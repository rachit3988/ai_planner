from sqlalchemy.orm import Session
from models.chat_message import ChatMessage
import json


class ChatService:
    def __init__(self, db: Session):
        self.db = db

    def save_message(self, user_id: int, message: str, ai_response: dict):
        chat = ChatMessage(
            user_id=user_id,
            message=message,
            ai_response=json.dumps(ai_response)
        )
        self.db.add(chat)
        self.db.commit()
