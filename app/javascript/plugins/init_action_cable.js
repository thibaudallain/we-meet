const appendParticipant = (element) => {
  const divAttending = document.getElementById('attending-participants');
  const divDeclined = document.getElementById('declined-participants');
  if (element.attending === false) {
    divDeclined.insertAdjacentHTML('beforeend', element["message_partial"]);
  } else {
    divAttending.insertAdjacentHTML('beforeend', element["message_partial"]);
  }
}


const initActionCable = () => {
  const divAttending = document.getElementById('attending-participants');
  if (divAttending) {
    const eventId = divAttending.dataset.event
    App[`event_${eventId}`] = App.cable.subscriptions.create(
      { channel: 'EventsChannel', event_id: eventId },
      { received: (data) => appendParticipant(data) }
      )
  }
}

export { initActionCable };
