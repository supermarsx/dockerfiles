# Docker Nginx + PHP-FPM 8

Docker Nginx latest image with PHP-FPM 8

## Example

```
docker run -p 80:8080 -v ~/public_html:/var/www/html eduardomota/nginx_php-fpm:8
```

```
docker build -t eduardomota/nginx_php-fpm:8 -t eduardomota/nginx_php-fpm:latest .
```
