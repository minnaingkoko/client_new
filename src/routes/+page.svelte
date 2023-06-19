<script lang="ts">
	import EmployeeData from '../components/EmployeeData.svelte';
	import close_icon from '$lib/images/close.svg';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { userData, view, remove, remove_id } from '../stores/MainStores';

	let gender = '';
	let marital = '';
	let workedCountry = '';
	let spokenLanguage = '';

	let addPage1 = true;
	let addPage2 = false;
	let addPage3 = false;

	const resetPage = () => {
		addPage1 = true;
		addPage2 = false;
		addPage3 = false;
	}

	let add = false;
	const addToggle = () => {
		resetPage();
		view.update((currentValue) => !currentValue);
		add = !add;
	};	

	const addNext = () => {
		if(addPage1 === true && addPage2 === false && addPage3 === false){
			addPage1 = false;
			addPage2 = true;
		}
		else if(addPage1 === false && addPage2 === true && addPage3 === false){
			addPage2 = false;
			addPage3 = true;
		}
	}

	const deleteToggle = (value: any) => {
		remove_id.update(() => value);
		view.update((currentValue) => !currentValue);
		remove.update((currentValue) => !currentValue);
	};

	const deleteRequest = async (value: any) => {
		const response = await fetch('http://localhost:3000/api/delete', {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ idNo: value })
		});
		if(response.status === 200){
			goto('/');
		}
		const data = await response.json();
		console.log(data);
	};

	onMount(async () => {
		// Fetch data from MongoDB
		const response = await fetch('http://localhost:3000/api/info');
		const data = await response.json();

		// Update the store with the fetched data
		userData.set(data);
	});
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<div class="overlay" style="display: {$view ? 'flex' : 'none'};">
	<div class="add-form" style="display: {add ? 'block' : 'none'};">
		<div class="addForm-heading">
			<div class="text">Add Employee</div>
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<div class="close" on:click={addToggle}>
				<img src={close_icon} alt="" width="24px" height="24px" />
			</div>
		</div>
		<hr />
		<form class="addForm" action="/api/uploadmultiple" enctype="multipart/form-data" method="POST">
			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="name">Name:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="name" id="name" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="fatherName">Father Name:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="fatherName" id="fatherName" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="address">Address:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="address" id="address" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="phNo">Phone Number:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="phNo" id="phNo" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="nrcNo">NRC No:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="nrcNo" id="nrcNo" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="religion">Religion:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="religion" id="religion" required />

			<label class="mg" style="display: {addPage1 ? 'block' : 'none'};" for="agent">Agent:</label>
			<input class="add_input" type="{addPage1 ? 'text' : 'hidden'}" name="agent" id="agent" required />




			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="gender">Gender:</label>
			<select class="add_input" style="display: {addPage2 ? 'block' : 'none'};" bind:value={gender} required>
				<option value="">Select gender</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			<input type="hidden" name="gender" value={gender} />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="passport">Passport:</label>
			<input class="add_input" type="{addPage2 ? 'text' : 'hidden'}" name="passport" id="passport" required />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="dob">Date of Birth:</label>
			<input class="add_input" type="{addPage2 ? 'date' : 'hidden'}" name="dob" id="dob" required />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="weight">Weight (kg):</label>
			<input class="add_input" type="{addPage2 ? 'number' : 'hidden'}" name="weight" id="weight" step="0.1" placeholder="Optional" />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="height">Height (cm):</label>
			<input class="add_input" type="{addPage2 ? 'number' : 'hidden'}" name="height" id="height" step="0.1" placeholder="Optional" />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="marital">Marital Status:</label>
			<select class="add_input" style="display: {addPage2 ? 'block' : 'none'};" bind:value={marital} required>
				<option value="">Select marital status</option>
				<option value="single">Single</option>
				<option value="married">Married</option>
				<option value="divorced">Divorced</option>
				<option value="widowed">Widowed</option>
			</select>
			<input type="hidden" name="marital" value={marital} />

			<label class="mg" style="display: {addPage2 ? 'block' : 'none'};" for="education">Education:</label>
			<input class="add_input" type="{addPage2 ? 'text' : 'hidden'}" name="education" id="education" required />





			<label class="mg" style="display: {addPage3 ? 'block' : 'none'};" for="experience">Experience:</label>
			<input class="add_input" type="{addPage3 ? 'text' : 'hidden'}" name="experience" id="experience" required />

			<label class="mg" style="display: {addPage3 ? 'block' : 'none'};" for="workedCountry">Worked Country:</label>
			<select class="add_input" style="display: {addPage3 ? 'block' : 'none'};" bind:value={workedCountry} required>
				<option value="myanmar" selected>Myanmar</option>
				<option value="malaysia">Malaysia</option>
				<option value="custom">Custom</option>
			</select>
			<input type="hidden" name="workedCountry" value={workedCountry} />

			<!-- <input
				class="mg"
				type="text"
				name="customCountry"
				id="customCountry"
				placeholder="Enter your country"
				style="display: none"
			/> -->

			<label class="mg" style="display: {addPage3 ? 'block' : 'none'};" for="spokenLanguage">Spoken Language:</label>
			<select class="add_input" style="display: {addPage3 ? 'block' : 'none'};" bind:value={spokenLanguage} required>
				<option value="basic" selected>English (Basic)</option>
				<option value="intermediate">English (Intermediate)</option>
				<option value="advanced">English (Advanced)</option>
			</select>
			<input type="hidden" name="spokenLanguage" value={spokenLanguage} />

			<label class="mg" style="display: {addPage3 ? 'block' : 'none'};" for="passportScan">Passport Scan:</label>
			<input type="{addPage3 ? 'file' : 'hidden'}" class="form-control mg" name="images" id="formFile" multiple />

			<div class="addForm-bot">
				<div class="cancel-btn" on:click={addToggle}>Cancel</div>
				{#if addPage3 === true}
					<button class="submit-btn" type="submit">Submit</button>
				{:else if addPage3 === false}
					<div class="next-btn" on:click={addNext}>Next</div>
				{/if}

			</div>
		</form>
	</div>

	<div class="remove-form" style="display: {$remove ? 'block' : 'none'};">
		<div class="removeForm-heading">
			<div class="text">Delete Employee</div>
			<!-- svelte-ignore a11y-click-events-have-key-events  -->
			<div class="close" on:click={deleteToggle}>
				<img src={close_icon} alt="" width="24px" height="24px" />
			</div>
		</div>
		<hr />
		<div class="remove-content">
			<div class="warning-text">Are you sure you want to delete these Records?</div>
			<div class="another-text">This action cannot be undone.</div>
		</div>
		<form class="removeForm" on:submit={() => deleteRequest($remove_id)}>
			<div class="removeForm-bot">
				<input type="hidden" name="idNo" value={$remove_id} />	
				<div class="remove_btn1" on:click={deleteToggle}>Cancel</div>
				<button class="remove_btn2" type="submit">Delete</button>
			</div>
		</form>
	</div>
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
<EmployeeData/>
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

<style>
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
	.add_input {
		margin-left: 30px;
		margin-right: 30px;
		margin-bottom: 15px;
		height: 34px;
	}
	.add-form,
	.remove-form {
		position: absolute;
		top: 30px;
		width: 400px;
		height: calc(100vh - 60px);
		background-color: white;
		z-index: 12;
		border-radius: 4px;
	}
	.cancel-btn {
		background-color: white;
	}
	.submit-btn, .next-btn {
		background-color: #4aa84d;
		color: white;
	}
	.submit-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100px;
		height: 33px;
		cursor: pointer;
		border: none;
	}
	.remove-form {
		height: 240px !important;
	}
	.remove-content {
		margin: 20px 30px;
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	.another-text {
		font-size: 12px;
		color: #8a6d3b;
	}
	.addForm-heading,
	.removeForm-heading {
		width: 100%;
		height: 66px;
		border-radius: 4px 4px 0 0;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		padding: 0 30px;
		font-size: 18px;
		font-weight: 500;
		color: black;
	}
	.removeForm-bot {
		display: flex;
		flex-direction: row;
		justify-content: flex-end;
		gap: 12px;
		align-items: center;
		padding: 0 30px;
	}
	.remove_btn1,
	.remove_btn2 {
		width: 100px;
		height: 33px;
		font-size: 14px;
		cursor: pointer;
		border-radius: 4px;
	}
	.remove_btn1 {
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: white;
		border: 1px solid transparent;
		border-color: #adadad;
	}
	.remove_btn2 {
		border-color: #d43f3a;
		border: 1px solid transparent;
		background-color: #d9534f;
		color: white;
	}
	.addForm-bot {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		gap: 12px;
		border-radius: 4px;
		padding: 0 30px;
	}
	.addForm-bot div {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100px;
		height: 33px;
		cursor: pointer;
	}
	.addForm-bot,
	.removeForm-bot {
		position: absolute;
		bottom: 0;
		background-color: #e5e5e5;
		width: 100%;
		height: 75px;
		border-radius: 0 0 4px 4px;
	}
	.addForm,
	.removeForm {
		display: flex;
		flex-direction: column;
		margin-top: 20px;
		margin-bottom: 95px;
	}
	.mg {
		margin: 0 30px;
	}
	.nav-bar {
		display: flex;
		background-color: #435e7c;
		width: 100%;
		height: 65px;
		padding: 16px 30px;
		justify-content: space-between;
		align-items: center;
	}
	.heading {
		color: white;
		font-size: 24px;
	}
	.add-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 5px;
		width: 164px;
		height: 33px;
		color: white;
		transition: 0.3s;
		background-color: #4aa84d;
		border-radius: 4px;
		font-size: 13px;
		cursor: pointer;
	}
	.add-btn:hover {
		background-color: #3b923e;
	}
	.bot-nav {
		display: flex;
		padding: 0 25px;
		flex-direction: row;
		justify-content: space-between;
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 72px;
	}
	.bot-left {
		height: 32px;
		margin-top: 10px;
	}
	.bot-right {
		display: flex;
		flex-direction: row;
		gap: 2px;
		height: 32px;
		margin: 20px 0;
	}
	.bot-right div {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 32px;
		border: 1px solid #ddd;
		border-radius: 2px;
		cursor: pointer;
		transition: 0.3s;
	}
	.bn1 {
		width: 76px;
	}
	.bn2 {
		background-color: #337ab7;
		color: white;
	}
	.bn2,
	.bn3,
	.bn4,
	.bn5,
	.bn6 {
		width: 33px;
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
		width: 52px;
	}
</style>
