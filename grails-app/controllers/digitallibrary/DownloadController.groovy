package digitallibrary

/**
 * DownloadController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DownloadController {

    def ebook = {
        String fn = params.fileName.substring(0, params.fileName.lastIndexOf(".")).trim()
        String url = Global.ebookURL + fn.encodeAsURL() + "/index.html"
        if (Global.exists(url)) {
            redirect(url: url)
        } else {
            flash.message = message(code: 'no_ebook', default: 'Sorry, eBook version does not exist for this publication yet. Please check back later.')
            redirect(controller: 'publication', action: 'show', id: params.id)
        }
    }

    //static scaffold = true
    def index = {
        String fn = Publication.get(params.id).fileName
        def file = new File(Global.path + fn)
        if (!file.exists()) {
            flash.message = "This document is restricted and can not be downloaded. Please contact SPC Publications Section."
            redirect(controller: 'publication', action: 'show', id: params.id)
        } else {
            try {
                byte[] content = file.readBytes()
                OutputStream out = response.getOutputStream();
                // Set headers
                //response.setContentType(bulletin.contentType)
                response.setContentLength(content.size())
                response.setHeader("Content-disposition", "attachment; filename=${fn}")
                /* By default, Tomcat will set headers on any SSL content to deny
         * caching. This will cause downloads to Internet Explorer to fail. So
         * we override Tomcat's default behavior here. */
                response.setHeader("Pragma", "")
                response.setHeader("Cache-Control", "private")
                Calendar cal = Calendar.getInstance()
                cal.add(Calendar.MINUTE, 5)
                response.setDateHeader("Expires", cal.getTimeInMillis())
                // Write the file content
                out.write(content)
                response.outputStream.flush()
                out.close()
            } catch (Exception ex) {
                flash.message = "This document is restricted and can not be downloaded. Please contact SPC Publications Section."
                redirect(controller: 'publication', action: 'show', id: params.id)
            }
        }

    }
}
