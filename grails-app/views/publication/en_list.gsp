
<%@ page import="digitallibrary.Global; digitallibrary.Publication" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-publication" class="first">
    <h3 align="center" style="background-color: #0088cc; color: white">English Publications</h3>
	<table class="table table-bordered">
		<thead>
			<tr>

                <th></th>
			
				<g:sortableColumn property="title" title="${message(code: 'publication.title.label', default: 'Title')}" />
			
				<g:sortableColumn property="author" title="${message(code: 'publication.author.label', default: 'Author')}" />
			
				<th><g:message code="publication.division.label" default="Division" /></th>
			
				<th><g:message code="publication.category.label" default="Category" /></th>
			
				<g:sortableColumn property="publishedYear" title="${message(code: 'publication.publishedYear.label', default: 'Year')}" />
			
				<g:sortableColumn property="language" title="${message(code: 'publication.language.label', default: 'Language')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${publicationInstanceList}" status="i" var="publicationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td style="width: 120px !important;">
                    <img src="${Global.thumbURL}${publicationInstance.fileName.replace('.pdf', '.jpg')}" onerror="this.src='${Global.thumbURL}none.png'" />
                </td>
			
				<td><g:link action="show" id="${publicationInstance.id}">${fieldValue(bean: publicationInstance, field: "title")}</g:link></td>
			
				<td>${fieldValue(bean: publicationInstance, field: "author")}</td>
			
				<td>${fieldValue(bean: publicationInstance, field: "division")}</td>
			
				<td>${fieldValue(bean: publicationInstance, field: "category")}</td>
			
				<td>${fieldValue(bean: publicationInstance, field: "publishedYear")}</td>
			
				<td>${fieldValue(bean: publicationInstance, field: "language")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${publicationInstanceTotal}" />
	</div>
</section>

</body>

</html>
