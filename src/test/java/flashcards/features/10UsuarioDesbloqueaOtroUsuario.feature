#Author: Sergio Perez Sanchez

Feature: Un usuario desbloquea a otro usuario

Scenario: Usuario desbloquea a otro usuario
Given Un usuario quiere desbloquear a otro
When Localiza a ese usuario
Then Le Desbloquea