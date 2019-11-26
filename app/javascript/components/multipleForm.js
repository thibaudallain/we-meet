const multipleForm = () => {
  const step1 = document.querySelector(".step-1");
  const step2 = document.querySelector(".step-2");
  const formUser = document.getElementById("form-user");
  const formAvailability = document.getElementById("form-availability");
  step1.addEventListener("click", (event) => {
    formUser.classList.remove("d-none");
    formAvailability.classList.add("d-none");
    step2.classList.remove("active");
    step1.classList.add("active");
  });
  step2.addEventListener("click", (event) => {
    formAvailability.classList.remove("d-none");
    formUser.classList.add("d-none");
    step1.classList.remove("active");
    step2.classList.add("active");
  });
};

export {multipleForm};
