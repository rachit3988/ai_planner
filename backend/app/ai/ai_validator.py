import json
from jsonschema import Draft7Validator

with open("schema.json", "r") as f:
    SCHEMA = json.load(f)

validator = Draft7Validator(SCHEMA)

class AIOutputValidationError(Exception):
    pass

def validate_ai_output(raw_json: str) -> dict:
    try:
        data = json.loads(raw_json)
    except json.JSONDecodeError as e:
        raise AIOutputValidationError(f"Invalid JSON: {e}")

    errors = sorted(validator.iter_errors(data), key=lambda e: e.path)
    if errors:
        messages = []
        for error in errors:
            path = ".".join([str(p) for p in error.path])
            messages.append(f"{path}: {error.message}")
        raise AIOutputValidationError("; ".join(messages))

    return data

if __name__ == "__main__":
    import sys
    output = sys.stdin.read()
    validated = validate_ai_output(output)
    print("VALID")
