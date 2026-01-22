from pydantic import BaseModel


class TaskPayload(BaseModel):
    title: str
    description: str
    estimated_minutes: int
    category_id: int
    scheduled_hour: int


class TaskConfirmRequest(BaseModel):
    task: TaskPayload


class TaskConfirmResponse(BaseModel):
    task_id: int
    status: str
