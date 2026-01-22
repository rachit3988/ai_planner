from fastapi import FastAPI
from api.chat import router as chat_router
from api.tasks import router as task_router

app = FastAPI(title="AI Planner API")

app.include_router(chat_router)
app.include_router(task_router)
