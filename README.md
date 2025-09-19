# 📌 Grupo 4
## 📌 TAREA 01: Despliegue MySQL 9.0 + phpMyAdmin 5.2.1 en Docker 


---

## 🚀 Integrantes
| Nro. | Nombre | Link |
|------|---------|---------|
| 1 | Giovanni Xavier Baño Jaya | https://github.com/Giovanni26101982/Grupo4_Docker_Tarea1#:~:text=Settings-,Grupo4_Docker_Tarea1,-Public |
| 2 | Portero Salas Onofre Lolislao | https://github.com/oportero/Grupo4_Docker_Tarea1 |
| 3 | Jara Pauta Cesar Paúl |   |
| 4 | Maldonado Flores Oscar Alexander |  |
| 5 | Balarezo Leon Ricardo Martin |  |

---

## 📖 Introducción

El despliegue de servicios en contenedores permite crear entornos ligeros, portables y fáciles de administrar.  
En este proyecto se implementa una infraestructura básica compuesta por **MySQL** como motor de base de datos y **phpMyAdmin** como herramienta de gestión web, utilizando **Docker**.  

La solución aprovecha:
- **Contenedores** para ejecutar cada servicio de forma aislada.  
- **Redes** para permitir la comunicación segura entre los servicios sin exponer puertos innecesarios.  
- **Volúmenes** para garantizar la persistencia de los datos, incluso si los contenedores son eliminados o reiniciados.  

Este enfoque facilita el desarrollo, las pruebas y el despliegue, al mismo tiempo que reduce los problemas de configuración y compatibilidad entre entornos.  

---

## 🚀 Características
- MySQL 9.0  
- phpMyAdmin 5.2.1

---  

## 📂 Estructura
```bash
├── .env/          
├── comandos.txt/         # Código fuente
├── mysql-init
├   └── init.sql              # Base de datos
└── README.md

```
--- 

## 🛠 Desarrollo - Procedimiento

--- 
1. **Clonar el repositorio en el directorio**

<img width="827" height="198" alt="01" src="https://github.com/user-attachments/assets/7982315d-5d0b-411c-bacd-7ce12303d66c" />

--- 

2. **Navegar al directorio /Docker y listar los archivos**

```bash
ls -l
```
<img width="828" height="198" alt="02" src="https://github.com/user-attachments/assets/bc339bec-c4a2-422f-bc06-441a6352f296" />

--- 

3. **Tree ->**

<img width="289" height="157" alt="03" src="https://github.com/user-attachments/assets/a3d4c6b3-9700-48f6-9da5-b1982b014fbd" />

--- 

4. **Crear la Red**
   ```bash
   docker network create mysql-network
   ```
   <img width="826" height="51" alt="04" src="https://github.com/user-attachments/assets/1e68d637-235d-4aa2-8051-05b52be45349" />

--- 

5. **Crear un Volumen**
 ```bash
   docker volume create mysql-volume
   ```
   <img width="829" height="53" alt="05" src="https://github.com/user-attachments/assets/b43e6e46-eb3f-4402-a0e2-daa402116cb1" />

--- 

6. **Crear contenedor de MySQL (con versión 9.0)**
 ```bash
 docker run -d \
 --name mysql-container \
 --network mysql-network \
 --env-file .env \
 -v $(pwd)/mysql-volumen:/var/lib/mysql \
 -v $(pwd)/mysql-init:/docker-entrypoint-initdb.d \
 mysql:9.0

   ```
<img width="840" height="487" alt="06" src="https://github.com/user-attachments/assets/cc5a53d2-3487-492f-ba5e-9552f81b1d3c" />

   

--- 

| Paso | Descripción | Comando |Resultado |
|------|-------------|---------|---------|
| 1 | Crear una red interna para que los contenedores se comuniquen. | ``` docker network create mysql-network``` |<img width="886" height="194" alt="image" src="https://github.com/user-attachments/assets/ad87f830-8578-4a33-8998-7c051ba28854" />|
| 2 | Crear un **volumen** para persistir los datos de MySQL entre reinicios. | ```docker volume create mysql-volume``` |<img width="886" height="174" alt="image" src="https://github.com/user-attachments/assets/9dcdbde4-aab8-43e8-a49f-456c57902745" />|
| 3 | Levantar **MySQL 8.0** con variables de entorno y persistencia | ```docker run -d \ --name mysql-container \ --network mysql-network \ -e MYSQL_ROOT_PASSWORD=Admin1992@ \ -e MYSQL_DATABASE=epmmop \  -e MYSQL_USER=adminmdmq \ -e MYSQL_PASSWORD=Emmeth2906@ \ -v $(pwd)/mysql-volumen:/var/lib/mysql \ -v $(pwd)/mysql-init:/docker-entrypoint-initdb.d \ mysql:8.0 ``` |<img width="886" height="97" alt="image" src="https://github.com/user-attachments/assets/79a38fba-af0f-4fd2-b4a0-3eb06744996e" />|
| 4 | Levantar **phpMyAdmin** conectado al servicio MySQL de la red. | ```docker run -d \   --name phpmyadmin-container \ --network mysql-network \    -e PMA_HOST=mysql-container \ -e PMA_PORT=3306 \   -p 8080:80 \``` |<img width="886" height="97" alt="image" src="https://github.com/user-attachments/assets/79a38fba-af0f-4fd2-b4a0-3eb06744996e" />|
| 5 |Acceder desde el **navegador** y autenticarse con las credenciales de MySQL. | Abrir `http://localhost:8080/index.php?route=/` e ingresar con las credenciales configuradas en el contenedor MySQL |<img width="886" height="580" alt="image" src="https://github.com/user-attachments/assets/7dbb7dd2-8a42-4bc9-b649-8f24275792f5" /> <img width="886" height="553" alt="image" src="https://github.com/user-attachments/assets/e1dbae8b-4424-412e-a2ed-2978b0e81f7d" />|


---

## ✅ Conclusiones

1. **Facilidad de despliegue**  
   Docker permite levantar un entorno con MySQL 9.0 y PhpMyAdmin en pocos comandos, sin necesidad de configuraciones manuales extensas.  

2. **Portabilidad**  
   El proyecto puede ejecutarse en cualquier máquina con Docker, garantizando que las versiones de MySQL y PhpMyAdmin sean consistentes entre distintos entornos (desarrollo, pruebas, producción).  

3. **Aislamiento**  
   La base de datos y la herramienta de administración corren en contenedores independientes, evitando conflictos con instalaciones locales.  

4. **Escalabilidad**  
   La configuración con `docker-compose` permite agregar fácilmente nuevos servicios (como un backend o balanceador) sin alterar la base de datos ya levantada.  

5. **Mantenimiento reducido**  
   Las actualizaciones de MySQL o PhpMyAdmin se realizan simplemente cambiando la imagen en el `docker-compose.yml`, simplificando el mantenimiento a largo plazo.  

6. **Acceso simplificado**  
   PhpMyAdmin brinda una interfaz gráfica accesible desde el navegador, lo que facilita la gestión de la base de datos para usuarios no familiarizados con la línea de comandos.  

7. **Persistencia de datos**  
   Con volúmenes de Docker, los datos se conservan incluso si los contenedores se reinician o eliminan, asegurando confiabilidad.  


---
