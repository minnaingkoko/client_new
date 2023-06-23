<script lang="ts">
	import { companyView, CPage1, CPage2, CPage3, companyAdd } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';

	let gender = '';
	let marital = '';
	let workedCountry = '';
	let spokenLanguage = '';

	const resetPage = () => {
		CPage1.update(() => true);
		CPage2.update(() => false);
		CPage3.update(() => false);
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
		<div class="text">Add Employee</div>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="close" on:click={addToggle}>
			<img src={close_icon} alt="" width="24px" height="24px" />
		</div>
	</div>
	<hr />
	<form class="addForm" action="/api/employeeUpload" enctype="multipart/form-data" method="POST">
		
	</form>
</div>

<style>
	.close {
		@apply cursor-pointer;
	}
	input,
	select {
		border: 1px solid gray;
	}
	.add_input {
		@apply ml-[30px] mr-[30px] mb-[15px] h-[34px];
	}
	.add-form {
		@apply absolute top-[30px] w-[400px] bg-white z-[12] rounded-[4px];
		height: calc(100vh - 60px);
	}
	.cancel-btn {
		@apply bg-white;
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
	.addForm-bot {
		@apply flex justify-end items-center gap-[12px] rounded-[4px];
		padding: 0 30px;
	}
	.addForm-bot div {
		@apply flex justify-center items-center w-[100px] h-[33px] cursor-pointer;
	}
	.addForm-bot {
		@apply absolute bottom-0 bg-[#e5e5e5] w-[100%] h-[75px];
		border-radius: 0 0 4px 4px;
	}
	.addForm {
		@apply flex flex-col mt-[20px] mb-[95px];
	}
	.mg {
		margin: 0 30px;
	}
</style>
