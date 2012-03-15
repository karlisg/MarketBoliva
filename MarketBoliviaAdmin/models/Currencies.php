<?php
require_once("BaseObject.php");
class Currency extends BaseObject
{
    private $isocode;
    private $country;
    private $name;
    private $symbol;
    private $decimalMark;
    private $thousandsSeparator;

    public function __construct()
    {
    }

    public function toArray()
    {
        return array("isocode" => $this->isocode, "country" => $this->country, "name" => $this->name, "symbol" => $this->symbol, "decimalMark" => $this->decimalMark, "thousandsSeparator" => $this->thousandsSeparator);
    }

    public function validate()
    {
        return true;
    }

    public function setIsoCode($isocode)
    {
        $this->isocode = $isocode;
    }

    public function getIsoCode()
    {
        return $this->isocode;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setCountry($country)
    {
        $this->country = $country;
    }

    public function getCountry()
    {
        return $this->country;
    }

    public function setSymbol($symbol)
    {
        $this->symbol = $symbol;
    }

    public function getSymbol()
    {
        return $this->symbol;
    }

    public function setDecimalMark($decimalMark)
    {
        $this->decimalMark = $decimalMark;
    }

    public function getDecimalMark()
    {
        return $this->decimalMark;
    }

    public function setThousandsSeparator($thousandsSeparator)
    {
        $this->thousandsSeparator = $thousandsSeparator;
    }

    public function getThousandsSeparator()
    {
        return $this->thousandsSeparator;
    }

}

?>