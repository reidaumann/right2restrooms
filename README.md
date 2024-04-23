# Right2Restrooms

Right2Restrooms is a web application that allows users to find nearby public restrooms, filter for accessbility, and add new reviews and restrooms to our database.

I am currently working on authorizations and adding a rating system.

- Ruby version: `3.2.1`
- Rails version: `7.0.4.3`


### Additional gems:

- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`web_git`](https://github.com/firstdraft/web_git)
- [`webmock`](https://github.com/bblimke/webmock)

### Additional software:
- OS Ubuntu 20.04.5 LTS
- Chromedriver
- Fly.io's `flyctl`
- Google Chrome (headless browser)
- Graphviz
- Heroku 
- Node JS 18
- NPM 8.19.3
- Parity
- Postgresql 12
- Redis
- Yarn

## Contributing
If you want to contribute please open an issue ticket and I will try to respond as quickly as possible! You can also create a branch and submit a pull request to be approved by me and connect this to your issue. Here's [information on cloning the repository] (https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo).

## Domain Model
- User (Devise)
  - id
  - email
  - username
  - encrypted_password
- Bathrooms
  - id
  - address
  - hours
  - accessible
  - gender_neutral
  - family_accessible
  - purchase_required
  - updated_at
  - user_id
- Reviews
  - id
  - user_id
  - bathroom_id
  - body
  - created_at
- Favorites
  - id
  - user_id
  - bathroom_id
 
### Version Information
Ruby version: `3.2.1`
Rails version: `7.0.4.3`
