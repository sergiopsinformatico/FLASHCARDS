#Author: Sergio Perez Sanchez

Feature: Un usuario envia una petición de amistad

Scenario: Usuario envia peticion de amistad
Given Un usuario conoce a otro
When Envia una petición de amistad
Then Llega al otro usuario