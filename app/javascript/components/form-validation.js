const valid = (field) => {
  field.classList.remove('invalid-input');
  field.classList.add('valid-input');
};

const invalid = (field) => {
  field.classList.remove('valid-input');
  field.classList.add('invalid-input');
};

const testRegex = (field, regex) => {
  if (regex.test(field.value)) {
    valid(field);
  } else {
    invalid(field);
  }
};

const validateForm = () => {

const name = document.getElementById('name');
const phone = document.getElementById('phone_number');
const start = document.getElementById("event_start_time");
const deadline = document.getElementById("event_deadline");
const address = document.getElementById('address');
const btn = document.getElementById('new-event');

  let sec = phone.classList.contains('valid-input');
  let thi = start.classList.contains('valid-input');
  let fou = deadline.classList.contains('valid-input');
  let fif = address.classList.contains('valid-input');

if (name && phone) {
  // name
  name.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget)
      let fir = name.classList.contains('valid-input');
      console.log(fir, sec, thi, fou, fif);
    } else {
      invalid(event.currentTarget);
      let fir = name.classList.contains('valid-input');
    };
  });
  // phone
  phone.addEventListener('blur', (event) => {
    testRegex(phone, /0(6|7)\d{8}/);
  });
};

if (start && deadline && address) {
  start.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
      console.log(fir, sec, thir, fou, fif);
    } else {
      invalid(event.currentTarget);
    };
  });
  deadline.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
      console.log(fir, sec, thir, fou, fif);
    } else {
      invalid(event.currentTarget);
    };
  });
  address.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
      console.log(fir, sec, thir, fou, fif);
    } else {
      invalid(event.currentTarget);
    };
  });

  if (fir && sec && thi && fou && fif) {
    btn.disabled = false;
    btn.classList.remove('btn-disabled');
  } else {
    btn.disabled = true;
    btn.classList.add('btn-disabled');
  };
};

};

export { validateForm };
