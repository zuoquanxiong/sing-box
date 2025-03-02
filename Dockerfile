FROM alpine:latest  # 或使用其他基础镜像（如 ubuntu）

# 安装依赖（如 wget、bash）
RUN apk add --no-cache wget bash  # Alpine 使用 apk
# 如果是 Ubuntu 基础镜像，替换为：RUN apt-get update && apt-get install -y wget

# 下载并执行脚本
RUN wget -qO install.sh https://github.com/233boy/sing-box/raw/main/install.sh \
    && chmod +x install.sh \
    && ./install.sh

# 确保服务持续运行（根据 sing-box 的实际启动命令调整）
CMD ["sing-box"]
