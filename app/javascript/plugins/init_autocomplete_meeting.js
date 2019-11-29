import places from 'places.js';

const ableMeeting = () => {
  const name = document.getElementById('name');
  const phone = document.getElementById('phone_number');
  const btn = document.getElementById('new-attending');
  let fir = name.classList.contains('valid-input');
  let sec = phone.classList.contains('valid-input');
  if (fir && sec) {
    btn.disabled = false;
    btn.classList.remove('btn-disabled');
  } else {
    btn.disabled = true;
    btn.classList.add('btn-disabled');
  };
}

const initAutocompleteMeeting = () => {
  const meetingAddressInput = document.getElementById('meeting_address');

  if (meetingAddressInput) {
    const meetingpl = places({ container: meetingAddressInput });
    meetingpl.on('change', (event) => {
      ableMeeting();
    });
  }
};


export { initAutocompleteMeeting };
