package com.yakraud

class ProjectException extends RuntimeException {
    String message
    Project project
}

class ProjectService implements Serializable {

    boolean transactional = true

    def create(userId, project) {
        def user = User.get(userId)
        if (user) {
            user.addToOwnedProjects(project)
            if (user.save()) {
                return project
            } else {
                throw new ProjectException(
                    message: "Invalid or empty project", project: project)
            }
        }
        throw new ProjectException(message: "Invalid username")
    }

    def create(userId, title, description, reward, deadline) {
        def project = new Project(
            title: title,
            description: description,
            reward: reward,
            deadline: deadline)
        def user = User.get(userId)
        if (user) {
            user.addToOwnedProjects(project)
            if (user.save()) {
                return project
            } else {
                throw new ProjectException(
                    message: "Invalid or empty project", project: project)
            }
        }
        throw new ProjectException(message: "Invalid username")
    }

}
