#Author: Sergio Perez Sanchez

Feature: Gestion de Clubes

Scenario: Crear Club
Given Un usuario crea un club
When Este usuario es el administrador
Then El club se crea

Scenario: Insertar Miembro en un Club
Given Un usuario quiere entrar a un club
When El administrador lo inserta
Then Forma parte del club

Scenario: Eliminar Miembro en un Club
Given Un usuario quiere abandonar un club
When Lo elimina del club
Then No forma parte del club

Scenario: Cambiar Administrador en un Club
Given El administrador del club cambia
When Indica el nuevo administrador
Then Ya no es administrador

Scenario: Eliminar un Club
Given Un club se va a eliminar
When El club se borra
Then El club deja de existir