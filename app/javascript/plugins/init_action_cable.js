const appendParticipant = (element) => {
  const divAttending = document.getElementById('attending-participants');
  const divDeclined = document.getElementById('declined-participants');
  const btnShareOrVote = document.getElementById('share-or-vote');
  if (element.attending === false) {
    divDeclined.insertAdjacentHTML('beforeend', element.message_partial);
  } else {
    divAttending.insertAdjacentHTML('beforeend', element.message_partial);
    btnShareOrVote.innerHTML = element.btn_partial;
  }
}

const addVote = (element) => {
  const votes = document.getElementById('votes');
  const btnVoteOrRecap = document.getElementById('recap-or-vote');
  if (element.voted === true) {
    votes.innerText = (Number.parseInt(votes.innerText) + 1).toString();
    btnVoteOrRecap.innerHTML = element.btn_recap_partial;
  }
}


const initActionCable = () => {
  const votes = document.getElementById('votes');
  const divAttending = document.getElementById('attending-participants');
  if (divAttending) {
    const eventId = divAttending.dataset.event
    App[`event_${eventId}`] = App.cable.subscriptions.create(
      { channel: 'EventsChannel', event_id: eventId },
      { received: (data) => appendParticipant(data) }
      )
  }
  if (votes) {
    const eventId = votes.dataset.event
    App[`event_${eventId}`] = App.cable.subscriptions.create(
      { channel: 'EventsChannel', event_id: eventId },
      { received: (data) => addVote(data) }
      )
  }
}

export { initActionCable };
