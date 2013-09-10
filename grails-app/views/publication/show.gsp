<%@ page import="digitallibrary.Global; digitallibrary.Publication" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-publication" class="first">

    <table style="margin-top: 20px" class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name" style="width: 30% !important;">
                <img align="left" style="margin: 0px" src="${Global.thumbURL}${publicationInstance.fileName.replace('.pdf', '.jpg')}"
                     onerror="this.src = '${Global.thumbURL}none.png'"/>
            </td>

            <td valign="top" class="value" style="width: 70% !important;">
                <h3>${publicationInstance.title}</h3>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.title.label" default="Title"/></td>

            <td valign="top" class="value">${fieldValue(bean: publicationInstance, field: "title")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.author.label" default="Author"/></td>

            <td valign="top" class="value">
                <a href="${createLink(controller: 'searchable', action: 'index')}?q=author:${publicationInstance.author}">
                    ${fieldValue(bean: publicationInstance, field: "author")}
                </a>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.division.label" default="Division"/></td>

            <td valign="top" class="value"><g:link controller="division" action="show"
                                                   id="${publicationInstance?.division?.id}">${publicationInstance?.division?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.category.label" default="Category"/></td>

            <td valign="top" class="value"><g:link controller="category" action="show"
                                                   id="${publicationInstance?.category?.id}">${publicationInstance?.category?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.publishedYear.label"
                                                     default="Published Year"/></td>

            <td valign="top" class="value">
                <a href="${createLink(controller: 'searchable', action: 'index')}?q=publishedYear:${publicationInstance.publishedYear}">
                    ${fieldValue(bean: publicationInstance, field: "publishedYear")}
                </a>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.language.label" default="Language"/></td>

            <td valign="top" class="value">${fieldValue(bean: publicationInstance, field: "language")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.ISBN.label" default="ISBN"/></td>

            <td valign="top" class="value">
                ${fieldValue(bean: publicationInstance, field: "ISBN")}
                <g:if test="${publicationInstance.ISBN.equals("")}">
                    <i>None</i>
                </g:if>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.ISSN.label" default="ISSN"/></td>

            <td valign="top" class="value">
                ${fieldValue(bean: publicationInstance, field: "ISSN")}
                <g:if test="${publicationInstance.ISSN.equals("")}">
                    <i>None</i>
                </g:if>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.keywords.label" default="Keywords"/></td>

            <td valign="top" class="value">
                <i>Pending</i>
                ${fieldValue(bean: publicationInstance, field: "keywords")}
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.fileName.label" default="File Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: publicationInstance, field: "fileName")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.creationDate.label"
                                                     default="Creation Date"/></td>

            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${publicationInstance?.creationDate}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.noOfPages.label" default="No Of Pages"/></td>

            <td valign="top" class="value">${fieldValue(bean: publicationInstance, field: "noOfPages")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.fileSize.label" default="File Size"/></td>

            <td valign="top" class="value">${fieldValue(bean: publicationInstance, field: "fileSize")} Kb</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.uploadDate.label" default="Upload Date"/></td>

            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${publicationInstance?.uploadDate}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.featured.label" default="Featured"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${publicationInstance?.featured}"/></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="publication.restricted.label" default="Restricted"/></td>

            <td valign="top" class="value"><g:formatBoolean boolean="${publicationInstance?.restricted}"/></td>

        </tr>

        </tbody>
    </table>

</section>

<hr/>

<table align="center" style="width: 100% !important;">
    <tr>

        <td style="width: 25% !important;" valign="middle">
            <g:form controller="download">
                <g:hiddenField name="id" value="${publicationInstance.id}"></g:hiddenField>
                <g:actionSubmitImage style="height: 110px !important; margin-top: 30px;" align="center" value="Download" action="index" src="${resource(dir: 'images', file: 'download.jpg')}"/>
            </g:form>
        </td>

        <td style="width: 25% !important;" valign="middle">
            <!-- Button to trigger modal -->
            <a href="#ptModal" role="button" align="center" style="" class="btn" data-toggle="modal">
                <g:message default="Preview Publication Text" code="preview_publication_text"></g:message>
            </a>
            <!-- Modal -->
            <div id="ptModal" class="modal hide fade" style="width: 700px; height: 600px" tabindex="-1" role="dialog" aria-labelledby="ptModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                    <h3 id="ptModalLabel">${publicationInstance.title}</h3>
                </div>

                <div class="modal-body">
                    <p>${digitallibrary.PublicationText.findWhere(publicationId: publicationInstance.id).text.replaceAll("\n", "<br/>")}</p>
                </div>

                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>
        </td>



        <td style="width: 25% !important;">
            <g:form controller="download" action="ebook">
                <g:hiddenField name="id" value="${publicationInstance.id}"></g:hiddenField>
                <g:hiddenField name="fileName" value="${publicationInstance.fileName}"></g:hiddenField>
                <g:actionSubmitImage style="height: 120px !important; margin-left: 100px" value="eBook" action="ebook" src="${resource(dir: 'images', file: 'ebook.gif')}"></g:actionSubmitImage>
            </g:form>
        </td>

        <td style="width: 25% !important; text-align: right" align="right" valign="middle">
            <a href="#eModal" role="button" align="right" style="text-decoration: none; border: none !important;" class="btn" data-toggle="modal">
                <g:img align="right" style="height: 80px !important;" dir="images" file="email.png"></g:img>
            </a>

            <!-- Modal -->
            <div id="eModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="eModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                    <h3 id="eModalLabel">Send Publication Link Via Email</h3>
                </div>

                <div class="modal-body">

                    <table>
                        <tr>
                            <td>Your Name :</td>
                            <td><g:textField name="name"></g:textField><td>
                        </tr>
                        <tr>
                            <td>Destination Email :</td>
                            <td><g:textField name="email"></g:textField></td>
                        </tr>
                        <tr>
                            <td>Message :</td>
                            <td><g:textArea name="msg"></g:textArea></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td>${publicationInstance.title}</td>
                        </tr>

                    </table>

                </div>

                <div class="modal-footer">
                    <button onclick="alert('Sorry, Email Sharing Not Implemented Yet.')" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Send</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>

        </td>
    </tr>

</table>

</body>

</html>
