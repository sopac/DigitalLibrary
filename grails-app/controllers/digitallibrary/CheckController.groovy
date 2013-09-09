package digitallibrary

/**
 * CheckController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CheckController {

    //static scaffold = true
    def index = {

        def list = []

        String invalid = new URL("http://ict.sopac.org/commonwords.txt").getText()

        def termFreqs = PublicationText.termFreqs(size: 100)
        termFreqs.each {
            boolean v = true
            String t = it.term.toString().trim()
            if (t.length() < 3) v = false
            if (t.isNumber()) v = false
            invalid.eachLine {
                if (t.equals(it.trim())) v = false
            }



            if (v) {
                render "<b>${it.term}</b> occurs ${it.freq} times in the index for Book instances"
                render "<br/>"
                list << it.term
            }

        }

        render "Finished"

        //missing books

    }
}
