import digitallibrary.Division

class BootStrap {

    def init = { servletContext ->

        if (Division.getAll().size() == 0) {
            Map<String, String> d = new HashMap<String, String>();
            d.put("EDD", "Economic Development Division")
            d.put("ETHD", "Education, Training and Human Development Division")
            d.put("FAME", "Fisheries, Aquaculture and Marine Ecosystem Division")
            d.put("LRD", "Land Resources Division")
            d.put("OMD", "Operations and Management Division")
            d.put("PHD", "Public Health Division")
            d.put("SDD", "Statistics for Development Division")
            d.put("SEPPF", "Strategic Engagement, Policy and Planning Facility")
            d.put("SOPAC", "Applied GeoScience and Technology Division")
            d.put("CCOP/SOPAC", "Pacific Islands Applied GeoScience Commission")

            for (String a : d.keySet()) {
                Division division = new Division()
                division.acronym = a
                division.ENname = d.get(a)

                division.save(flush: true, failOnError: true)

            }
        }

        if (digitallibrary.Category.getAll().size() == 0) {
            def list = []
            list << "Project Report"
            list << "Annual Report"
            list << "Strategic Plan"
            list << "Awareness Brochure"
            list << "Manual"
            list << "Newsletter"
            list << "Policy Brief"
            list << "Technical Note"
            list << "Other"

            for (String l : list) {
                digitallibrary.Category c = new digitallibrary.Category()
                c.setCategory(l)
                c.setFrenchCategory("")
                c.save(flush: true, failOnError: true)
            }
        }

    }
    def destroy = {
    }
}
