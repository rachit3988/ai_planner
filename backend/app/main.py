import logging
from fastapi import FastAPI

logging.basicConfig(level=logging.INFO)

app = FastAPI()

@app.get("/health")
def health_check():
    logging.info("Health check called")
    return {"status": "ok"}
