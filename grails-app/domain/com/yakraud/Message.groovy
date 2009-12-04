package com.yakraud

class Message implements Serializable {

    String title
    String content
    User sender
    Project project

    Date dateCreated
    Date lastUpdated

    static searchable = true

    static constraints = {
        title(blank: false)
        content(nullable: true, maxSize: 1000000)
        sender(nullable: false)
    }

    static hasMany = [ recipients: User ]
    static belongsTo = [ User, Project ]
    
}
