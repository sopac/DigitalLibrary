
<%@ page import="digitallibrary.Category" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<h3 align="center" style="background-color: #0088cc; color: white"><g:message code="categories"></g:message> </h3>

<section id="list-category" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="category" title="${message(code: 'category.category.label', default: 'Category')}" />
			
				<g:sortableColumn property="frenchCategory" title="${message(code: 'category.frenchCategory.label', default: 'French Category')}" />

                <td><b>No. Publications</b></td>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "category")}</g:link></td>
			
				<td>${fieldValue(bean: categoryInstance, field: "frenchCategory")}</td>

                <td>${categoryInstance.publications.size()}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${categoryInstanceTotal}" />
	</div>
</section>

</body>

</html>
