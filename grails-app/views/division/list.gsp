<%@ page import="digitallibrary.Division" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'division.label', default: 'Division')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h3 align="center" style="background-color: #0088cc; color: white">Divisions</h3>

<section id="list-division" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>

            <g:sortableColumn property="acronym" title="${message(code: 'division.acronym.label', default: 'Acronym')}"/>

            <g:sortableColumn property="ENname" title="${message(code: 'division.ENname.label', default: 'EN Name')}"/>

            <g:sortableColumn property="FRname" title="${message(code: 'division.FRname.label', default: 'FR Name')}"/>

            <td><b>No. Publications</b></td>

        </tr>
        </thead>
        <tbody>
        <g:each in="${divisionInstanceList}" status="i" var="divisionInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show" id="${divisionInstance.id}">${fieldValue(bean: divisionInstance, field: "acronym")}</g:link></td>

                <td>${fieldValue(bean: divisionInstance, field: "ENname")}</td>


                <td>${fieldValue(bean: divisionInstance, field: "FRname")}</td>


                <td>${divisionInstance.publications.size()}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <bs:paginate total="${divisionInstanceTotal}"/>
    </div>
</section>

</body>

</html>
