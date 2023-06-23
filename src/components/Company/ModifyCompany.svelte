<script lang="ts">
	import { companyModifyData, companyView, CPage1, CPage2, CPage3, companyModify } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import { goto } from '$app/navigation';

	const resetPage = () => {
		CPage1.update(() => true);
		CPage2.update(() => false);
		CPage3.update(() => false);
	};

	const modifyToggle = () => {
		resetPage();
		companyView.update((currentValue) => !currentValue);
		companyModify.update((currentValue) => !currentValue);
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

	$: company = $companyModifyData;

	const modifyRequest = async (value: any) => {
		const response = await fetch('http://localhost:3000/api/companyModifyRequest', {
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
			<label class="mg" for="companyName">Company Name:</label>
			<input class="mg add_input" name="companyName" id="companyName" bind:value={company.companyName} required />

			<label class="mg" for="companyAddress">Company Address:</label>
			<input class="mg add_input" name="companyAddress" id="companyAddress" bind:value={company.companyAddress} required />

			<label class="mg" for="postCode">Post Code:</label>
			<input class="mg add_input" name="postCode" id="postCode" bind:value={company.postCode} required />

			<label class="mg" for="demandTotal">Demand Male:</label>
			<input class="mg add_input" name="demandMale" id="demandMale" bind:value={company.demandTotal.male} required />

			<label class="mg" for="demandTotal">Demand Female:</label>
			<input class="mg add_input" name="demandFemale" id="demandFemale" bind:value={company.demandTotal.female} required />

			<label class="mg" for="companyPhNo">Company Phone Number:</label>
			<input class="mg add_input" name="companyPhNo" id="companyPhNo" bind:value={company.companyPhNo} required />

			<button class="submit-btn" type="submit">Submit</button>
		</form>
	</div>
{/if}

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
