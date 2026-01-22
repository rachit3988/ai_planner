from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from ai.orchestrator import AIOrchestrator
from schemas.chat import ChatParseRequest, ChatParseResponse
from services.chat_service import ChatService
from db.session import get_db
from auth.jwt import get_current_user

router = APIRouter(prefix="/chat", tags=["Chat"])
orchestrator = AIOrchestrator()


@router.post("/parse", response_model=ChatParseResponse)
def parse_chat(
    payload: ChatParseRequest,
    db: Session = Depends(get_db),
    user=Depends(get_current_user)
):
    result = orchestrator.parse_message(payload.message)
    ChatService(db).save_message(user.id, payload.message, result)
    return result
