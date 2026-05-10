# Pet Hub (pet.proj)

Java web app: Jakarta Servlets, JSP, MySQL.

## Run with Docker (recommended)

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. From this folder run:

```powershell
docker compose up --build
```

Or double-click **`run-docker.bat`** (Windows).

3. Open **http://localhost:8080/PetHubProject/**

First startup waits for MySQL to import **`pethub.sql`**; it can take a minute.

Default DB password in Compose: **`petroot`** (see `docker-compose.yml`). The app reads **`MYSQL_URL`**, **`MYSQL_USER`**, **`MYSQL_PASSWORD`**.

## Run locally (no Docker)

1. Install MySQL 8, create database **`PetHub`**, import **`pethub.sql`**.
2. Set environment variables (see **`env.example`**; at minimum **`MYSQL_PASSWORD`** for local MySQL).
3. Build the WAR — either install Maven and run **`mvn -DskipTests package`**, or on Windows run:

```powershell
cd PetHubProject
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

The script uses Maven from your PATH if present; otherwise it downloads a portable Maven into **`PetHubProject/.maven/`** (ignored by Git).

4. Deploy **`PetHubProject/target/PetHubProject.war`** to **Tomcat 10.x** (Jakarta), or use Eclipse as a Dynamic Web Project.

## GitHub Pages

The **`index.html`** at the repo root is only a static landing page. The full app does not run on GitHub Pages.
