FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY app/requirements.txt .
RUN pip cache purge && pip install --no-cache-dir -r requirements.txt

# Copy application code and local model fallback
COPY app/ .
COPY vertexModels.json .

# Expose the port
EXPOSE 7860

CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${PORT:-7860}"]
