const swiper = new Swiper('.swiper-container', {
  // Optional parameters
  direction: 'vertical',
  loop: true,
  speed: 1500,
  autoplay: {
    delay: 3000,
  },
  direction: "horizontal",
  effect: "coverflow",
  
  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
    type: "bullets",
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },
});