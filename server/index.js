import * as dotenv from "dotenv"
dotenv.config()
import express from "express"
import { graphqlHTTP } from "express-graphql"
import cors from "cors"
import schema from "./schema.js"

const users = [
  { id: 1, username: "admin", age: 25 },
  { id: 2, username: "vanov", age: 28 },
]

const createUser = (input) => {
  const id = Date.now()
  return {
    id,
    ...input,
  }
}

const PORT = process.env.PORT || 5001
const app = express()

app.use(express.static("media"))
app.use(express.json({ limit: "300mb" }))
app.use(express.urlencoded({ extended: false }))
app.use(cors())

const root = {
  getAllUsers: () => {
    return users
  },
  getUser: ({ id }) => {
    return users.find((user) => user.id == id)
  },
  createUser: ({ input }) => {
    const user = createUser(input)
    users.push(user)
    return user
  },
}

app.use(
  "/graphql",
  graphqlHTTP({
    graphiql: true,
    schema,
    rootValue: root,
  })
)

const start = async () => {
  try {
    app.listen(PORT, () => {
      console.log(`Server is listening on port ${PORT}`)
    })
  } catch (error) {
    console.log(error)
  }
}

start()
