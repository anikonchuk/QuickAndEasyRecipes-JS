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
  for(let i = 0; i < ingredientLinks.length; i++) {
    ingredientLinks[i].addEventListener('click', function(e){
      e.preventDefault();
      const url = this.attributes.href.textContent;
      fetchIndividualIngredient(url);
    });
  };
}

function fetchIndividualIngredient(url) {
  console.log("I was clicked")
}
