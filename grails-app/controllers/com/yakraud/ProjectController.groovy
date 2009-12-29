package com.yakraud

import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import grails.converters.JSON
import java.text.SimpleDateFormat

class ProjectDetailsCommand implements Serializable {

    String title
    String description
    String content
    byte[] file
    Integer reward
    Date deadline

    static constraints = {
        title(blank: false)
        description(blank: false, maxSize: 10000)
        content(nullable: true, maxSize: 1000000)
        file(nullable: true)
        reward(blank: false, minSize: 20000, maxSize: 100000000)
        deadline(blank: false)
    }

}

class PaymentCommand implements Serializable {
    String cardNumber
    String name
    String expiry

    static constraints = {
        cardNumber(blank: false, creditCard: true)
        name(blank: false)
        expiry(blank: false)
    }
}

class ProjectController {

    def authenticateService
    def projectService
    def creditCardService

    def scaffold = true

//    static navigation = [
//        [group: "tabs", action: "myProjects", title: "My Projects", order: 0],
//        [group: "tabs", action: "search", title: "Search", order: 1]
//    ]

    def index = {
    }

    def results = {
        def projects = Project.findAllByTitleOrDescriptionIlike("%${params.keyword}%", "%${params.keyword}%")
        return [ projects: projects, term: params.keyword ]
    }

    @Secured(['ROLE_USER'])
    def myProjects = {
        //def user = User.findByUsername(params.id)
        def user = authenticateService.userDomain()
        user = User.get(user.id)
        [ user: user ]
    }

    @Secured(['ROLE_USER'])
    def addProject = {
        def user = authenticateService.userDomain()
        def project = new Project()
        project.properties["title", "description", "reward", "deadline"] = params
        project.validate()
        try {
            project = projectService.create(user.id, project)
            flash.message = "Added new project: ${project.title}"
        } catch (ProjectException e) {
            flash.message = e.message
        }

        /*
        def user = User.findByUsername(params.id)
        if (user) {
            def project = new Project(params)
            user.addToProjects(project)
            if (user.save()) {
                flash.message = "Successfully created project"
            } else {
                //user.discard() // required only under Grails 1.0
                flash.message = "Invalid or empty project"
            }
        } else {
            flash.message = "Invalid username"
        }
        */
       
        redirect(action: "myProjects", id:params.id)
    }

    def addProjectAjax = {
        def user = authenticateService.userDomain()
        def project = new Project()
        project.properties["title", "description", "reward", "deadline"] = params
        project.validate()
        try {
            project = projectService.create(user.id, project)
        } catch (ProjectException e) {
            render {
                div(class:"errors", e.message)
            }
        }

        user = User.get(user.id)
        render(template: "myProjects",
               collection: user.ownedProjects,
               var: "project")
    }

    def search = {
    }
    
    def searchAjax = {
        def projects
        def count
        if (params.q) {
            def searchResult = Project.search(params.q, params)
            projects = searchResult.results
            count = searchResult.total
        } else {
            projects = Project.list(params)
            count = Project.count()
        }

        def list = []
        projects.each {
            list << [
                id: it.id,
                title: it.title,
                description: it.description,
                reward: it.reward,
                deadline: new SimpleDateFormat("MMM dd, yyyy").format(it.deadline),
                //dataUrl: g.createLink(controller: 'project', action: 'details') + "/$it.id"
                dataUrl: g.createLink(action: 'showDescription') + "/$it.id"
            ]
        }

        def data = [
            totalRecords: count,
            results: list
        ]

        response.setHeader("Cache-Control", "no-store")
        render data as JSON
    }

    def showDescription = {
        def project = Project.get(params.id)
        [project: project]
    }

    def listAjax = {
        /*
        def results = Project.withCriteria {
            ilike("title", "%${params.sSearch}%")
            firstResult(params.iDisplayStart as int)
            maxResults(params.iDisplayLength as int)
        }
        */

        def query = params.sSearch
        def offset = params.iDisplayStart as int
        def max = params.iDisplayLength as int

        def user = authenticateService.userDomain()

        def json
        if (query) {
            def searchResult = Project.search(
                {
                    must(queryString(query))
                    must(term("username", user.username))
                },
                [offset: offset, max: max]
            )

            json = [
                sEcho: params.sEcho,
                iTotalRecords: searchResult.total,
                iTotalDisplayRecords: searchResult.total,
                aaData: searchResult.results.collect {
                    [it.title, it.description, it.content, it.reward, it.deadline]
                }
            ]
        } else {
            def results = Project.withCriteria {
                firstResult(offset)
                maxResults(max)
            }

            json = [
                sEcho: params.sEcho,
                iTotalRecords: Project.count(),
                iTotalDisplayRecords: Project.count(),
                aaData: results.collect {
                    [it.title, it.description, it.content, it.reward, it.deadline]
                }
            ]
        }

        render json as JSON
    }

    @Secured(['ROLE_USER'])
    def listOwned = {
        def user = authenticateService.userDomain()

        def projects = Project.createCriteria().list(params) {
            eq('owner', user)
        }
        def count =  Project.createCriteria().count {
            eq('owner', user)
        }

        def list = []
        projects.each {
            list << [
                id: it.id,
                title: it.title,
                description: it.description,
                reward: it.reward,
                deadline: it.deadline,
                dataUrl: g.createLink(action: 'details') + "/$it.id"
            ]
        }

        def data = [
            totalRecords: count,
            results: list
        ]

        response.setHeader("Cache-Control", "no-store")
        render data as JSON
    }

    @Secured(['ROLE_USER'])
    def listApplied = {
        def user = authenticateService.userDomain()

        def projects = Project.createCriteria().list(params) {
            applications {
                eq('user', user)
            }
        }
        def count =  Project.createCriteria().count {
            applications {
                eq('user', user)
            }
        }

        def list = []
        projects.each {
            list << [
                id: it.id,
                title: it.title,
                description: it.description,
                reward: it.reward,
                deadline: it.deadline,
                dataUrl: g.createLink(action: 'details') + "/$it.id"
            ]
        }

        def data = [
            totalRecords: count,
            results: list
        ]

        response.setHeader("Cache-Control", "no-store")
        render data as JSON
    }

    def details = {
        def project = Project.get(params.id)
        [project: project]
    }

    @Secured(['ROLE_USER'])
    def postFlow = {

        displayTerms {
            on("next") {
                // display terms of use
            }.to("enterProject")
            on("cancel").to("finish")
        }

        enterProject {
            on("next") { ProjectDetailsCommand pdc ->
                // capture project details
                if (pdc.hasErrors()) {
                    flow.projectDetails = pdc
                    return error()
                }
                [ projectDetails: pdc ]
            }.to("enterPayment")
            on("previous").to("displayTerms")
        }

        enterPayment {
            on("next") { PaymentCommand pc ->
                // capture payment details
                if (pc.hasErrors()) {
                    flow.payment = pc
                    return error()
                }
                [ payment: pc ]
            }.to("validateCard")
            on("previous").to("enterProject")
        }

        validateCard {
            action {
                // do some logic here
                def validCard = creditCardService.checkCard(
                    flow.payment.cardNumber,
                    flow.payment.name,
                    flow.payment.expiry
                )

                if (validCard) {
                    log.debug("Valid card!!")
                    valid()
                } else {
                    log.debug("Invalid card!!")
                    flow.pc.errors.rejectValue("cardNumber",
                        "card.failed.validation",
                        "Invalid card!!")
                    invalid()
                }
            }
            on("valid").to("postComplete")
            on("invalid").to("enterPayment")
        }

        postComplete {
            // display project details
            on("confirm") {
                // save project and payment details
                def user = authenticateService.userDomain()
                def pd = flow.projectDetails

                try {
                    def project = projectService.create(user.id,
                        pd.title, pd.description, pd.reward, pd.deadline)
                    flash.message = "Added new project: ${project.title}"
                } catch (ProjectException e) {
                    flash.message = e.message
                }
            }.to("finish")
            on("cancel").to("finish")
        }

        finish {
            redirect(controller: "project", action: "myProjects")
        }

    }

    @Secured(['ROLE_USER'])
    def apply = {
        def project = Project.get(params.id)
        project.addToApplicants(authenticateService.userDomain(), project.content, params.snippet)
        redirect(controller: "application", action: "list")
    }

}
