<?php
class Mailing {
    private $id, $Address, $City, $State, $Zipcode;

    public function __construct($Address, $City, $State, $Zipcode)
    {
        $this->Address = $Address;
        $this->City = $City;
        $this->State = $State;
        $this->Zipcode = $Zipcode;
    }
    public function getId() {
        return $this->id;
    }
    public function setId($id) {
        $this->id = $id;
    }
    public function getAddress() {
        return $this->Address;
    }
    public function setAddress($Address) {
        $this->Address = $Address;
    }
    public function getCity() {
        return $this->City;
    }
    public function setCity($City) {
        $this->City = $City;
    }
    public function getState() {
        return $this->State;
    }
    public function setState($State) {
        $this->State = $State;
    }
    public function getZipcode() {
        return $this->Zipcode;
    }
    public function setZipcode($Zipcode) {
        $this->Zipcode = $Zipcode;
    }
}