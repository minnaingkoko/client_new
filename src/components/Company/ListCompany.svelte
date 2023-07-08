<script lang="ts">
	import { companyData, companyView, companyList, companyList_id, CPage1, CPage2, CPage3, fullImg, fullImgUrl, fullImgName, assignSingle } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import download_icon from '$lib/images/download.svg';
	import visibility_icon from '$lib/images/visibility.svg';

	$: assign = $assignSingle;

	$: console.log(assign);

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

	const Previous = () => {
		if ($CPage1 === false && $CPage2 === true) {
			CPage1.update(() => true);
			CPage2.update(() => false);
		}
	};

	const fullImage = (url: any, name: any) => {
		fullImg.update((currentValue) => !currentValue);
		fullImgUrl.update(() => url)
		fullImgName.update(() => name)
	}
</script>

{#if assign}
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
				{#if $CPage1}
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

				<div class="collect">
					<label for="employees">Employees:</label>
					<div>{assign.name}</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">Passport Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.demandLetterScanData.s3URL,data.demandLetterScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.demandLetterScanData.s3URL} download={data.demandLetterScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">KSM Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.KSMScanData.s3URL,data.KSMScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.KSMScanData.s3URL} download={data.KSMScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">Company Profile Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.companyProfileScanData.s3URL,data.companyProfileScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.companyProfileScanData.s3URL} download={data.companyProfileScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">Calling Copy Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.callingCopyScanData.s3URL,data.callingCopyScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.callingCopyScanData.s3URL} download={data.callingCopyScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">Calling Original Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.callingOrgScanData.s3URL,data.callingOrgScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.callingOrgScanData.s3URL} download={data.callingOrgScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="collect p-scan">
					<label for="passportScan">Notary Scan:</label>
					<div class="p-btns">
						<div class="p-btn">
							<!-- svelte-ignore a11y-click-events-have-key-events -->
							<img src={visibility_icon} alt="" width="22px" height="22px" on:click={() => fullImage(data.notaryScanData.s3URL,data.notaryScanData.filename)} >
						</div>
						<div class="p-btn">
							<a href={data.notaryScanData.s3URL} download={data.notaryScanData.filename}>
								<img src={download_icon} alt="" width="24px" height="24px" />
							</a>
						</div>
					</div>
				</div>

				<div class="addForm-bot">
					{#if $CPage1 === true}
						<div />
					{:else if $CPage1 === false}
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="next-btn" on:click={Previous}>Previous</div>
					{/if}
					{#if $CPage2 === true}
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="cancel-btn" on:click={listToggle}>Cancel</div>
					{:else if $CPage2 === false}
						<!-- svelte-ignore a11y-click-events-have-key-events -->
						<div class="next-btn" on:click={Next}>Next</div>
					{/if}
				</div>
				{/if}
			</form>
		{:else}
			<div />
		{/if}
	{/each}
</div>
{/if}

<style>
	.cancel-btn {
		@apply bg-white;
	}
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
		@apply flex flex-row justify-between items-center cursor-pointer;
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
