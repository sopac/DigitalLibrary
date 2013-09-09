package digitallibrary

import org.springframework.dao.DataIntegrityViolationException

/**
 * PublicationTextController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class PublicationTextController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [publicationTextInstanceList: PublicationText.list(params), publicationTextInstanceTotal: PublicationText.count()]
    }

    def create() {
        [publicationTextInstance: new PublicationText(params)]
    }

    def save() {
        def publicationTextInstance = new PublicationText(params)
        if (!publicationTextInstance.save(flush: true)) {
            render(view: "create", model: [publicationTextInstance: publicationTextInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), publicationTextInstance.id])
        redirect(action: "show", id: publicationTextInstance.id)
    }

    def show() {
        def publicationTextInstance = PublicationText.get(params.id)
        if (!publicationTextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "list")
            return
        }

        [publicationTextInstance: publicationTextInstance]
    }

    def edit() {
        def publicationTextInstance = PublicationText.get(params.id)
        if (!publicationTextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "list")
            return
        }

        [publicationTextInstance: publicationTextInstance]
    }

    def update() {
        def publicationTextInstance = PublicationText.get(params.id)
        if (!publicationTextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (publicationTextInstance.version > version) {
                publicationTextInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'publicationText.label', default: 'PublicationText')] as Object[],
                        "Another user has updated this PublicationText while you were editing")
                render(view: "edit", model: [publicationTextInstance: publicationTextInstance])
                return
            }
        }

        publicationTextInstance.properties = params

        if (!publicationTextInstance.save(flush: true)) {
            render(view: "edit", model: [publicationTextInstance: publicationTextInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), publicationTextInstance.id])
        redirect(action: "show", id: publicationTextInstance.id)
    }

    def delete() {
        def publicationTextInstance = PublicationText.get(params.id)
        if (!publicationTextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "list")
            return
        }

        try {
            publicationTextInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'publicationText.label', default: 'PublicationText'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
