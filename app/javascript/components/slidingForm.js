const able = () => {
  const name = document.getElementById('name');
  const phone = document.getElementById('phone_number');
  const start = document.getElementById("event_start_time");
  const btn = document.getElementById('new-event');
  const address = document.getElementById('address');
  let fir = name.classList.contains('valid-input');
  let sec = phone.classList.contains('valid-input');
  let thi = start.classList.contains('valid-input');
  let fou = start.classList.contains('valid-input');
  if (fir && sec && thi && fou) {
    btn.disabled = false;
    btn.classList.remove('btn-disabled');
  } else {
    btn.disabled = true;
    btn.classList.add('btn-disabled');
  };
}

const slideForm = () => {
  const deadlines = document.querySelectorAll('.label-deadline');
  const secondPart = document.getElementById('rest-of-form');
  deadlines.forEach((deadline) => {
    deadline.addEventListener('click', (event) => {
      secondPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
      able();
    })
  });
};

export { slideForm };
