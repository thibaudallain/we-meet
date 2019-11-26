const multipleForm = () => {
  const step1 = document.querySelector(".step-1");
  const step2 = document.querySelector(".step-2");
  const formUser = document.getElementById("form-user");
  const formAvailability = document.getElementById("form-availability");
  const next = document.querySelector(".next");
  const fas = document.querySelector(".fas");
  step1.addEventListener("", (event) => {
    formUser.classList.remove("d-none");
    formAvailability.classList.add("d-none");
    step2.classList.remove("active");
    step1.classList.add("active");
  });
  step2.addEventListener("", (event) => {
    formAvailability.classList.remove("d-none");
    formUser.classList.add("d-none");
    step1.classList.remove("active");
    step2.classList.add("active");

  });
next.addEventListener("click", (event) => {
    formAvailability.classList.remove("d-none");
    formUser.classList.add("d-none");
    step1.classList.remove("active");
    step2.classList.add("active");
  });

fas.addEventListener("click", (event) => {
    formAvailability.classList.add("d-none");
    formUser.classList.remove("d-none");

  });
};



export {multipleForm};
