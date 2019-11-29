import places from 'places.js';

const able = () => {
  const name = document.getElementById('name');
  const phone = document.getElementById('phone_number');
  const start = document.getElementById("event_start_time");
  const deadline = document.getElementById("event_deadline");
  const btn = document.getElementById('new-event');
  let fir = name.classList.contains('valid-input');
  let sec = phone.classList.contains('valid-input');
  let thi = start.classList.contains('valid-input');
  let fou = deadline.classList.contains('valid-input');
  if (fir && sec && thi && fou) {
    btn.disabled = false;
    btn.classList.remove('btn-disabled');
  } else {
    btn.disabled = true;
    btn.classList.add('btn-disabled');
  };
}

const initAutocomplete = () => {
  const addressInput = document.getElementById('address');
  if (addressInput) {
    const pl = places({ container: addressInput });
    pl.on('change', (event) => {
      able();
    });
  }
};

export { initAutocomplete };
