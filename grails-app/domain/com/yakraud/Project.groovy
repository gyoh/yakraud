package com.yakraud

class Project implements Serializable {

    String title
    String description
    String content
    byte[] file
    Integer reward
    Date deadline
    User owner

    Date dateCreated
    Date lastUpdated

    static belongsTo = User
    static hasMany = [ applications: Application, solutions: Solution, messages: Message ]

    static constraints = {
        title(blank: false)
        description(blank: false, maxSize: 10000)
        content(nullable: true, maxSize: 1000000)
        file(nullable: true)
        reward(blank: false, minSize: 20000, maxSize: 100000000)
        deadline(blank: false)
    }

    static searchable = {
        owner(component:true)
        except = ["file"]
        spellCheck "include"
    }

    def applicants() {
        return applications.collect{it.user}
    }

    def addToApplicants(User applicant, String source, String snippet) {
        Application.link(applicant, this, source, snippet)
        return applicants();
    }

    def removeFromApplicants(User applicant) {
        Applicattion.unlink(applicant, this)
        return applicants();
    }

    String toString() {
        "${id}: ${title} (${owner.username})"
    }

}
