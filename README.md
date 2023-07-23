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

```gql
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

```gql
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

**Create Book**:

```gql
mutation {
  createBook(name: "Book Name", position: 4) {
    id
    name
    position
  }
}
```

**Create Book (Nested)**:

```gql
mutation {
  createBook(name: "Números", position: 4, verses: [{chapter: 1, number: 1, body: "No segundo ano..."}, {chapter: 1, number: 2, body: "Levantai o censo..."}]) {
    id
    name
    position
    verses {
      body
      chapter
      id
      number
    }
  }
}
```

**Signup**:

```gql
mutation {
  signup(email: "wbotelhos@gmail.com", password: "password") {
    token
    user {
      email
    }
  }
}
```

**Signin**:

```gql
mutation {
  signin(email: "wbotelhos@gmail.com", password: "password") {
    token
    user {
      email
    }
  }
}
```
