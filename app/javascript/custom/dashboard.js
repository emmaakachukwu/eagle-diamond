document.addEventListener("DOMContentLoaded", () => {
  const app = document.querySelector(".app");

  const toggleBtn = document.querySelectorAll(".new-mail__toggle");
  toggleBtn.forEach((element) => {
    element.addEventListener("click", () => {
      document.querySelector(".new-mail").classList.toggle("active");
      document.querySelector(".new__button").classList.toggle("active");
    });
  });

  function toggleClassToApp(trigger, className, cancellable) {
    let bonus = document.querySelector(trigger);
    bonus.addEventListener("click", () => {
      app.classList.toggle(className);
      if (cancellable) byeCancelButton();
    });
  }

  toggleClassToApp(".bonus-dark-mode", "dark-mode", false);
});
