# Sử dụng image Python nhẹ
FROM python:3.10-slim

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Cài đặt các thư viện yêu cầu
RUN pip install --no-cache-dir -r requirements.txt

# Expose port nếu cần (ví dụ, nếu ứng dụng của bạn chạy server)
EXPOSE 8000

# Chạy ứng dụng
CMD ["python", "api/app.py"]
