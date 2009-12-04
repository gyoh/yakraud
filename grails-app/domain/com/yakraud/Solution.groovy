package com.yakraud

class Solution implements Serializable {

    String title
    String content
    byte[] file

    Date dateCreated
    Date lastUpdated

    static searchable = true

    static constraints = {
        title(blank: false)
        content(nullable: true, maxSize: 1000000)
        file(nullable: true)
        solver(nullable: false)
        project(nullable: false)
    }

    static belongsTo = [ solver: User, project: Project ]

}
