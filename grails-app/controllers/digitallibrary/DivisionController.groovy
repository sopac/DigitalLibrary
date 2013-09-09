package digitallibrary

import org.springframework.dao.DataIntegrityViolationException

/**
 * DivisionController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class DivisionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [divisionInstanceList: Division.list(params), divisionInstanceTotal: Division.count()]
    }

    def create() {
        [divisionInstance: new Division(params)]
    }

    def save() {
        def divisionInstance = new Division(params)
        if (!divisionInstance.save(flush: true)) {
            render(view: "create", model: [divisionInstance: divisionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'division.label', default: 'Division'), divisionInstance.id])
        redirect(action: "show", id: divisionInstance.id)
    }

    def show() {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "list")
            return
        }

        [divisionInstance: divisionInstance]
    }

    def edit() {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "list")
            return
        }

        [divisionInstance: divisionInstance]
    }

    def update() {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (divisionInstance.version > version) {
                divisionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'division.label', default: 'Division')] as Object[],
                          "Another user has updated this Division while you were editing")
                render(view: "edit", model: [divisionInstance: divisionInstance])
                return
            }
        }

        divisionInstance.properties = params

        if (!divisionInstance.save(flush: true)) {
            render(view: "edit", model: [divisionInstance: divisionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'division.label', default: 'Division'), divisionInstance.id])
        redirect(action: "show", id: divisionInstance.id)
    }

    def delete() {
        def divisionInstance = Division.get(params.id)
        if (!divisionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "list")
            return
        }

        try {
            divisionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'division.label', default: 'Division'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
