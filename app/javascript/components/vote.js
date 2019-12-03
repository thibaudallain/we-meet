const vote = () => {
  const hearts = document.querySelectorAll(".transparent-target");
  if (hearts.length > 0) {
      hearts.forEach((heart) => {
        heart.addEventListener('click', (event) => {
          const id = event.currentTarget.dataset.barid;
          console.log(id);
          const divId = `div${id}`;
          const input = document.getElementById(id);
          const like = document.getElementById(divId.toString());
          like.classList.toggle('active-like');
          if (input.value === "") {
            input.value = "1";
          } else {
            input.value = "0";
          }
          console.log(input.value);
        });
      });
    };
};

export { vote }
