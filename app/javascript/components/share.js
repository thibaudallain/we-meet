const share = () => {
const btn = document.querySelector('.share');
const link = document.querySelector('.link-to-share');
if (btn) {
  btn.addEventListener('click', (event) => {
      console.log(link.innerText)
      const eventId = btn.dataset.event;
      console.log(eventId);
    if (navigator.share) {
      console.log("it's working");
      navigator.share({
        title: "We Meet",
        text: "On sort ce soir ? Pour l'organisation, c'est We Meet",
        url: `${link.innerText}`
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
