<?php include 'header.php'; ?>
<h1 class="text-center">Create</h1>
<form action="." method="post" class="col-lg-6 mx-auto">
    <hr>
    <div class="form-group">
        <label for="address">Address</label>
        <input type="text" class="form-control" name="address" id="address" placeholder="Address" autofocus>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input type="text" class="form-control" name="city" id="city" placeholder="City">
    </div>
    <div class="form-group">
        <label for="state">State</label>
        <input type="text" class="form-control" name="state" id="state" placeholder="State">
    </div>
    <div class="form-group">
        <label for="zipcode">Zip Code</label>
        <input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="Zip Code">
    </div>
    <div class="form-group text-center">
        <input type="hidden" name="action" value="create-mailing">
        <input type="submit" class="btn-secondary btn" value="Create">
        <a href="." class="btn btn-secondary">Cancel</a>
    </div>
</form>
<?php include 'footer.php'; ?>