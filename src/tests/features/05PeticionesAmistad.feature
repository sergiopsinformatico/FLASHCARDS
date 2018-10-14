#Author: Sergio Perez Sanchez

Feature: Peticiones de Amistad

Scenario: Crear una Peticion de Amistad
Given Un usuario quiere tener amigos
When Localiza a otro usuario
Then Envia una peticion de amistad

Scenario: Aceptar Petición de Amistad
Given Un usuario recibe una peticion de amistad
When Conoce al usuario
Then Acepta la peticion de amistad

Scenario: Rechazar Petición de Amistad
Given Un usuario ha recibido una peticion de amistad
When No conoce al usuario
Then Rechaza la peticion de amistad

Scenario: Bloquear a un usuario
Given Un usuario ve un usuario
When Quiere bloquearle
Then No aparece