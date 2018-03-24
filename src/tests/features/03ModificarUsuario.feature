#Author: Sergio Perez Sanchez

Feature: Modificar Usuario

Scenario: Modificar datos de un usuario
Given Una persona logueada
When Modifica sus datos
Then Se guardan correctamente