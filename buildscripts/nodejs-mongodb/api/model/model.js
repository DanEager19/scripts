const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const BillingSchema = new Schema ({
    cost: {
        type: Number
    },
    cardnumber: {
        type: Number
    },
    expdate: {
        type: String
    },
    code: {
        type: Number
    }
});

module.exports = mongoose.model('Billing', BillingSchema);