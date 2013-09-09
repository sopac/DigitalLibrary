package digitallibrary

/**
 * AuthorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class AuthorController {

    //static scaffold = true
    def index = {
        //link - searchable: author:x
        def list = []
        Publication.listOrderByAuthor().each { p->
            String a = p.author


            list << a


        }


        return [authors: list]
    }

    def list = {
        redirect(action: 'index')
    }
}
