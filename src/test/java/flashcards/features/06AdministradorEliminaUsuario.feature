#Author: Sergio Perez Sanchez

Feature: Como administrador, quiero eliminar un usuario del sistema

Scenario: Administrador Elimina a un Usuario
Given Un administrador quiere eliminar a un usuario
When Busca al usuario
Then Elimina el perfil del usuario