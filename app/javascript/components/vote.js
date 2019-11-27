const vote = () => {
  const hearts = document.querySelectorAll(".card-bar-heart");
  if (hearts.length > 0) {
      hearts.forEach((heart) => {
        heart.addEventListener('click', (event) => {
          const id = event.currentTarget.id.slice(-2);
          const input = document.getElementById(id.toString());
          heart.classList.toggle('active');
          if (input.value === "0") {
            input.value = "1";
          } else {
            input.value = "0";
          }
        });
      });
    };
};

export { vote }
