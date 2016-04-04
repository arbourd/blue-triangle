# blue-triangle
[![Circle CI](https://circleci.com/gh/arbourd/blue-triangle.svg?style=svg&circle-token=86af882944dd7337083cd1acd5c014317de5bcc4)](https://circleci.com/gh/arbourd/blue-triangle)

## Database set-up

Copy `database.default.yml` to `database.yml` and edit the YAML for your PostgreSQL configation. Then:
```bash
  $ rake db:create # creates db
  $ rake db:migrate # updates db
  $ rake db:seed # seeds db with test data
```

## Running the server locally

```bash
  $ bundle exec rails s
```
