from typing import Dict, Any
from ai.system_prompt import build_system_prompt
from ai.user_prompt import build_user_prompt
from ai.ai_validator import validate_ai_output


class LLMClientStub:
    def complete(self, prompt: str) -> Dict[str, Any]:
        return {
            "tasks": [],
            "questions": ["What time should this be scheduled?"],
            "notes": ""
        }


class AIOrchestrator:
    def __init__(self):
        self.client = LLMClientStub()

    def parse_message(self, raw_text: str) -> Dict[str, Any]:
        system_prompt = build_system_prompt()
        user_prompt = build_user_prompt(raw_text)

        prompt = f"{system_prompt}\n{user_prompt}"
        response = self.client.complete(prompt)

        validate_ai_output(response)
        return response
