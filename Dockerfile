# Usa una imagen base con Python 3.11 (por ejemplo, la versión slim para reducir el tamaño)
FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo requirements.txt y el código fuente al contenedor
COPY requirements.txt .
COPY . .

# Actualiza pip e instala las dependencias
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expone el puerto (Render.com configura la variable de entorno PORT)
EXPOSE $PORT

# Ejecuta Gunicorn utilizando la variable de entorno $PORT para enlazar
CMD ["gunicorn", "flask_app:app", "--bind", "0.0.0.0:$PORT"]