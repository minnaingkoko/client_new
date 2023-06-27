<script lang="ts">
    export let label:any;
    export let attr:any;
  </script>

<label class="mg" for="{attr}">{label}:</label>
<input type="file" class="form-control mg" name="{attr}" id="formFile" multiple />

<style>
    .mg {
		margin: 0 30px;
	}
    input {
		border: 1px solid gray;
	}
</style>