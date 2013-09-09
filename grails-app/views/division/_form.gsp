<%@ page import="digitallibrary.Division" %>



			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'acronym', 'error')} ">
				<label for="acronym" class="control-label"><g:message code="division.acronym.label" default="Acronym" /></label>
				<div class="controls">
					<g:textField name="acronym" value="${divisionInstance?.acronym}"/>
					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'acronym', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'ENname', 'error')} ">
				<label for="ENname" class="control-label"><g:message code="division.ENname.label" default="EN name" /></label>
				<div class="controls">
					<g:textField name="ENname" value="${divisionInstance?.ENname}"/>
					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'ENname', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'ENabout', 'error')} ">
				<label for="ENabout" class="control-label"><g:message code="division.ENabout.label" default="EN about" /></label>
				<div class="controls">
					<g:textField name="ENabout" value="${divisionInstance?.ENabout}"/>
					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'ENabout', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'FRname', 'error')} ">
				<label for="FRname" class="control-label"><g:message code="division.FRname.label" default="FR name" /></label>
				<div class="controls">
					<g:textField name="FRname" value="${divisionInstance?.FRname}"/>
					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'FRname', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'FRabout', 'error')} ">
				<label for="FRabout" class="control-label"><g:message code="division.FRabout.label" default="FR about" /></label>
				<div class="controls">
					<g:textField name="FRabout" value="${divisionInstance?.FRabout}"/>
					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'FRabout', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: divisionInstance, field: 'publications', 'error')} ">
				<label for="publications" class="control-label"><g:message code="division.publications.label" default="Publications" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${divisionInstance?.publications?}" var="p">
    <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="publication" action="create" params="['division.id': divisionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'publication.label', default: 'Publication')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: divisionInstance, field: 'publications', 'error')}</span>
				</div>
			</div>

