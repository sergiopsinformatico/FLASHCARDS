#Author: Sergio Perez Sanchez

Feature: Usuario recibe peticion de amistad

Scenario: Usuario recibe peticion de amistad
Given Un usuario conectado a la aplicacion
When Consulta las peticiones recibidas
Then Lista las peticiones