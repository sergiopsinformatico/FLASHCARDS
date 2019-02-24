$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("01UsuarioCreaCuentaUsuario.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero una cuenta nueva para acceder al sistema",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Registro correcto. Registrar un usuario exitosamente",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;registro-correcto.-registrar-un-usuario-exitosamente",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Introduce los datos correctamente",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se registra correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 1841150593,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_los_datos_correctamente()"
});
formatter.result({
  "duration": 984155601,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.se_registra_correctamente()"
});
formatter.result({
  "duration": 169813414,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Error en el Registro. Existe username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-existe-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Introduce un username existente",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 4907235,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_username_existente()"
});
formatter.result({
  "duration": 642755915,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 40668752,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Error en el Registro. Caracter invalido en el username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-caracter-invalido-en-el-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "El username contiene un caracter invalido",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 3194381,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.el_username_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 28817,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 637513136,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Error en el Registro. Longitud incorrecta del username",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-longitud-incorrecta-del-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "La longitud del username es incorrecta",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 2571848,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_del_username_es_incorrecta()"
});
formatter.result({
  "duration": 29607,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 642054036,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Error en el Registro. Caracter invalido en la clave",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-caracter-invalido-en-la-clave",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "La clave contiene un caracter invalido",
  "keyword": "When "
});
formatter.step({
  "line": 28,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 3207013,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_clave_contiene_un_caracter_invalido()"
});
formatter.result({
  "duration": 40660,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 651796662,
  "status": "passed"
});
formatter.scenario({
  "line": 30,
  "name": "Error en el Registro. Longitud de la clave incorrecta",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-longitud-de-la-clave-incorrecta",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 31,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 32,
  "name": "La longitud de la clave es incorrecta",
  "keyword": "When "
});
formatter.step({
  "line": 33,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 3054242,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.la_longitud_de_la_clave_es_incorrecta()"
});
formatter.result({
  "duration": 28028,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 663249379,
  "status": "passed"
});
formatter.scenario({
  "line": 35,
  "name": "Error en el Registro. Existe email",
  "description": "",
  "id": "como-usuario-quiero-una-cuenta-nueva-para-acceder-al-sistema;error-en-el-registro.-existe-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 36,
  "name": "Una persona quiere registrarse",
  "keyword": "Given "
});
formatter.step({
  "line": 37,
  "name": "Introduce un email existente",
  "keyword": "When "
});
formatter.step({
  "line": 38,
  "name": "No se registra",
  "keyword": "Then "
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.una_persona_quiere_registrarse()"
});
formatter.result({
  "duration": 2818571,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.introduce_un_email_existente()"
});
formatter.result({
  "duration": 670040005,
  "status": "passed"
});
formatter.match({
  "location": "Test01UsuarioCreaCuentaUsuario.no_se_registra()"
});
formatter.result({
  "duration": 38940896,
  "status": "passed"
});
formatter.uri("02UsuarioIniciaSesion.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero acceder al sistema para usar la aplicación",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Login correcto. Login mediante email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-correcto.-login-mediante-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Se loguea con el email",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se loguea correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 2522898,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 682810424,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 36713,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Login correcto. Login mediante username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-correcto.-login-mediante-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Se loguea con el username",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "Se loguea correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3559532,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 636892971,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.se_loguea_correctamente()"
});
formatter.result({
  "duration": 22896,
  "status": "passed"
});
formatter.scenario({
  "line": 15,
  "name": "Login incorrecto. Error en el email",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-el-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 16,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 17,
  "name": "El email es erroneo",
  "keyword": "When "
});
formatter.step({
  "line": 18,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3020688,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_email_es_erroneo()"
});
formatter.result({
  "duration": 696441020,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 37107,
  "status": "passed"
});
formatter.scenario({
  "line": 20,
  "name": "Login incorrecto. Error en el username",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-el-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 21,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 22,
  "name": "El username es erroneo",
  "keyword": "When "
});
formatter.step({
  "line": 23,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3274517,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.el_username_es_erroneo()"
});
formatter.result({
  "duration": 734850967,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 16580,
  "status": "passed"
});
formatter.scenario({
  "line": 25,
  "name": "Login incorrecto. Error en la clave",
  "description": "",
  "id": "como-usuario-quiero-acceder-al-sistema-para-usar-la-aplicación;login-incorrecto.-error-en-la-clave",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 26,
  "name": "Una persona quiere loguearse",
  "keyword": "Given "
});
formatter.step({
  "line": 27,
  "name": "La clave es erronea",
  "keyword": "When "
});
formatter.step({
  "line": 28,
  "name": "No se puede loguear",
  "keyword": "Then "
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.una_persona_quiere_loguearse()"
});
formatter.result({
  "duration": 3612429,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.la_clave_es_erronea()"
});
formatter.result({
  "duration": 734013291,
  "status": "passed"
});
formatter.match({
  "location": "Test02UsuarioIniciaSesion.no_se_puede_loguear()"
});
formatter.result({
  "duration": 23291,
  "status": "passed"
});
formatter.uri("03UsuarioVePerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero ver mi perfil para ver mis datos",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Ver perfil con username",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos;ver-perfil-con-username",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere ver su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Se ha logueado con el username",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Ve el perfil con el username",
  "keyword": "Then "
});
formatter.match({
  "location": "Test03UsuarioVePerfil.una_persona_quiere_ver_su_perfil()"
});
formatter.result({
  "duration": 2981607,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_username()"
});
formatter.result({
  "duration": 663248589,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_username()"
});
formatter.result({
  "duration": 116448458,
  "status": "passed"
});
formatter.scenario({
  "line": 10,
  "name": "Ver perfil con email",
  "description": "",
  "id": "como-usuario-quiero-ver-mi-perfil-para-ver-mis-datos;ver-perfil-con-email",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 11,
  "name": "Una persona quiere ver su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 12,
  "name": "Se ha logueado con el email",
  "keyword": "When "
});
formatter.step({
  "line": 13,
  "name": "Ve el perfil con el email",
  "keyword": "Then "
});
formatter.match({
  "location": "Test03UsuarioVePerfil.una_persona_quiere_ver_su_perfil()"
});
formatter.result({
  "duration": 3990213,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.se_loguea_con_el_email()"
});
formatter.result({
  "duration": 672687646,
  "status": "passed"
});
formatter.match({
  "location": "Test03UsuarioVePerfil.ve_el_perfil_con_el_email()"
});
formatter.result({
  "duration": 117361138,
  "status": "passed"
});
formatter.uri("04UsuarioActualizaPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero cambiar mis datos para actualizarlos",
  "description": "",
  "id": "como-usuario-quiero-cambiar-mis-datos-para-actualizarlos",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Actualizar Perfil",
  "description": "",
  "id": "como-usuario-quiero-cambiar-mis-datos-para-actualizarlos;actualizar-perfil",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere actualizar su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Cambia los datos",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Se actualiza el perfil correctamente",
  "keyword": "Then "
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.una_persona_quiere_actualizar_su_perfil()"
});
formatter.result({
  "duration": 723704976,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.cambia_los_datos()"
});
formatter.result({
  "duration": 47371,
  "status": "passed"
});
formatter.match({
  "location": "Test04UsuarioActualizaPerfil.se_actualiza_el_perfil_correctamente()"
});
formatter.result({
  "duration": 198303489,
  "status": "passed"
});
formatter.uri("05UsuarioEliminaPerfil.feature");
formatter.feature({
  "comments": [
    {
      "line": 1,
      "value": "#Author: Sergio Perez Sanchez"
    }
  ],
  "line": 3,
  "name": "Como usuario quiero eliminar mi perfil para no acceder más",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-más",
  "keyword": "Feature"
});
formatter.scenario({
  "line": 5,
  "name": "Eliminar Perfil",
  "description": "",
  "id": "como-usuario-quiero-eliminar-mi-perfil-para-no-acceder-más;eliminar-perfil",
  "type": "scenario",
  "keyword": "Scenario"
});
formatter.step({
  "line": 6,
  "name": "Una persona quiere eliminar su perfil",
  "keyword": "Given "
});
formatter.step({
  "line": 7,
  "name": "Da a eliminar",
  "keyword": "When "
});
formatter.step({
  "line": 8,
  "name": "Elimina su perfil",
  "keyword": "Then "
});
formatter.match({
  "location": "Test05UsuarioEliminaPerfil.una_persona_quiere_eliminar_su_perfil()"
});
formatter.result({
  "duration": 704236305,
  "status": "passed"
});
formatter.match({
  "location": "Test05UsuarioEliminaPerfil.da_a_eliminar()"
});
formatter.result({
  "duration": 38983530,
  "status": "passed"
});
formatter.match({
  "location": "Test05UsuarioEliminaPerfil.elimina_su_perfil()"
});
formatter.result({
  "duration": 76280654,
  "status": "passed"
});
});