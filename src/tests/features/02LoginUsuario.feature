#Author: Sergio Perez Sanchez

Feature: Login Usuario

Scenario: Login de un usuario con usuario
Given Una persona quiere loguearse con su usuario
When Escribe sus credenciales con el usuario
Then Entra al sistema con el usuario

Scenario: Login de un usuario con email
Given Una persona quiere loguearse con su email
When Escribe sus credenciales con el email
Then Entra al sistema con el email

Scenario: Error en el login con el usuario o email
Given Una persona va a loguearse
When Introduce sus credenciales
Then El email o usuario no existe
    
Scenario: Error en el login con la clave del usuario
Given Una persona va a entrar al sistema
When Escribe las credenciales
Then La clave no coincide