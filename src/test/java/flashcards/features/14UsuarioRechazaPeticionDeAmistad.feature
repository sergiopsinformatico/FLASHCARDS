#Author: Sergio Perez Sanchez

Feature: Usuario rechaza peticion de amistad

Scenario: Usuario rechaza peticion de amistad
Given Un usuario recibe una peticion de amistad
When Rechaza la peticion
Then No son amigos