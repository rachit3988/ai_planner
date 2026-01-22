from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from schemas.task import TaskConfirmRequest, TaskConfirmResponse
from services.task_service import TaskService
from db.session import get_db
from auth.jwt import get_current_user

router = APIRouter(prefix="/tasks", tags=["Tasks"])


@router.post("/confirm", response_model=TaskConfirmResponse)
def confirm_task(
    payload: TaskConfirmRequest,
    db: Session = Depends(get_db),
    user=Depends(get_current_user)
):
    task = TaskService(db).confirm_task(user.id, payload.task)
    if not task:
        raise HTTPException(status_code=400, detail="Task creation failed")

    return {"task_id": task.id, "status": "confirmed"}
