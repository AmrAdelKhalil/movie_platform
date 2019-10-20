## Environment Required

* Ruby (2.5.1)
* Rails (5.2.3)
* Postgresql (9.5.19)

## Setup

### WAY 1

Assuming you have the required environment installed, By following the next step you will be able to run the project locally.

* First thing we have to clone the repo, run:
    
       git clone https://github.com/AmrAdelKhalil/movie_platform.git
       
* Open a terminal and move inside the project directory.
* Open the `config/database.yml` file and replace the `username` and `password` attributes with you own.
* After changing the database configurations run the following commands in the specified order.

      rake db:create
      rake db:migrate
      rake db:seed
* If the above steps walk smoothly, Then you will be able to run the server by running:

        rails server
* Open a browser and visit `http://localhost:3000`.

### WAY2
Docker comes to make life easier, So you can run the project using it too.

Environment needed are:

* docker
* docker-compose

You have to configure the `database.yml` to be:

        default: &default
          adapter: postgresql
          encoding: unicode
          host: db
          port: 5432
          username: postgres
          password:
          pool: 5
        
        development:
          <<: *default
          database: movies_platform_development
        
        test:
          <<: *default
          database: movies_platform_test
        
        production:
          <<: *default
          database: movies_platform_production
          username: movies_platform
          password: <%= ENV['MOVIES_PLATFORM_DATABASE_PASSWORD'] %>


####steps
After cloning and getting into the project using the terminal all you have to run is this command:

        docker-compose up --build
        
then you can visit `http://localhost:3000`

## TESTS

To run the test cases, Make sure that you opened a terminal inside the project and then run:

    rspec

##Notices

* An admin account is created by default with the following credentials

        email: admin@admin.admin
        password: 123456
* I kept my facebook app credentials into the project, I know it should be inside a `.env` file but I left them so that it could fasten the testing with the app, Anyway the secret will be changed after a week, So if there is an error because of that be create your own facebook app and put the credentials inside `config/initializers/devise.rb` with
    
        config.omniauth :facebook, APP_ID, APP_SECRET, callback_url: "http://localhost:3000/users/auth/facebook/callback"