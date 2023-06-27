<script lang="ts">
	import { employeeView, HPage1, HPage2, HPage3, HPage4, employeeAdd } from '../../stores/MainStores';
	import close_icon from '$lib/images/close.svg';
	import { goto } from '$app/navigation';
	import { readable } from 'svelte/store';

	interface Scan {
		name: string;
		fatherName: string;
		motherName: string;
		address: string;
		phNo: string;
		nrcNo: string;
		religion: string;
		agent: string;
		gender: string;
		passport: string;
		dob: null;
		weight: null;
		height: null;
		marital: string;
		education: string;
		experience: string;
		workedCountry: string;
		spokenLanguage: string;
		deposit: string;
		applyDate: string;
		passportExpireDate: string;
		passportType: string;
		medicalOnlineExpire: string;
		smartCardNo: string;
		airPlaneNo: string;
		departureDate: string;
		passportScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		nrcScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		vaccineNotaryScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		medicalOnlineScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		trainingScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		airTicketScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		visaScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		smartCardScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
		familyDataScan: {
			filename: string;
			contentType: string;
			imageBase64: string | ArrayBuffer | null;
		};
	}

	let employeeData: Scan = {
		name: '',
		fatherName: '',
		motherName: '',
		address: '',
		phNo: '',
		nrcNo: '',
		religion: '',
		agent: '',
		gender: '',
		passport: '',
		dob: null,
		weight: null,
		height: null,
		marital: '',
		education: '',
		experience: '',
		workedCountry: '',
		spokenLanguage: '',
		deposit: '',
		applyDate: '',
		passportExpireDate: '',
		passportType: '',
		medicalOnlineExpire: '',
		smartCardNo: '',
		airPlaneNo: '',
		departureDate: '',
		passportScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		nrcScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		vaccineNotaryScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		medicalOnlineScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		trainingScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		airTicketScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		visaScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		smartCardScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		},
		familyDataScan: {
			filename: '',
			contentType: '',
			imageBase64: ''
		}
	};

	const addRequest = async () => {
		console.log(employeeData);
		const response = await fetch('http://localhost:3000/api/employeeUpload', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(employeeData)
		});
		if (response.status === 200) {
			goto('/');
			location.reload();
		}
	};

	const handleFileChange1 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.passportScan.filename = file.name;
					employeeData.passportScan.contentType = file.type;
					employeeData.passportScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange2 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.nrcScan.filename = file.name;
					employeeData.nrcScan.contentType = file.type;
					employeeData.nrcScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange3 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.vaccineNotaryScan.filename = file.name;
					employeeData.vaccineNotaryScan.contentType = file.type;
					employeeData.vaccineNotaryScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange4 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.medicalOnlineScan.filename = file.name;
					employeeData.medicalOnlineScan.contentType = file.type;
					employeeData.medicalOnlineScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange5 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.trainingScan.filename = file.name;
					employeeData.trainingScan.contentType = file.type;
					employeeData.trainingScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange6 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.airTicketScan.filename = file.name;
					employeeData.airTicketScan.contentType = file.type;
					employeeData.airTicketScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange7 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.visaScan.filename = file.name;
					employeeData.visaScan.contentType = file.type;
					employeeData.visaScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange8 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.smartCardScan.filename = file.name;
					employeeData.smartCardScan.contentType = file.type;
					employeeData.smartCardScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const handleFileChange9 = (event: any) => {
		const files = event.target.files;
		if (files && files.length > 0) {
			const file = files[0];
			if (file) {
				const reader = new FileReader();

				reader.onloadend = () => {
					const base64String = reader.result;
					employeeData.familyDataScan.filename = file.name;
					employeeData.familyDataScan.contentType = file.type;
					employeeData.familyDataScan.imageBase64 = base64String;
					// Use the base64String as needed (e.g., send it in a request)
				};

				reader.readAsDataURL(file);
			}
		}
	};

	const resetPage = () => {
		HPage1.update(() => true);
		HPage2.update(() => false);
		HPage3.update(() => false);
		HPage4.update(() => false);
	};

	const addToggle = () => {
		resetPage();
		employeeView.update((currentValue) => !currentValue);
		employeeAdd.update((currentValue) => !currentValue);
	};

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
</script>

<div class="add-form" style="display: {$employeeAdd ? 'block' : 'none'};">
	<div class="addForm-heading">
		<div class="text">Add Employee</div>
		<!-- svelte-ignore a11y-click-events-have-key-events -->
		<div class="close" on:click={addToggle}>
			<img src={close_icon} alt="" width="24px" height="24px" />
		</div>
	</div>
	<hr />
	<form class="addForm" on:submit|preventDefault={() => addRequest()}>
		{#if $HPage1}
			<label class="mg" for="name">Name:</label>
			<input class="add_input" type="text" bind:value={employeeData.name} name="name" id="name" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="motherName">Mother Name:</label>
			<input class="add_input" type="text" bind:value={employeeData.motherName} name="motherName" id="motherName" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="fatherName">Father Name:</label>
			<input class="add_input" type="text" bind:value={employeeData.fatherName} name="fatherName" id="fatherName" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="address">Address:</label>
			<input class="add_input" type="text" bind:value={employeeData.address} name="address" id="address" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="phNo">Phone Number:</label>
			<input class="add_input" type="text" bind:value={employeeData.phNo} name="phNo" id="phNo" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="nrcNo">NRC No:</label>
			<input class="add_input" type="text" bind:value={employeeData.nrcNo} name="nrcNo" id="nrcNo" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="religion">Religion:</label>
			<input class="add_input" type="text" bind:value={employeeData.religion} name="religion" id="religion" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="agent">Agent:</label>
			<input class="add_input" type="text" bind:value={employeeData.agent} name="agent" id="agent" required />
		{/if}

		{#if $HPage1}
			<label class="mg" for="gender">Gender:</label>
			<select class="add_input" bind:value={employeeData.gender} required>
				<option value="">Select gender</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
		{/if}

		{#if $HPage1}
			<label class="mg" for="passport">Passport:</label>
			<input class="add_input" type="text" bind:value={employeeData.passport} name="passport" id="passport" required />
		{/if}

		{#if $HPage2}
			<label class="mg" for="dob">Date of Birth:</label>
			<input class="add_input" type="date" bind:value={employeeData.dob} name="dob" id="dob" required />
		{/if}

		{#if $HPage2}
			<label class="mg" for="weight">Weight (kg):</label>
			<input class="add_input" type="number" bind:value={employeeData.weight} name="weight" id="weight" step="0.1" placeholder="Optional" />
		{/if}

		{#if $HPage2}
			<label class="mg" for="height">Height (cm):</label>
			<input class="add_input" type="number" bind:value={employeeData.height} name="height" id="height" step="0.1" placeholder="Optional" />
		{/if}

		{#if $HPage2}
			<label class="mg" for="marital">Marital Status:</label>
			<select class="add_input" bind:value={employeeData.marital} required>
				<option value="">Select marital status</option>
				<option value="single">Single</option>
				<option value="married">Married</option>
				<option value="divorced">Divorced</option>
				<option value="widowed">Widowed</option>
			</select>
		{/if}

		{#if $HPage2}
			<label class="mg" for="education">Education:</label>
			<input class="add_input" type="text" bind:value={employeeData.education} name="education" id="education" required />
		{/if}

		{#if $HPage2}
			<label class="mg" for="experience">Experience:</label>
			<input class="add_input" type="text" bind:value={employeeData.experience} name="experience" id="experience" required />
		{/if}

		{#if $HPage2}
			<label class="mg" for="workedCountry">Worked Country:</label>
			<select class="add_input" bind:value={employeeData.workedCountry} required>
				<option value="myanmar" selected>Myanmar</option>
				<option value="malaysia">Malaysia</option>
				<option value="custom">Custom</option>
			</select>
		{/if}

		<!-- <input
            class="mg"
            type="text"
            name="customCountry"
            id="customCountry"
            placeholder="Enter your country"
            style="display: none"
        /> -->

		{#if $HPage2}
			<label class="mg" for="spokenLanguage">Spoken Language:</label>
			<select class="add_input" bind:value={employeeData.spokenLanguage} required>
				<option value="basic" selected>English (Basic)</option>
				<option value="intermediate">English (Intermediate)</option>
				<option value="advanced">English (Advanced)</option>
			</select>
		{/if}

		{#if $HPage2}
			<label class="mg" for="passportScan">Passport Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange1} multiple />
		{/if}

		{#if $HPage2}
			<label class="mg" for="nrcScan">NRC Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange2} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="vaccineNotaryScan">Vaccine Notary Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange3} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="medicalOnlineScan">Medical Online Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange4} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="trainingScan">Training Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange5} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="airTicketScan">Air Ticket Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange6} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="visaScan">Visa Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange7} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="smartCardScan">Smart Card Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange8} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="familyDataScan">Family Data Scan:</label>
			<input type="file" class="form-control mg" id="formFile" on:change={handleFileChange9} multiple />
		{/if}

		{#if $HPage3}
			<label class="mg" for="deposit">Deposit:</label>
			<input class="add_input" type="text" bind:value={employeeData.deposit} name="deposit" id="deposit" required />
		{/if}

		{#if $HPage3}
			<label class="mg" for="applyDate">Apply Date:</label>
			<input class="add_input" type="text" bind:value={employeeData.applyDate} name="applyDate" id="applyDate" required />
		{/if}

		{#if $HPage3}
			<label class="mg" for="passportExpireDate">Passport Expire Date:</label>
			<input class="add_input" type="text" bind:value={employeeData.passportExpireDate} name="passportExpireDate" id="passportExpireDate" required />
		{/if}

		{#if $HPage4}
			<label class="mg" for="passportType">Passport Type:</label>
			<input class="add_input" type="text" bind:value={employeeData.passportType} name="passportType" id="passportType" required />
		{/if}

		{#if $HPage4}
			<label class="mg" for="medicalOnlineExpire">Medical Online Expire:</label>
			<input class="add_input" type="text" bind:value={employeeData.medicalOnlineExpire} name="medicalOnlineExpire" id="medicalOnlineExpire" required />
		{/if}

		{#if $HPage4}
			<label class="mg" for="smartCardNo">Smart Card No:</label>
			<input class="add_input" type="text" bind:value={employeeData.smartCardNo} name="smartCardNo" id="smartCardNo" required />
		{/if}

		<!-- <label class="mg" for="vaccineData">Vaccine Data:</label>
		<input class="add_input" type='text'  name="vaccineData" id="vaccineData" required /> -->

		{#if $HPage4}
			<label class="mg" for="airPlaneNo">Air Plane No:</label>
			<input class="add_input" type="text" bind:value={employeeData.airPlaneNo} name="airPlaneNo" id="airPlaneNo" required />
		{/if}

		{#if $HPage4}
			<label class="mg" for="departureDate">Departure Date:</label>
			<input class="add_input" type="text" bind:value={employeeData.departureDate} name="departureDate" id="departureDate" required />
		{/if}

		<div class="addForm-bot">
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<div class="cancel-btn" on:click={addToggle}>Cancel</div>
			{#if $HPage4 === true}
				<button class="submit-btn" type="submit">Submit</button>
			{:else if $HPage4 === false}
				<!-- svelte-ignore a11y-click-events-have-key-events -->
				<div class="next-btn" on:click={Next}>Next</div>
			{/if}
		</div>
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
