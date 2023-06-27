<script lang="ts">
  export let label:any;
  export let attr:any;
</script>

<label class="mg" for={attr}>{label}:</label>
<input class="add_input" name={attr} id={attr} required />

<style>
    .mg {
		margin: 0 30px;
	}
    .add_input {
		@apply ml-[30px] mr-[30px] mb-[15px] h-[34px];
	}
    input {
		border: 1px solid gray;
	}
</style>