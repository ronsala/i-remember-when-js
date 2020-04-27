# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project

  _Gemfile.lock_:

  rails (5.2.3)

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)

  _user.rb_:

  has_many :memories

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

  _memory.rb_:

  belongs_to :user

  belongs_to :event

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

  _user.rb_:

  has_many :events, through: :memories

  _event.rb_:

  has_many :users, through: :memories

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

  _user.rb_:

    has_many :events, through: :memories

  _event.rb_:

  has_many :users, through: :memories

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

  _views/memories/new.html.erb_:

  Text fields setting :title, :body

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

  _User_:

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  _Event_:

  validates :date, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :country, presence: true

  _Memory_:

  validates :title, presence: true
  validates :body, presence: true

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise)

  Devise

- [x] Include login (how e.g. Devise)

  Devise

- [x] Include logout (how e.g. Devise)

  Devise

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

  Devise/OmniAuth/Google

- [x] Include nested resource show or index (URL e.g. users/2/recipes)

  users/:id/memories

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

  /events/new
  /events/:id/edit
  /events/:id/memories/new
  /events/:id/memories/:id/edit

Confirm:

- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate

  #format_date

- [X] Views use partials if appropriate

  views/events/_form
