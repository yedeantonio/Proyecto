// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Empleado {
    struct EmpleadoData {
        string nombre;
        uint edad;
        string puesto;
    }

    mapping(address => EmpleadoData) public empleados;

    function crearEmpleado(string memory _nombre, uint _edad, string memory _puesto) public {
        require(bytes(_nombre).length > 0, "El nombre es requerido");
        require(_edad > 0, "La edad debe ser mayor a cero");
        require(bytes(_puesto).length > 0, "El puesto es requerido");

        empleados[msg.sender] = EmpleadoData(_nombre, _edad, _puesto);
    }

    function obtenerEmpleado() public view returns (string memory, uint, string memory) {
        EmpleadoData memory empleado = empleados[msg.sender];
        return (empleado.nombre, empleado.edad, empleado.puesto);
    }
}
