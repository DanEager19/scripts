<?php include 'header.php'; ?>
<h1 class="text-center">Update</h1>
<form action="." method="post" class="col-lg-6 mx-auto">
    <hr>
    <div class="form-group">
        <label>ID</label>
        <input type="text" class="form-control" name="ID" id="ID" value="<?php echo $mailing->getId(); ?>" disabled>
    </div>
    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" class="form-control" name="address" id="address" value="<?php echo $mailing->getAddress(); ?>" autofocus>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input type="text" class="form-control" name="city" id="city" value="<?php echo $mailing->getCity(); ?>" >
    </div>
    <div class="form-group">
        <label for="state">State</label>
        <input type="text" class="form-control" name="state" id="state" value="<?php echo $mailing->getState(); ?>" >
    </div>
    <div class="form-group">
        <label for="zipcode">Zip Code</label>
        <input type="text" class="form-control" name="zipcode" id="zipcode" value="<?php echo $mailing->getZipcode(); ?>" >
    </div>
    <div class="form-group text-center">
        <input type="hidden" name="ID" value="<?php echo $mailing->getId(); ?>">
        <input type="hidden" name="action" value="update-mailing">
        <input type="submit" class="btn-secondary btn" value="Update">
        <a href="." class="btn btn-secondary">Cancel</a>
    </div>
</form>
<?php include 'footer.php'; ?>