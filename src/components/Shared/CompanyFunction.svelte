<script lang="ts" context="module">
	import { companyView, companyAdd, companySearch, CPage1, CPage2, CPage3, assign, fullImg, fullImgUrl } from '../../stores/MainStores';


    export const toggleImg = () => {
		fullImg.update(() => false);
		fullImgUrl.update(() => '');
	};

	export const assignEmployee = async () => {
		assign.update((assign) => !assign);
		companyView.update(() => true);
		companyAdd.update(() => true);
	};

	const resetPage = () => {
		CPage1.update(() => true);
		CPage2.update(() => false);
		CPage3.update(() => false);
	};

	export const searchToggle = () => {
		resetPage();
		companyView.update((currentValue) => !currentValue);
		companySearch.update((currentValue) => !currentValue);
	};

	export const addToggle = () => {
		resetPage();
		companyView.update((currentValue) => !currentValue);
		companyAdd.update((currentValue) => !currentValue);
	};
</script>