#!/bin/sh
# Script para probar el webhook de n8n

WEBHOOK_URL="http://localhost:5678/webhook/lab1-webhook"

curl -X POST "$WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Prueba", "asunto": "Test automático", "mensaje": "Mensaje generado por test_webhook.sh"}'
