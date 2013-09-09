<%@ page import="digitallibrary.Global" %>
<html>

<head>

    <title><g:message code="default.welcome.title" args="[meta(name: 'app.name')]"/></title>
    <meta name="layout" content="kickstart"/>

</head>

<body>

<section id="intro" class="first">

<div align="center">
    <h1 style="background-color: #0088cc; color: white; padding: 10px"><g:message code="spc"></g:message></h1>

    <h2><g:message code="publications_digital_library"></g:message></h2>
</div>

<div align="center">
    <g:form controller="searchable">
    <g:textField style="width: 420px; height: 34px; font-size: 18px" name="q"/>
    <br/>
    <g:link class="btn btn-large btn-primary" style="font-size: 12px !important;"
            controller="searchable"><g:message code="search"></g:message></g:link>
    </g:form>
</div>

<p align="justify">
    <g:message code="intro"/>
   <a href="mailto:pubs@spc.int">pubs@spc.int</a>
</p>

<div align="center">
    <h3 style="background-color: #0088cc; color: white"><g:message code="featured_publications" /></h3>

    <div id="myCarousel" class="carousel slide" data-interval="2000">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>

        <div class="carousel-inner">

            <g:set var="counter" value="${1}"/>

            <g:each in="${digitallibrary.Publication.findAllWhere(featured: true)[0]}" var="p">
                <div class="item active">
                    <a href="${createLink(controller: 'publication', action: 'show', id: p.id)}">
                        <img height="300px" style="height: 300px !important;" src="${Global.thumbURL}${p.fileName.replace('.pdf', '.jpg')}"/>
                    </a>

                    <div style="height: 130px !important;"></div>

                    <div class="container">
                        <div class="carousel-caption">
                            <a href="${createLink(controller: 'publication', action: 'show', id: p.id)}">
                                <h4 style="color: #ffffff !important;">${p.title}</h4>

                                <p style="color: #ffffff !important;">${p.author}, ${p.division.ENname}, ${p.publishedYear}, ${p.category}</p>

                                <p style="color: #ffffff !important;">${counter}|5</p>
                            </a>
                            %{--<p><a class="btn btn-small btn-primary" href="#">View</a></p>--}%
                        </div>
                    </div>
                </div>

            </g:each>

            <g:each in="${digitallibrary.Publication.findAllWhere(featured: true)[1..4]}" var="p">

                <div class="item">
                    <a href="${createLink(controller: 'publication', action: 'show', id: p.id)}">
                        <img height="300px" style="height: 300px !important;" src="${Global.thumbURL}${p.fileName.replace('.pdf', '.jpg')}"/>
                    </a>

                    <div style="height: 130px !important;"></div>

                    <div class="container">
                        <div class="carousel-caption">
                            <a href="${createLink(controller: 'publication', action: 'show', id: p.id)}">
                                <h4 style="color: #ffffff !important;">${p.title}</h4>

                                <p style="color: #ffffff !important;">${p.author}, ${p.division.ENname}, ${p.publishedYear}, ${p.category}</p>
                                <g:set var="counter" value="${counter = counter + 1}"></g:set>
                                <p style="color: #ffffff !important;">${counter}|5</p>
                            </a>

                            %{--<p><a class="btn btn-small btn-primary" href="#">View</a></p>--}%
                        </div>
                    </div>
                </div>
            </g:each>

        </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
                class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next"><span
                class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
</div>

<section id="info" style="margin-top: -80px">
    <div class="row-fluid">
        <div class="span4">
            <div class="center">

                <h3><g:message code="latest_publications"></g:message></h3>
            </div>

            <g:each var="p" in="${digitallibrary.Publication.listOrderByCreationDate(order: 'desc', max: 10)}">
                <p align="justify">
                    <a href="${createLink(controller: 'publication', action: 'show', id: p.id)}">
                        <b>${p.title}</b>
                    </a>
                    <br/>
                    ${p.author}, ${p.division.ENname}, ${p.publishedYear}, ${p.category}
                </p>
            </g:each>

        </div>

        <div class="span4">
            <div class="center">

                <h3><g:message code="browse_by_division"></g:message></h3>
            </div>

            <g:each var="d" in="${digitallibrary.Division.list()}">
                <p align="center">
                    <a href="${createLink(controller: 'division', action: 'show', id: d.id)}">
                        <b>${d.ENname}</b>
                        <br/>
                        ${d.acronym}
                    </a>
                    <br/>
                    ${digitallibrary.Publication.findAllWhere(division: d).size()} Publications
                </p>
            </g:each>
        </div>

        <div class="span4">
            <div class="center">

                <h3><g:message code="browse_by_category"></g:message></h3>
            </div>

            <g:each var="c" in="${digitallibrary.Category.list()}">
                <p align="center">
                    <a href="${createLink(controller: 'category', action: 'show', id: c.id)}">
                        <b>${c.category}</b>
                    </a>
                    <br/>
                    ${digitallibrary.Publication.findAllWhere(category: c).size()} Publications
                </p>
                </p>

            </g:each>

            <br/>

            <div class="center">
                <h3><g:message code="statistics"></g:message></h3>
            </div>
                <table style="width: 100%; margin-left: 40px" cellpadding="10">
                    <tr>
                        <td style="width: 60%">Total Publications</td>
                        <td style="width: 40%; font-style: italic">${digitallibrary.Publication.getAll().size()}</td>
                    </tr>
                    <tr>
                        <td>English Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByLanguage("EN").size()}</td>
                    </tr>
                    <tr>
                        <td>Publications Françaises</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByLanguage("FR").size()}</td>
                    </tr>
                    <tr>
                        <td>2013 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2013).size()}</td>
                    </tr>
                    <tr>
                        <td>2012 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2012).size()}</td>
                    </tr>
                    <tr>
                        <td>2011 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2011).size()}</td>
                    </tr>
                    <tr>
                        <td>2010 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2010).size()}</td>
                    </tr>
                    <tr>
                        <td>2009 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2009).size()}</td>
                    </tr>
                    <tr>
                        <td>2008 Publications</td>
                        <td style="font-style: italic">${digitallibrary.Publication.findAllByPublishedYear(2008).size()}</td>
                    </tr>
                </table>



            <!-- 	                <li>Less 1.3</li> -->
        </div>
    </div>
</section>

</body>

</html>
