<#import "parts/common.ftlh" as c>
<@c.page>
User editor
    <form action="/user" method="post">
        <input type="text" value="${user.username}" name="username">

        <#list roles as role>
        <div>

<#--            ${user.roles?seq_contains(role)?string("checked","")
                true(checked)/false(_) freemarker check
-->
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}>${role}</label>
        </div>
        </#list>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">Save changes</button>
    </form>
    <div>
    <form action="/user?" method="get">
        <input type="submit" value="Back"/>
    </form>
    </div>
</@c.page>