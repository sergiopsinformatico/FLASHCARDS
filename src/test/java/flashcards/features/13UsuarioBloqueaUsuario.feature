#Author: Sergio Perez Sanchez

Feature: Usuario bloquea usuario

Scenario: Usuario bloquea usuario
Given Usuario quiere bloquear a otro
When Encuentra a ese usuario
Then Bloquea al usuario