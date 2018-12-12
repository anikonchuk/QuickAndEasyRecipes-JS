$(function(){
  addListenerToIngredientsLink();
})


function addListenerToIngredientsLink() {
  const ingredientsLink = document.getElementById("ingredients-link");
  ingredientsLink.addEventListener('click', function(e){
    e.preventDefault();
    console.log("ingredients link is working");
  });
}
