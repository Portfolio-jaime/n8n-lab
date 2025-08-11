# Proyecto DevContainer Alpine + n8n + GitHub Validator

Este entorno está basado en Alpine Linux (edge) y contiene:

- **n8n**: Plataforma de automatización de workflows.
- **Validador de credenciales GitHub**: Script interactivo en Python (`github_validator.py`).
- Herramientas de desarrollo: Python 3, git, ssh, wget, etc.

## Requisitos

- Docker y VS Code con extensión "Dev Containers".
- Acceso a [GitHub](https://github.com/) y [n8n](https://n8n.io/).

## Primeros pasos

1. **Levanta el devcontainer**  
   Abre el proyecto en VS Code y selecciona "Reopen in Container".

2. **Accede a n8n**  
   Ejecuta en la terminal:
   ```sh
   "$BROWSER" http://localhost:5678
   ```
   O abre manualmente la URL en tu navegador.

3. **Valida tus credenciales de GitHub**  
   Ejecuta el validador interactivo:
   ```sh
   python3 github_validator.py
   ```

## Variables de entorno

Asegúrate de definir las siguientes variables en tu archivo `.env`:

```env
GITHUB_TOKEN=tu_token_github
app_gmail_password=tu_app_password_gmail
```

## Ejemplo de prueba de workflow n8n

Para probar el workflow de email vía webhook:

1. Activa el workflow en n8n.
2. Ejecuta en la terminal:
   ```sh
   curl -X POST http://localhost:5678/webhook/lab1-webhook \
     -H "Content-Type: application/json" \
     -d '{"nombre": "Juan", "asunto": "Prueba n8n", "mensaje": "¡Hola desde el webhook!"}'
   ```
3. Verifica el correo en la bandeja de entrada.

## Estructura

- `.devcontainer/`: Configuración del entorno (Dockerfile, docker-compose.yml, Caddyfile).
- `github_validator.py`: Script para validar llaves SSH, PAT, OAuth y configuración de git.
- Otros archivos y carpetas según tus workflows.

## Personalización

- Puedes instalar más paquetes editando `.devcontainer/Dockerfile`.
- Los datos de n8n y la base de datos se persisten en volúmenes Docker.

## Recursos útiles

- [Documentación n8n](https://docs.n8n.io/)
- [Documentación Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Documentación Alpine Linux](https://wiki.alpinelinux.org/wiki/Main_Page)

---

**¡Listo para automatizar y validar tu entorno de desarrollo!**