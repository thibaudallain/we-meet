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
  const firstArrow = document.querySelector('#first-arrow');
  const secondPart = document.getElementById('form-2');
    firstArrow.addEventListener('click', (event) => {
      secondPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
      able();
    });

  const secondArrow = document.querySelector('#second-arrow');
  const thirdPart = document.getElementById('form-3');
    secondArrow.addEventListener('click', (event) => {
      thirdPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const deadline1 = document.querySelector('#label1');
  const fourthPart2 = document.getElementById('form-3');
    deadline1.addEventListener('click', (event) => {
      fourthPart2.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const deadline2 = document.querySelector('#label2');
  const fourthPart3 = document.getElementById('form-3');
    deadline2.addEventListener('click', (event) => {
      fourthPart3.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const deadline3 = document.querySelector('#label3');
  const fourthPart4 = document.getElementById('form-3');
    deadline3.addEventListener('click', (event) => {
      fourthPart4.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const thirdArrow = document.querySelector('#third-arrow');
  const fourthPart = document.getElementById('form-4');
    thirdArrow.addEventListener('click', (event) => {
      fourthPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const fourthArrow = document.querySelector('#fourth-arrow');
  const fifthPart = document.getElementById('form-4');
    fourthArrow.addEventListener('click', (event) => {
      fifthPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const fifthArrow = document.querySelector('#fifth-arrow');
  const sixthPart = document.getElementById('form-5');
    fourthArrow.addEventListener('click', (event) => {
      sixthPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  // const deadlines = document.querySelectorAll('.label-deadline');
  // const secondPart = document.getElementById('rest-of-form');
  // deadlines.forEach((deadline) => {
  //   deadline.addEventListener('click', (event) => {
  //     secondPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  //   })
  // });


};

export { slideForm };
