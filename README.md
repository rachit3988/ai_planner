# 🧠 AI Planner – Full Stack Intelligent Task Planning System

AI Planner is a production-grade AI-powered task planning ecosystem built with a modern full-stack architecture.

It consists of:
- 📱 Flutter Mobile App (Client)
- 🤖 AI Service (Python + LLM Integration)
- 🚀 Go Backend (API + WebSocket + Auth + DB)

This repository acts as the parent mono-repo and manages all three services as Git submodules.

---

# 🏗 Architecture Overview
```
ai-planner (parent repo)
│
├── ai_planner_flutter_app      → Flutter mobile application
├── ai-planner-ai               → AI service (LLM task generation)
└── ai-planner-go-backend       → REST + WebSocket backend (Go)
```

---

# 🔥 Tech Stack
### 📱 Mobile App – ai_planner_flutter_app

- Flutter
- Riverpod (State Management)
- WebSocket integration
- Clean Architecture
- JWT Authentication
- REST + Real-time updates

---

# 🤖 AI Service – ai-planner-ai

- Python
- FastAPI
- LLM Integration (GROQ / OpenAI compatible)
- Task generation from natural language
- Structured JSON response
- Modular prompt design

---

# 🚀 Backend – ai-planner-go-backend

- Go (Golang)
- Gin Framework
- WebSocket Support
- PostgreSQL
- JWT Authentication
- Clean Architecture
- Repository Pattern
- Docker-ready deployment

---

# 🔄 System Flow

- User enters goal in Flutter app
- Flutter sends request to Go backend
- Go backend triggers AI service
- AI generates structured tasks
- Backend stores tasks in DB
- Tasks are pushed back via WebSocket
- Flutter updates UI in real-time

# 📂 Repository Structure

This is a meta repository using Git submodules.
```
ai-planner/
│
├── .gitmodules
├── ai_planner_flutter_app/
├── ai-planner-ai/
└── ai-planner-go-backend/
```

---

# 🚀 Getting Started
### Clone With Submodules
```
git clone --recurse-submodules https://github.com/your-username/ai-planner.git
cd ai-planner
```

If already cloned:
```
git submodule update --init --recursive
```

---

# 🛠 Running Locally
### 🚀 Start Go Backend
```
cd ai-planner-go-backend
go mod tidy
go run main.go
```

Backend runs on:
```
http://localhost:8080
```

### 🤖 Start AI Service
```
cd ai-planner-ai
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```

AI service runs on:
```
http://localhost:8000
```

### 📱 Run Flutter App
```
cd ai_planner_flutter_app
flutter pub get
flutter run
```

### 🌐 Production Deployment

Recommended setup:
- Go Backend → Render / AWS / Railway
- AI Service → Render / AWS
- PostgreSQL → Managed DB (Render / Supabase / RDS)
- Flutter → Play Store / App Store

# 📡 API + WebSocket

### REST Endpoints
- ``` POST /login ```
- ``` POST /register ```
- ``` POST /tasks/generate ```
- ``` GET /tasks ```

WebSocket
``` /ws ```


Used for:
- Real-time AI task push
- Task updates

---

# 🧠 AI Capabilities

- Converts natural language goals into structured tasks
- Adds:
    - Title
    - Description
    - Estimated Minutes
- Returns clean JSON
- Optimized prompt engineering
- Extensible for:
    - Scheduling
    - Priority ranking
    - Smart reminders

---

# 🎯 Features

- AI-first task creation
- Manual task creation
- Real-time task streaming
- JWT authentication
- Clean modular architecture
- Scalable microservice setup
- Production-ready structure

---

# 📈 Future Improvements

- Push notifications
- Task scheduling engine
- Analytics dashboard
- AI task prioritization
- Smart daily planner mode
- Calendar integration

# 👨‍💻 Author

Rachit Sharma
Full Stack Engineer | Android | Go | AI/ML
Building scalable AI-powered systems.