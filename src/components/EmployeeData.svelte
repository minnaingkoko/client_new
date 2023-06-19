<script lang="ts">
    import visibility_icon from '$lib/images/visibility.svg';
	import edit_icon from '$lib/images/edit.svg';
	import delete_icon from '$lib/images/delete.svg';
    import { userData, view, remove, remove_id } from '../stores/MainStores';

    const deleteToggle = (value: any) => {
		remove_id.update(() => value);
		view.update((currentValue) => !currentValue);
		remove.update((currentValue) => !currentValue);
	};
</script>

<div class="employees_data">
	<div class="e_heading">
		<div class="col1">Select</div>
		<div class="col2">Name</div>
		<div class="col3">Passport No</div>
		<div class="col4">NRC No</div>
		<div class="col5">Gender</div>
		<div class="col6">Birthday</div>
		<div class="col7">Age</div>
		<div class="col8">Address</div>
		<div class="col9">Phone Number</div>
		<!-- <div class="col10">Father Name</div> -->
		<!-- <div class="col11">Religion</div> -->
		<div class="col12">Education</div>
		<!-- <div class="col13">Agent</div> -->
		<div class="col14">Actions</div>
	</div>
	<div class="hr" />
	<ul>
		{#each $userData as user, index}
			<div class={index % 2 === 0 ? 'row-alt' : 'row'}>
				<div class="col1">
					<input class="cb" type="checkbox" />
				</div>
				<div class="col2">{user.name}</div>
				<div class="col3">{user.passport}</div>
				<div class="col4">{user.nrcNo}</div>
				<div class="col5">{user.gender}</div>
				<div class="col6">{user.dobString}</div>
				<div class="col7">{user.age}</div>
				<div class="col8">{user.address}</div>
				<div class="col9">{user.phNo}</div>
				<!-- <div class="col10">{user.fatherName}</div> -->
				<!-- <div class="col11">{user.religion}</div> -->
				<div class="col12">{user.education}</div>
				<!-- <div class="col13">{user.agent}</div>-->
				<div class="col14">
					<div>
						<img class="visibility" src={visibility_icon} alt="" width="22px" height="22px" />
					</div>
					<div>
						<img class="edit" src={edit_icon} alt="" width="22px" height="22px" />
					</div>
					<!-- svelte-ignore a11y-click-events-have-key-events -->
					<div on:click={() => deleteToggle(user._id)}>
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
		min-width: 120px;
	}
	.col4 {
		min-width: 180px;
	}
	.col5 {
		min-width: 80px;
	}
	.col6 {
		min-width: 120px;
	}
	.col7 {
		min-width: 60px;
	}
	.col8 {
		min-width: 200px;
	}
	.col9 {
		min-width: 140px;
	}
	.col10 {
		min-width: 220px;
	}
	.col11 {
		min-width: 100px;
	}
	.col12 {
		min-width: 130px;
	}
	.col13 {
		min-width: 100px;
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
	.delete,
	.close {
		cursor: pointer;
		transition: 0.3s;
	}
	.visibility:hover,
	.edit:hover,
	.delete:hover {
		opacity: 0.6;
	}
</style>