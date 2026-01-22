from sqlalchemy.orm import Session
from models.task import Task
from services.calendar_service import CalendarService
from services.reminder_service import ReminderService


class TaskService:
    def __init__(self, db: Session):
        self.db = db
        self.calendar = CalendarService(db)
        self.reminder = ReminderService()

    def confirm_task(self, user_id: int, task_data):
        scheduled_at = self.calendar.assign_hour(task_data.scheduled_hour)

        task = Task(
            user_id=user_id,
            title=task_data.title,
            description=task_data.description,
            estimated_minutes=task_data.estimated_minutes,
            category_id=task_data.category_id,
            scheduled_at=scheduled_at
        )
        self.db.add(task)
        self.db.commit()
        self.db.refresh(task)

        self.reminder.schedule(task)
        return task
