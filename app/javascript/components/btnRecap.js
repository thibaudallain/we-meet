const btnRecap = () => {
  const btn = document.getElementById('btn-recap-or-vote');
  const div = document.getElementById('recap-or-vote');
  if (btn && div) {
    btn.addEventListener('click', (event) => {
      const link = "/events/" + div.dataset.event.toString();
      const eventId = div.dataset.event.toString();
      const html = `<a href='${link}' data-event='${eventId}' class='btn-blue-wm share bouton-bas'>Le Récap</a>"`;
      div.innerHTML = html;
    });
  }
}

export { btnRecap };
