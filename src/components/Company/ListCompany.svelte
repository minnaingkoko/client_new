<script lang="ts">
	import { companyData, companyView, companyList, companyList_id, CPage1, CPage2, CPage3 } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';

	const resetPage = () => {
		CPage1.update(() => true);
		CPage2.update(() => false);
		CPage3.update(() => false);
	};

	const listToggle = (value: any) => {
		resetPage();
		companyList_id.update(() => value);
		companyView.update((currentValue) => !currentValue);
		companyList.update((currentValue) => !currentValue);
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

<div class="list-data" style="display: {$companyList ? 'block' : 'none'};">
	<div class="addForm-heading">
		<div class="text">Company's Data</div>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="close" on:click={listToggle}>
			<img src={close_icon} alt="" width="24px" height="24px" />
		</div>
	</div>
	<hr />
	{#each $companyData as data, index}
		{#if data._id === $companyList_id}
			<form class="addForm">
				<div class="collect">
					<label for="companyName">Company Name:</label>
					<div>{data.companyName}</div>
				</div>

				<div class="collect">
					<label for="companyAddress">Company Address:</label>
					<div>{data.companyAddress}</div>
				</div>

				<div class="collect">
					<label for="postCode">Post Code:</label>
					<div>{data.postCode}</div>
				</div>

				<div class="collect">
					<label for="demandTotal">Demand Total:</label>
					<div>M-{data.demandTotal.male}/ F-{data.demandTotal.female}</div>
				</div>

				<div class="collect">
					<label for="companyPhNo">Company Phone Number:</label>
					<div>{data.companyPhNo}</div>
				</div>

				<div class="addForm-bot">
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div class="cancel-btn" on:click={listToggle}>Cancel</div>
				</div>
			</form>
		{:else}
			<div />
		{/if}
	{/each}
</div>

<style>
	.p-scan {
		@apply flex flex-row;
	}
	.p-btns {
		@apply flex flex-col;
	}
	.p-btn {
		@apply flex flex-row justify-between items-center;
	}
	.image-f {
		@apply w-[50px] h-[50px];
	}
	.addForm {
		@apply flex flex-col gap-[16px];
	}
	.collect {
		@apply flex pl-[30px] pr-[30px] w-[100%] justify-between text-[14px];
	}
	.collect label {
		@apply w-[130px];
	}
	.collect > div {
		@apply w-[160px];
	}
	.close {
		@apply cursor-pointer;
	}
	.list-data {
		@apply absolute top-[30px] w-[400px] bg-white z-[12] rounded-[4px];
		height: calc(100vh - 60px);
	}
	.cancel-btn {
		@apply bg-white;
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
</style>
