const slideForm = () => {
  const deadlines = document.querySelectorAll('.label-deadline');
  const secondPart = document.getElementById('rest-of-form');
  deadlines.forEach((deadline) => {
    deadline.addEventListener('click', (event) => {
      secondPart.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
    })
  });
};

export { slideForm };
