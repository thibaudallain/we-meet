const multipleForm = () => {
  const step1 = document.querySelector(".step-1");
  const step2 = document.querySelector(".step-2");
  if (step1 || step2) {
  const formUser = document.querySelector(".form-step1");
  const formAvailability = document.querySelector(".form-step2");
  const next = document.querySelector(".next-btn");
  // step1.addEventListener("", (event) => {
  //   formUser.classList.remove("d-none");
  //   formAvailability.classList.add("d-none");
  //   step2.classList.remove("active");
  //   step1.classList.add("active");
  // });
  // step2.addEventListener("", (event) => {
  //   formAvailability.classList.remove("d-none");
  //   formUser.classList.add("d-none");
  //   step1.classList.remove("active");
  //   step2.classList.add("active");

  // });
  next.addEventListener("click", (event) => {

    // const value1 = document.querySelector("#event_name").value;
    // const value2 = document.querySelector("#event_phone_number").value;
    // const value3 = document.querySelector("#event_address").value;

    // if ()//si les champs sont remplis
    formAvailability.classList.remove("d-none");
    formUser.classList.add("d-none");
    step1.classList.remove("active");
    step2.classList.add("active");
    //sinon
  //   else
  //     (value1 == "") {
  //     alert("Vous devez remplir les 3 champs ci-dessus");
  });

  step1.addEventListener("click", (event) => {
    formAvailability.classList.add("d-none");
    formUser.classList.remove("d-none");
    step1.classList.add("active");
    step2.classList.remove("active");
  });
  step2.addEventListener("click", (event) => {
    formAvailability.classList.remove("d-none");
    formUser.classList.add("d-none");
    step1.classList.remove("active");
    step2.classList.add("active");
  });
  }
};




export {multipleForm};
