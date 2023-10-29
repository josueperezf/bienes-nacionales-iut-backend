# Proyecto bienes nacionales version iut 'backend'

este proyecto contiene solo el backend, faltan algunos reportes y correciones


## pasos levantar el proyecto

1. debemos utilizar el archivo ```.env.laravel-viejo``` y cambiarle el nombre a ```.env```. este archivo proviene de la version de vieja de este proyecto, lo deje porque funciona. Pero, igual podemos probar cambiando el nombre del archivo ```.env.example``` y colocar el nombre a ```.env``` este es el que viene con la version resiente de Laravel probablemente es mejor. asi que se puede utilizar la version vieja, o la nueva y colocar los valores que necesitemos segun nuestro ambiente
2. el frontend de este proyecto esta en <https://github.com/josueperezf/bienes-nacionales-iut-frontend>
3. para la base de datos bastaria con ejecutar ```php artisan migrate```, y luego ```php artisan db:seed``` para tener la base data entera para empezar a cargar. recordemos que solamente se puede tener una dependencia usuaria tipo almacen, despues de alli todas las dependencias deben ser tipo almacen


docker build -t josueperezf/bienes .
docker run --rm -t -p 9000:80 josueperezf/bienes



