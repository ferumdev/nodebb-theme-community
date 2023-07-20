<ul component="category" class="topics-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">

	{{{ each topics }}}
	<li component="category/topic" class="category-item border-bottom py-3 position-relative w-100 d-flex flex-column flex-lg-row align-items-start {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<link itemprop="url" content="{config.relative_path}/topic/{./slug}" />
		<meta itemprop="name" content="{function.stripTags, ./title}" />
		<meta itemprop="itemListOrder" content="descending" />
		<meta itemprop="position" content="{./index}" />
		<a id="{./index}" data-index="{./index}" component="topic/anchor"></a>


		<div class="d-flex p-0 col-12 col-lg-7 gap-2 gap-lg-3 pe-1 align-items-start">
			<div class="flex-shrink-0 position-relative">
				{{{ if ./thumbs.length }}}
				<a class="position-relative text-decoration-none flex-shrink-0" href="{config.relative_path}/topic/{./slug}{{{ if ./bookmark }}}/{./bookmark}{{{ end }}}">
				<img class="topic-thumb rounded-1 bg-light" style="width:auto;max-width: 5.33rem;height: 3.33rem;object-fit: contain;" src="{./thumbs.0.url}"/>
				<span data-numthumbs="{./thumbs.length}" class="px-1 position-absolute top-0 start-100 translate-middle badge rounded bg-info" style="z-index: 1;">+{increment(./thumbs.length, "-1")}</span>
				</a>
				{{{ else }}}
				<a class="text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
					{buildAvatar(./user, "40px", true, "avatar avatar-tooltip")}
				</a>
				{{{ end }}}
			</div>
			<div class="flex-grow-1 d-flex flex-wrap gap-1 position-relative">
				<h3 component="topic/header" class="title text-break fs-5 fw-semibold m-0 tracking-tight w-100 {{{ if showSelect }}}me-4 me-lg-0{{{ end }}}">
					{{{ if widgets.topic-title-left.length }}}
					<span data-widget-area="topic-title-left">
					{{{each widgets.topic-title-left}}}
					{{widgets.topic-title-left.html}}
					{{{end}}}
					</span>
					{{{ end }}}
					{{{ if topics.noAnchor }}}
					<span>{./title}</span>
					{{{ else }}}
					<a class="text-reset" href="{config.relative_path}/topic/{./slug}{{{ if ./bookmark }}}/{./bookmark}{{{ end }}}">{./title}</a>
					{{{ end }}}
					{{{ if widgets.topic-title-right.length }}}
					<span data-widget-area="topic-title-right">
					{{{each widgets.topic-title-right}}}
					{{widgets.topic-title-right.html}}
					{{{end}}}
					</span>
					{{{ end }}}
				</h3>
				<span component="topic/labels" class="d-flex flex-wrap gap-1">
					<span component="topic/scheduled" class="badge border border-gray-300 text-muted {{{ if !./scheduled }}}hidden{{{ end }}}">
						<i class="fa fa-clock-o"></i>
						<span class="d-none d-xl-inline">[[topic:scheduled]]</span>
					</span>
					<span component="topic/pinned" class="badge border border-gray-300 text-muted {{{ if (./scheduled || !./pinned) }}}hidden{{{ end }}}">
						<i class="fa fa-thumb-tack"></i>
						<span class="d-none d-xl-inline">{{{ if !./pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {isoTimeToLocaleString(./pinExpiryISO)}]]{{{ end }}}</span>
					</span>
					<span component="topic/locked" class="badge border border-gray-300 text-muted {{{ if !./locked }}}hidden{{{ end }}}">
						<i class="fa fa-lock"></i>
						<span class="d-none d-xl-inline">[[topic:locked]]</span>
					</span>
					<span class="badge border border-gray-300 text-muted {{{ if !./oldCid }}}hidden{{{ end }}}">
						<i class="fa fa-arrow-circle-right"></i>
						<span class="d-none d-xl-inline">[[topic:moved]]</span>
					</span>
					{{{each ./icons}}}<span class="lh-1">{@value}</span>{{{end}}}
					{{{ if !template.category }}}
					<a class="lh-1" href="{config.relative_path}/category/{./category.slug}">{function.buildCategoryLabel, ./category, "border"}</a>
					{{{ end }}}
					<span data-tid="{./tid}" component="topic/tags" class="lh-1 tag-list hidden-xs d-flex flex-wrap gap-1 {{{ if !./tags.length }}}hidden{{{ end }}}">
						{{{ each ./tags }}}
						<a href="{config.relative_path}/tags/{./valueEncoded}"><span class="badge border border-gray-300 text-muted fw-normal tag tag-class-{./class}" data-tag="{./value}">{./valueEscaped}</span></a>
						{{{ end }}}
					</span>
					{{{ if !./tags.length}}}
					<span class="badge bg-transparent text-muted fw-normal timeago" title="{./timestampISO}"></span>
					{{{ end }}}
					{{{ if !config.theme.mobileTopicTeasers}}}
					<span class="hidden badge bg-transparent text-muted fw-normal timeago" title="{{{ if ./teaser.timestampISO }}}{./teaser.timestampISO}{{{ else }}}{./timestampISO}{{{ end }}}"></span>
					{{{ end }}}
				</span>
			</div>
		</div>

		<div class="d-flex p-0 col-lg-5 align-content-stretch">
			<div class="meta stats d-none d-lg-grid col-6 gap-1 pe-2 text-muted" style="grid-template-columns: 1fr 1fr 1fr;">
				{{{ if !reputation:disabled }}}
				<div class="stats-votes align-items-center card px-3 py-0 border-0 rounded-1 bg-transparent">
					<i class="fas fa-caret-up text-sm"></i>
					<span class="fw-semibold" title="{./votes}">{humanReadableNumber(./votes, 0)}</span>
					<i class="fas fa-caret-down text-sm"></i>
				</div>
				{{{ end }}}
				<div class="stats-postcount card card-header align-items-center card card-header px-0 py-1 border-0 rounded-1">
					<span class="text-sm fw-semibold" title="{./postcount}">{humanReadableNumber(./postcount, 0)}</span>
					<span class="text-lowercase text-sm"><i class="fas fa-comments"></i></span>
				</div>
				<div class="stats-viewcount card card-header align-items-center card card-header px-0 py-1 border-0 rounded-1">
					<span class="text-sm fw-semibold" title="{./viewcount}">{humanReadableNumber(./viewcount, 0)}</span>
					<span class="text-lowercase text-sm"><i class="fa-solid fa-chart-simple"></i></span>
				</div>
			</div>
			<div component="topic/teaser" class="meta teaser col-lg-6 {{{ if !config.theme.mobileTopicTeasers }}}d-none d-lg-block{{{ end }}}">
				<div class="lastpost background-link-container border-start border-2 lh-sm h-100" style="border-color: {./category.bgColor}!important;">
					<a class="background-link" href="{config.relative_path}/topic/{./slug}/{./teaser.index}"></a>
					{{{ if ./unreplied }}}
					<div class="ps-2 text-xs">
						[[category:no_replies]]
					</div>
					{{{ else }}}
					{{{ if ./teaser.pid }}}
					<div class="ps-2">
						<a href="{config.relative_path}/user/{./teaser.user.userslug}" class="text-decoration-none">{buildAvatar(./teaser.user, "18px", true, "avatar-tooltip not-responsive")}</a>
						<a class="permalink text-muted timeago text-xs" href="{config.relative_path}/topic/{./slug}/{./teaser.index}" title="{./teaser.timestampISO}">
						</a>
					</div>
					<div class="post-content text-xs ps-2 line-clamp-2 lh-sm text-break">
						{./teaser.content}
					</div>
					{{{ end }}}
					{{{ end }}}
				</div>
			</div>
		</div>
		{{{ if showSelect }}}
				<div class="checkbox position-absolute end-0" style="max-width:max-content">
					<i component="topic/select" class="fa text-muted pointer fa-square-o"></i>
				</div>
		{{{ end }}}
	</li>
	{{{end}}}
</ul>
