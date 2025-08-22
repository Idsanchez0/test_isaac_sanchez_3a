# 🌌 Planets App

Aplicación en **Flutter Web** para explorar información de planetas.  
Incluye navegación con **go_router**, gestión de estado con **Riverpod** y almacenamiento seguro de
favoritos con **flutter_secure_storage**.

---

## 📦 Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.35.1** (canal stable)
- Dart

Verifica la versión instalada:

```bash
flutter --version
```

---

## ⚙️ Instalación

Clona el repositorio:

```bash
git clone https://github.com/Idsanchez0/test_isaac_sanchez_3a
seleccionar la rama develop
```

Instala dependencias:

```bash
flutter pub get
```

---

## ▶️ Ejecución en desarrollo

Ejecuta en Chrome:

```bash
flutter run -d chrome
```

---

## 🌐 Build para Web

Genera el build optimizado:

```bash
flutter build web --release
```

El contenido se guarda en `build/web`.

---

## 📸 Características principales

- 🌍 **Listado de planetas** con búsqueda y filtrado.
- ❤️ **Favoritos persistentes** usando almacenamiento seguro.
- 🖥️ **Responsive** para desktop, tablet y móvil.
- ⚡ Navegación con **go_router** y manejo de rutas de error.
