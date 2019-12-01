import places from 'places.js';

const able = () => {
  const name = document.getElementById('name');
  const phone = document.getElementById('phone_number');
  const start = document.getElementById("event_start_time");
  const deadlines = document.querySelectorAll(".label-deadline");
  const btn = document.getElementById('new-event');
  let fir = name.classList.contains('valid-input');
  let sec = phone.classList.contains('valid-input');
  let thi = start.classList.contains('valid-input');
  let fou = deadlines[0].classList.contains('active') || deadlines[1].classList.contains('active') || deadlines[2].classList.contains('active') ;
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
