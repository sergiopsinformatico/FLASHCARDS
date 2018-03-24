#Author: Sergio Perez Sanchez

Feature: Login Usuario

Scenario: Login de un usuario exitosamente
Given Una persona quiere loguearse
When Escribe sus credenciales
Then Entra al sistema

Scenario: Error en el login con el usuario o email
Given Una persona va a loguearse
When Introduce sus credenciales
Then El email o usuario no existe
    
Scenario: Error en el login con la clave del usuario
Given Una persona va a entrar al sistema
When Escribe las credenciales
Then La clave no coincide