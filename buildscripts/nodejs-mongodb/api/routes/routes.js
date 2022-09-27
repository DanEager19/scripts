module.exports = (app) => {
    const billing = require('../controller/controller');

    app.route('/billing')
        .get(billing.listAllBilling)
        .post(billing.createBilling);

    app.route('/billing/:billingId')
        .get(billing.listBilling)
        .put(billing.updateBilling)
        .delete(billing.deleteBilling);
};