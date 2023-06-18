// import { writable } from 'svelte/store';

//   // Define the initial user schema
//   const userSchema = {
//     name: { type: String, required: true },
//     fatherName: { type: String, required: true },
//     address: { type: String, required: true },
//     phNo: { type: String, required: true },
//     nrcNo: { type: String, required: true, unique: true },
//     religion: { type: String, required: true },
//     gender: { type: String, required: true },
//     passport: { type: String, required: true, unique: true },
//     dob: { type: Date, required: true },
//     dobString: { type: String },
//     dobUpdate: { type: String },
//     age: { type: Number, required: true },
//     weight: { type: Number },
//     height: { type: Number },
//     marital: { type: String, required: true },
//     education: { type: String, required: true },
//     experience: { type: String, required: true },
//     workedCountry: { type: String, required: true },
//     spokenLanguage: { type: String, required: true },
//     passportScan: {
//       filename: {
//         type: String,
//         unique: true,
//         required: true
//       },
//       contentType: {
//         type: String,
//         required: true
//       },
//       imageBase64: {
//         type: String,
//         required: true
//       }
//     }
//   };

//   // Create a writable store with the initial user schema
//   export const userSchemaStore = writable(userSchema);


// src/store.js
import { writable } from 'svelte/store';

export const userData = writable<Array<any>>([]);