#!/bin/bash
su - root
pkg update && pkg upgrade
pkg install php80 vim php80-xml mod_php80 php80-zip php80-mbstring php80-zlib php80-curl php80-mysqli php80-gd php80-gd apache24

sysrc apache24_enable=yes
service apache24 start
tee /usr/local/www/apache24/data/index.php<<EOF
<h1>See if a host is up!</h1>
<form method="post">
    <label for="host">Host IP:</label>
    <input type="text" name="host" id="host">
    <input type="submit" name="submit" value="ping">
</form>
<pre>
    <?php 
        if (isset($_POST['submit'])) {
            $host = $_POST['host'];
            $output = shell_exec("ping -c 4 $host");
            echo($output);
        }
    ?>
</pre>
EOF