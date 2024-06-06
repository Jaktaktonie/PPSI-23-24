<?php
require_once 'logger.php';
class DB
{
    private $logger;
     private $db;
    public function __construct()
    {
        $this->logger = new MyLogger();
        $this->db = mysqli_connect("localhost", "root", "", "megusta");
    }
    function getConnection()
    {
        return $this->db;
    }
    public function queryDB($query)
    {
        $array=[];
        try {
            $result = mysqli_query($this->db, $this->db->escape_string($query));
            for ($i=0;$i<mysqli_num_rows($result);$i++) {
                $array[] = mysqli_fetch_assoc($result);
            }
            return $array;
        }catch (Exception $e){
            return [""=>""];
        }

    }
    public function queryDB_injection($sql, $params = []) {
        $stmt = $this->db->prepare($sql);
        if ($stmt === false) {
            $this->logger->error("Bład przy przygotowywaniu zapytania.");
        }
        if (!empty($params)) {
            $types = '';
            $values = [];
            foreach ($params as $param) {
                $types .= $this->getParamType($param);
                $values[] = $param;
            }

            // Bind parameters dynamically
            $bind_names = array_merge([$types], $values);
            call_user_func_array([$stmt, 'bind_param'], $bind_names);
        }
        $success = $stmt->execute();
        $result = $stmt->get_result();
        if ($success &&$result === false) {
            return true;
        }else if ($result === false) {
            return false;
        }

        $data = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
        return $data;
    }
    private function getParamType($var) {
        if (is_int($var)) {
            return 'i';
        } elseif (is_float($var)) {
            return 'd';
        } elseif (is_string($var)) {
            return 's';
        } else {
            return 'b';
        }
    }

    function set($query, $params = array()) {
    try {
        $stmt = $this->db->prepare($query);

        if ($stmt === false) {
            throw new Exception("Błąd przy przygotowywaniu zapytania.");
        }

        // Jeśli są parametry, związuj je
        if (!empty($params)) {
            $types = str_repeat('s', count($params)); // Zakładam, że wszystkie parametry to stringi; dostosuj, jeśli potrzebujesz innych typów danych
            $stmt->bind_param($types, ...$params);
        }

        $result = $stmt->execute();

        if ($result === false) {
            throw new Exception("Błąd wykonania zapytania.");
        }

        return $result;
    } catch (Exception $e) {
        // Logowanie błędów lub inna obsługa błędów
        return false;
    }
}

function delete($query,$filename=''){
    try {
        $result = mysqli_query($this->db, $this->db->escape_string($query));
    }catch (Exception $e){
        echo $e;
    }
    if(is_file($filename)){
        unlink($filename);
    }

}

}