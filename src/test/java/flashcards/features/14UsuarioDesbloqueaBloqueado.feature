#Author: Sergio Perez Sanchez

Feature: Usuario desbloquea usuario

Scenario: Usuario desbloquea usuario
Given Un usuario tiene bloqueado a otro
When Quiere desbloquearlo
Then Desbloquea al usuario