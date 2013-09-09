<div class="">
    <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
        %{--
            <g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
                <li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
                    <g:link controller="${c.logicalPropertyName}" action="index">
                        <g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
                    </g:link>
                </li>
            </g:each>
            --}%

        <li class="controller${params.controller == 'home' ? " active" : ""}">
            <g:link controller="home" action="index">
                <g:message code="home"></g:message>
            </g:link>
        </li>

        <li class="controller${params.controller == 'publication' ? " active" : ""}">
            <g:link controller="publication" action="index">
                <g:message code="all_publications"></g:message>
            </g:link>
        </li>

        <li class="controller${params.controller == 'keyword' ? " active" : ""}">
            <g:link controller="keyword" action="index">
                <g:message code="keywords"></g:message>
            </g:link>
        </li>

        <li class="controller${params.controller == 'publication' ? " active" : ""}">
            <g:link controller="publication" action="en_list">
                English Publications
            </g:link>
        </li>


        <li class="controller${params.controller == 'publication' ? " active" : ""}">
            <g:link controller="publication" action="fr_list">
                Publications Françaises
            </g:link>
        </li>

        <li class="controller${params.controller == 'division' ? " active" : ""}">
            <g:link controller="division" action="index">
                Divisions
            </g:link>
        </li>

        <li class="controller${params.controller == 'category' ? " active" : ""}">
            <g:link controller="category" action="index">
                <g:message code="category"></g:message>
            </g:link>
        </li>

        <li class="controller${params.controller == 'author' ? " active" : ""}">
            <g:link controller="author" action="index">
                <g:message code="authors"></g:message>
            </g:link>
        </li>

        <li class="controller${params.controller == 'contact' ? " active" : ""}">
            <g:link controller="contact" action="index">
                <g:message code="contact"></g:message>
            </g:link>
        </li>

    </ul>
</div>
