#Author: Sergio Perez Sanchez

Feature: Un usuario elimina un mensaje

Scenario: Un usuario elimina un mensaje
Given Un usuario haya listado todos sus mensajes
When Quiere eliminar un mensaje
Then El mensaje queda eliminado