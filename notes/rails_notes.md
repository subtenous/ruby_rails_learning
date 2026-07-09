# Rails Notes

## What is Rails?

Rails is a Ruby framework. It uses MVC: Model, View, Controller.

## MVC

Model = data and database logic  
View = what the user sees  
Controller = handles requests and decides what to return

## Request flow

Browser request  
→ route in config/routes.rb  
→ controller action  
→ view  
→ response

## Important folders

app/controllers = controller files  
app/models = model/database classes  
app/views = HTML/ERB templates  
config/routes.rb = URL routing  
db/migrate = database migrations  
Gemfile = dependencies

## HTTP

HTTP is the request-response system used betwee