<script lang="ts">
	import { modifyData, view, Page1, Page2, Page3, modify } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import { goto } from '$app/navigation';

	const resetPage = () => {
		Page1.update(() => true);
		Page2.update(() => false);
		Page3.update(() => false);
	};

	const modifyToggle = () => {
		resetPage();
		view.update((currentValue) => !currentValue);
		modify.update((currentValue) => !currentValue);
	};

	const Next = () => {
		if ($Page1 === true && $Page2 === false && $Page3 === false) {
			Page1.update(() => false);
			Page2.update(() => true);
		} else if ($Page1 === false && $Page2 === true && $Page3 === false) {
			Page2.update(() => false);
			Page3.update(() => true);
		}
	};

	$: employee = $modifyData;

	const modifyRequest = async (value: any) => {
		const response = await fetch('http://localhost:3000/api/employeeModifyRequest', {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(employee)
		});
		if (response.status === 200) {
			goto('/');
			location.reload();
		}
	};
</script>

{#if employee}
	<div class="add-form" style="display: {$modify ? 'block' : 'none'};">
		<div class="addForm-heading">
			<div class="text">Modify Employee</div>
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<div class="close" on:click={modifyToggle}>
				<img src={close_icon} alt="" width="24px" height="24px" />
			</div>
		</div>
		<hr />
		<form class="addForm" action="/api/employeeModifyRequest" enctype="multipart/form-data" method="POST" on:submit|preventDefault={() => modifyRequest(employee._id)}>
			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="name">Name:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="name" id="name" bind:value={employee.name} required />
			{:else}
				<input class="add_input" type="hidden" name="name" id="name" bind:value={employee.name} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="fatherName">Father Name:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="fatherName" id="fatherName" bind:value={employee.fatherName} required />
			{:else}
				<input class="add_input" type="hidden" name="fatherName" id="fatherName" bind:value={employee.fatherName} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="address">Address:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="address" id="address" bind:value={employee.address} required />
			{:else}
				<input class="add_input" type="hidden" name="address" id="address" bind:value={employee.address} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="phNo">Phone Number:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="phNo" id="phNo" bind:value={employee.phNo} required />
			{:else}
				<input class="add_input" type="hidden" name="phNo" id="phNo" bind:value={employee.phNo} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="nrcNo">NRC No:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="nrcNo" id="nrcNo" bind:value={employee.nrcNo} required />
			{:else}
				<input class="add_input" type="hidden" name="nrcNo" id="nrcNo" bind:value={employee.nrcNo} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="religion">Religion:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="religion" id="religion" bind:value={employee.religion} required />
			{:else}
				<input class="add_input" type="hidden" name="religion" id="religion" bind:value={employee.religion} required />
			{/if}

			<label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="agent">Agent:</label>
			{#if $Page1}
				<input class="add_input" type="text" name="agent" id="agent" bind:value={employee.agent} required />
			{:else}
				<input class="add_input" type="hidden" name="agent" id="agent" bind:value={employee.agent} required />
			{/if}

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="gender">Gender:</label>
			<select class="add_input" style="display: {$Page2 ? 'block' : 'none'};" bind:value={employee.gender} required>
				<option value="">Select gender</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			<!-- <input type="hidden" name="gender" value={gender} /> -->

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="passport">Passport:</label>
			{#if $Page2}
				<input class="add_input" type="text" name="passport" id="passport" bind:value={employee.passport} required />
			{:else}
				<input class="add_input" type="hidden" name="passport" id="passport" bind:value={employee.passport} required />
			{/if}

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="dob">Date of Birth:</label>
			{#if $Page2}
				<input class="add_input" type="text" name="dob" id="dob" bind:value={employee.dob} required />
			{:else}
				<input class="add_input" type="hidden" name="dob" id="dob" bind:value={employee.dob} required />
			{/if}

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="weight">Weight (kg):</label>
			{#if $Page2}
				<input class="add_input" type="text" name="weight" id="weight" bind:value={employee.weight} required />
			{:else}
				<input class="add_input" type="hidden" name="weight" id="weight" bind:value={employee.weight} required />
			{/if}

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="height">Height (cm):</label>
			{#if $Page2}
				<input class="add_input" type="text" name="height" id="height" bind:value={employee.height} required />
			{:else}
				<input class="add_input" type="hidden" name="height" id="height" bind:value={employee.height} required />
			{/if}

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="marital">Marital Status:</label>
			<select class="add_input" style="display: {$Page2 ? 'block' : 'none'};" bind:value={employee.marital} required>
				<option value="">Select marital status</option>
				<option value="single">Single</option>
				<option value="married">Married</option>
				<option value="divorced">Divorced</option>
				<option value="widowed">Widowed</option>
			</select>
			<!-- <input type="hidden" name="marital" value={marital} /> -->

			<label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="education">Education:</label>
			{#if $Page2}
				<input class="add_input" type="text" name="education" id="education" bind:value={employee.education} required />
			{:else}
				<input class="add_input" type="hidden" name="education" id="education" bind:value={employee.education} required />
			{/if}

			<label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="experience">Experience:</label>
			{#if $Page3}
				<input class="add_input" type="text" name="experience" id="experience" bind:value={employee.experience} required />
			{:else}
				<input class="add_input" type="hidden" name="experience" id="experience" bind:value={employee.experience} required />
			{/if}

			<label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="workedCountry">Worked Country:</label>
			<select class="add_input" style="display: {$Page3 ? 'block' : 'none'};" bind:value={employee.workedCountry} required>
				<option value="myanmar" selected>Myanmar</option>
				<option value="malaysia">Malaysia</option>
				<option value="custom">Custom</option>
			</select>
			<!-- <input type="hidden" name="workedCountry" value={workedCountry} /> -->

			<!-- <input
                class="mg"
                type="text"
                name="customCountry"
                id="customCountry"
                placeholder="Enter your country"
                style="display: none"
            /> -->

			<label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="spokenLanguage">Spoken Language:</label>
			<select class="add_input" style="display: {$Page3 ? 'block' : 'none'};" bind:value={employee.spokenLanguage} required>
				<option value="basic" selected>English (Basic)</option>
				<option value="intermediate">English (Intermediate)</option>
				<option value="advanced">English (Advanced)</option>
			</select>
			<!-- <input type="hidden" name="spokenLanguage" value={spokenLanguage} /> -->

			<!-- <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="passportScan"
				>Passport Scan:</label
			>
			<input
				type={$Page3 ? 'file' : 'hidden'}
				class="form-control mg"
				name="images"
				id="formFile"
				multiple
			/>
			{#if $Page3}
				<input
					class="form-control mg"
					type="file"
					name="images"
				id="formFile"
					bind:value={employee.images}
					required
				/>
			{:else}
				<input
					class="add_input"
					type="hidden"
					name="images"
				id="formFile"
					bind:value={employee.images}
					required
				/>
			{/if} -->

			<div class="addForm-bot">
				<!-- svelte-ignore a11y-click-events-have-key-events -->
				<div class="cancel-btn" on:click={modifyToggle}>Cancel</div>
				{#if $Page3 === true}
					<button class="submit-btn" type="submit">Submit</button>
				{:else if $Page3 === false}
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div class="next-btn" on:click={Next}>Next</div>
				{/if}
			</div>
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
