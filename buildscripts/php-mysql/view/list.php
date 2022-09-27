
<?php include 'header.php'; ?>
    <div id="container">
        <h1>Mailing List</h1>
        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Zip Code</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($mailings as $mailing): ?>
                    <tr>
                        <td><?php echo $mailing->getId(); ?></td>
                        <td><?php echo $mailing->getAddress(); ?></td>
                        <td><?php echo $mailing->getCity(); ?></td>
                        <td><?php echo $mailing->getState(); ?></td>
                        <td><?php echo $mailing->getZipcode(); ?></td>
                        <td>
                            <form action="." method="POST">
                                <input type="hidden" name="action" value="show-update-mailing">
                                <input type="hidden" name="ID" value="<?php echo $mailing->getId(); ?>">
                                <input type="submit" value="Update" class="btn btn-secondary">
                            </form>
                        </td>
                        <td>
                            <form action="." method="POST">
                                <input type="hidden" name="action" value="show-delete-mailing">
                                <input type="hidden" name="ID" value="<?php echo $mailing->getId(); ?>">
                                <input type="submit" value="Delete" class="btn btn-secondary">
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <div class="form-group text-center">
            <form action="." method="post" class="btn-group">
                <input type="hidden" name="action" value="show-create-mailing">
                <input type="submit" class="btn btn-secondary" value="Create">
            </form>
        </div>
    </div>
<?php include 'footer.php'; ?>