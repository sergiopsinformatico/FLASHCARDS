#Author: Sergio Perez Sanchez

Feature: Usuario envia peticion de amistad

Scenario: Usuario envia peticion de amistad
Given Un usuario conoce a otro
When Envia una peticion de amistad
Then El otro usuario recibe una peticion de amistad