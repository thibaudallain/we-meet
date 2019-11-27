const multipleForm = () => {
  const step1 = document.querySelector(".step-1");
  const step2 = document.querySelector(".step-2");
  const formUser = document.getElementById("form-user");
  const formAvailability = document.getElementById("form-availability");
  const next = document.querySelector(".next");
  const fas = document.querySelector(".fas");
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

  fas.addEventListener("click", (event) => {
    formAvailability.classList.add("d-none");
    formUser.classList.remove("d-none");
    step1.classList.add("active");
    step2.classList.remove("active");

  });
};




export {multipleForm};
