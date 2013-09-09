<html>

<head>

    <meta name="layout" content="kickstart"/>

</head>

<body>

<h3 align="center" style="background-color: #0088cc; color: white">Common Keywords List</h3>

<section id="intro" class="first">

</section>

<div align="center">

    <ul style="list-style-type: none;">

        <g:each in="${res}" var="k">
            <li><a href="${createLink(controller: 'searchable', action: 'index')}?q=${k}">${k}</a></li>
        </g:each>

    </ul>
</div>

</body>

</html>
	