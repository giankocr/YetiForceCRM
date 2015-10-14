{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
{strip}
		<div class="row widget_header">
			<div class="col-md-8">
				{include file='BreadCrumbs.tpl'|@vtemplate_path:$MODULE}
			</div>
			<div class="col-md-4 btn-toolbar marginLeftZero">
				<div class="pull-right">
					{foreach item=LINK_MODEL from=$MODULE_MODEL->getDetailViewLinks()}
						<button type="button" class="btn btn-info" onclick={$LINK_MODEL->getUrl()}><strong>{vtranslate($LINK_MODEL->getLabel(), $QUALIFIED_MODULE)}</strong></button>
					{/foreach}
				</div>
			</div>
		</div>
		<div class='clearfix'></div>
		<div class=" contents" id="detailView">			
				<table class="table customTableRWD table-bordered" width="100%">
					<thead>
						<tr class="blockHeader">
							<th class="blockHeader" width="20%">{vtranslate('LBL_FIELD_LABEL', $QUALIFIED_MODULE)}</th>
							<th class="blockHeader" width="20%">{vtranslate('LBL_FIELD_TYPE', $QUALIFIED_MODULE)}</th>
							<th data-hide='phone' class="blockHeader textAlignCenter" colspan="3" width="60%">{vtranslate('LBL_MAPPING_WITH_OTHER_MODULES', $QUALIFIED_MODULE)}</th>
						</tr>
					</thead>
				</table>
				<table class="table customTableRWD table-bordered" width="100%">
					<thead>	
						<tr>
							{foreach key=key item=LABEL from=$MODULE_MODEL->getHeaders() name=index}
								<th width="20%" {if $smarty.foreach.index.iteration > 2}data-hide='phone'{/if} ><b>{vtranslate($LABEL, $LABEL)}</b></th>
							{/foreach}
						</tr>
					</thead>
					<tbody>
						{foreach key=MAPPING_ID item=MAPPING from=$MODULE_MODEL->getMapping()}
							<tr class="listViewEntries" data-cfmid="{$MAPPING_ID}">
								<td width="20%">{vtranslate({$MAPPING['Leads']['label']}, 'Leads')}</td>
								<td width="20%">{vtranslate($MAPPING['Leads']['fieldDataType'], $QUALIFIED_MODULE)}</td>
								<td width="20%">{vtranslate({$MAPPING['Accounts']['label']}, 'Accounts')}</td>
								<td width="20%">{vtranslate({$MAPPING['Contacts']['label']}, 'Contacts')}</td>
								<td width="20%">
									{vtranslate({$MAPPING['Potentials']['label']}, 'Potentials')}
									{if $MAPPING['editable'] eq 1}
										{foreach item=LINK_MODEL from=$MODULE_MODEL->getMappingLinks()}
											<div class="pull-right actions">
												<span class="actionImages">
													<a onclick={$LINK_MODEL->getUrl()}><span title="{vtranslate($LINK_MODEL->getLabel(), $MODULE)}" class="glyphicon glyphicon-trash alignMiddle"></span></a>
												</span>
											</div>
										{/foreach}
									{/if}
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
		</div>
{/strip}
