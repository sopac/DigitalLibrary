package digitallibrary

import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.pdf.PDFParser
import org.apache.tika.sax.BodyContentHandler
import org.apache.tomcat.jni.Global
import org.xml.sax.ContentHandler

import java.text.SimpleDateFormat

/**
 * ImportController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ImportController {

    //1. SPC Featured (featured.csv, and metadata, pdf text)
    //2. SOPAC PR (old - db, and new - csv, merged then imported)
    //3. SPC French
    //4. SOPAC Commission PR (handpicked)

    def index = {
        render "Import Controller"
    }

    def text = {
        int count = 0
        //PublicationText.executeUpdate("Delete from PublicationText")

        Publication.getAll().each { p ->
            try {
                if (!p.fileName.equals("climate-change-book.pdf")) {
                    if (PublicationText.get(p.id) == null) {
                        println "Importing: " + p.fileName
                        String path = digitallibrary.Global.path
                        File f = new File(path + p.fileName)
                        InputStream input = new FileInputStream(f);
                        ContentHandler textHandler = new BodyContentHandler(-1);
                        Metadata metadata = new Metadata();
                        PDFParser parser = new PDFParser();
                        parser.parse(input, textHandler, metadata);
                        input.close();
                        String content = textHandler.toString()

                        PublicationText pt = new PublicationText()
                        pt.publicationId = p.id
                        pt.text = content
                        pt.summary = ""
                        pt.save(flush: true, failOnError: true)
                        count++
                    }
                }
            } catch (Exception ex) {
                println "ERROR: " + ex.getMessage()
            }
        }
        println "PDF TEXT IMPORTED : " + count.toString()
        println "FINISHED : " + count
    }

    def sopac = {
        String title = ""
        String author = ""
        String fileName = ""
        String division = "SOPAC"
        String isbn = ""
        String issn = ""
        String category = "Other"
        String created = ""
        String publishedYear = ""
        String pages = ""
        String fileSize = ""

        int count = 0
        String path = "/home/sachin/Work/DigitalLibrary/SOPAC/PR/"

        new File("/home/sachin/Work/DigitalLibrary/SOPAC.csv").eachLine { l ->
            fileName = l.split("\\|")[0].trim() + ".pdf"
            title = l.split("\\|")[1].trim()
            author = l.split("\\|")[2].trim()
            publishedYear = l.split("\\|")[3]
            //println fileName + " : " + title

            File f = new File(path + fileName)
            if (f.exists()) {
                InputStream input = new FileInputStream(f);
                ContentHandler textHandler = new BodyContentHandler(-1);
                Metadata metadata = new Metadata();
                PDFParser parser = new PDFParser();
                parser.parse(input, textHandler, metadata);
                input.close();
                count++

                pages = metadata.get("xmpTPg:NPages")
                fileSize = String.valueOf(f.length() / 1024)

                created = metadata.get(Metadata.CREATION_DATE)
                created = created.substring(0, created.indexOf("T")).trim()

                if (title.toLowerCase().contains("plan")) category = "Strategic Plan"
                if (title.toLowerCase().contains("annual")) category = "Annual Report"
                if (title.toLowerCase().contains("leaflet")) category = "Awareness Brochure"
                if (title.toLowerCase().contains("manual")) category = "Manual"
                if (fileName.toLowerCase().contains("manual")) category = "Manual"
                if (title.toLowerCase().contains("snapshot")) category = "Newsletter"
                if (title.toLowerCase().contains("preen")) category = "Newsletter"
                if (title.toLowerCase().contains("news")) category = "Newsletter"
                if (title.toLowerCase().contains("review")) category = "Project Report"
                if (title.toLowerCase().contains("assessment")) category = "Project Report"
                if (title.toLowerCase().contains("study")) category = "Project Report"
                if (title.toLowerCase().contains("status")) category = "Project Report"
                if (title.toLowerCase().contains("vulnerability")) category = "Project Report"
                if (title.toLowerCase().contains("survey")) category = "Project Report"
                if (title.toLowerCase().contains("mapping")) category = "Project Report"
                if (title.toLowerCase().contains("technical")) category = "Technical Note"
                if (title.toLowerCase().contains("economic")) category = "Project Report"

                //persist
                Publication p = new Publication()
                p.setTitle(title)
                p.setAuthor(author)
                p.setCategory(Category.findWhere(category: category))
                p.setDivision((Division.findWhere(acronym: division)))
                p.setPublishedYear(Integer.parseInt(publishedYear))
                p.setLanguage("EN")
                p.setISBN(isbn)
                p.setISSN(issn)
                p.setFileName(f.getName())
                p.setFileSize(Double.parseDouble(fileSize.trim()))
                p.setNoOfPages(Integer.parseInt(pages.trim()))
                p.setFeatured(false)
                p.setRestricted(false)
                //2012-05-24
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
                Date d1 = sdf.parse(created)
                p.setCreationDate(d1)
                p.setUploadDate(sdf.parse("2013-08-30"))
                //println created + " : " + d1.toString()
                p.save(flush: true, failOnError: true)
            }

        }

        render "SOPAC Imported : " + count.toString()

    }

    def fr = {
        int count = 0
        new File("/home/sachin/Work/DigitalLibrary/French/").eachFile { f ->
            if (f.getName().toLowerCase().endsWith(".pdf")) {
                InputStream input = new FileInputStream(f);
                ContentHandler textHandler = new BodyContentHandler(-1);
                Metadata metadata = new Metadata();
                PDFParser parser = new PDFParser();
                parser.parse(input, textHandler, metadata);
                input.close();
                count++
                //
                //println metadata.toString()
                String title = ""
                String author = ""
                String fileName = ""
                String division = ""
                String isbn = ""
                String issn = ""
                String category = "Other"
                new File("/home/sachin/Work/DigitalLibrary/French.csv").eachLine { l ->
                    String fn = l.split(";")[1]
                    fn = fn.substring(fn.lastIndexOf("/") + 1, fn.length()).trim().toLowerCase()
                    fn = fn.replaceAll("%20", " ")
                    if (f.getName().toLowerCase().trim().equals(fn)) {
                        title = l.split(";")[2].trim()
                        fileName = fn
                        division = l.split(";")[0].trim()
                        if (division.contains("/")) division = division.substring(0, division.indexOf("/"))

                        if (l.split(";")[0].contains("/News")) category = "Newsletter"
                        if (l.split(";")[0].contains("/PolicyBrief")) category = "Policy Brief"
                    }
                }
                if (title.trim().equals("")) {
                    println "MISSING TITLE: " + f.getName()
                }

                if (metadata.get(Metadata.AUTHOR) != null && !metadata.get(Metadata.AUTHOR).startsWith("SPC")) {
                    if (!metadata.get(Metadata.AUTHOR).startsWith("Anon"))
                        author = metadata.get(Metadata.AUTHOR)
                }

                String content = textHandler.toString()
                //author
                if (author.equals("")) {
                    //author =  "EMPTY"
                    content.eachLine { l ->
                        if (author.equals("")) {
                            if (l.trim().startsWith("I. ")) {
                                if (!l.trim().startsWith("I. Titre")) {
                                    if (l.trim().contains("II.")) {
                                        if (!l.trim().startsWith("I. Title")) {
                                            author = l.trim()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                //default author to division
                if (author.equals("")) author = division + ", " + "Secretariat of the Pacific Community (SPC)"

                //isbn, issn
                content.eachLine { l ->
                    if (l.trim().toLowerCase().startsWith("isbn")) {
                        isbn = l.replace("ISBN", "").replace(":", "").trim()
                    }
                    if (l.trim().toLowerCase().startsWith("issn")) {
                        issn = l.replace("ISSN", "").replace(":", "").trim()
                    }
                }


                String created = metadata.get(Metadata.CREATION_DATE)
                created = created.substring(0, created.indexOf("T")).trim()
                println created
                String publisheYear = created.substring(0, created.indexOf("-")).trim()
                //println publisheYear

                String pages = metadata.get("xmpTPg:NPages")

                String fileSize = String.valueOf(f.length() / 1024)
                //fileSize = fileSize.substring(0, fileSize.indexOf(".")) + " kB"

                //category
                if (title.toLowerCase().contains("no. ")) category = "Awareness Brochure"
                if (title.toLowerCase().contains("plan")) category = "Strategic Plan"
                if (title.toLowerCase().contains("annuel")) category = "Annual Report"
                if (title.toLowerCase().contains("leaflet")) category = "Awareness Brochure"
                if (title.toLowerCase().contains("manual")) category = "Manual"
                if (fileName.toLowerCase().contains("manual")) category = "Manual"
                if (title.toLowerCase().contains("review")) category = "Project Report"
                if (title.toLowerCase().contains("assessment")) category = "Project Report"
                if (title.toLowerCase().contains("study")) category = "Project Report"
                if (title.toLowerCase().contains("status")) category = "Project Report"
                if (title.toLowerCase().contains("vulnerability")) category = "Project Report"


                println count.toString() + " : " + title

                //persist
                Publication p = new Publication()
                p.setTitle(title)
                p.setAuthor(author)
                p.setCategory(Category.findWhere(category: category))
                p.setDivision((Division.findWhere(acronym: division)))
                p.setPublishedYear(Integer.parseInt(publisheYear))
                p.setLanguage("FR")
                p.setISBN(isbn)
                p.setISSN(issn)
                p.setFileName(f.getName())
                p.setFileSize(Double.parseDouble(fileSize.trim()))
                p.setNoOfPages(Integer.parseInt(pages.trim()))
                p.setFeatured(false)
                p.setRestricted(false)
                //2012-05-24
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
                Date d1 = sdf.parse(created)
                p.setCreationDate(d1)
                p.setUploadDate(sdf.parse("2013-08-30"))
                p.save(flush: true, failOnError: true)


            }

        }
        println "FINISHED."
        render "<h3>" + count.toString() + "</h3>"

    }

    def en = {
        //pdf test for SPC Featured
        //also extract ISBN and test with ALL.txt monographs
        int count = 0
        new File("/home/sachin/Work/DigitalLibrary/Featured/").eachFile { f ->
            if (f.getName().toLowerCase().endsWith(".pdf")) {
                InputStream input = new FileInputStream(f);

                ContentHandler textHandler = new BodyContentHandler(-1);
                Metadata metadata = new Metadata();
                PDFParser parser = new PDFParser();
                parser.parse(input, textHandler, metadata);
                input.close();
                count++
                //
                //println metadata.toString()

                String title = ""
                String author = ""
                String fileName = ""
                String division = ""
                String isbn = ""
                String issn = ""
                String category = "Other"
                new File("/home/sachin/Work/DigitalLibrary/FeaturedPublications.csv").eachLine { l ->
                    String fn = l.split(";")[1]
                    fn = fn.substring(fn.lastIndexOf("/") + 1, fn.length()).trim().toLowerCase()
                    fn = fn.replaceAll("%20", " ")
                    if (f.getName().toLowerCase().trim().equals(fn)) {
                        title = l.split(";")[2].trim()
                        fileName = fn
                        division = l.split(";")[0].trim()
                        if (division.contains("/")) division = division.substring(0, division.indexOf("/"))

                        if (l.split(";")[0].contains("/News")) category = "Newsletter"
                        if (l.split(";")[0].contains("/PolicyBrief")) category = "Policy Brief"
                    }
                }
                if (title.trim().equals("")) {
                    println "MISSING TITLE: " + f.getName()
                }

                if (metadata.get(Metadata.AUTHOR) != null && !metadata.get(Metadata.AUTHOR).startsWith("SPC")) {
                    if (!metadata.get(Metadata.AUTHOR).startsWith("Anon"))
                        author = metadata.get(Metadata.AUTHOR)
                }

                String content = textHandler.toString()
                //author
                if (author.equals("")) {
                    //author =  "EMPTY"
                    content.eachLine { l ->
                        if (author.equals("")) {
                            if (l.trim().startsWith("I. ")) {
                                if (!l.trim().startsWith("I. Title")) {
                                    if (l.trim().contains("II.")) {
                                        author = l.trim()
                                    }
                                }
                            }
                        }
                    }
                }
                //default author to division
                if (author.equals("")) author = division + ", " + "Secretariat of the Pacific Community (SPC)"

                //isbn, issn
                content.eachLine { l ->
                    if (l.trim().toLowerCase().startsWith("isbn")) {
                        isbn = l.replace("ISBN", "").replace(":", "").trim()
                    }
                    if (l.trim().toLowerCase().startsWith("issn")) {
                        issn = l.replace("ISSN", "").replace(":", "").trim()
                    }
                }


                String created = metadata.get(Metadata.CREATION_DATE)
                created = created.substring(0, created.indexOf("T")).trim()
                println created
                String publisheYear = created.substring(0, created.indexOf("-")).trim()
                //println publisheYear

                String pages = metadata.get("xmpTPg:NPages")

                String fileSize = String.valueOf(f.length() / 1024)
                //fileSize = fileSize.substring(0, fileSize.indexOf(".")) + " kB"

                //category

                if (title.toLowerCase().contains("plan")) category = "Strategic Plan"
                if (title.toLowerCase().contains("annual")) category = "Annual Report"
                if (title.toLowerCase().contains("leaflet")) category = "Awareness Brochure"
                if (title.toLowerCase().contains("manual")) category = "Manual"
                if (fileName.toLowerCase().contains("manual")) category = "Manual"
                if (title.toLowerCase().contains("news")) category = "Newsletter"
                if (title.toLowerCase().contains("review")) category = "Project Report"
                if (title.toLowerCase().contains("assessment")) category = "Project Report"
                if (title.toLowerCase().contains("study")) category = "Project Report"
                if (title.toLowerCase().contains("status")) category = "Project Report"
                if (title.toLowerCase().contains("vulnerability")) category = "Project Report"


                println count.toString() + " : " + title

                //persist
                Publication p = new Publication()
                p.setTitle(title)
                p.setAuthor(author)
                p.setCategory(Category.findWhere(category: category))
                p.setDivision((Division.findWhere(acronym: division)))
                p.setPublishedYear(Integer.parseInt(publisheYear))
                p.setLanguage("EN")
                p.setISBN(isbn)
                p.setISSN(issn)
                p.setFileName(f.getName())
                p.setFileSize(Double.parseDouble(fileSize.trim()))
                p.setNoOfPages(Integer.parseInt(pages.trim()))
                p.setFeatured(false)
                p.setRestricted(false)
                //2012-05-24
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
                Date d1 = sdf.parse(created)
                p.setCreationDate(d1)
                p.setUploadDate(sdf.parse("2013-08-30"))
                p.save(flush: true, failOnError: true)


            }

        }
        println "FINISHED."
        render "<h3>" + count.toString() + "</h3>"

    }


}
