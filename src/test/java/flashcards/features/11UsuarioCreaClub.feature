#Author: Sergio Perez Sanchez

Feature: Un usuario quiere crear un club

Scenario: Usuario crea un club
Given Un usuario quiere crear un club
When Inserta nombre y descripcion
Then Crea el club y es el administrador de este