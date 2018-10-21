# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)- A User has_many Recipes. A Recipe has_many Quantities. An Ingredient has_many Quantities.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User). A Recipe belongs_to a User. A Quantity belongs_to a Recipe. A Quantity belongs_to an Ingredient.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients). A Recipe has_many Ingredients through Quantities. An Ingredient has_many Recipes through Quantities.
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity). The user-submittable attribute is quantity.amount.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)- A User email is validated for presence and uniqueness. A Recipe's name, instructions, and time are validated for presence. A Quantity's amount is validated for presence.
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
