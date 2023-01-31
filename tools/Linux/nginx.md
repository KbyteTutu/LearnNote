# Nginx

反向代理，用于负载均衡以及静态资源访问，可以用来做前后端分离。

前端部分指向静态页面，需要动态的地方后端实现。

```sh
docker run -d -p 80:80 --name=nginx_web \
  -v /opt/nginx/www:/usr/share/nginx/html \
  -v /opt/nginx/conf.d:/etc/nginx/conf.d \
  -v /opt/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
  -v /opt/nginx/logs:/var/log/nginx \
  nginx
```

