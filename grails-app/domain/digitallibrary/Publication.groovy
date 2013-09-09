package digitallibrary

/**
 * Publication
 * A domain class describes the data object and it's mapping to the database
 */
class Publication {

    static searchable = true

    String title //from  featured.csv
    String author      //form pdf properties, then, pdf text
    Division division  //from featured.csv
    Category category //Project Report, Annual Report, Strategic Plan, Awareness Brochure, Manual, Newsletter, Policy Brief
    int publishedYear
    String language //enum
    String ISBN //pdf text
    String ISSN //pdf text
    String keywords
    String fileName
    Date creationDate
    int noOfPages
    double fileSize // kb
    Date uploadDate = new Date()
    boolean featured = false
    boolean restricted = false

    static constraints = {
        title()
        author()
        division()
        category()
        publishedYear()
        language(inList: ['EN', 'FR'])
        ISBN()
        ISSN()
        keywords(nullable: true, blank: true)
        fileName()
        creationDate()
        noOfPages()
        fileSize()
        featured()
        restricted()
        uploadDate()
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
    public String toString() {
        return "${title}";
    }
}
