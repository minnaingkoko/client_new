<script lang="ts">
    import { userData, view, list, list_id, Page1, Page2, Page3 } from '../stores/MainStores';
    import close_icon from '$lib/images/close.svg';

    const resetPage = () => {
        Page1.update(() => true);
        Page2.update(() => false);
        Page3.update(() => false);
	};

    const listToggle = (value: any) => {
		resetPage();
		list_id.update(() => value);
		view.update((currentValue) => !currentValue);
		list.update((currentValue) => !currentValue);
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
</script>

<div class="list-data" style="display: {$list ? 'block' : 'none'};">
    <div class="addForm-heading">
        <div class="text">Add Employee</div>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <div class="close" on:click={listToggle}>
            <img src={close_icon} alt="" width="24px" height="24px" />
        </div>
    </div>
    <hr />
    {#each $userData as user, index}
        {#if user._id === $list_id}
            <form
                class="addForm"
                action="/api/uploadmultiple"
                enctype="multipart/form-data"
                method="POST"
            >
                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="name">Name:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.name}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="fatherName">Father Name:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.fatherName}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="address">Address:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.address}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="phNo">Phone Number:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.phNo}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="nrcNo">NRC No:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.nrcNo}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="religion">Religion:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.religion}</div>

                <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="agent">Agent:</label>
                <div style="display: {$Page1 ? 'block' : 'none'};">{user.agent}</div>



                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="gender">Gender:</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.gender}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="passport">Passport:</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.passport}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="dob">Date of Birth:</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.dobString}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="weight">Weight (kg):</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.weight}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="height">Height (cm):</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.height}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="marital">Marital Status:</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.marital}</div>

                <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="education">Education:</label>
                <div style="display: {$Page2 ? 'block' : 'none'};">{user.education}</div>


                <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="experience">Experience:</label>
                <div style="display: {$Page3 ? 'block' : 'none'};">{user.experience}</div>

                <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="workedCountry">Worked Country:</label>
                <div style="display: {$Page3 ? 'block' : 'none'};">{user.workedCountry}</div>

                <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="spokenLanguage">Spoken Language:</label>
                <div style="display: {$Page3 ? 'block' : 'none'};">{user.spokenLanguage}</div>

                <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="passportScan">Passport Scan:</label>
                <div style="display: {$Page3 ? 'block' : 'none'};">{user.passportScan}</div>

                <div class="addForm-bot">
                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                    <div class="cancel-btn" on:click={listToggle}>Cancel</div>
                    {#if $Page3 === true}
                        <button class="submit-btn" type="submit">Submit</button>
                    {:else if $Page3 === false}
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