$(function() {
  addListenerToAllRecipesLink();
  addListenerToUserRecipesLink();
  addListenerToNewRecipeLink();
})

class Recipe {
  constructor(attr) {
    this.name = attr.name
    this.time = attr.time
    this.ingredients = attr.ingredients
    this.quantities = attr.quantities
    this.instructions = attr.instructions
  }
}

function addListenerToAllRecipesLink () {
  const allRecipesLink = document.getElementById("all-recipes-link");
  allRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    fetchAllRecipeData();
    })
  });
}

function fetchAllRecipeData() {
  fetch('/recipes.json')
  .then(res => res.json())
  .then(function(resp){
    let htmlResponse = `<h2>All Recipes</h2><table><thead><th>Recipe Name</th><th>Time</th></thead><tbody>`;
    resp.forEach(function(recipe){
      htmlResponse += `<tr><td>${recipe.name}</td><td>${recipe.time}</td></tr>`;
    });
    htmlResponse += `</tbody></table>`
    document.getElementById("landing-content").innerHTML = htmlResponse;
}

function addListenerToUserRecipesLink() {
  const userRecipesLink = document.getElementById("user-recipes-link");
  userRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
  });
}



function addListenerToNewRecipeLink() {
  const newRecipeLink = document.getElementById("new-recipe-link");
  newRecipeLink.addEventListener('click', function(e){
    e.preventDefault();
  });
}
