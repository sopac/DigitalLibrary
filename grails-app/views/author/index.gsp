<html>

<head>
    <title>Next Steps</title>
    <meta name="layout" content="kickstart"/>
</head>

<body>

<h3 align="center" style="background-color: #0088cc; color: white"><g:message code="browse_by_authors"></g:message></h3>

<div align="left">

    <table style="width: 100% !important;">
        <g:each in="${authors.unique(false)}" var="a">
            <tr>
                <td style="width: 80% !important;">
                    <a style="margin-left: 40px" href="${createLink(controller: 'searchable', action: 'index')}?q=author:${a}">${a}</a>
                </td>
                <td>
                    ${authors.count(a)}
                </td>
            </tr>
        </g:each>
    </table>

</div>

</body>

</html>
	