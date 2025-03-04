const express = require('express');
const app = express();

const PORT = process.env.PORT || 490;

// Define a route
app.get('/', (req, res) => {
    res.send('Hello, World! Testing server is running on 490.');
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
