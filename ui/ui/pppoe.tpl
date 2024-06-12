{include file="sections/header.tpl"}

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-hovered mb20 panel-primary">
            <div class="panel-heading">
                <div class="btn-group pull-right">
                    <a class="btn btn-primary btn-xs" title="save" href="{$_url}services/sync/pppoe"
                        onclick="return confirm('This will sync/send PPPOE plan to Mikrotik?')"><span
                            class="glyphicon glyphicon-refresh" aria-hidden="true"></span> sync</a>
                </div>{Lang::T('PPPOE Plans')}
            </div>
            <div class="panel-body">
                <div class="md-whiteframe-z1 mb20 text-center" style="padding: 15px">
                    <div class="col-md-8">
                        <form id="site-search" method="post" action="{$_url}services/pppoe/">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <span class="fa fa-search"></span>
                                </div>
                                <input type="text" name="name" class="form-control"
                                    placeholder="{Lang::T('Search by Name')}...">
                                <div class="input-group-btn">
                                    <button class="btn btn-success" type="submit">{Lang::T('Search')}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4">
                        <a href="{$_url}services/pppoe-add" class="btn btn-primary btn-block"><i
                                class="ion ion-android-add"> </i> {Lang::T('New Service Plan')}</a>
                    </div>&nbsp;
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>{Lang::T('Plan Name')}</th>
                                <th>{Lang::T('Plan Type')}</th>
                                <th>{Lang::T('Bandwidth Plans')}</th>
                                <th>{Lang::T('Plan Price')}</th>
                                <th>{Lang::T('Plan Validity')}</th>
                                <th>{Lang::T('IP Pool')}</th>
                                <th>{Lang::T('Expired Internet Plan')}</th>
                                <th>{Lang::T('Routers')}</th>
                                <th>{Lang::T('Device')}</th>
                                <th>{Lang::T('Manage')}</th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $d as $ds}
                                <tr {if $ds['enabled'] != 1}class="danger" title="disabled"{/if}>
                                    <td>{$ds['name_plan']}</td>
                                    <td>{$ds['plan_type']} {if $ds['prepaid'] != 'yes'}<b>Postpaid</b>{else}Prepaid{/if}</td>
                                    <td>{$ds['name_bw']}</td>
                                    <td>{Lang::moneyFormat($ds['price'])}</td>
                                    <td>{$ds['validity']} {$ds['validity_unit']}</td>
                                    <td>{$ds['pool']}</td>
                                    <td>{if $ds['plan_expired']}<a href="{$_url}services/edit/{$ds['plan_expired']}">Yes</a>{else}No{/if}</td>
                                    <td>
                                        {if $ds['is_radius']}
                                            <span class="label label-primary">RADIUS</span>
                                        {else}
                                            {if $ds['routers']!=''}
                                                <a href="{$_url}routers/edit/0&name={$ds['routers']}">{$ds['routers']}</a>
                                            {/if}
                                        {/if}
                                    </td>
                                    <td>{$ds['device']}</td>
                                    <td>
                                        <a href="{$_url}services/pppoe-edit/{$ds['id']}"
                                            class="btn btn-info btn-xs">{Lang::T('Edit')}</a>
                                        <a href="{$_url}services/pppoe-delete/{$ds['id']}"
                                            onclick="return confirm('{Lang::T('Delete')}?')" id="{$ds['id']}"
                                            class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i></a>
                                    </td>
                                    <td>{$ds['id']}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                {include file="pagination.tpl"}
				<div class="bs-callout bs-callout-info" id="callout-navbar-role">
					<h4>Create expired Internet Plan</h4>
					<p>When customer expired, you can move it to Expired Internet Plan</p>
				</div>
            </div>
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}