# Docker Nginx + PHP-FPM 7.3

Docker Nginx latest image with PHP-FPM 7.3

## Example

```
docker run -p 80:8080 -v ~/public_html:/var/www/html eduardomota/nginx_php-fpm:7.3
```

```
docker build -t eduardomota/nginx_php-fpm:7.3 .
```
