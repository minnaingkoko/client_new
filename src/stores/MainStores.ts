import { writable } from 'svelte/store';

export const userData = writable<Array<any>>([]);

export const view = writable(false);
export const remove = writable(false);
export const remove_id = writable<any>(null);