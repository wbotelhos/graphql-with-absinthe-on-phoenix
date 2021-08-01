# GraphQL with Absinthe on Phoenix

A guide teaching how to use Query, Dataloader, Mutation, Subscription and Authentication with GraphQL using Absinthe on Phoenix.

Read the article at:

- [GraphQL with Absinthe on Phoenix - Query and Dataloader](https://www.wbotelhos.com/graphql-with-absinthe-on-phoenix-query-and-dataloader);
- [GraphQL with Absinthe on Phoenix - Mutation](https://www.wbotelhos.com/graphql-with-absinthe-on-phoenix-mutation);

## Setup

```sh
# clone the project
git clone git@github.com:wbotelhos/graphql-with-absinthe-on-phoenix.git

# access the project
cd graphql-with-absinthe-on-phoenix

# installs the dependencies
mix deps.get

# creates the database
mix ecto.setup

# run the server
mix phx.server

# open the browser
open localhost:4000
```

## GraphQL Queries

**Books**:

```json
{
  books(limit: 2) {
    id
    name
    position
    verses(limit: 2) {
      id
      chapter
      number
      body
    }
  }
}
```

**Book**:

```json
{
  book(id: 1) {
    id
    name
    position
    verses(limit: 2) {
      id
      chapter
      number
      body
    }
  }
}
```
