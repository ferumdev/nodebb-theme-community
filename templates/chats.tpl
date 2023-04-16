<div class="chats-full d-flex gap-1 h-100 mt-3 mt-md-0 py-md-3">
	<div class="flex-shrink-0 d-flex flex-column h-100" component="chat/nav-wrapper" data-loaded="{{{ if roomId }}}1{{{ else }}}0{{{ end }}}">
		<div class="chat-search dropdown mb-2">
			<label class="text-sm text-muted">[[users:search-user-for-chat]]</label>

			<div class="input-group">
				<input class="form-control text-sm" type="text" component="chat/search" data-bs-toggle="dropdown" />
				<ul component="chat/search/list" class="dropdown-menu text-sm">
					<li><a href="#" class="dropdown-item rounded-1">[[admin/menu:search.start-typing]]</a></li>
				</ul>
				<button class="btn btn-sm btn-primary" type="button">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
		<hr class="my-1">
		<div component="chat/recent" class="chats-list overflow-auto mb-0 pe-1" data-nextstart="{nextStart}">
			{{{each rooms}}}
			<!-- IMPORT partials/chats/recent_room.tpl -->
			{{{end}}}
		</div>
	</div>
	<div class="flex-grow-1 ms-md-2 ps-md-2 border-1 border-start-md h-100" component="chat/main-wrapper" style="min-width: 0;">
		<!-- IMPORT partials/chats/message-window.tpl -->
	</div>
	<div class="imagedrop"><div>[[topic:composer.drag_and_drop_images]]</div></div>
</div>
