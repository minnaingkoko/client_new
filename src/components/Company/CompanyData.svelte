<script lang="ts">
	import visibility_icon from '$lib/images/visibility.svg';
	import edit_icon from '$lib/images/edit.svg';
	import delete_icon from '$lib/images/delete.svg';
	import { companyData, companyView, companyModify, companyModifyData, companyRemove, companyRemove_id, companyList, companyList_id, assignSingle } from '../../stores/MainStores';

	const listToggle = async (value: any) => {
		const response = await fetch('http://localhost:3000/api/companySingleInfo', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ idNo: value })
		});

		const data = await response.json();

		console.log(data);

		assignSingle.set(data);
		companyList_id.update(() => value);
		companyView.update((currentValue) => !currentValue);
		companyList.update((currentValue) => !currentValue);
	};

	const modifyPost = async (value: any) => {
		const response = await fetch('http://localhost:3000/api/companyModify', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ idNo: value })
		});
		const data = await response.json();

		// Update the store with the fetched data
		companyModifyData.set(data);
	};

	const modifyToggle = (value: any) => {
		modifyPost(value);
		companyView.update((currentValue) => !currentValue);
		companyModify.update((currentValue) => !currentValue);
	};

	const deleteToggle = (value: any) => {
		companyRemove_id.update(() => value);
		companyView.update((currentValue) => !currentValue);
		companyRemove.update((currentValue) => !currentValue);
	};
</script>

<div class="employees_data">
	<div class="e_heading">
		<div class="col1">Select</div>
		<div class="col2">Company Name</div>
		<div class="col3">Company Address</div>
		<div class="col4">Post Code</div>
		<div class="col5">Demand Person</div>
		<div class="col6">Company Phone Number</div>
		<div class="col14">Actions</div>
	</div>
	<div class="hr" />
	<ul>
		{#each $companyData as data, index}
			<div class={index % 2 === 0 ? 'row-alt' : 'row'}>
				<div class="col1">
					<input class="cb" type="checkbox" />
				</div>
				<div class="col2">{data.companyName}</div>
				<div class="col3">{data.companyAddress}</div>
				<div class="col4">{data.postCode}</div>
				<div class="col5">M-{data.demandTotal.male}/ F-{data.demandTotal.female}</div>
				<div class="col6">{data.companyPhNo}</div>
				<div class="col14">
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div on:click={() => listToggle(data._id)}>
						<img class="visibility" src={visibility_icon} alt="" width="22px" height="22px" />
					</div>
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div on:click={() => modifyToggle(data._id)}>
						<img class="edit" src={edit_icon} alt="" width="22px" height="22px" />
					</div>
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div on:click={() => deleteToggle(data._id)}>
						<img class="delete" src={delete_icon} alt="" width="22px" height="22px" />
					</div>
				</div>
			</div>
			<div class="hr" />
		{/each}
	</ul>
</div>

<style>
	.employees_data {
		color: black;
	}
	.hr {
		width: 100%;
		height: 2px;
		background-color: #e9e9e9;
	}
	.cb {
		margin: 0;
	}
	.e_heading,
	.row-alt,
	.row {
		font-size: 14px;
		display: flex;
		flex-direction: row;
		width: 100%;
	}
	.e_heading {
		height: 50px;
		font-weight: bold;
	}
	.row-alt {
		height: 52px;
		background-color: white;
	}
	.row {
		height: 52px;
		background-color: #f5f5f5;
	}
	.e_heading > div,
	.row > div,
	.row-alt > div {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 0 15px;
		border-right: 1px solid #e9e9e9;
	}
	.col1 {
		min-width: 100px;
	}
	.col2 {
		min-width: 200px;
	}
	.col3 {
		min-width: 170px;
	}
	.col4 {
		min-width: 180px;
	}
	.col5 {
		min-width: 150px;
	}
	.col6 {
		min-width: 200px;
	}
	.col14 {
		border-right: 0 !important;
		display: flex;
		flex-direction: row;
		gap: 8px;
		min-width: 120px;
	}
	.visibility,
	.edit,
	.delete {
		cursor: pointer;
		transition: 0.3s;
	}
	.visibility:hover,
	.edit:hover,
	.delete:hover {
		opacity: 0.6;
	}
</style>
