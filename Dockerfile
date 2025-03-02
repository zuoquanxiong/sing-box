# 使用 Ubuntu 官方镜像
FROM ubuntu:22.04

# 避免交互式安装（如时区选择）
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要依赖
RUN apt-get update && apt-get install -y wget bash

# 下载脚本并执行（建议将脚本本地化，而非直接下载）
RUN wget -O /app/install.sh https://github.com/233boy/sing-box/raw/main/install.sh \
    && chmod +x /app/install.sh \
    && /app/install.sh

# 切换非 root 用户（提升安全性）
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

# 确保服务持续运行（根据 sing-box 的实际启动命令调整）
CMD ["sing-box"]
