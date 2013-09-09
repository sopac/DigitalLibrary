package digitallibrary



import org.junit.*
import grails.test.mixin.*

/**
 * PublicationTextControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PublicationTextController)
@Mock(PublicationText)
class PublicationTextControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/publicationText/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.publicationTextInstanceList.size() == 0
        assert model.publicationTextInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.publicationTextInstance != null
    }

    void testSave() {
        controller.save()

        assert model.publicationTextInstance != null
        assert view == '/publicationText/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/publicationText/show/1'
        assert controller.flash.message != null
        assert PublicationText.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationText/list'


        populateValidParams(params)
        def publicationText = new PublicationText(params)

        assert publicationText.save() != null

        params.id = publicationText.id

        def model = controller.show()

        assert model.publicationTextInstance == publicationText
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationText/list'


        populateValidParams(params)
        def publicationText = new PublicationText(params)

        assert publicationText.save() != null

        params.id = publicationText.id

        def model = controller.edit()

        assert model.publicationTextInstance == publicationText
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/publicationText/list'

        response.reset()


        populateValidParams(params)
        def publicationText = new PublicationText(params)

        assert publicationText.save() != null

        // test invalid parameters in update
        params.id = publicationText.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/publicationText/edit"
        assert model.publicationTextInstance != null

        publicationText.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/publicationText/show/$publicationText.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        publicationText.clearErrors()

        populateValidParams(params)
        params.id = publicationText.id
        params.version = -1
        controller.update()

        assert view == "/publicationText/edit"
        assert model.publicationTextInstance != null
        assert model.publicationTextInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/publicationText/list'

        response.reset()

        populateValidParams(params)
        def publicationText = new PublicationText(params)

        assert publicationText.save() != null
        assert PublicationText.count() == 1

        params.id = publicationText.id

        controller.delete()

        assert PublicationText.count() == 0
        assert PublicationText.get(publicationText.id) == null
        assert response.redirectedUrl == '/publicationText/list'
    }
}
