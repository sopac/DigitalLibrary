package digitallibrary

/**
 * CheckController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CheckController {

    //static scaffold = true
    def index = {

        //check existing ebooks
        render "<h1 style='color: blue'>Status Check</h1>"
        render "<h3>Existing Ebooks</h3>"
        int count = 0
        Publication.listOrderByFileName().each { p ->
            String fn = p.fileName.substring(0, p.fileName.lastIndexOf(".")).trim()

            //render fn + "<br/>"
            String url = Global.ebookURL + fn.encodeAsURL() + "/index.html"


            println url

            if (Global.exists(url)) {
                String link = createLink(controller: 'publication', action: 'show', id: p.id)
                render "<a href='${link}'>${p.title}</a>"
                render "<br/>"
                count++
            }

        }

        render "<br/><b>Total : </b>" + count.toString() + "<hr/>"

        //missing thumbnails

        render "<h3>Missing Thumbnails</h3>"
        count = 0
        Publication.listOrderByTitle().each { p ->
            String url = digitallibrary.Global.thumbURL + p.fileName.replace('.pdf', '.jpg')
            if (!Global.exists(url)) {
                String link = createLink(controller: 'publication', action: 'show', id: p.id)
                render "<a href='${link}'>${p.title}</a>"
                render "<br/>"
                count++
            }
        }
        render "<br/><b>Total : </b>" + count.toString() + "<hr/>"


    }

}


