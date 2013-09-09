<%@ page import="digitallibrary.Division" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'division.label', default: 'Division')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-division" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.acronym.label" default="Acronym"/></td>

            <td valign="top" class="value">
                <b style="color: #0088cc">
                    ${fieldValue(bean: divisionInstance, field: "acronym")}
                </b>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.ENname.label" default="EN Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: divisionInstance, field: "ENname")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.ENabout.label" default="EN About"/></td>

            <td valign="top" class="value">${fieldValue(bean: divisionInstance, field: "ENabout")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.FRname.label" default="FR Name"/></td>

            <td valign="top" class="value">${fieldValue(bean: divisionInstance, field: "FRname")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.FRabout.label" default="FR About"/></td>

            <td valign="top" class="value">${fieldValue(bean: divisionInstance, field: "FRabout")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="division.publications.label" default="Publications"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${divisionInstance.publications}" var="p">
                        <li><g:link controller="publication" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
