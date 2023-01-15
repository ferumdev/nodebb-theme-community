<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="tags">
	<h2 class="fw-semibold">[[pages:tags]]</h2>
	{{{ if displayTagSearch }}}
	{{{ if tags.length }}}
	<div class="row justify-content-end mb-3">
		<div class="col-lg-6">
			<div class="d-flex justify-content-end">
				<div>
					<div class="input-group">
						<input type="text" class="form-control form-control-sm" placeholder="[[global:search]]" id="tag-search">
						<button class="btn btn-primary btn-sm" type="button">
						<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	{{{ end }}}
	{{{ end }}}

	{{{ if !tags.length }}}
	<div class="alert alert-warning">[[tags:no_tags]]</div>
	{{{ end }}}

	<div class="category">
		<div class="tag-list row row-cols-2 row-cols-lg-3 row-cols-xl-4  row-cols-xxl-5 gx-3 gy-2" data-nextstart="{nextStart}">
			<!-- IMPORT partials/tags_list.tpl -->
		</div>
	</div>
</div>
