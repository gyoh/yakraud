package com.yakraud

/**
 * User domain class.
 */
class User implements Serializable {

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled

	String email
	boolean emailShow

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

    Profile profile

    Date dateCreated
    Date lastUpdated

    static searchable = {
        except = ["pass"]
    }

	static constraints = {
		username(blank: false, unique: true, size: 3..12)
		userRealName(blank: false)
		pass(blank: false, size: 8..16)
		enabled()
        email(blank: false, unique: true, email: true)
        profile(nullable: true)
	}

	static transients = ['pass']

    static mapping = {
        profile lazy:false
    }

    static belongsTo = Role

	static hasMany = [
        authorities: Role,
        ownedProjects: Project,
        applications: Application,
        solutions: Solution,
        sentMessages: Message,
        receivedMessages: Message
    ]

    static mappedBy = [
        ownedProjects: "owner",
        sentMessages: "sender"
    ]

    def appliedProjects() {
        return applications.collect{it.project}
    }

    List addToAppliedProjects(Project project, String source, String snippet) {
        Application.link(this, project, source, snippet)
        return appliedProjects()
    }

    List removeFromAppliedProjects(Project project) {
        Application.unlink(this, project)
        return appliedProjects()
    }

}
