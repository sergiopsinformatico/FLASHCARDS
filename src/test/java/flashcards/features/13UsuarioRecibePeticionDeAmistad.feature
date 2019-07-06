#Author: Sergio Perez Sanchez

Feature: Usuario recibe peticion de amistad

Scenario: Usuario recibe peticion de amistad
Given Un usuario del sistema
When Otro usuario le haya enviado una peticion de amistad
Then Este usuario la recibe