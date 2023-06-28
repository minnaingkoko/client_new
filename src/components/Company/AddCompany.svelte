<script lang="ts">
	import { companyView, CPage1, CPage2, CPage3, companyAdd, assign } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import Input from './Input.svelte';
	import FileInput from './FileInput.svelte';

	const resetPage = () => {
		CPage1.update(() => true);
		CPage2.update(() => false);
		CPage3.update(() => false);
	};

	const assignEmployee = () => {
		assign.update((assign) => !assign);
	};

	const addToggle = () => {
		resetPage();
		companyView.update((currentValue) => !currentValue);
		companyAdd.update((currentValue) => !currentValue);
	};

	const Next = () => {
		if ($CPage1 === true && $CPage2 === false && $CPage3 === false) {
			CPage1.update(() => false);
			CPage2.update(() => true);
		} else if ($CPage1 === false && $CPage2 === true && $CPage3 === false) {
			CPage2.update(() => false);
			CPage3.update(() => true);
		}
	};
</script>

<div class="add-form" style="display: {$companyAdd ? 'block' : 'none'};">
	<div class="addForm-heading">
		<div class="text">Add Company</div>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="close" on:click={addToggle}>
			<img src={close_icon} alt="" width="24px" height="24px" />
		</div>
	</div>
	<hr />
	<form class="addForm" action="/api/companyUpload" enctype="multipart/form-data" method="POST">
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="add-employee" on:click={assignEmployee}>Add Employee</div>
		<Input label="Company Name" attr="companyName" />
		<Input label="Company Address" attr="companyAddress" />
		<Input label="Post Code" attr="postCode" />
		<Input label="Demand Male" attr="demandMale" />
		<Input label="Demand Female" attr="demandFemale" />
		<Input label="Company Phone Number" attr="companyPhNo" />
		<Input label="Demand Letter Scan" attr="demandLetterScan" />

		<FileInput label="KSM Scan" attr="KSMScan" />
		<FileInput label="Company Profile Scan" attr="companyProfileScan" />
		<FileInput label="Calling Copy Scan" attr="callingCopyScan" />
		<FileInput label="Calling Original Scan" attr="callingOrgScan" />
		<FileInput label="Notary Scan" attr="notaryScan" />

		<button class="submit-btn" type="submit">Submit</button>
	</form>
</div>

<style>
	.close {
		@apply cursor-pointer;
	}
	.add-form {
		@apply absolute top-[30px] w-[400px] bg-white z-[12] rounded-[4px];
		height: calc(100vh - 60px);
	}
	.submit-btn {
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
</style>
