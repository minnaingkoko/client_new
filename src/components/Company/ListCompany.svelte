<script lang="ts">
	import { userData, employeeView, employeeList, employeeList_id, HPage1, HPage2, HPage3 } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';

	const resetPage = () => {
		HPage1.update(() => true);
		HPage2.update(() => false);
		HPage3.update(() => false);
	};

	const listToggle = (value: any) => {
		resetPage();
		employeeList_id.update(() => value);
		employeeView.update((currentValue) => !currentValue);
		employeeList.update((currentValue) => !currentValue);
	};

	const Next = () => {
		if ($HPage1 === true && $HPage2 === false && $HPage3 === false) {
			HPage1.update(() => false);
			HPage2.update(() => true);
		} else if ($HPage1 === false && $HPage2 === true && $HPage3 === false) {
			HPage2.update(() => false);
			HPage3.update(() => true);
		}
	};
</script>

<div class="list-data" style="display: {$employeeList ? 'block' : 'none'};">
	<div class="addForm-heading">
		<div class="text">Employee's Data</div>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="close" on:click={listToggle}>
			<img src={close_icon} alt="" width="24px" height="24px" />
		</div>
	</div>
	<hr />

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
