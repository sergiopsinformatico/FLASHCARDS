#Author: Sergio Perez Sanchez

Feature: Como usuario quiero acceder al sistema para usar la aplicacion

Scenario: Login correcto. Login mediante email
Given Una persona quiere loguearse
When Se loguea con el email
Then Se loguea correctamente

Scenario: Login correcto. Login mediante username
Given Una persona quiere loguearse
When Se loguea con el username
Then Se loguea correctamente

Scenario: Login incorrecto. Error en el email
Given Una persona quiere loguearse
When El email es erroneo
Then No se puede loguear

Scenario: Login incorrecto. Error en el username
Given Una persona quiere loguearse
When El username es erroneo
Then No se puede loguear

Scenario: Login incorrecto. Error en la clave
Given Una persona quiere loguearse
When La clave es erronea
Then No se puede loguear