from pydantic import BaseModel
from typing import List, Any


class ChatParseRequest(BaseModel):
    message: str


class ChatParseResponse(BaseModel):
    tasks: List[Any]
    questions: List[str]
    notes: str
