$(function() {
  console.log("JS is working");
  addListenerToAllRecipesLink();
})

function addListenerToAllRecipesLink () {
  const allRecipesLink = document.getElementById("all-recipes-link");
  allRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    console.log("All Recipes Link is Working");
  });
}
