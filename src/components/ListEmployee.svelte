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
        <div class="text">Employee's Data</div>
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
                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="name">Name:</label>
                    <div>{user.name}</div>
                </div>
                
                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="fatherName">Father Name:</label>
                    <div>{user.fatherName}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="address">Address:</label>
                    <div>{user.address}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="phNo">Phone Number:</label>
                    <div>{user.phNo}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="nrcNo">NRC No:</label>
                    <div>{user.nrcNo}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="religion">Religion:</label>
                    <div>{user.religion}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="agent">Agent:</label>
                    <div>{user.agent}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="gender">Gender:</label>
                    <div>{user.gender}</div>    
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="passport">Passport:</label>
                    <div>{user.passport}</div>    
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="dob">Date of Birth:</label>
                    <div>{user.dobString}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="weight">Weight (kg):</label>
                    <div>{user.weight}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="height">Height (cm):</label>
                    <div>{user.height}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="marital">Marital Status:</label>
                    <div>{user.marital}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="education">Education:</label>
                    <div>{user.education}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="experience">Experience:</label>
                    <div>{user.experience}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="workedCountry">Worked Country:</label>
                    <div>{user.workedCountry}</div>
                </div>

                <div class="collect" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="spokenLanguage">Spoken Language:</label>
                    <div>{user.spokenLanguage}</div>
                </div>

                <div class="collect p-scan" style="display: {$Page1 ? 'flex' : 'none'};">
                    <label for="passportScan">Passport Scan:</label>
                    <div class="p-btns">
                        <div>
                            {user.passportScan.filename}
                        </div>
                        <div class="p-btn">
                            <a href='data:{user.passportScan.contentType};base64,{user.passportScan.imageBase64}'>
                                <img class="image-f" src='data:{user.passportScan.contentType};base64,{user.passportScan.imageBase64}' alt="...">
                            </a>
                            <a href='data:{user.passportScan.contentType};base64,{user.passportScan.imageBase64}' download="{user.passportScan.filename}">
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