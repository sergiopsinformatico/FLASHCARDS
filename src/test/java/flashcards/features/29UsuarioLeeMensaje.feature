#Author: Sergio Perez Sanchez

Feature: Un usuario lee un mensaje

Scenario: Un usuario lee un mensaje
Given Un usuario haya listado los mensajes
When Quiere abrir un mensaje
Then Puede leer el mensaje