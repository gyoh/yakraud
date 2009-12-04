package com.yakraud

import grails.test.*

class ProjectIntegrationTests extends GrailsUnitTestCase {

    def authenticateService

    void testSave() {
        def user = new User(username: "save",
            userRealName: "Save",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "save@example.com").save()
        def project1 = new Project(title: "Project 1",
                                   description: "Project 1 description goes here.",
                                   reward: 20000,
                                   deadline: new Date())
        user.addToOwnedProjects(project1)
        def project2 = new Project(title: "Project 2",
                                   description: "Project 2 description goes here.",
                                   reward: 30000,
                                   deadline: new Date())
        user.addToOwnedProjects(project2)
        def project3 = new Project(title: "Project 3",
                                   description: "Project 3 description goes here.",
                                   reward: 40000,
                                   deadline: new Date())
        user.addToOwnedProjects(project3)

        assertEquals(3, User.get(user.id).ownedProjects.size())
    }

    void testRetrieve() {
        def user = new User(username: "retrieve",
            userRealName: "Retrieve",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "retrieve@example.com").save()
        def project1 = new Project(title: "Project 1",
                                   description: "Project 1 description goes here.",
                                   reward: 20000,
                                   deadline: new Date())
        user.addToOwnedProjects(project1)
        def project2 = new Project(title: "Project 2",
                                   description: "Project 2 description goes here.",
                                   reward: 30000,
                                   deadline: new Date())
        user.addToOwnedProjects(project2)
        def project3 = new Project(title: "Project 3",
                                   description: "Project 3 description goes here.",
                                   reward: 40000,
                                   deadline: new Date())
        user.addToOwnedProjects(project3)

        def foundUser = User.get(user.id)
        def projectTitles = foundUser.ownedProjects.collect {it.title}
        assertEquals([ "Project 1", "Project 2", "Project 3" ], projectTitles.sort())
    }

    void testParticipatingProject() {
        def role = Role.findByAuthority("ROLE_USER")

        def user1 = new User(username: "user1",
            userRealName: "User 1",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "user1@example.com")
        def user2 = new User(username: "user2",
            userRealName: "User 2",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "user2@example.com")
        def user3 = new User(username: "user3",
            userRealName: "User 3",
            pass: "password",
            passwd: authenticateService.encodePassword("password"),
            enabled: true,
            email: "user3@example.com")

        role.addToPeople(user1)
        role.addToPeople(user2)
        role.addToPeople(user3)
        assertNotNull(role.save())

        def project1 = new Project(title: "Project 1",
                                   description: "Project 1 description goes here.",
                                   reward: 20000,
                                   deadline: new Date())
        user1.addToOwnedProjects(project1)
        assertNotNull(user1.save())
        def project2 = new Project(title: "Project 2",
                                   description: "Project 2 description goes here.",
                                   reward: 30000,
                                   deadline: new Date())
        user2.addToOwnedProjects(project2)
        assertNotNull(user2.save())
        def project3 = new Project(title: "Project 3",
                                   description: "Project 3 description goes here.",
                                   reward: 40000,
                                   deadline: new Date())
        user3.addToOwnedProjects(project3)
        assertNotNull(user3.save())

        project1.addToMembers(user2)
        project1.addToMembers(user3)
        //assertNotNull(project1.save())
        project2.addToMembers(user1)
        project2.addToMembers(user3)
        //assertNotNull(project2.save())
        project3.addToMembers(user1)
        project3.addToMembers(user2)
        //assertNotNull(project3.save())

        def foundUser1 = User.get(user1.id)
        def ownedProjectTitles = foundUser1.ownedProjects.collect {it.title}
        assertEquals([ "Project 1" ], ownedProjectTitles.sort())

        def joinedProjectTitles = foundUser1.joinedProjects.collect {it.title}
        assertEquals([ "Project 2", "Project 3" ], joinedProjectTitles.sort())

        def foundUser2 = User.get(user2.id)
        ownedProjectTitles = foundUser2.ownedProjects.collect {it.title}
        assertEquals([ "Project 2" ], ownedProjectTitles.sort())

        joinedProjectTitles = foundUser2.joinedProjects.collect {it.title}
        assertEquals([ "Project 1", "Project 3" ], joinedProjectTitles.sort())

        def foundUser3 = User.get(user3.id)
        ownedProjectTitles = foundUser3.ownedProjects.collect {it.title}
        assertEquals([ "Project 3" ], ownedProjectTitles.sort())

        joinedProjectTitles = foundUser3.joinedProjects.collect {it.title}
        assertEquals([ "Project 1", "Project 2" ], joinedProjectTitles.sort())
    }

}
