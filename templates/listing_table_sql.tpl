<!--table class="table table-striped table-hover table-condensed dataTable"-->
<thead>
    <tr>
        <th class="hidden-print nosort">&nbsp;</th>
        {foreach $listing_columns as $item}<th>{$msg_label_{$item}}</th>{/foreach}
    </tr>
</thead>
<tbody>
{foreach $entries as $entry}
    <tr{if ! $listing_linkto|is_array} class="clickable" title="{$msg_displayentry}"{/if}>
        <th class="hidden-print">
        {*
            <a href="index.php?page=display&dn={$entry.dn|escape:'url'}&search={$search}" class="btn btn-info btn-sm{if $listing_linkto===false} hidden{/if}" role="button" title="{$msg_displayentry}">
                <i class="fa fa-fw fa-id-card"></i>
            </a>
        *}
        {*
        {if $display_unlock_button}
            <a href="index.php?page=unlockaccount&dn={$entry.dn|escape:'url'}&returnto=searchlocked" class="btn btn-success btn-sm" role="button" title="{$msg_unlockaccount}">
                <i class="fa fa-fw fa-unlock"></i>
            </a>
        {/if}
        *}
        </th>
    {foreach $listing_columns as $column}
        <td>
        {$attribute=$attributes_map.$column.attribute}
        {if ({$entry.$attribute.0})}
            {if $listing_linkto|is_array && in_array($column, $listing_linkto)}
                 <a href="index.php?page=display&dn={$entry.dn|escape:'url'}&search={$search}" title="{$msg_displayentry}">
            {/if}
            {foreach $entry.$attribute as $value}
                {* {if $value@index eq 0}{continue}{/if} *}
                {$type=$attributes_map.{$column}.type}
                {if $type eq 'percent'}
                    {$value} %<br/>
                {else}
                    {include 'value_displayer.tpl' value=$value type=$type}
                {/if}
            {/foreach}
            {if $listing_linkto|is_array && in_array($column, $listing_linkto)}
                 </a>
            {/if}
        {else}
            {if $show_undef}<i>{$msg_notdefined}</i>{else}&nbsp;{/if}
        {/if}
        </td>
    {/foreach}
    </tr>
{/foreach}
</tbody>
<!--/table-->
