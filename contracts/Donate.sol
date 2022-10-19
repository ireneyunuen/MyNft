// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// @author Irene based in S.C. RafaBlockDev BuyMeACoffee
// @title Donate

//importar openzeppelin

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Donate is ERC20{

    //Variables
    //propietario
    address payable owner;


    //Events -Llamado al ejecutar
    event NewInfo(address indexed from, uint256 timestamp, string nombre,string mensaje );

    //Structs

    struct Info {
        address from;
        uint256 timestamp;
        string nombre;
        string mensaje;
    }

    //Array

    Info[] info;

    //Constructor
    constructor () ERC20("Donate", "Dnt") {
        owner = payable(msg.sender);
    }

    //Functions

    function Deposit(string memory _nombre, string memory _mensaje) public payable {
        //que el valor sea mayor a 0, sino mostrar un mensaje "No puedes enviar 0 ether"
        require(msg.value > 0, "No podemos recibir 0 agrega una cantidad mayor " );

        // Datos y parametros que  se guardan en el array
        info.push(Info(msg.sender, block.timestamp, _nombre, _mensaje));

        emit NewInfo(msg.sender,block.timestamp,_nombre,_mensaje);

    }
    //Obtener información de la función "Deposit"Donate.sol

    function getInfo() public view returns(Info[] memory){
        return info;
    }
    //function para retirar ether
    function withrawEther() public {
        require(owner.send(address(this).balance));
    }
    
}

