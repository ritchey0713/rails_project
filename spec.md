Specifications for the Rails Assessment
Specs:

Using Ruby on Rails for the project [x]

Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) [x] user has many rankings

Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) [x] ranking belongs to user

Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) [x] user has many games through rankings

The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)[x] ranking.new_score

Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)[x] validation for name email password and score

Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) [x] games/pro_level to show rank 

Include signup (how e.g. Devise)[x] user new

Include login (how e.g. Devise) [x] sessions new

Include logout (how e.g. Devise) [x] sessions destroy

Include third party signup/login (how e.g. Devise/OmniAuth)

Include nested resource show or index (URL e.g. users/2/recipes) [x] games nested in user

Include nested resource "new" form (URL e.g. recipes/1/ingredients) [x] form for new game

Include form display of validation errors (form URL e.g. /recipes/new) [x] added a fields with errors condition on forms

Confirm:

The application is pretty DRY [x] created helpers


Limited logic in controllers [x]

Views use helper methods if appropriate [x] current user and logged in

Views use partials if appropriate [x] _form in games views
