const vote = () => {
  const hearts = document.querySelectorAll(".transparent-target");
  if (hearts.length > 0) {
      hearts.forEach((heart) => {
        heart.addEventListener('click', (event) => {
          const id = event.currentTarget.id.slice(-2);
          console.log(id);
          const divId = event.currentTarget.id.slice(-3);
          const input = document.getElementById(id.toString());
          console.log(input.value);
          const like = document.getElementById(divId.toString());
          like.classList.toggle('active-like');
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
