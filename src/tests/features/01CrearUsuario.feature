#Author: Sergio Perez Sanchez

Feature: Crear Usuario

Scenario: Registrar un usuario exitosamente
Given Una persona quiere registrarse
When Introduce los datos
Then Se registra correctamente

Scenario: Existe email
Given Una persona desea registrarse
When Introduce un email existente
Then No puede registrarse
    
Scenario: Existe nombre de usuario
Given Una persona va a registrarse
When Introduce un nombre de usuario existente
Then La cuenta no se crea
    
Scenario: La password no cumple con los requisitos
Given Un usuario quiere registrarse
When La clave no cumple los requisitos
Then No se crea la cuenta