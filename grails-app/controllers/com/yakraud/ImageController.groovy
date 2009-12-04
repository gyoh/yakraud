package com.yakraud

class PhotoUploadCommand {
    byte[] photo
    String username
}

class ImageController {

    def upload = { PhotoUploadCommand puc ->
        def user = User.findByUsername(puc.username)
        if (!user.profile) {
            user.profile = new Profile()
        }
        user.profile.photo = puc.photo
        redirect(controller: "user", action: "profile", id: puc.username)
    }

    def form = {
        // pass through to upload form
        [ userList: User.list() ]
    }

    def view = {
        // pass through to "view photo" page
    }

    def render = {
        def user = User.findByUsername(params.id)
        if (user?.profile?.photo) {
            response.setContentLength(user.profile.photo.length)
            response.outputStream.write(user.profile.photo)
        } else {
            response.sendError(404)
        }
    }

}
