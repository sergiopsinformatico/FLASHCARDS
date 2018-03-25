#Author: Sergio Perez Sanchez

Feature: Administrador

Scenario: Administrador Cambia Rol
Given El administrador logueado
When Cambia de rol a un usuario
Then Obtiene ese usuario un nuevo rol

Scenario: Administrador Elimina a un Usuario
Given El administrador conectado
When Elimina a un usuario
Then El usuario se elimina