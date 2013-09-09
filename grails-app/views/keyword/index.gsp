<html>

<head>

    <meta name="layout" content="kickstart"/>
    <script src="http://ict.sopac.org/js/tagcanvas.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        window.onload = function () {
            try {
                TagCanvas.Start('myCanvas', 'tags', {
                    textColour: '#0088cc',
                    outlineColour: 'lightpink',
                    reverse: true,
                    depth: 0.8,
                    maxSpeed: 0.05,
                    weight: true,
                    weightSizeMin: 30,
                    weightSizeMax: 80,
                    wheelZoom: false

                });
            } catch (e) {
                // something went wrong, hide the canvas container
                document.getElementById('myCanvasContainer').style.display = 'none';
            }
        };
    </script>

</head>

<body>

<h3 align="center" style="background-color: #0088cc; color: white"><g:message code="common_keywords"></g:message></h3>

<section id="intro" class="first">

</section>

<div align="center" id="myCanvasContainer">
    <canvas width="600" height="600" id="myCanvas">
        <p>Internet Explorer Is Not Supported. Please Use Google Chrome or Firefox Browser.</p>
    </canvas>
</div>

<div align="center" id="tags">
    <ul>

        <g:each in="${res}" var="k">
            <li><a href="${createLink(controller: 'searchable', action: 'index')}?q=${k}">${k}</a></li>
        </g:each>

    </ul>
</div>

</body>

</html>
	