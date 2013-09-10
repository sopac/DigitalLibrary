package digitallibrary

/**
 * KeywordController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class KeywordController {

    def index = {
        [res: getList()]
    }

    def list = {
        [res: getList()]
    }

    //static scaffold = true
    def List getList() {
        def list = []

        //String invalid = new URL("http://ict.sopac.org/commonwords.txt").getText()

        String invalid = new File("/opt/dl/commonwords.txt").getText()

        def termFreqs = Publication.termFreqs("title", size: 120)
        termFreqs.each {
            boolean v = true
            String t = it.term.toString().trim()
            if (t.length() < 3) v = false
            if (t.isNumber()) v = false
            invalid.eachLine {
                if (t.equals(it.trim())) v = false
            }

            if (v) {
                list << it.term.toString().trim()
            }
        }

        list << "agriculture"
        list << "land resources"
        list << "fisheries"
        list << "health"
        list << 'women'

        list.remove("eye")
        list << "geo eye"
        list.remove("pan")
        //list << "pan mapping"
        list.remove("sharpened")
        list << "pan-sharpened"
        list.remove("multi")
        list << "multi-spectral"

        return list.unique()
    }
}
