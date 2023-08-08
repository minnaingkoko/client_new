<script lang="ts">
	import { companyModifyData, companyView, CPage1, CPage2, CPage3, companyModify } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import { goto } from '$app/navigation';
	import { modifyToggle, Previous, Next } from '../Shared/CompanyFunction.svelte';
	import ModifyTextData from './ModifyTextData.svelte';

	$: company = $companyModifyData;

	const modifyRequest = async (value: any) => {
		const response = await fetch('https://shan-pyae-phyo.onrender.com/api/companyModifyRequest', {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(company)
		});
		if (response.status === 200) {
			goto('/company');
			location.reload();
		}
	};
</script>

{#if company}
	<div class="add-form" style="display: {$companyModify ? 'block' : 'none'};">
		<div class="addForm-heading">
			<div class="text">Modify company</div>
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<div class="close" on:click={modifyToggle}>
				<img src={close_icon} alt="" width="24px" height="24px" />
			</div>
		</div>
		<hr />
		<form class="addForm" action="/api/companyModifyRequest" enctype="multipart/form-data" method="POST" on:submit|preventDefault={() => modifyRequest(company._id)}>
		{#if $CPage1}
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<!-- <div class="add-employee" on:click={assignEmployee}>Add Employee</div> -->
			<ModifyTextData text='Company Name:' value='companyName' dataF={company.companyName} />
			<label class="mg" for="companyName">Company Name:</label>
			<input class="add_input" bind:value={company.companyName} name="companyName" id="companyName" required />

			<label class="mg" for="companyAddress">Company Address:</label>
			<input class="add_input" bind:value={company.companyAddress} name="companyAddress" id="companyAddress" required />

			<label class="mg" for="postCode">Post Code:</label>
			<input class="add_input" bind:value={company.postCode} name="postCode" id="postCode" required />

			<label class="mg" for="demandMale">Demand Male:</label>
			<input class="add_input" bind:value={company.demandTotal.male} name="demandMale" id="demandMale" required />

			<label class="mg" for="demandFemale">Demand Female:</label>
			<input class="add_input" bind:value={company.demandTotal.female} name="demandFemale" id="demandFemale" required />

			<label class="mg" for="companyPhNo">Company Phone Number:</label>
			<input class="add_input" bind:value={company.companyPhNo} name="companyPhNo" id="companyPhNo" required />

			<!-- <label class="mg" for="demandLetterScan">Demand Letter Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.demandLetterScan)} class="form-control mg" name="demandLetterScan" id="demandLetterScan" required />

			<label class="mg" for="KSMScan">KSM Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.KSMScan)} class="form-control mg" name="KSMScan" id="formFile" multiple />

			<label class="mg" for="companyProfileScan">Company Profile Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.companyProfileScan)} class="form-control mg" name="companyProfileScan" id="formFile" multiple /> -->
		{/if}

		{#if $CPage2}
			<!-- <label class="mg" for="callingCopyScan">Calling Copy Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.callingCopyScan)} class="form-control mg" name="callingCopyScan" id="formFile" multiple />

			<label class="mg" for="callingOrgScan">Calling Original Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.callingOrgScan)} class="form-control mg" name="callingOrgScan" id="formFile" multiple />

			<label class="mg" for="notaryScan">Notary Scan:</label>
			<input type="file" on:change={(event) => handleFileChange(event, companyData.notaryScan)} class="form-control mg" name="notaryScan" id="formFile" multiple /> -->
		{/if}
		<div class="addForm-bot">
			{#if $CPage1 === true}
				<div />
			{:else if $CPage1 === false}
				<!-- svelte-ignore a11y-click-events-have-key-events -->
				<div class="next-btn" on:click={Previous}>Previous</div>
			{/if}
			{#if $CPage2 === true}
				<button class="submit-btn" type="submit">Submit</button>
			{:else if $CPage2 === false}
				<!-- svelte-ignore a11y-click-events-have-key-events -->
				<div class="next-btn" on:click={Next}>Next</div>
			{/if}
		</div>
		</form>
	</div>
{/if}

<style>
	.addForm-bot {
		@apply absolute bottom-0 bg-[#e5e5e5] w-[100%] h-[75px];
		border-radius: 0 0 4px 4px;
	}
	.addForm-bot {
		@apply flex justify-end items-center gap-[12px] rounded-[4px];
		padding: 0 30px;
	}
	.addForm-bot div {
		@apply flex justify-center items-center w-[100px] h-[33px] cursor-pointer;
	}
	.close {
		@apply cursor-pointer;
	}
	input {
		border: 1px solid gray;
	}
	.add_input {
		@apply ml-[30px] mr-[30px] mb-[15px] h-[34px];
	}
	.add-form {
		@apply absolute top-[30px] w-[400px] bg-white z-[12] rounded-[4px];
		height: calc(100vh - 60px);
	}
	.submit-btn,
	.next-btn {
		@apply bg-[#4aa84d] text-white;
	}
	.submit-btn {
		@apply flex justify-center items-center w-[100px] h-[33px] cursor-pointer;
		border: none;
	}
	.addForm-heading {
		@apply w-[100%] h-[66px] flex flex-row justify-between items-center text-[18px] font-[500] text-black;
		border-radius: 4px 4px 0 0;
		padding: 0 30px;
	}
	.addForm {
		@apply flex flex-col mt-[20px] mb-[95px];
	}
	.mg {
		margin: 0 30px;
	}
</style>
