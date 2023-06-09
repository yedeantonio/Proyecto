// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ContratoLaboral {
    struct EmpleadoData {
        string nombre;
        uint edad;
        string puesto;
    }

    struct Contrato {
        uint salario;
        uint duracion; // Duración en días
    }

    mapping(address => EmpleadoData) public empleados;
    mapping(address => Contrato) public contratos;

    function crearEmpleado(string memory _nombre, uint _edad, string memory _puesto) public {
        require(bytes(_nombre).length > 0, "El nombre es requerido");
        require(_edad > 0, "La edad debe ser mayor a cero");
        require(bytes(_puesto).length > 0, "El puesto es requerido");

        empleados[msg.sender] = EmpleadoData(_nombre, _edad, _puesto);
    }

    function crearContrato(address empleado, uint _salario, uint _duracion) public {
        require(empleados[empleado].edad > 0, "El empleado no existe");
        require(_salario > 0, "El salario debe ser mayor a cero");
        require(_duracion > 0, "La duracion debe ser mayor a cero");

        contratos[empleado] = Contrato(_salario, _duracion);
    }

    function obtenerContrato(address empleado) public view returns (uint, uint) {
        Contrato memory contrato = contratos[empleado];
        return (contrato.salario, contrato.duracion);
    }
}
