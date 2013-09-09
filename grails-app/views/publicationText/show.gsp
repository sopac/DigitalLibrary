
<%@ page import="digitallibrary.PublicationText" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'publicationText.label', default: 'PublicationText')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-publicationText" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="publicationText.publicationId.label" default="Publication Id" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: publicationTextInstance, field: "publicationId")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="publicationText.text.label" default="Text" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: publicationTextInstance, field: "text")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="publicationText.summary.label" default="Summary" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: publicationTextInstance, field: "summary")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
