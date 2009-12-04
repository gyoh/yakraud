package com.yakraud

class Application {

    User user
    Project project
    String source
    String snippet

    static constraints = {
        source(nullable: true, maxSize: 10000)
        snippet(nullable: true, maxSize: 10000)
    }

    static Application link(user, project, source, snippet) {
        def a = Application.findByUserAndProject(user, project)
        if (!a) {
            a = new Application()
            a.source = source
            a.snippet = snippet
            a.user = user
            a.project = project
            //user?.addToApplications(a)
            //project?.addToApplications(a)
            a.save()
        }
        return a
    }

    static void unlink(user, project) {
        def a = Application.findByUserAndProject(user, project)
        if (a) {
            //user?.removeFromApplications(a)
            //project?.removeFromApplications(a)
            a.delete()
        }
    }

}
