# docker-trojan

> **PULL IMAGE**

```shell
# sudo docker pull hcolde/trojan:2.0
```

> **RUN**

```shell
# sudo docker run -itd -p 443:443 \
--env DOMAIN=example.com \
--env PASSWORD=123456 \
--name trojan-server hcolde/trojan:2.0
```

make sure to replace `example.com` with your own domain and replace `123456` with your password!
