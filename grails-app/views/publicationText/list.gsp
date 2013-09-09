
<%@ page import="digitallibrary.PublicationText" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'publicationText.label', default: 'PublicationText')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-publicationText" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="publicationId" title="${message(code: 'publicationText.publicationId.label', default: 'Publication Id')}" />

				<g:sortableColumn property="text" title="${message(code: 'publicationText.text.label', default: 'Text')}" />

				<g:sortableColumn property="summary" title="${message(code: 'publicationText.summary.label', default: 'Summary')}" />

			</tr>
		</thead>
		<tbody>
		<g:each in="${publicationTextInstanceList}" status="i" var="publicationTextInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${publicationTextInstance.id}">${fieldValue(bean: publicationTextInstance, field: "publicationId")}</g:link></td>
			
				<td>${fieldValue(bean: publicationTextInstance, field: "text").substring(0, 1000)}</td>
			
				<td>${fieldValue(bean: publicationTextInstance, field: "summary")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${publicationTextInstanceTotal}" />
	</div>
</section>

</body>

</html>
