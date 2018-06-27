# Quantified Self Back-end Rails

## Initial Setup

1. Clone this repository and rename the repository to `quantified-self-rails` in one command

  ```shell
  git clone git@github.com:lilwillifo/quantified-self-be-rails.git
  ```
2. Change into the `quantified-self-rails` directory

3. Install the dependencies

  ```shell
  bundle
  ```

3. Set up the database

  ```shell
  rake db:create
  rake db:migrate
  rake db:seed
  ```

4. Run test suite

  ```shell
    rspec
  ```

## Running the Server Locally

To see your code in action locally, you need to fire up a development server. Use the command:

```shell
rails s
```

Once the server is running, visit API endpoints in your browser:

* `http://localhost:3000/` to run your application. Enpoints are available in the * [Project Spec](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module4/projects/quantified-self/quantified-self.md)

## Deployed
* Back end is deployed here: http://quantified-self-be-rails2-dev.us-west-2.elasticbeanstalk.com/api/v1/foods

* To see the [front end](https://github.com/lilwillifo/quantified-self-fe) deployed with this app, visit http://gifted-print.surge.sh/

## Built With

* [JavaScript](https://www.javascript.com/)
* [jQuery](https://jquery.com/)
* [Express](https://expressjs.com/)
* [Mocha](https://mochajs.org/)
* [Chai](https://chaijs.com/)
