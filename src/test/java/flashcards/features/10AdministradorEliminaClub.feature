#Author: Sergio Perez Sanchez

Feature: Administrador elimina club

Scenario: El administrador elimina el club
Given Un administrador quiere eliminar el club
When Elimina el club
Then El club ya no existe