
const initHeartClick = () => {
  const heart = document.querySelector('.like-heart');
  if (heart) {
    const form = document.querySelector('#likes_form')


  heart.addEventListener('click', (event) => {
    console.log('Thank you!');
    console.log(form)
    form.submit();
  });
};
}
export { initHeartClick };
