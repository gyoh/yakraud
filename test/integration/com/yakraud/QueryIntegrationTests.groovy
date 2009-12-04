package com.yakraud

import grails.test.*

class QueryIntegrationTests extends GrailsUnitTestCase {

    def authenticateService

    void testBasicDynamicFinders() {
        new User(username: "query1",
            userRealName: "Query 1",
            pass: "password1",
            passwd: authenticateService.encodePassword("password1"),
            enabled: true,
            email: "query1@example.com").save()
        new User(username: "query2",
            userRealName: "Query 2",
            pass: "password2",
            passwd: authenticateService.encodePassword("password2"),
            enabled: true,
            email: "query2@example.com").save()

        def user = User.findByPasswd(
            authenticateService.encodePassword("password1"))
        assertEquals("query1", user.username)

        user = User.findByUsernameAndPasswd("query2",
            authenticateService.encodePassword("password2"))
        assertEquals("query2", user.username)

        def now = new Date()
        def users = User.findAllByDateCreatedBetween(now - 1, now)
        assertEquals(2, users.size())

        def project1 = new Project(title: "Project 1",
            description: "This is an example project 1.",
            reward: 20000,
            deadline: new Date())
        user.addToOwnedProjects(project1)
        def project2 = new Project(title: "Project 2",
            description: "This is an example project 2 which contains a keyword: yakraud for integration test.",
            reward: 20000,
            deadline: new Date())
        user.addToOwnedProjects(project2)

        def projects = Project.findAllByTitleIlikeOrDescriptionIlike("%Yakraud%", "%Yakraud%")
        assertEquals([ "Project 2" ], projects*.title)
    }

    /*
    void testQueryByExample() {
        new User(username: "qbe1",
            userRealName: "QBE 1",
            pass: "password1",
            passwd: authenticateService.encodePassword("password1"),
            enabled: true,
            email: "qbe1@example.com").save()
        new User(username: "qbe2",
            userRealName: "QBE 2",
            pass: "password2",
            passwd: authenticateService.encodePassword("password2"),
            enabled: true,
            email: "qbe2@example.com").save()
        new User(username: "qbe3",
            userRealName: "QBE 3",
            pass: "password1",
            passwd: authenticateService.encodePassword("password1"),
            enabled: true,
            email: "qbe3@example.com").save()

        def userToFind = new User(username: "qbe1")
        def user1 = User.find(userToFind)
        assertEquals("qbe1@example.com", user1.email)

        userToFind = new User(username: "qbe2")
        def user2 = User.find(userToFind)
        assertEquals(authenticateService.encodePassword("password2"),
            user2.passwd)

        userToFind = new User(
            passwd: authenticateService.encodePassword("password1"))
        def users = User.findAll(userToFind)
        assertEquals(["qbe1", "qbe3"], users*.username)
    }
    */

    void testQueryByCriteria() {
        def user1 = new User(username: "criterion1",
            userRealName: "Criterion 1",
            pass: "password1",
            passwd: authenticateService.encodePassword("password1"),
            enabled: true,
            email: "criterion1@example.com").save()
        def user2 = new User(username: "criterion2",
            userRealName: "Criterion 2",
            pass: "password2",
            passwd: authenticateService.encodePassword("password2"),
            enabled: true,
            email: "criterion2@example.com").save()
        def user3 = new User(username: "criterion3",
            userRealName: "Criterion 3",
            pass: "password1",
            passwd: authenticateService.encodePassword("password3"),
            enabled: true,
            email: "criterion3@example.com").save()

        def project1 = new Project(title: "Project 1",
            description: "This is an example project 1.",
            reward: 20000,
            deadline: new Date())
        user1.addToOwnedProjects(project1)
        def project2 = new Project(title: "Project 2",
            description: "This is an example project 2.",
            reward: 30000,
            deadline: new Date())
        user2.addToOwnedProjects(project2)
        def project3 = new Project(title: "Project 3",
            description: "This is an example project 3.",
            reward: 100000,
            deadline: new Date())
        user3.addToOwnedProjects(project3)
        def project4 = new Project(title: "Project 4",
            description: "This is an example project 4.",
            reward: 200000,
            deadline: new Date())
        user1.addToOwnedProjects(project4)
        def project5 = new Project(title: "Project 5",
            description: "This is an example project 5.",
            reward: 40000,
            deadline: new Date())
        user2.addToOwnedProjects(project5)
        def project6 = new Project(title: "Project 6",
            description: "This is an example project 6.",
            reward: 50000,
            deadline: new Date())
        user3.addToOwnedProjects(project6)
        def project7 = new Project(title: "Project 7",
            description: "This is an example project 7.",
            reward: 45000,
            deadline: new Date())
        user1.addToOwnedProjects(project7)
        def project8 = new Project(title: "Project 8",
            description: "This is an example project 8.",
            reward: 80000,
            deadline: new Date())
        user2.addToOwnedProjects(project8)

        def user = User.findByUsername("criterion1")

        def projects = Project.withCriteria {
            and {
                eq("owner", user)
                between("reward", 20000, 80000)
                order("title", "asc")
            }
        }

        assertEquals(["Project 1", "Project 7"], projects*.title)
    }

}
