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

        <tr class="prop">
            <td valign="top" class="name"></td>

            <td valign="top" class="value">

                <g:form controller="download">
                    <g:hiddenField name="id" value="${publicationInstance.id}"></g:hiddenField>
                    <g:actionSubmitImage style="height: 110px !important; margin-top: 30px" align="left" value="Download" action="index" src="${resource(dir: 'images', file: 'download.jpg')}"/>
                </g:form>

                <a href="#" onclick="alert('Sorry, eBook is not available for this publication.')">
                    <g:img align="right" style="height: 120px !important;" dir="images" file="ebook.gif"></g:img>
                </a>
            </td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
