#Author: Sergio Perez Sanchez

Feature: Usuario elimina amigo

Scenario: Usuario elimina amigo
Given Un usuario no quiere tener a un usuario de amigo
When Elimina al amigo
Then Ya no son amigos