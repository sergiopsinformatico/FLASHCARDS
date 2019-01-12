#Author: Sergio Perez Sanchez

Feature: Un administrador del club deja de ser administrador

Scenario: Administrador club deja de ser administrador
Given El administrador del club va a dejar de ser el administrador
When Cambia de Administrador
Then Forma parte del club sin ser administrador