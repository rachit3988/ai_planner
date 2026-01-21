import uuid
from sqlalchemy import Column, String, Date, Time, ForeignKey
from sqlalchemy.dialects.postgresql import UUID
from app.db.base import Base

class Task(Base):
    __tablename__ = "tasks"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    category_id = Column(UUID(as_uuid=True), ForeignKey("categories.id"), nullable=False)
    title = Column(String, nullable=False)
    description = Column(String, nullable=True)
    planned_date = Column(Date, nullable=False)
    due_time = Column(Time, nullable=True)
    priority = Column(String, nullable=False)
    status = Column(String, nullable=False)
