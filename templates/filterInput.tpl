{**
 * plugins/generic/lucene/templates/filterInput.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Search::SearchResults::FilterInput hook.
 *
 * Parameters:
 *   $filterName string
 *   $filterValue string
 *}
<script>

		{capture assign="autocompleteUrl"}{url page="lucene" op="queryAutocomplete" searchField=$searchfield}{/capture}

		document.addEventListener("DOMContentLoaded", function(event){ldelim}
		$('#{$filterName}Autocomplete').find("#{$filterName}_input").autocomplete(
				{ldelim}
					source:  function(request, response) {ldelim}
					$.ajax({ldelim}
						url: ' 	{$autocompleteUrl}',
						data: {ldelim}query: request.term},
						dataType: 'json',
						success: function(jsonData) {ldelim}
							if (jsonData.status == true) {ldelim}
								response(jsonData.content);
							{rdelim}
						{rdelim}
					{rdelim});
				}
				{rdelim}
		)

	{rdelim});
</script>
<span id="{$filterName}Autocomplete">
	<input type="text" id="{$filterName}_input" name="{$filterName}" size="{$size|default:40}" maxlength="255" value="{$filterValue|escape}" class="textField" />
	<input type="hidden" id="{$filterName}" name="{$filterName}_hidden" value="{$filterValue|escape}" />
</span>
