<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="name">Name:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="name" id="name" bind:value={employee.name} required />
			{:else}
				<input class="add_input" type="hidden" name="name" id="name" bind:value={employee.name} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="fatherName">Father Name:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="fatherName" id="fatherName" bind:value={employee.fatherName} required />
			{:else}
				<input class="add_input" type="hidden" name="fatherName" id="fatherName" bind:value={employee.fatherName} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="address">Address:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="address" id="address" bind:value={employee.address} required />
			{:else}
				<input class="add_input" type="hidden" name="address" id="address" bind:value={employee.address} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="phNo">Phone Number:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="phNo" id="phNo" bind:value={employee.phNo} required />
			{:else}
				<input class="add_input" type="hidden" name="phNo" id="phNo" bind:value={employee.phNo} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="nrcNo">NRC No:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="nrcNo" id="nrcNo" bind:value={employee.nrcNo} required />
			{:else}
				<input class="add_input" type="hidden" name="nrcNo" id="nrcNo" bind:value={employee.nrcNo} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="religion">Religion:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="religion" id="religion" bind:value={employee.religion} required />
			{:else}
				<input class="add_input" type="hidden" name="religion" id="religion" bind:value={employee.religion} required />
			{/if}

			<label class="mg" style="display: {$HPage1 ? 'block' : 'none'};" for="agent">Agent:</label>
			{#if $HPage1}
				<input class="add_input" type="text" name="agent" id="agent" bind:value={employee.agent} required />
			{:else}
				<input class="add_input" type="hidden" name="agent" id="agent" bind:value={employee.agent} required />
			{/if}

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="gender">Gender:</label>
			<select class="add_input" style="display: {$HPage2 ? 'block' : 'none'};" bind:value={employee.gender} required>
				<option value="">Select gender</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
			</select>
			<!-- <input type="hidden" name="gender" value={gender} /> -->

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="passport">Passport:</label>
			{#if $HPage2}
				<input class="add_input" type="text" name="passport" id="passport" bind:value={employee.passport} required />
			{:else}
				<input class="add_input" type="hidden" name="passport" id="passport" bind:value={employee.passport} required />
			{/if}

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="dob">Date of Birth:</label>
			{#if $HPage2}
				<input class="add_input" type="text" name="dob" id="dob" bind:value={employee.dob} required />
			{:else}
				<input class="add_input" type="hidden" name="dob" id="dob" bind:value={employee.dob} required />
			{/if}

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="weight">Weight (kg):</label>
			{#if $HPage2}
				<input class="add_input" type="text" name="weight" id="weight" bind:value={employee.weight} required />
			{:else}
				<input class="add_input" type="hidden" name="weight" id="weight" bind:value={employee.weight} required />
			{/if}

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="height">Height (cm):</label>
			{#if $HPage2}
				<input class="add_input" type="text" name="height" id="height" bind:value={employee.height} required />
			{:else}
				<input class="add_input" type="hidden" name="height" id="height" bind:value={employee.height} required />
			{/if}

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="marital">Marital Status:</label>
			<select class="add_input" style="display: {$HPage2 ? 'block' : 'none'};" bind:value={employee.marital} required>
				<option value="">Select marital status</option>
				<option value="single">Single</option>
				<option value="married">Married</option>
				<option value="divorced">Divorced</option>
				<option value="w idowed">Widowed</option>
			</select>
			<!-- <input type="hidden" name="marital" value={marital} /> -->

			<label class="mg" style="display: {$HPage2 ? 'block' : 'none'};" for="education">Education:</label>
			{#if $HPage2}
				<input class="add_input" type="text" name="education" id="education" bind:value={employee.education} required />
			{:else}
				<input class="add_input" type="hidden" name="education" id="education" bind:value={employee.education} required />
			{/if}

			<label class="mg" style="display: {$HPage3 ? 'block' : 'none'};" for="experience">Experience:</label>
			{#if $HPage3}
				<input class="add_input" type="text" name="experience" id="experience" bind:value={employee.experience} required />
			{:else}
				<input class="add_input" type="hidden" name="experience" id="experience" bind:value={employee.experience} required />
			{/if}

			<label class="mg" style="display: {$HPage3 ? 'block' : 'none'};" for="workedCountry">Worked Country:</label>
			<select class="add_input" style="display: {$HPage3 ? 'block' : 'none'};" bind:value={employee.workedCountry} required>
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

			<label class="mg" style="display: {$HPage3 ? 'block' : 'none'};" for="spokenLanguage">Spoken Language:</label>
			<select class="add_input" style="display: {$HPage3 ? 'block' : 'none'};" bind:value={employee.spokenLanguage} required>
				<option value="basic" selected>English (Basic)</option>
				<option value="intermediate">English (Intermediate)</option>
				<option value="advanced">English (Advanced)</option>
			</select>
			<!-- <input type="hidden" name="spokenLanguage" value={spokenLanguage} /> -->

			<!-- <label class="mg" style="display: {$HPage3 ? 'block' : 'none'};" for="passportScan"
				>Passport Scan:</label
			>
			<input
				type={$HPage3 ? 'file' : 'hidden'}
				class="form-control mg"
				name="images"
				id="formFile"
				multiple
			/>
			{#if $HPage3}
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