

// function scroll() {
//   console.log("scroll")
//   const reservation = document.querySelector('.reserver');

//   if (reservation) {
//     window.addEventListener('click', function() {
//      $("body").animate({ scrollTop: $(window).height()}, 300);
//     });
//   }
// // }

const scroll = () => {
  console.log("scroll")
  const reservation = document.querySelector('.reserver');

  if (reservation) {
    reservation.addEventListener('click', function() {
      console.log("click");
      $('html, body').animate({scrollTop: $(window).height()}, 500);
    });
  }
}


export default scroll;
