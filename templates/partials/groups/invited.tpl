<label class="text-xs text-muted">[[groups:invited.search]]</label>
<div class="input-group mb-2">
	<input class="form-control" type="text" component="groups/members/invite"/>
	<span class="input-group-text search-button"><i class="fa fa-search"></i></span>
</div>

<div class="mb-2">
	<label class="text-xs text-muted">[[groups:bulk-invite-instructions]]</label>
	<textarea class="form-control" component="groups/members/bulk-invite"></textarea>
</div>

<div class="mb-2 clearfix">
	<button type="button" class="btn btn-primary btn-sm float-end" component="groups/members/bulk-invite-button">[[groups:bulk-invite]]</button>
</div>

<table component="groups/invited" class="table table-hover">
	{{{ if !group.invited.length }}}
	<div class="alert alert-info">[[groups:invited.none]]</div>
	{{{ end }}}
	{{{each group.invited}}}
	<tr data-uid="{group.invited.uid}" class="align-middle">
		<td class="p-2">
			<a class="text-decoration-none" href="{config.relative_path}/user/{group.invited.userslug}">{buildAvatar(group.invited, "24px", true)}</a>
		</td>
		<td class="member-name p-2 w-100">
			<a href="{config.relative_path}/user/{group.invited.userslug}">{group.invited.username}</a>
		</td>
		<td class="p-2">
			<button class="btn btn-outline-secondary btn-sm text-nowrap" data-action="rescindInvite">[[groups:invited.uninvite]]</button>
		</td>
	</tr>
	{{{end}}}
</table>
