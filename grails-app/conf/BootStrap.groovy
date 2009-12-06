import grails.util.Environment

import com.yakraud.*

class BootStrap {

    def authenticateService

    def init = { servletContext ->
        switch (Environment.current) {
            case Environment.DEVELOPMENT:
                createAdminUser()
                createUser("gyo", "Gyo Hamamoto")
                createUser("haru", "Haru Hamamoto")
                createUser("shun", "Shun Hamamoto")
                break;
            case Environment.TEST:
                createRoles()
                break;
            case Environment.PRODUCTION:
            default:
                println("No special configuration required")
                break;
        }
    }

    def destroy = {
    }

    void createRoles() {
        if (!Role.findAll()) {
            println("Creating roles")
            new Role(
                authority: "ROLE_ADMIN",
                description: "Administrator Role").save()
            new Role(
                authority: "ROLE_USER",
                description: "User Role").save()
        }
    }

    void createAdminUser() {
        if (!User.findByUsername("admin")) {
            def adminRole = Role.findByAuthority("ROLE_ADMIN")
            if (!adminRole) {
                createRoles()
                adminRole = Role.findByAuthority("ROLE_ADMIN")
            }
            println("Creating admin user")
            def adminUser = new User(
                username: "admin",
                userRealName: "Administrator",
                pass: "adminadmin",
                passwd: authenticateService.encodePassword("adminadmin"),
                enabled: true,
                email: "admin@yakraud.com",
                description: "Administrator")
            adminRole.addToPeople(adminUser)
        }
    }

    void createUser(String username, String realName) {
        if (!User.findByUsername(username)) {
            def userRole = Role.findByAuthority("ROLE_USER")
            if (!userRole) {
                createRoles()
                userRole = Role.findByAuthority("ROLE_USER")
            }
            println("Creating general user ${username}")
            def user = new User(
                username: username,
                userRealName: realName,
                pass: "password",
                passwd: authenticateService.encodePassword("password"),
                enabled: true,
                email: "${username}@yakraud.com",
                description: "General user"
            )
            userRole.addToPeople(user)
            createProjects(user)
        }
    }

    void createProjects(User user) {
        println("Adding projects of user: ${user.username}")
        for (int i = 0; i < 200; i++) {
            def project = new Project(
                title: "Project ${i}",
                description: "This is the description of the project number: ${i}.",
                content: "This is the content of the project number: ${i}.",
                deadline: new Date() + i,
                reward: 20000 + i * 1000
            )
            user.addToOwnedProjects(project)
        }
    }
} 