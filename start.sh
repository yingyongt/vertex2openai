#!/bin/bash
# Render 部署启动脚本
# Render 会自动分配 $PORT 环境变量，必须绑定到该端口

cd app
exec uvicorn main:app --host 0.0.0.0 --port ${PORT:-7860}
