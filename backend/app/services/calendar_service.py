from datetime import datetime, timedelta
from sqlalchemy.orm import Session


class CalendarService:
    def __init__(self, db: Session):
        self.db = db

    def assign_hour(self, hour: int) -> datetime:
        now = datetime.utcnow()
        scheduled = now.replace(hour=hour, minute=0, second=0, microsecond=0)
        if scheduled < now:
            scheduled += timedelta(hours=1)
        return scheduled
