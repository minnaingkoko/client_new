<script lang="ts">
	import { employeeData, employeeView, employeeList, employeeList_id, HPage1, HPage2, HPage3, HPage4, fullImg, fullImgUrl, fullImgName } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import download_icon from '$lib/images/download.svg';
	import visibility_icon from '$lib/images/visibility.svg';

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

	const fullImage = (url: any, name: any) => {
		fullImg.update((currentValue) => !currentValue);
		fullImgUrl.update(() => url)
		fullImgName.update(() => name)
	}

	const Next = () => {
		if ($HPage1 === true && $HPage2 === false && $HPage3 === false && $HPage4 === false) {
			HPage1.update(() => false);
			HPage2.update(() => true);
		} else if ($HPage1 === false && $HPage2 === true && $HPage3 === false && $HPage4 == false) {
			HPage2.update(() => false);
			HPage3.update(() => true);
		} else if ($HPage1 === false && $HPage2 === false && $HPage3 === true && $HPage4 == false) {
			HPage3.update(() => false);
			HPage4.update(() => true);
		}
	};

	const Previous = () => {
		if ($HPage4 === true && $HPage1 === false && $HPage2 === false && $HPage3 === false) {
			HPage4.update(() => false);
			HPage3.update(() => true);
		} else if ($HPage3 === true && $HPage1 === false && $HPage2 === false && $HPage4 === false) {
			HPage3.update(() => false);
			HPage2.update(() => true);
		} else if ($HPage2 === true && $HPage1 === false && $HPage3 === false && $HPage4 === false) {
			HPage2.update(() => false);
			HPage1.update(() => true);
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
				{#if $HPage1}
				<div class="collect">
					<label for="name">Name:</label>
					<div>{data.name}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="motherName">Mother Name:</label>
					<div>{data.motherName}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="fatherName">Father Name:</label>
					<div>{data.fatherName}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="address">Address:</label>
					<div>{data.address}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="phNo">Phone Number:</label>
					<div>{data.phNo}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="nrcNo">NRC No:</label>
					<div>{data.nrcNo}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="religion">Religion:</label>
					<div>{data.religion}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="agent">Agent:</label>
					<div>{data.agent}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="gender">Gender:</label>
					<div>{data.gender}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="passport">Passport:</label>
					<div>{data.passport}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="dob">Date of Birth:</label>
					<div>{data.dobString}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="weight">Weight (kg):</label>
					<div>{data.weight}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="height">Height (cm):</label>
					<div>{data.height}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="marital">Marital Status:</label>
					<div>{data.marital}</div>
				</div>
				{/if}

				{#if $HPage1}
				<div class="collect">
					<label for="education">Education:</label>
					<div>{data.education}</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect">
					<label for="experience">Experience:</label>
					<div>{data.experience}</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect">
					<label for="workedCountry">Worked Country:</label>
					<div>{data.workedCountry}</div>
				</div>
				{/if}	

				{#if $HPage2}
				<div class="collect">
					<label for="spokenLanguage">Spoken Language:</label>
					<div>{data.spokenLanguage}</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Passport Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.passportScanData.s3URL,data.passportScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.passportScanData.s3URL} download={data.passportScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}
				
				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">NRC Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.nrcScanData.s3URL,data.nrcScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.nrcScanData.s3URL} download={data.nrcScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Vaccine Notary Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.vaccineNotaryScanData.s3URL,data.vaccineNotaryScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.vaccineNotaryScanData.s3URL} download={data.vaccineNotaryScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Medical Online Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.medicalOnlineScanData.s3URL,data.medicalOnlineScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.medicalOnlineScanData.s3URL} download={data.medicalOnlineScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Training Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.trainingScanData.s3URL,data.trainingScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.trainingScanData.s3URL} download={data.trainingScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">AirTicket Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.airTicketScanData.s3URL,data.airTicketScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.airTicketScanData.s3URL} download={data.airTicketScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Visa Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.visaScanData.s3URL,data.visaScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.visaScanData.s3URL} download={data.visaScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Smart Card Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.smartCardScanData.s3URL,data.smartCardScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.smartCardScanData.s3URL} download={data.smartCardScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect p-scan">
					<label for="passportScan">Family Data Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.familyDataScanData.s3URL,data.familyDataScanData.filename)}>
						</div>
						<div class="p-btn">
							<a href={data.familyDataScanData.s3URL} download={data.familyDataScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect">
					<label for="deposit">Deposit:</label>
					<div>{data.deposit}</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect">
					<label for="applyDate">Apply Date:</label>
					<div>{data.applyDate}</div>
				</div>
				{/if}

				{#if $HPage2}
				<div class="collect">
					<label for="passportExpireDate">Passport Expire Date:</label>
					<div>{data.passportExpireDate}</div>
				</div>
				{/if}

				{#if $HPage3}
				<div class="collect">
					<label for="passportType">Passport Type:</label>
					<div>{data.passportType}</div>
				</div>
				{/if}

				{#if $HPage3}
				<div class="collect">
					<label for="medicalOnlineExpire">Medical Online Expire:</label>
					<div>{data.medicalOnlineExpire}</div>
				</div>
				{/if}

				{#if $HPage3}
				<div class="collect">
					<label for="smartCardNo">Smart Card No:</label>
					<div>{data.smartCardNo}</div>
				</div>
				{/if}

				{#if $HPage3}
				<div class="collect">
					<label for="airPlaneNo">AirPlane No:</label>
					<div>{data.airPlaneNo}</div>
				</div>
				{/if}

				{#if $HPage3}
				<div class="collect">
					<label for="departureDate">Departure Date:</label>
					<div>{data.departureDate}</div>
				</div>
				{/if}

				<div class="addForm-bot">
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					{#if $HPage1 === true}
						<div />
					{:else if $HPage1 === false}
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="next-btn" on:click={Previous}>Previous</div>
					{/if}
					{#if $HPage3 === true}
					<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="cancel-btn" on:click={listToggle}>Cancel</div>
					{:else if $HPage3 === false}
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="next-btn" on:click={Next}>Next</div>
					{/if}
				</div>
			</form>
		{:else}
			<div />
		{/if}
	{/each}
</div>

<style>
	.next-btn {
		@apply bg-[#4aa84d] text-white;
	}
	.p-scan {
		@apply flex flex-row;
	}
	.p-btns {
		@apply flex flex-row gap-[16px];
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
