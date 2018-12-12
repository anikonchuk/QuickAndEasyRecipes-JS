$(function() {
  console.log("JS is working");
  addListenerToAllRecipesLink();
  addListenerToUserRecipesLink();
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
