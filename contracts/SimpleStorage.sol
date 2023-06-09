//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract SimpleStorage {
    struct EmpleadoData {
        string nombre;
        uint edad;
        string puesto;
        bool existe;
    }
    address public client;
    constructor(){
        client =msg.sender;
    }
    struct Contrato {
        uint salario;
        uint duracion; 
    }

    mapping(address => EmpleadoData) public empleados;
    mapping(address => Contrato) public contratos;

    function crearEmpleado(string memory _nombre, uint _edad, string memory _puesto) public {
        require(bytes(_nombre).length > 0, "El nombre es requerido");
        require(_edad > 0, "La edad debe ser mayor a cero");
        require(bytes(_puesto).length > 0, "El puesto es requerido");

        empleados[msg.sender] = EmpleadoData(_nombre, _edad, _puesto, true);
    }

    function crearContrato(address empleado, uint _salario, uint _duracion) public {
        require(empleados[empleado].existe, "El empleado no existe");
        require(_salario > 0, "El salario debe ser mayor a cero");
        require(_duracion > 0, "La duracion debe ser mayor a cero");

        contratos[empleado] = Contrato(_salario, _duracion);
    }

    function obtenerEmpleado(address empleado) public view returns (string memory, uint, string memory) {
        require(empleados[empleado].existe, "El empleado no existe");
        EmpleadoData memory empleadoData = empleados[empleado];
        return (empleadoData.nombre, empleadoData.edad, empleadoData.puesto);
    }

    function obtenerContrato(address empleado) public view returns (uint, uint) {
        require(empleados[empleado].existe, "El empleado no existe");
        Contrato memory contrato = contratos[empleado];
        return (contrato.salario, contrato.duracion);
    }
}