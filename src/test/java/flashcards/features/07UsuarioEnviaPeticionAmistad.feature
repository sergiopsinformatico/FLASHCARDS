#Author: Sergio Perez Sanchez

Feature: Un usuario envia una petici�n de amistad

Scenario: Usuario envia peticion de amistad
Given Un usuario conoce a otro
When Envia una petici�n de amistad
Then Llega al otro usuario