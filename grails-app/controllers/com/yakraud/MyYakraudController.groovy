package com.yakraud

import org.codehaus.groovy.grails.plugins.springsecurity.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class MyYakraudController {

    def authenticateService
    def projectService
    def creditCardService

    def index = { }

    def listProjects = {
        def user = authenticateService.userDomain()
        user = User.get(user.id)
        [ user: user ]
    }

    def listOwnedProjects = {
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
                dataUrl: g.createLink(action: 'showProject') + "/$it.id"
            ]
        }

        def data = [
            totalRecords: count,
            results: list
        ]

        response.setHeader("Cache-Control", "no-store")
        render data as JSON
    }

    def listAppliedProjects = {
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
                dataUrl: g.createLink(controller: 'project', action: 'details') + "/$it.id"
            ]
        }

        def data = [
            totalRecords: count,
            results: list
        ]

        response.setHeader("Cache-Control", "no-store")
        render data as JSON
    }

    def showProject = {
        def project = Project.get(params.id)
        [project: project]
    }

}
