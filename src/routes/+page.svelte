<script lang="ts">
	import EmployeeData from '../components/Home/EmployeeData.svelte';
	import { onMount } from 'svelte';
	import close_icon from '$lib/images/close.svg';
	import download_icon from '$lib/images/download.svg';
	import { employeeData, employeeModifyData, employeeView, employeeAdd, HPage1, HPage2, HPage3, fullImg, fullImgUrl } from '../stores/MainStores';
	import AddEmployee from '../components/Home/AddEmployee.svelte';
	import ListEmployee from '../components/Home/ListEmployee.svelte';
	import ModifyEmployee from '../components/Home/ModifyEmployee.svelte';
	import RemoveEmployee from '../components/Home/RemoveEmployee.svelte';

	const toggleImg = () => {
		fullImg.update(() => false);
		fullImgUrl.update(() => '')
	}

	const resetPage = () => {
		HPage1.update(() => true);
		HPage2.update(() => false);
		HPage3.update(() => false);
	};

	const addToggle = () => {
		resetPage();
		employeeView.update((currentValue) => !currentValue);
		employeeAdd.update((currentValue) => !currentValue);
	};

	onMount(async () => {
		// Fetch data from MongoDB
		const response = await fetch('http://localhost:3000/api/employeeInfo');
		const data = await response.json();

		// Update the store with the fetched data
		employeeData.set(data);
	});
	$: image = $fullImg;
</script>

{#if image === true}
	<!-- svelte-ignore a11y-click-events-have-key-events -->
	<div class="toggle-img" on:click={toggleImg}>
		<img src={close_icon} alt="" width="24px" height="24px" />
		<img src={download_icon} alt="" width="24px" height="24px" />
	</div>
	<div class="overlay-img">
	</div>
	<div class="mid-align">
		<img class="fullImg" src={$fullImgUrl} alt="">
	</div>
{:else if image === false}
	<div class="overlay" style="display: {$employeeView ? 'flex' : 'none'};">
		<AddEmployee />

		<RemoveEmployee />

		{#if employeeModifyData}
			<ModifyEmployee />
		{/if}

		<ListEmployee />
	</div>

	<nav class="nav-bar">
		<div class="heading">
			Manage <b>Employees</b>
		</div>
		<div class="nav-btns">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<div class="add-btn" on:click={addToggle}>
				<i class="material-icons">&#xE147;</i>
				<span>Add New Employee</span>
			</div>
		</div>
	</nav>
	<EmployeeData />
	<div class="bot-nav">
		<div class="bot-left">
			Showing <b>5</b> out of <b>25</b> entries
		</div>
		<div class="bot-right">
			<div class="bn1">Previous</div>
			<div class="bn2">1</div>
			<div class="bn3">2</div>
			<div class="bn4">3</div>
			<div class="bn5">4</div>
			<div class="bn6">5</div>
			<div class="bn7">Next</div>
		</div>
	</div>
{/if}

<style>
	.mid-align {
		margin-top: 8px;
		margin-bottom: 32px;
		height: auto;
		width: auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.toggle-img {
		position: sticky;
		top: 32px;
		max-width: 100%;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-top: 32px;
		margin-left: 32px;
		margin-right: 32px;
		cursor: pointer;
		z-index: 15;
	}
	.overlay-img {
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 10;
		background: rgba(0, 0, 0, 0.3);
		transition: 0.3s;
	}
	.fullImg {
		width: 50vw; 
		height: 110vh;
		z-index: 15;
	}
	.overlay {
		position: fixed;
		display: none;
		justify-content: center;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		z-index: 10;
		background: rgba(0, 0, 0, 0.3);
		transition: 0.3s;
	}
	.nav-bar {
		@apply flex bg-[#435e7c] w-[100%] h-[65px] justify-between items-center;
		padding: 16px 30px;
	}
	.heading {
		color: white;
		font-size: 24px;
	}
	.add-btn {
		@apply flex justify-center items-center gap-[5px] w-[164px] h-[33px] text-white duration-300 bg-[#4aa84d] rounded-[4px] text-[13px] cursor-pointer;
	}
	.add-btn:hover {
		@apply bg-[#3b923e];
	}
	.bot-nav {
		@apply flex flex-row justify-between absolute bottom-0 w-[100%] h-[72px];
		padding: 0 25px;
	}
	.bot-left {
		@apply h-[32px] mt-[10px];
	}
	.bot-right {
		@apply flex flex-row gap-[2px] h-[32px];
		margin: 20px 0;
	}
	.bot-right div {
		@apply flex justify-center items-center h-[32px] rounded-[2px] cursor-pointer duration-300;
		border: 1px solid #ddd;
	}
	.bn1 {
		@apply w-[76px];
	}
	.bn2 {
		@apply bg-[#337ab7] text-white;
	}
	.bn2,
	.bn3,
	.bn4,
	.bn5,
	.bn6 {
		@apply w-[33px];
	}
	.bn1:hover,
	.bn2:hover,
	.bn3:hover,
	.bn4:hover,
	.bn5:hover,
	.bn6:hover,
	.bn7:hover {
		border: 1px solid rgb(158, 157, 157);
	}
	.bn7 {
		@apply w-[52px];
	}
</style>
