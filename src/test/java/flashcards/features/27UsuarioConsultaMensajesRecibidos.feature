#Author: Sergio Perez Sanchez

Feature: Un usuario consulta mensajes recibidos

Scenario: Un usuario consulta mensajes recibidos
Given Un usuario que esta en los mensajes
When Lista los mensajes recibidos
Then Ve la lista con todos los mensajes recibidos