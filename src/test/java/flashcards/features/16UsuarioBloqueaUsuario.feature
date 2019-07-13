#Author: Sergio Perez Sanchez

Feature: Usuario bloquea a otro usuario

Scenario: Usuario bloquea a otro usuario
Given Un usuario no quiere que otro usuario sea su amigo
When Bloquea
Then El usuario bloqueado no ve su perfil