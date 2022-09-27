<?php include 'header.php'; ?>
<h1 class="text-center">Delete <?php echo $mailing->getAddress(); ?> ?</h1>
<form action="." method="post" class="col-lg-6 mx-auto">
    <hr>
    <div class="form-group">
        <label for="address">Address</label>
        <p name="address"><?php echo $mailing->getAddress(); ?></p>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <p name="city"><?php echo $mailing->getCity(); ?></p>
    </div>
    <div class="form-group">
        <label for="state">State</label>
        <p name="state"><?php echo $mailing->getState(); ?></p>
    </div>
    <div class="form-group">
        <label for="zipcode">Zip Code</label>
        <p name="zipcode"><?php echo $mailing->getZipcode(); ?></p>
    </div>
    <div class="form-group text-center">
        <input type="hidden" name="ID" value="<?php echo $mailing->getId(); ?>">
        <input type="hidden" name="action" value="delete-mailing">
        <input type="submit" class="btn-secondary btn" value="Delete">
        <a href="." class="btn btn-secondary">Cancel</a>
    </div>
</form>
<?php include 'footer.php'; ?>