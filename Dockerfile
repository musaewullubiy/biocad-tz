# Dockerfile
FROM python:3.9-slim

WORKDIR /app

# Обновляем пакеты и устанавливаем необходимые зависимости
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3-venv && \
    python3 -m venv /app/venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Копируем requirements.txt и устанавливаем зависимости
COPY requirements.txt requirements.txt
RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы приложения
COPY . .

# Указываем команду для запуска приложения с использованием виртуального окружения
CMD ["/app/venv/bin/python", "app.py"]
