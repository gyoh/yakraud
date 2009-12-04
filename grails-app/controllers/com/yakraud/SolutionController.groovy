package com.yakraud

class SolutionDetailsCommand implements Serializable {

    String title
    String content
    byte[] file

    Date dateCreated
    Date lastUpdated

    static constraints = {
        title(blank: false)
        content(nullable: true, maxSize: 1000000)
        file(nullable: true)
    }

}

class SolutionController {

    def scaffold = true

    def submitFlow = {
        validateProject {
            action {
                def project = Project.get(params.id)
                if (project) {
                    log.debug("Valid project!!")
                    flow.project = project
                    valid()
                } else {
                    log.debug("Invalid card!!")
                    invalid()
                }
            }
            on("valid").to("enterSolution")
            on("invalid").to("finish")
        }

        enterSolution {
            on("submit") { SolutionDetailsCommand sdc ->
                // capture solution details
                if (sdc.hasErrors()) {
                    flow.solutionDetails = sdc
                    return error()
                }
                [ solutionDetails: sdc ]

            }.to("confirmSolution")
            on("cancel").to("finish")
        }

        confirmSolution {
            // display solution details
            on("confirm") {
                // save solution
                def user = authenticateService.userDomain()
                def sd = flow.solutionDetails

                try {
                    def solution = solutionService.create(
                        user.id, flow.project.id, sd.title, sd.content)
                    flash.message = "Added new solution: ${solution.title}"
                } catch (SolutionException e) {
                    flash.message = e.message
                }
            }.to("finish")
            on("cancel").to("finish")
        }

        finish {
            redirect(controller: "project", action: "myProjects")
        }
    }

}
