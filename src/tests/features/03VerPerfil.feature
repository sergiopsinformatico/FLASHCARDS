#Author: Sergio Perez Sanchez

Feature: Ver Perfil de Usuario

Scenario: Ver Perfil de Usuario con Nombre de Usuario
Given Un usuario logueado con su nombre de usuario
When Va al perfil
Then Ve sus datos

Scenario: Ver Perfil de Usuario con Email
Given Un usuario logueado con su email
When Se dirige al perfil
Then Ve sus datos en el perfil