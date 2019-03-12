#Author: Sergio Perez Sanchez

Feature: Usuario envia peticion de amistad

Scenario: Usuario envia peticion de amistad
Given Un usuario encuentra un usuario
When Envia una peticion de amistad
Then Otro usuario recibe esa invitacion