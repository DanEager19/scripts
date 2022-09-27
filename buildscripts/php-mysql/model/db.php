<?php 
    class DB {
        private static $dsn = "mysql:host=10.0.0.3;dbname=mailing";
        private static $username = 'root';
        private static $password = 'Password1!';
        private static $db;

        public function __construct() {
            try {
                self::$db = new PDO(self::$dsn, self::$username, self::$password);
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
        }

        public function createTable() {
            $sql = '
                CREATE TABLE IF NOT EXISTS mailing (
                    ID  INT AUTO_INCREMENT  PRIMARY KEY,
                    address VARCHAR (255)   DEFAULT NULL,
                    city    VARCHAR (255)   DEFAULT NULL,
                    state   VARCHAR (255)   DEFAULT NULL,
                    zipcode INT DEFAULT NULL
                );';
            $statement = self::$db->prepare($sql);
            $statement->execute();
            $statement->closeCursor();
        }

        public function readAll() {
                $sql = 'SELECT * FROM mailing ORDER BY ID';
                $statement = self::$db->prepare($sql);
                $statement->execute();
                $rows = $statement->fetchAll();
                foreach($rows as $row) {
                    $mailing = new Mailing($row['address'], $row['city'], $row['state'], $row['zipcode']);
                    $mailing->setId($row['ID']);
                    $mailings[] = $mailing;
                }
                $statement->closeCursor();
                return $mailings;
        }

        public function read($id) {
                $sql = 'SELECT * FROM mailing WHERE ID = :id';
                $statement = self::$db->prepare($sql);
                $statement->bindValue(':id', $id, PDO::PARAM_INT);
                $statement->execute();
                $row = $statement->fetch();
                $mailing = new Mailing($row['address'], $row['city'], $row['state'], $row['zipcode']);
                $mailing->setId($row['ID']);
                $statement->closeCursor();
                return $mailing;

        }

        public function create(Mailing $mailing) {
            $sql = 'INSERT INTO mailing (
                address, 
                city,
                state,
                zipcode
            ) VALUES (
                :address,
                :city,
                :state,
                :zipcode
            );';

            $statement = self::$db->prepare($sql);
            $statement->bindValue(':address', $mailing->getAddress());
            $statement->bindValue(':city', $mailing->getCity());
            $statement->bindValue(':state', $mailing->getState());
            $statement->bindValue(':zipcode', $mailing->getZipcode());
            $statement->execute();
            $statement->closeCursor();
        }

        public function update(Mailing $mailing) {
            $sql = 'UPDATE mailing
                SET address = :address,
                    city = :city,
                    state = :state,
                    zipcode = :zipcode
                WHERE ID = :id';
            
            $statement = self::$db->prepare($sql);
            $statement->bindValue(':id', $mailing->getId(), PDO::PARAM_INT);
            $statement->bindValue(':address', $mailing->getAddress());
            $statement->bindValue(':city', $mailing->getCity());
            $statement->bindValue(':state', $mailing->getState());
            $statement->bindValue(':zipcode', $mailing->getZipcode());
            $statement->execute();
            $statement->closeCursor();
        }

        public function delete($id) {
            $sql = 'DELETE FROM mailing WHERE ID = :id';
            $statement = self::$db->prepare($sql);
            $statement->bindValue(':id', $id, PDO::PARAM_INT);
            $statement->execute();
            $statement->closeCursor();
        }
    }