<script lang="ts">
	import { employeeData, employeeView, employeeList, employeeList_id, HPage1, HPage2, HPage3 } from '../../stores/MainStores';
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
	{#each $employeeData as data, index}
		{#if data._id === $employeeList_id}
			<form class="addForm">
				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="name">Name:</label>
					<div>{data.name}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="fatherName">Father Name:</label>
					<div>{data.fatherName}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="address">Address:</label>
					<div>{data.address}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="phNo">Phone Number:</label>
					<div>{data.phNo}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="nrcNo">NRC No:</label>
					<div>{data.nrcNo}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="religion">Religion:</label>
					<div>{data.religion}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="agent">Agent:</label>
					<div>{data.agent}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="gender">Gender:</label>
					<div>{data.gender}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="passport">Passport:</label>
					<div>{data.passport}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="dob">Date of Birth:</label>
					<div>{data.dobString}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="weight">Weight (kg):</label>
					<div>{data.weight}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="height">Height (cm):</label>
					<div>{data.height}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="marital">Marital Status:</label>
					<div>{data.marital}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="education">Education:</label>
					<div>{data.education}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="experience">Experience:</label>
					<div>{data.experience}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="workedCountry">Worked Country:</label>
					<div>{data.workedCountry}</div>
				</div>

				<div class="collect" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="spokenLanguage">Spoken Language:</label>
					<div>{data.spokenLanguage}</div>
				</div>

				<div class="collect p-scan" style="display: {$HPage1 ? 'flex' : 'none'};">
					<label for="passportScan">Passport Scan:</label>
					<div class="p-btns">
						<div>
							{data.passportScan.filename}
						</div>
						<div class="p-btn">
							<a href="{data.passportScan.imageBase64}">
								<img class="image-f" src="{data.passportScan.imageBase64}" alt="..." />
							</a>
							<a href="{data.passportScan.imageBase64}" download={data.passportScan.filename}>
								<div>Download</div>
							</a>
						</div>
					</div>
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
