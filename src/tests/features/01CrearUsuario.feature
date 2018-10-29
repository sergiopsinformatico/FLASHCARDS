#Author: Sergio Perez Sanchez

Feature: Registrar Usuario

Scenario: Registro correcto. Registrar un usuario exitosamente
Given Una persona quiere registrarse
When Introduce los datos correctamente
Then Se registra correctamente

Scenario: Error en el Registro. Nombre de Usuario Incorrecto
Given Una persona quiere registrarse
When Introduce un nombre de usuario no valido
Then No se registra

Scenario: Error en el Registro. Existe nombre de usuario
Given Una persona quiere registrarse
When Introduce un nombre de usuario existente
Then No se registra

Scenario: Error en el Registro. Existe email
Given Una persona quiere registrarse
When Introduce un email existente
Then No se registra

Scenario: Error en el Registro. La clave contiene espacios
Given Una persona quiere registrarse
When La clave contiene espacios
Then No se registra

Scenario: Error en el Registro. La clave no contiene al menos una letra mayuscula
Given Una persona quiere registrarse
When La clave no contiene una letra mayuscula como minimo
Then No se registra

Scenario: Error en el Registro. La clave no contiene al menos una letra minuscula
Given Una persona quiere registrarse
When La clave no contiene una letra minuscula como minimo
Then No se registra

Scenario: Error en el Registro. La clave no contiene al menos un numero
Given Una persona quiere registrarse
When La clave no contiene un numero como minimo
Then No se registra

Scenario: Error en el Registro. Longitud de clave incorrecta
Given Una persona quiere registrarse
When La longitud de la clave es incorrecta
Then No se registra
