const initUpdateLikesOnClick = () => {
  const heart = document.querySelector(".like-heart");
  heart.addEventListener("click", () => {
  console.log("you liked")});
}

export { initUpdateLikesOnClick };
