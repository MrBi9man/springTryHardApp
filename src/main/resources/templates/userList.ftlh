<#import "parts/common.ftlh" as c>
<@c.page>

    Users list
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>

    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>::</#list></td>
            <td><a href="/user/${user.id}">more</a> </td>
        </tr>

    </#list>
    </tbody>
</table>
    <div>
        <form action="/main" method="get">
            <input type="submit" value="Back"/>
        </form>
    </div>
</@c.page>