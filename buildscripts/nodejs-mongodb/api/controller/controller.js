const mongoose = require('mongoose');
const Billing = mongoose.model('Billing');

exports.listAllBilling = (req, res) => {
    Billing.find({}, (err, billing) => {
        if (err)
            res.send(err);
        res.json(billing);
    });
};

exports.createBilling = (req, res) => {
    let newBilling = new Billing(req.body);
    newBilling.save((err, billing) => {
        if (err)
            res.send(err)
        res.json(billing);
    });
};

exports.listBilling = (req, res) => {
    Billing.findById(req.params.billingId, (err, billing) => {
        if (err)
            res.send(err)
        res.json(billing);
    });
};

exports.updateBilling = (req, res) => {
    Billing.findOneAndUpdate({_id: req.params.gillingId}, req.body,
        {new: true}, (err, billing) => {
        if (err)
            res.send(err)
        res.json(billing);
    });
};

exports.deleteBilling = (req, res) => {
    Billing.remove({_id: req.params.gillingId}, (err, billing) => {
        if (err)
            res.send(err)
        res.json({message: 'Billing Deleted :('});
    });
};