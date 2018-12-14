# Specifications for the Rails with JavaScript Front End Assessment

Specs:
- [x] Must have a Rails Backend and new requirements implemented through JavaScript.- I used my Rails project and added the JS features.
- [x] Makes use of ES6 features as much as possible(e.g Arrow functions, Let & Const, Constructor Functions).- I use "let" and "const" throughout, and wherever possible, I used arrow functions.
- [x] Must translate the JSON responses into Javascript Model Objects using either ES6 class or constructor syntax.- I created classes for Recipe and Ingredient, and whenever I returned a JSON response with a recipe or ingredient, I translated it into a Model Object.
- [x] Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend.- The All Recipes, All Ingredients, and User Recipe index pages are all rendered with AJAX.
- [x] Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend.- The individual recipe and ingredient show pages are rendered via JS/AJAX.
- [x] Your Rails application must reveal at least one has-many relationship through JSON that is then rendered to the page.- Recipes have many ingredients through quantities, both of which are represented on the recipe show page. Ingredients have many recipes through quantities, and the ingredient show page represents the ingredient's multiple recipes.
- [x] Must use your Rails application to render a form for creating a resource that is submitted dynamically through JavaScript.- My form partial is rendered via AJAX and is submitted dynamically through AJAX with a JSON response.
- [x] At least one of the JS Model Objects must have a method on the prototype.- Both models have custom HTML generators for individual items and collections.

Read Me file contains:
- [x] Application Description
- [x] Installation guide (e.g. fork and clone repo, migrate db, bundle install, etc)
- [x] Contributors guide (e.g. file an issue, file an issue with a pull request, etc)
- [x] Licensing statement at the bottom (e.g. This project has been licensed under the MIT open source license.)

Repo General:
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
