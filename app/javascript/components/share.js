const share = () => {
const btn = document.querySelector('.share');
if (btn) {
  btn.addEventListener('click', (event) => {

      const eventId = btn.dataset.event;
      console.log(eventId);
    if (navigator.share) {
      console.log("it's working");
      navigator.share({
        title: "We Meet",
        text: "We Meet - Invitation pour ce soir",
        url: `/events/${eventId}/share`
      }).then(() => {
        console.log("Link shared");
      })
      .catch(console.error);
    } else {
      console.log("Link was not shared");
    };

  });
}
};

export { share };
