package digitallibrary

/**
 * Division
 * A domain class describes the data object and it's mapping to the database
 */
class Division {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping

    String acronym
    String ENname
    String ENabout
    String FRname
    String FRabout

    static hasMany = [publications: Publication]

    static mapping = {
    }

    static constraints = {
        acronym()
        ENname()
        ENabout(nullable: true)
        FRname(nullable: true)
        FRabout(nullable: true)
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
    public String toString() {
        return "${acronym}";
    }
}
