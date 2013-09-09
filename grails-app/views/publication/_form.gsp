<%@ page import="digitallibrary.Publication" %>



<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'title', 'error')} ">
    <label for="title" class="control-label"><g:message code="publication.title.label" default="Title"/></label>

    <div class="controls">
        <g:textField name="title" value="${publicationInstance?.title}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'title', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'author', 'error')} ">
    <label for="author" class="control-label"><g:message code="publication.author.label" default="Author"/></label>

    <div class="controls">
        <g:textField name="author" value="${publicationInstance?.author}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'author', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'division', 'error')} required">
    <label for="division" class="control-label"><g:message code="publication.division.label" default="Division"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="division" name="division.id" from="${digitallibrary.Division.list()}" optionKey="id" required="" value="${publicationInstance?.division?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'division', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'category', 'error')} required">
    <label for="category" class="control-label"><g:message code="publication.category.label" default="Category"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="category" name="category.id" from="${digitallibrary.Category.list()}" optionKey="id" required="" value="${publicationInstance?.category?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'category', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'publishedYear', 'error')} required">
    <label for="publishedYear" class="control-label"><g:message code="publication.publishedYear.label" default="Published Year"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field type="number" name="publishedYear" required="" value="${publicationInstance.publishedYear}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'publishedYear', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'language', 'error')} ">
    <label for="language" class="control-label"><g:message code="publication.language.label" default="Language"/></label>

    <div class="controls">
        <g:select name="language" from="${publicationInstance.constraints.language.inList}" value="${publicationInstance?.language}" valueMessagePrefix="publication.language" noSelection="['': '']"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'language', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'ISBN', 'error')} ">
    <label for="ISBN" class="control-label"><g:message code="publication.ISBN.label" default="ISBN"/></label>

    <div class="controls">
        <g:textField name="ISBN" value="${publicationInstance?.ISBN}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'ISBN', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'ISSN', 'error')} ">
    <label for="ISSN" class="control-label"><g:message code="publication.ISSN.label" default="ISSN"/></label>

    <div class="controls">
        <g:textField name="ISSN" value="${publicationInstance?.ISSN}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'ISSN', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'keywords', 'error')} ">
    <label for="keywords" class="control-label"><g:message code="publication.keywords.label" default="Keywords"/></label>

    <div class="controls">
        <g:textField name="keywords" value="${publicationInstance?.keywords}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'keywords', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'fileName', 'error')} ">
    <label for="fileName" class="control-label"><g:message code="publication.fileName.label" default="File Name"/></label>

    <div class="controls">
        <g:textField name="fileName" value="${publicationInstance?.fileName}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'fileName', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'creationDate', 'error')} required">
    <label for="creationDate" class="control-label"><g:message code="publication.creationDate.label" default="Creation Date"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <bs:datePicker name="creationDate" precision="day" value="${publicationInstance?.creationDate}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'creationDate', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'noOfPages', 'error')} required">
    <label for="noOfPages" class="control-label"><g:message code="publication.noOfPages.label" default="No Of Pages"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field type="number" name="noOfPages" required="" value="${publicationInstance.noOfPages}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'noOfPages', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'fileSize', 'error')} required">
    <label for="fileSize" class="control-label"><g:message code="publication.fileSize.label" default="File Size"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field type="number" name="fileSize" step="any" required="" value="${publicationInstance.fileSize}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'fileSize', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'uploadDate', 'error')} required">
    <label for="uploadDate" class="control-label"><g:message code="publication.uploadDate.label" default="Upload Date"/><span class="required-indicator">*</span>
    </label>

    <div class="controls">
        <bs:datePicker name="uploadDate" precision="day" value="${publicationInstance?.uploadDate}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'uploadDate', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'featured', 'error')} ">
    <label for="featured" class="control-label"><g:message code="publication.featured.label" default="Featured"/></label>

    <div class="controls">
        <bs:checkBox name="featured" value="${publicationInstance?.featured}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'featured', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: publicationInstance, field: 'restricted', 'error')} ">
    <label for="restricted" class="control-label"><g:message code="publication.restricted.label" default="Restricted"/></label>

    <div class="controls">
        <bs:checkBox name="restricted" value="${publicationInstance?.restricted}"/>
        <span class="help-inline">${hasErrors(bean: publicationInstance, field: 'restricted', 'error')}</span>
    </div>
</div>

