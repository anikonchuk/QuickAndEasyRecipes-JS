$(function(){
  addListenerToIngredientsLink();
})

class Ingredient{
  constructor(attr) {
    this.name = attr.name
    this.recipes = attr.recipes
  }
}

Ingredient.prototype.createIngredientDisplay = function() {
  let customHTML = `<h2>${this.name}</h2>`;
  customHTML += `<p><em>This ingredient is used in the following recipes:</em></p><ul>`;
  for (let i = 0; i < this.recipes.length; i ++) {
    customHTML += `<li><a href="/recipes/${this.recipes[i].id}" class="recipe-name">${this.recipes[i].name}</a></li>`
  }
  customHTML += `</ul>`;
  return customHTML;
}

function addListenerToIngredientsLink() {
  const ingredientsLink = document.getElementById("ingredients-link");
  ingredientsLink.addEventListener('click', function(e){
    e.preventDefault();
    fetchAllIngredientData();
  });
}

function fetchAllIngredientData() {
  fetch('/ingredients.json')
  .then(res => res.json())
  .then(function(resp){
    let htmlResponse = `<h2>All Ingredients</h2><p>Click on an ingredient to see recipes that use it!</p></ul>`;
    resp.forEach(function(ingredient){
      htmlResponse += `<li><a href="ingredients/${ingredient.id}" class="individual-ingredient-links">${ingredient.name}</a></li>`;
    });
    htmlResponse += `</ul>`
    document.getElementById("landing-content").innerHTML = htmlResponse;
    addListenerToIngredientNameLink();
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
  fetch(url + ".json")
  .then(res => res.json())
  .then(function(resp){
    const myIngredient = new Ingredient(resp);
    document.getElementById("landing-content").innerHTML = myIngredient.createIngredientDisplay();
    addListenerToRecipeName();
    //This function is in recipes.js
  })
}
