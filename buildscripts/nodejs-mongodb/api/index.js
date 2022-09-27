const express = require('express');
const app = express();
const mongoose = require('mongoose');
const port = 8000;
const uri = 'mongodb://10.2.0.3'
const Billing = require('./model/model');

mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(res => {
    console.log("Connected to the DB.");
}).catch(err => {
    console.log(Error, err.message);
});

app.use(express.json());

app.use(
    express.urlencoded({
        extended:true, 
    })
);

const routes = require('./routes/routes');

routes(app);

app.get('/', (req, res) => {
    res.json({message: 'Please secure this HTTP server.'})
});

app.listen(port, () => {
    console.log(`Listening on port ${port}`)
});