<%@ page import="digitallibrary.PublicationText" %>



			<div class="control-group fieldcontain ${hasErrors(bean: publicationTextInstance, field: 'publicationId', 'error')} required">
				<label for="publicationId" class="control-label"><g:message code="publicationText.publicationId.label" default="Publication Id" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="publicationId" required="" value="${publicationTextInstance.publicationId}"/>
					<span class="help-inline">${hasErrors(bean: publicationTextInstance, field: 'publicationId', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: publicationTextInstance, field: 'text', 'error')} ">
				<label for="text" class="control-label"><g:message code="publicationText.text.label" default="Text" /></label>
				<div class="controls">
					<g:textArea name="text" cols="40" rows="5" maxlength="2500" value="${publicationTextInstance?.text}"/>
					<span class="help-inline">${hasErrors(bean: publicationTextInstance, field: 'text', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: publicationTextInstance, field: 'summary', 'error')} ">
				<label for="summary" class="control-label"><g:message code="publicationText.summary.label" default="Summary" /></label>
				<div class="controls">
					<g:textArea name="summary" cols="40" rows="5" maxlength="2500" value="${publicationTextInstance?.summary}"/>
					<span class="help-inline">${hasErrors(bean: publicationTextInstance, field: 'summary', 'error')}</span>
				</div>
			</div>

