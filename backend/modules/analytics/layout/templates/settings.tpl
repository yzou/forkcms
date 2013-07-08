{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

<div class="pageTitle">
	<h2>{$lblModuleSettings|ucfirst}: {$lblAnalytics|ucfirst}</h2>
</div>

{option:Wizard}
	<div class="generalMessage infoMessage content">
		<p><strong>{$msgConfigurationError}</strong></p>
		<ul class="pb0">
			{option:NoSessionToken}<li>{$errNoSessionToken}</li>{/option:NoSessionToken}
			{option:NoTableId}<li>{$errNoTableId}</li>{/option:NoTableId}
		</ul>
	</div>
{/option:Wizard}

<div class="box">
	<div class="heading">
		<h3>{$lblGoogleAnalyticsLink|ucfirst}</h3>
	</div>

	<div class="options">

		{* Fill in client id and secret *}
		{option:step1}
			{form:clientInfo}
				<p>{$msgLinkGoogleAccount}</p>

				<div class="inputList">
					<label for="clientId">{$lblClientId|ucfirst}</label>
					{$txtClientId} {$txtClientIdError}
				</div>
				<div class="inputList">
					<label for="clientSecret">{$lblClientSecret|ucfirst}</label>
					{$txtClientSecret} {$txtClientSecretError}
				</div>

				<div class="buttonHolder">
					<input id="submitForm" class="inputButton button mainButton" type="submit" name="submitForm" value="{$msgAuthenticateAtGoogle}" />
				</div>
			{/form:clientInfo}
		{/option:step1}

		{* Choose a profile/account *}
		{option:step3}
			<p>{$msgLinkWebsiteProfile}</p>
			{form:linkProfile}
				{option:hasProfiles}
					<div class="fakeP">
						<p>
							<label for="gaAccount">1. {$msgChooseAnAccount}</label>
							{$ddmGaAccount} {$ddmGaAccountError}
						</p>
						<p id="jsGaWebProperties" style="display: none;">
							<label for="webProperty">2. {$msgChooseAWebProperty}</label>
							{$ddmWebProperty} {$ddmWebPropertyError}
						</p>
						<div id="jsGaProfiles" style="display: none;">
							<p><label for="profile">3. {$msgChooseAProfile}</label></p>
							<ul id="jsProfiles">
								{iteration:profile}
									<li><label for="{$profile.id}">{$profile.rbtProfile}</label></li>
								{/iteration:profile}
							</ul>
							{$rbtProfileError}
						</div>
					</div>
				{/option:hasProfiles}

				{option:!hasProfiles}
					<p>{$msgNoAccounts}</p>
				{/option:!hasProfiles}

				<div class="oneLiner">
					{option:hasProfiles}
						<div class="buttonHolder">
							<input id="submitForm" class="inputButton button mainButton" type="submit" name="submitForm" value="{$lblLinkThisProfile|ucfirst}" />
						</div>
					{/option:hasProfiles}
					<div class="buttonHolder">
						<a href="{$var|geturl:'settings'}&amp;remove=session" data-message-id="confirmDeleteSession" class="askConfirmation button inputButton"><span>{$msgRemoveAccountLink}</span></a>
					</div>
				</div>
			{/form:linkProfile}
		{/option:step3}

		{* Account is linked, display info *}
		{option:step4}
			<p>
				{$lblLinkedAccount|ucfirst}: <strong>{$accountName}</strong><br />
				{$lblLinkedWebProperty|ucfirst}: <strong>{$webPropertyName} ({$webPropertyId})</strong><br />
				{$lblLinkedProfile|ucfirst}: <strong>{$webProfileName}</strong>
			</p>
			<div class="buttonHolder">
				<a href="{$var|geturl:'settings'}&amp;remove=session" data-message-id="confirmDeleteSession" class="askConfirmation submitButton button inputButton"><span>{$msgRemoveAccountLink}</span></a>
				{option:showAnalyticsIndex}<a href="{$var|geturl:'index'}" class="mainButton button"><span>{$lblViewStatistics|ucfirst}</span></a>{/option:showAnalyticsIndex}
			</div>
		{/option:step4}

		<div id="confirmDeleteSession" title="{$lblDelete|ucfirst}?" style="display: none;">
			<p>
				{$msgConfirmDeleteLinkAccount}
			</p>
		</div>
	</div>
</div>

{option:step4}
	{form:trackingType}
		<div class="box">
			<div class="heading">
				<h3>{$lblTrackingType|ucfirst}</h3>
			</div>

			<div class="options">
				<p>{$msgHelpTrackingType}</p>
				{iteration:type}
					<label for="{$type.id}">{$type.rbtType} {$type.label}</label><br />
				{/iteration:type}
				{$rbtTypeError}
			</div>
		</div>

		<div class="fullwidthOptions">
			<div class="buttonHolderRight">
				<input id="save" class="inputButton button mainButton" type="submit" name="save" value="{$lblSave|ucfirst}" />
			</div>
		</div>
	{/form:trackingType}
{/option:step4}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}
