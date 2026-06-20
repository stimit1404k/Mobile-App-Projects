# Tic-Tac-Toe Server

This is the server for the Tic-Tac-Toe game.

## Prerequisites

- Node.js
- npm

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/PookieeStimit/Tic-Tac-Toe-App.git
   ```
2. Navigate to the server directory:
   ```bash
   cd server
   ```
3. Install the dependencies:
   ```bash
   npm install
   ```

## Running the Server

To start the server in development mode, run:

```bash
npm run dev
```

This will start the server with `nodemon`, which will automatically restart the server when you make changes to the code.

### Environment Variables

The server uses the following environment variable:

- `DB_CONNECTION_STRING`: The connection string for your MongoDB database.

It is recommended to create a `.env` file in the `server` directory and add your environment variables there. For example:

```
DB_CONNECTION_STRING=your_mongodb_connection_string
```

You can then use a package like `dotenv` to load the environment variables from the `.env` file.
