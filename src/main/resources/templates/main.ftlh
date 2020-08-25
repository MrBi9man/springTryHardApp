
<#import "parts/common.ftlh" as c>

<@c.page>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter!}" placeholder="Find by tag">
            <button class="btn btn-outline-primary ml-3" type="submit">Find</button>
        </form>
    </div>
</div>

    <a class="btn btn-outline-primary mb-3" data-toggle="collapse" href="#addNewNoteForm" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new note
    </a>

    <div class="collapse" id="addNewNoteForm">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Note text">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tags">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-outline-primary" >Save note</button>
                </div>
            </form>
        </div>
    </div>

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
        No notes
</#list>

</@c.page>