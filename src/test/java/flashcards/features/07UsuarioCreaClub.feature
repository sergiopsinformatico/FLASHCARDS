#Author: Sergio Perez Sanchez

Feature: Usuario crea un club

Scenario: Un usuario crea un club
Given Un usuario no encuentra club
When Crea un club
Then Existe el club