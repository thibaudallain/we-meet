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

const slideInvite = () => {
  const firstArrowInvite = document.querySelector('#invite-arrow-1');
  const secondPartInvite = document.getElementById('invite-2');
    firstArrowInvite.addEventListener('click', (event) => {
      secondPartInvite.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
      able();
    });

  const secondArrowInvite = document.querySelector('#invite-arrow-2');
  const thirdPartInvite = document.getElementById('invite-3');
    secondArrowInvite.addEventListener('click', (event) => {
      thirdPartInvite.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const deadline1Invite = document.querySelector('#invite-arrow-3');
  const fourthPart2Invite = document.getElementById('invite-4');
    deadline1Invite.addEventListener('click', (event) => {
      fourthPart2Invite.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

  const deadline2Invite = document.querySelector('#invite-arrow-4');
  const fourthPart3Invite = document.getElementById('invite-5');
    deadline2Invite.addEventListener('click', (event) => {
      fourthPart3Invite.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
  });

};

export { slideInvite };
