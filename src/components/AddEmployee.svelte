<script lang="ts">
    import { view, Page1, Page2, Page3, add } from '../stores/MainStores';
    import close_icon from '$lib/images/close.svg';

    let gender = '';
	let marital = '';
	let workedCountry = '';
	let spokenLanguage = '';

	const resetPage = () => {
        Page1.update(() => true);
        Page2.update(() => false);
        Page3.update(() => false);
	};

	const addToggle = () => {
		resetPage();
		view.update((currentValue) => !currentValue);
		add.update((currentValue) => !currentValue);
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

<div class="add-form" style="display: {$add ? 'block' : 'none'};">
    <div class="addForm-heading">
        <div class="text">Add Employee</div>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <div class="close" on:click={addToggle}>
            <img src={close_icon} alt="" width="24px" height="24px" />
        </div>
    </div>
    <hr />
    <form class="addForm" action="/api/uploadmultiple" enctype="multipart/form-data" method="POST">
        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="name">Name:</label>
        <input class="add_input" type={$Page1 ? 'text' : 'hidden'} name="name" id="name" required />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="fatherName"
            >Father Name:</label
        >
        <input
            class="add_input"
            type={$Page1 ? 'text' : 'hidden'}
            name="fatherName"
            id="fatherName"
            required
        />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="address"
            >Address:</label
        >
        <input
            class="add_input"
            type={$Page1 ? 'text' : 'hidden'}
            name="address"
            id="address"
            required
        />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="phNo"
            >Phone Number:</label
        >
        <input class="add_input" type={$Page1 ? 'text' : 'hidden'} name="phNo" id="phNo" required />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="nrcNo">NRC No:</label>
        <input
            class="add_input"
            type={$Page1 ? 'text' : 'hidden'}
            name="nrcNo"
            id="nrcNo"
            required
        />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="religion"
            >Religion:</label
        >
        <input
            class="add_input"
            type={$Page1 ? 'text' : 'hidden'}
            name="religion"
            id="religion"
            required
        />

        <label class="mg" style="display: {$Page1 ? 'block' : 'none'};" for="agent">Agent:</label>
        <input
            class="add_input"
            type={$Page1 ? 'text' : 'hidden'}
            name="agent"
            id="agent"
            required
        />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="gender">Gender:</label>
        <select
            class="add_input"
            style="display: {$Page2 ? 'block' : 'none'};"
            bind:value={gender}
            required
        >
            <option value="">Select gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
        <input type="hidden" name="gender" value={gender} />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="passport"
            >Passport:</label
        >
        <input
            class="add_input"
            type={$Page2 ? 'text' : 'hidden'}
            name="passport"
            id="passport"
            required
        />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="dob"
            >Date of Birth:</label
        >
        <input class="add_input" type={$Page2 ? 'date' : 'hidden'} name="dob" id="dob" required />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="weight"
            >Weight (kg):</label
        >
        <input
            class="add_input"
            type={$Page2 ? 'number' : 'hidden'}
            name="weight"
            id="weight"
            step="0.1"
            placeholder="Optional"
        />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="height"
            >Height (cm):</label
        >
        <input
            class="add_input"
            type={$Page2 ? 'number' : 'hidden'}
            name="height"
            id="height"
            step="0.1"
            placeholder="Optional"
        />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="marital"
            >Marital Status:</label
        >
        <select
            class="add_input"
            style="display: {$Page2 ? 'block' : 'none'};"
            bind:value={marital}
            required
        >
            <option value="">Select marital status</option>
            <option value="single">Single</option>
            <option value="married">Married</option>
            <option value="divorced">Divorced</option>
            <option value="widowed">Widowed</option>
        </select>
        <input type="hidden" name="marital" value={marital} />

        <label class="mg" style="display: {$Page2 ? 'block' : 'none'};" for="education"
            >Education:</label
        >
        <input
            class="add_input"
            type={$Page2 ? 'text' : 'hidden'}
            name="education"
            id="education"
            required
        />

        <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="experience"
            >Experience:</label
        >
        <input
            class="add_input"
            type={$Page3 ? 'text' : 'hidden'}
            name="experience"
            id="experience"
            required
        />

        <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="workedCountry"
            >Worked Country:</label
        >
        <select
            class="add_input"
            style="display: {$Page3 ? 'block' : 'none'};"
            bind:value={workedCountry}
            required
        >
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

        <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="spokenLanguage"
            >Spoken Language:</label
        >
        <select
            class="add_input"
            style="display: {$Page3 ? 'block' : 'none'};"
            bind:value={spokenLanguage}
            required
        >
            <option value="basic" selected>English (Basic)</option>
            <option value="intermediate">English (Intermediate)</option>
            <option value="advanced">English (Advanced)</option>
        </select>
        <input type="hidden" name="spokenLanguage" value={spokenLanguage} />

        <label class="mg" style="display: {$Page3 ? 'block' : 'none'};" for="passportScan"
            >Passport Scan:</label
        >
        <input
            type={$Page3 ? 'file' : 'hidden'}
            class="form-control mg"
            name="images"
            id="formFile"
            multiple
        />

        <div class="addForm-bot">
            <!-- svelte-ignore a11y-click-events-have-key-events -->
            <div class="cancel-btn" on:click={addToggle}>Cancel</div>
            {#if $Page3 === true}
                <button class="submit-btn" type="submit">Submit</button>
            {:else if $Page3 === false}
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