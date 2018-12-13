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

Recipe.prototype.createRecipeDisplay = function() {
  let customHTML = `<h2>${this.name}</h2>`;
  customHTML += `<p><strong>Time Required:</strong> ${this.time} minutes</p><ul>`;
  for (let i = 0; i < this.quantities.length; i ++) {
    customHTML += `<li>${this.quantities[i].amount} <a href="/ingredients/${this.ingredients[i].id}" class="individual-ingredient-links">${this.ingredients[i].name}</a></li>`
  }
  customHTML += `</ul><p>${this.instructions}</p>`;
  return customHTML;
}

function addListenerToAllRecipesLink () {
  const allRecipesLink = document.getElementById("all-recipes-link");
  allRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    fetchAllRecipeData();
  });
}

function fetchAllRecipeData() {
  fetch('/recipes.json')
  .then(res => res.json())
  .then(resp => {
    let htmlResponse = `<h2>All Recipes</h2><table><thead><th>Recipe Name</th><th>Time</th><th>Ingredients</th></thead><tbody>`;
    resp.forEach(recipe => {
      htmlResponse += `<tr><td><a href="/recipes/${recipe.id}" class="recipe-name">${recipe.name}</a></td><td>${recipe.time} minutes</td><td>${recipe.ingredients.length} ingredients</td></tr>`;
    });
    htmlResponse += `</tbody></table>`
    document.getElementById("landing-content").innerHTML = htmlResponse;
    addListenerToRecipeName();
  });
}

function addListenerToRecipeName() {
  const recipeNames = document.getElementsByClassName("recipe-name");
  for(let i = 0; i < recipeNames.length; i++) {
    recipeNames[i].addEventListener('click', function(e){
      e.preventDefault();
      const url = this.attributes.href.textContent;
      fetchIndividualRecipe(url);
    });
  };
}

function fetchIndividualRecipe(url) {
  fetch(url + ".json")
  .then(res => res.json())
  .then(resp => {
    const myRecipe = new Recipe(resp);
    document.getElementById("landing-content").innerHTML = myRecipe.createRecipeDisplay();
    addListenerToIngredientNameLink();
    //This function is in ingredients.js
  })
}

function addListenerToUserRecipesLink() {
  const userRecipesLink = document.getElementById("user-recipes-link");
  userRecipesLink.addEventListener('click', function(e){
    e.preventDefault();
    const url = this.attributes.href.textContent;
    fetchUserRecipeData(url);
  });
}

function fetchUserRecipeData(url) {
  fetch(url + ".json")
  .then(res => res.json())
  .then(resp => {
    let htmlResponse = `<h2>Your Recipes</h2><table><thead><th>Recipe Name</th><th>Time</th><th>Ingredients</th></thead><tbody>`;
    resp.forEach(recipe => {
      htmlResponse += `<tr><td><a href="/recipes/${recipe.id}" class="recipe-name">${recipe.name}</a></td><td>${recipe.time} minutes</td><td>${recipe.ingredients.length} ingredients</td></tr>`;
    });
    htmlResponse += `</tbody></table>`
    document.getElementById("landing-content").innerHTML = htmlResponse;
    addListenerToRecipeName();
  });
}

function addListenerToNewRecipeLink() {
  const newRecipeLink = document.getElementById("new-recipe-link");
  newRecipeLink.addEventListener('click', function(e){
    e.preventDefault();
    const address = this.attributes.href.textContent;
    getFormPartial(address);
  });
}

function getFormPartial(address) {
  $.get(address).done((resp) => {
    $("#landing-content").html(resp);
    addListenerToForm();
  })
}

function addListenerToForm() {
  const form = document.getElementById("new_recipe")
  form.addEventListener('submit', function(e){
    e.preventDefault();
    const data = $(this).serialize();
    const url = this.action;
    postDataFromForm(url, data);
  })
}

function postDataFromForm(url, data) {
  $.ajax({
    type: "POST",
    url: url,
    data: data,
    success: (response) => {
      const myRecipe = new Recipe(response);
      document.getElementById("landing-content").innerHTML = myRecipe.createRecipeDisplay();
      addListenerToIngredientNameLink();
    },
    error: (response) => {
      const customMessage = "<h4>Your recipe must have a name, time, ingredients, and instructions</h4>"
      document.getElementById("landing-content").innerHTML = customMessage;
    }
  })
}
