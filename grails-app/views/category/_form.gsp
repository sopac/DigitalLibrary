<%@ page import="digitallibrary.Category" %>



			<div class="control-group fieldcontain ${hasErrors(bean: categoryInstance, field: 'category', 'error')} ">
				<label for="category" class="control-label"><g:message code="category.category.label" default="Category" /></label>
				<div class="controls">
					<g:textField name="category" value="${categoryInstance?.category}"/>
					<span class="help-inline">${hasErrors(bean: categoryInstance, field: 'category', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoryInstance, field: 'frenchCategory', 'error')} ">
				<label for="frenchCategory" class="control-label"><g:message code="category.frenchCategory.label" default="French Category" /></label>
				<div class="controls">
					<g:textField name="frenchCategory" value="${categoryInstance?.frenchCategory}"/>
					<span class="help-inline">${hasErrors(bean: categoryInstance, field: 'frenchCategory', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: categoryInstance, field: 'publications', 'error')} ">
				<label for="publications" class="control-label"><g:message code="category.publications.label" default="Publications" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${categoryInstance?.publications?}" var="p">
    <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publication" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'Publication')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: categoryInstance, field: 'publications', 'error')}</span>
				</div>
			</div>

