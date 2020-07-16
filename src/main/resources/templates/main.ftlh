<#--commented sections are mustach legacy-->

<#--<html>-->

<#--<body>-->
<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
<#--        <form action="/logout" method="post">-->
<#--            <input type="hidden" name="_csrf" value="{{_csrf.token}}"/>-->
<#--            <input type="submit" value="Sign Out"/>-->
<#--        </form>-->
        <@l.logout/>

    </div>
    <div>
        <form action="/user" method="get">
            <input type="submit" value="List of all users"/>
        </form>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Vvedite text">
            <input type="text" name="tag" placeholder="Tags">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Sohtanit' soobshenie</button>
        </form>
    </div>
    <div>Messages list</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!}">
                <button type="submit">find</button>
    </form>
<#list messages as message>
<div>
    <b>${message.id}}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
    <br>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}">
        </#if>
    </div>
</div>
    <#else>
        No messages
</#list>
<#--    {{#messages}}-->
<#--        <b>{{id}}</b>-->
<#--        <span>{{text}}</span>-->
<#--        <i>{{tag}}</i>-->
<#--        <strong>{{authorName}}</strong>-->
<#--        <br>-->
<#--    {{/messages}}-->
<#--</body>-->
<#--</html>-->
</@c.page>