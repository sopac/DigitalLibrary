package digitallibrary

/**
 * ContactController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ContactController {

    //static scaffold = true
    def index = {}

    def list = {
        redirect(action: 'index')
    }
}
