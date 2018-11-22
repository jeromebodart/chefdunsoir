function reviewButton() {

  document.addEventListener("DOMContentLoaded", () => {
    const available = document.querySelector('#review_button');
    const review_form = document.querySelector('#review_section');

    console.log("je suis dans init");

    if (available && review_form) {
      available.addEventListener("click", (event) => {
        console.log("je toggle");
        review_form.classList.toggle("hidden");
        // const topPosition = element.offsetTop - document.querySelector('.navbar-wagon').offsetHeight
        // window.scroll({top: topPosition, behavior: "smooth"})
      });
    }
  });
}

export default reviewButton;
