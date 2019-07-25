#Author: Sergio Perez Sanchez

Feature: Un usuario consulta mensajes enviados

Scenario: Un usuario consulta mensajes enviados
Given Un usuario que esta viendo los mensajes
When Lista los mensajes enviados
Then Ve la lista con todos los mensajes enviados