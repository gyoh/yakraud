package com.yakraud

class Profile implements Serializable {

    byte[] photo
    String bio
    String homepage
    String timezone
    String country

    Date dateCreated
    Date lastUpdated

    static searchable = {
        except = ["photo"]
    }

    static belongsTo = User

    static constraints = {
        photo(nullable: true)
        bio(nullable: true, maxSize: 1000)
        homepage(nullable: true, url: true)
        timezone(nullable: true)
        country(nullable: true)
    }

}
