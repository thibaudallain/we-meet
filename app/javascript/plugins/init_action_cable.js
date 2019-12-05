const appendParticipant = (element) => {
  const divAttending = document.getElementById('attending-participants');
  const divDeclined = document.getElementById('declined-participants');
  const btnShareOrVote = document.getElementById('share-or-vote');
  const nbAttending = document.getElementById('nb-dispo');
  if (element.attending === false && element.voted !== true) {
    divDeclined.insertAdjacentHTML('beforeend', element.message_partial);
  } else if (element.attending === true && element.voted !== true) {
    divAttending.insertAdjacentHTML('beforeend', element.message_partial);
    btnShareOrVote.innerHTML = element.btn_partial;
    nbAttending.innerHTML = element.dispos_partial;
  }
}

const addVote = (element) => {
  const cardVoters = document.getElementById('voting-participants');
  if (element.voted === true) {
    cardVoters.innerHTML = element.voting_partial;
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
