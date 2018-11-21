
const scroll = () => {
  console.log("scroll")
  const reservation = document.querySelector('.reserver');
  const element = document.querySelector('#container-restaurant-cards')
  if (reservation) {
    reservation.addEventListener('click', function(e) {
      e.preventDefault();
      console.log("click");
      const topPosition = element.offsetTop - document.querySelector('.navbar-wagon').offsetHeight
      window.scroll({top: topPosition, behavior: "smooth"})
    });
  }
}


export default scroll;





