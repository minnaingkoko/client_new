import { writable } from 'svelte/store';

export const userData = writable<Array<any>>([]);

export const add = writable(false);
export const view = writable(false);

export const remove = writable(false);
export const remove_id = writable<any>(null);

export const modify = writable(false);
export const modifyData = writable<any>(null);

export const list = writable(false);
export const list_id = writable<any>(null);

export const Page1 = writable(true);
export const Page2 = writable(false);
export const Page3 = writable(false);
