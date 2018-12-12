$(function(){
  addListenerToIngredientsLink();
})


function addListenerToIngredientsLink() {
  const ingredientsLink = document.getElementById("ingredients-link");
  ingredientsLink.addEventListener('click', function(e){
    e.preventDefault();
  });
}

function addListenerToIngredientNameLink() {
  const ingredientLinks = document.getElementsByClassName("individual-ingredient-links");
}
