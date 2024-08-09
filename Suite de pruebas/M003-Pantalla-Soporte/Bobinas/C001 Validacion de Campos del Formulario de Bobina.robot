
*** Settings ***

Documentation       Pruebas individuales que se centren en la validación de datos de cada campo del formulario.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Ingreso a la aplicacion

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s

Ingreso a la pantalla de soporte

     #Click Element At Coordinates    753    2173
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Capture Page Screenshot    ${TEST NAME}.png
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Bobinas']

Validacion de campos requeridos

     Wait until page contains   Describa el incidente  10s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar un asunto  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de asunto

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asunto}
     Click Element              xpath=//android.widget.TextView[@text='Describa el incidente']
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes seleccionar una sucursal  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de sucursal

     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=//android.widget.Button[@content-desc="Sucursal, Seleccione una opción"]
     Sleep                      2s
     Click element              xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]
     Sleep                      2s
     #Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Sleep                      3s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar la dirección  5s  # Validamos 2 veces este mensaje
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de zona de envio

     Wait until page contains   Soporte   10s
     Click element              xpath=(//android.widget.TextView[@resource-id="android:id/text1"])[1]
     Sleep                      3s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Asunción"]
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar la dirección  5s  # Validamos 2 veces este mensaje
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de direccion

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Dirección"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Dirección"]       ${direccion}
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     Sleep                      1s
     Swipe                      39  1244  47  856
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el horario de tu comercio  5s
     Capture Page Screenshot    ${TEST NAME}.png

validacion ingreso de cantidad de bobinas

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Seleccione una opción']
     Sleep                      2s
     Click Element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="2"]
     #Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Asunción"]
     #Click element              xpath=//android.widget.TextView[@text='Dirección']
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el horario de tu comercio  5s
     Capture Page Screenshot    ${TEST NAME}.png

validacion ingreso de horario de atencion

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]     ${horario}
     Click element              xpath=//android.widget.TextView[@text='Dirección']
     Swipe                      39  1244  47  856
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar un teléfono  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de telefono

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de teléfono"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de teléfono"]     ${telefono}
     Click element              xpath=//android.widget.TextView[@text='Cantidad']
     Swipe                      26  1484  43  951
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     #Wait until page contains   Debes indicar el número de serie de tu equipo  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de modelo de POS

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='POS VERIFONE VX680']
     Sleep                      2s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="POS ANDROID"]
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el número de serie de tu equipo  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de numero de serie del POS

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]        ${serie}
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Modelo de tu equipo']
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de archivo adjunto

     Wait until page contains   Adjuntar archivos   10s
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Soporte   10s
     Swipe                      485  1602  288  938
     Wait until page contains   Archivos adjuntos (1)   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application




