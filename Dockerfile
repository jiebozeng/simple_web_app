#源镜像
FROM golang:1.19

ENV GOPROXY=https://goproxy.cn,https://goproxy.io,direct \
    GO111MODULE=on \
    CGO_ENABLED=1

#作者
MAINTAINER Razil "test"
## 在docker的根目录下创建相应的使用目录
RUN mkdir -p /app
## 设置工作目录
WORKDIR /app
## 把当前（宿主机上）目录下的文件都复制到docker上刚创建的目录下
COPY . .

#go构建可执行文件
RUN go build -o simple_web_app
#暴露端口
EXPOSE 8080

RUN chmod +x simple_web_app
ENTRYPOINT ["./simple_web_app"]

# 设置容器启动时运行的命令
# 这里是运行编译好的可执行文件 simple_web_app
CMD ["/app/simple_web_app"]