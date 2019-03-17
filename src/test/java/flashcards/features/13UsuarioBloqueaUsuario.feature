#Author: Sergio Perez Sanchez

Feature: Usuario bloquea usuario

Scenario: Usuario bloquea usuario
Given Usuario quiere bloquear a otro
When Bloquea al usuario
Then No pueden ser amigos