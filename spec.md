# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
Yes - Ruby on Rails is the framework for Bookshelf.

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
Yes - a book has_many reviews, a genre has_many books, a user has_many reviews.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
Yes - a book belongs_to a genre, a review belongs_to a book and a review belongs_to a user.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
Yes - a book has_many users through reviews, and a user has_many books through reviews.

- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
Yes - the reviews table meets this requirement. We have to know what we’re reviewing and who reviewed it and there has to be some information, in this case, the content of the review itself. There are three components: book_id, user_id, and content.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
Yes - the reviews table meets this requirement. We have to know what we’re reviewing and who reviewed it and there has to be some information, in this case, the content of the review itself. There are three components: book_id, user_id, and content.

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Yes - the book, genre, review and user models all contain validations. Please see each model for the specifics of each validation/validations, but I believe these are sufficient.

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
Yes - in the book model, there are two scope methods:
    scope :order_by_title, -> {order("title")}
    scope :order_by_author, -> {order("author_last")}

And those scope methods can be found in the static > author and static > title view files.

- [x] Include signup (how e.g. Devise)
Yes - in routes.rb, Session Controller and Sessions Helper you'll find routes and methods for signing up.

- [x] Include login (how e.g. Devise)
Yes - in routes.rb, Session Controller and Sessions Helper you'll find routes and methods for logging in.

- [x] Include logout (how e.g. Devise)
Yes - in routes.rb, Session Controller and Sessions Helper you'll find routes and methods for logging out.

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
Yes - in routes.rb, Session Controller and Sessions Helper you'll find routes and methods for signing up and logging in via Google with OmniAuth.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
Yes - in routes.rb, here you'll find the nested resources for books and reviews and the pages they'll route to:

  resources :users do
    resources :books, only: [:index]
    resources :reviews, only: [:new, :create, :show]
  end

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
Yes - in routes.rb, here you'll find the nested resources for books and reviews and the pages they'll route to:

  resources :users do
    resources :books, only: [:index]
    resources :reviews, only: [:new, :create, :show]
  end
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
Yes - I believe so! I'm sure there's always refactoring that could be done, but I'm happy with this for now!

- [x] Limited logic in controllers
Yes - I tried to help keep logic minimal in controllers via helper methods and partials.

- [x] Views use helper methods if appropriate
Yes - SessionsHelpers were important for all login/logout, signup and google signup/signin info - sessions information.

- [x] Views use partials if appropriate
Yes - in particular, partials for error messages and user links (found in views > layouts > shared folders). Also partials for the footer, header and the main form (found in views > layouts folders).