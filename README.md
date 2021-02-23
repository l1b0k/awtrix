# AWTRIX

auto build

## Docker hub

`docker pull registry.cn-hangzhou.aliyuncs.com/l1b0k/awtrix`

## Aliyun ACR

`docker pull l1b0k:awtrix`

## Usage

适用于局域网 Docker 场景

```sh
docker run --name awtrix --restart=always -d \
--cpus=".5" --memory=256m \
-v /data/aw:/awtrix \
-v /etc/localtime:/etc/localtime:ro \
-p 7000:7000 -p 7001:7001 \
registry.cn-hangzhou.aliyuncs.com/l1b0k/awtrix
```

## with nginx

适用于公网场景

### 1. 生成basic auth密码

```sh
htpasswd -bdc .htpasswd admin admin@1024
```

### 2. 修改 k8s.yml 里面密码

替换`admin:YAf9KBvtmzUh6` 为之前生成的内容

### 3. 部署

```sh
kubectl create -f k8s.yml
```

### 4. 对接

```sh
kubectl get svc awtrix
```

获取LB 的VIP，在 awtrix 上配置 VIP:7001
