<script lang="ts" context='module'>
    import { employeeView, employeeAdd, employeeSearch, HPage1, HPage2, HPage3, HPage4, fullImg, fullImgUrl, employeeList_id, employeeList, fullImgName, fullImgType } from '../../stores/MainStores';

    const resetPage = () => {
		HPage1.update(() => true);
		HPage2.update(() => false);
		HPage3.update(() => false);
		HPage4.update(() => false);
	};

    export const searchToggle = () => {
		resetPage();
		employeeView.update((currentValue: any) => !currentValue);
		employeeSearch.update((currentValue: any) => !currentValue);
	};

	export const addToggle: () => void = () => {
		resetPage();
		employeeView.update((currentValue: any) => !currentValue);
		employeeAdd.update((currentValue: any) => !currentValue);
	};

    export const toggleImg = () => {
		fullImg.update(() => false);
		fullImgUrl.update(() => '')
	}

	export const listToggle = (value: any) => {
		resetPage();
		employeeList_id.update(() => value);
		employeeView.update((currentValue) => !currentValue);
		employeeList.update((currentValue) => !currentValue);
	};

	export const fullImage = (url: any, name: any, typ:any) => {
		fullImg.update((currentValue) => !currentValue);
		fullImgUrl.update(() => url)
		fullImgName.update(() => name)
		fullImgType.update(() => typ)
	}
</script>