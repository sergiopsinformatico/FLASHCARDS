#Author: Sergio Perez Sanchez

Feature: Como usuario quiero una cuenta nueva para acceder al sistema

Scenario: Registro correcto. Registrar un usuario exitosamente
Given Una persona quiere registrarse
When Introduce los datos correctamente
Then Se registra correctamente

Scenario: Error en el Registro. Existe username
Given Una persona quiere registrarse
When Introduce un username existente
Then No se registra

Scenario: Error en el Registro. Caracter invalido en el username
Given Una persona quiere registrarse
When El username contiene un caracter invalido
Then No se registra

Scenario: Error en el Registro. Longitud incorrecta del username
Given Una persona quiere registrarse
When La longitud del username es incorrecta
Then No se registra

Scenario: Error en el Registro. Caracter invalido en la clave
Given Una persona quiere registrarse
When La clave contiene un caracter invalido
Then No se registra

Scenario: Error en el Registro. Longitud de la clave incorrecta
Given Una persona quiere registrarse
When La longitud de la clave es incorrecta
Then No se registra

Scenario: Error en el Registro. Existe email
Given Una persona quiere registrarse
When Introduce un email existente
Then No se registra