# README

gem used - Faker   : for generation of sample datas
         - Devise  : user authentication.
         - Pundit  : user authorization
         - Rspec-rails : TDD
         - shoulda-matchers' : authorization testing with pundit
         - pry              : debug
         - database_cleaner : cleaning of data after every it block
         -
model and associations:

user : profile => one to one associations,  profile has user denpendency : Destroy.
user : category => one to many associations
products :category => many to many associatons through table => category_productes model

test: 

Rspec test => user, profile, category, product and category_productes (both model & requests)
policy test = > user, profile and category.