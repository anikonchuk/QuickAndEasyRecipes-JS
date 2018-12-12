$(function() {
  console.log("JS is working");
  addListenerToAllRecipesLink();
  addListenerToUserRecipesLink();
  addListenerToIngredientsLink();
})

function addListenerToAllRecipesLink () {
  const allRecipesLink = document.getElementById("all-recipes-link");
  allRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    console.log("All Recipes Link is Working");
  });
}

function addListenerToUserRecipesLink() {
  const userRecipesLink = document.getElementById("user-recipes-link");
  userRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    console.log("User Recipes Link is working");
  });
}

//Move this to ingredients js file?
function addListenerToIngredientsLink() {
  const ingredientsLink = document.getElementById("ingredients-link");
  ingredientsLink.addEventListener('click', function(e){
    e.preventDefault();
    console.log("ingredients link is working");
  })
}
