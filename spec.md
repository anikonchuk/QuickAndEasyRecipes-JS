# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)- A User has_many Recipes. A Recipe has_many Quantities. An Ingredient has_many Quantities.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User). A Recipe belongs_to a User. A Quantity belongs_to a Recipe. A Quantity belongs_to an Ingredient.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients). A Recipe has_many Ingredients through Quantities. An Ingredient has_many Recipes through Quantities.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity). The user-submittable attribute is quantity.amount.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)- A User email is validated for presence and uniqueness. A Recipe's name, instructions, and time are validated for presence. A Quantity's amount is validated for presence.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)- Recipes.by_name URL: /recipes/name, Recipes.by_recently_added URL: /recipes/recent, Recipes.by_shortest_time URL: /recipes/shortest, Recipes.by_fewest_ingredients URL: /recipes/fewest_ingredients 
- [x] Include signup (how e.g. Devise)- users/new includes a signup route that creates a user through the create action in the UsersController
- [x] Include login (how e.g. Devise)- The get /login route maps to the new action on the Sessions controller and posts to the create route in the Sessions controller. The user is Authenticated (bcrypt/has_secure_password) and then a session[:user_id] is assigned.
- [x] Include logout (how e.g. Devise)- a link to get /logout is in the navbar on all pages once logged in. This maps to the sessions#destroy action. A link to the get route was chosen over a post route for aesthetic purposes.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)- OmniAuth Github login enabled
- [x] Include nested resource show or index (URL e.g. users/2/recipes)- A User can view his or her own recipes at the nested Index route /users/:user_id/recipes.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)- A new recipe can only be created through a nested New route at /users/:user_id/recipes/new.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)- The users/new form, the recipes/new and recipes/edit forms user form_for and includes a display of validation errors if saving/updating fails.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate- I did not find any appropriate uses for helper methods.
- [x] Views use partials if appropriate- Partials are used for validation errors, flash alerts, the new/edit form for recipes, and the recipe table that is used in the index and scope method views.
