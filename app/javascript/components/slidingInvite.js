const slideInvite = () => {
  const firstArrowInvite = document.querySelector('#invite-arrow-1');
  const secondPartInvite = document.getElementById('invite-2');
    firstArrowInvite.addEventListener('click', (event) => {
      secondPartInvite.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
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
