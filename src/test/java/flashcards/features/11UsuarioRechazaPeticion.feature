#Author: Sergio Perez Sanchez

Feature: Usuario rechaza peticion de amistad

Scenario: Usuario rechaza peticion de amistad
Given Un usuario recibe peticiones de amistad
When No quiere conectar
Then Rechaza la peticion