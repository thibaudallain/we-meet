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
const addressMeeting = document.getElementById('meeting_address');
const btn = document.getElementById('new-event');
const btnMeeting = document.getElementById('new-attending');

if (btn) {
  btn.disabled = true;
  btn.classList.add('btn-disabled');
}

if (btnMeeting) {
  btnMeeting.disabled = true;
  btnMeeting.classList.add('btn-disabled');
}

if (name && phone) {
  // name
  name.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget)
    } else {
      invalid(event.currentTarget)
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
    } else {
      invalid(event.currentTarget);
    };
  });

  deadline.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
    } else {
      invalid(event.currentTarget);
    };
  });

  address.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
    } else {
      invalid(event.currentTarget);
    };
  });
};

if (addressMeeting) {
  addressMeeting.addEventListener('blur', (event) => {
    if (event.currentTarget.value) {
      valid(event.currentTarget);
    } else {
      invalid(event.currentTarget);
    };
  });
}

};

export { validateForm };
