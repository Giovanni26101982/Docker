# 📌 Grupo 4
## 📌 TAREA 01: Despliegue MySQL 8.0 + phpMyAdmin en Docker


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

## 📝 Descripción
Desplegar una infraestructura de MySQL + phpMyAdmin usando contenedores, redes y volúmenes.  

---

## 🚀 Características
- MySQL 8.0  
- phpMyAdmin

---  

## 📂 Estructura
```bash
├── docs/          # Documentación
├── src/           # Código fuente
├── tests/         # Pruebas
├── .gitignore     
├── README.md
└── LICENSE
```
--- 


# MySQL 8.0 + phpMyAdmin en Docker

| Paso | Descripción | Comando |Resultado |
|------|-------------|---------|---------|
| 1 | Crear una red interna para que los contenedores se comuniquen. | ```docker network create mysql-network``` |<img width="886" height="194" alt="image" src="https://github.com/user-attachments/assets/ad87f830-8578-4a33-8998-7c051ba28854" />|
| 2 | Crear un **volumen** para persistir los datos de MySQL entre reinicios. | ```docker volume create mysql-volume``` |<img width="886" height="174" alt="image" src="https://github.com/user-attachments/assets/9dcdbde4-aab8-43e8-a49f-456c57902745" />|
| 3 | Levantar **MySQL 8.0** con variables de entorno y persistencia | ```docker run -d \ --name mysql-container \ --network mysql-network \ -e MYSQL_ROOT_PASSWORD=Admin1992@ \ -e MYSQL_DATABASE=epmmop \  -e MYSQL_USER=adminmdmq \ -e MYSQL_PASSWORD=Emmeth2906@ \ -v $(pwd)/mysql-volumen:/var/lib/mysql \ -v $(pwd)/mysql-init:/docker-entrypoint-initdb.d \ mysql:8.0 ``` |<img width="886" height="97" alt="image" src="https://github.com/user-attachments/assets/79a38fba-af0f-4fd2-b4a0-3eb06744996e" />|
| 4 | Levantar **phpMyAdmin** conectado al servicio MySQL de la red. | ```docker run -d \   --name phpmyadmin-container \ --network mysql-network \    -e PMA_HOST=mysql-container \ -e PMA_PORT=3306 \   -p 8080:80 \``` |<img width="886" height="97" alt="image" src="https://github.com/user-attachments/assets/79a38fba-af0f-4fd2-b4a0-3eb06744996e" />|
| 5 |Acceder desde el **navegador** y autenticarse con las credenciales de MySQL. | Abrir `http://localhost:8080/index.php?route=/` e ingresar con las credenciales configuradas en el contenedor MySQL |<img width="886" height="580" alt="image" src="https://github.com/user-attachments/assets/7dbb7dd2-8a42-4bc9-b649-8f24275792f5" /> <img width="886" height="553" alt="image" src="https://github.com/user-attachments/assets/e1dbae8b-4424-412e-a2ed-2978b0e81f7d" />|




## ⚙️ Instalación
Pasos para instalar y configurar el proyecto:  

```bash
# Clonar el repositorio
git clone https://github.com/usuario/repositorio.git

# Entrar en la carpeta
cd repositorio

# Instalar dependencias
npm install   # o pip install -r requirements.txt

```



## 📌 Alcance
Describe los límites del proyecto:  
- Qué incluye.  
- Qué no incluye.  

---

## ⚙️ Metodología
Explica el enfoque utilizado:  
- Metodología de desarrollo (ágil, cascada, etc.)  
- Herramientas empleadas.  
- Flujo de trabajo.  

---

## 🛠 Tecnologías Utilizadas
- Lenguaje(s) de programación  
- Frameworks  
- Bases de datos  
- Servicios externos  

---

## 📂 Estructura del Proyecto
```bash
├── docs/          # Documentación
├── src/           # Código fuente
├── tests/         # Pruebas
├── .gitignore     
├── README.md
└── LICENSE
```
