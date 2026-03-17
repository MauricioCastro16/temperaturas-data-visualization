[![Consultar a DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/MauricioCastro16/temperaturas-data-visualization)

# Sistema de Temperaturas Pascal

![Pascal](https://img.shields.io/badge/Pascal-3.2.2-9cf.svg)

Sistema académico completo para la gestión y análisis de datos meteorológicos. Implementa recolección, procesamiento y visualización de registros de temperatura con validación de fechas y generación de estadísticas.

## Características Principales

- Ingreso interactivo de datos con validación robusta de fechas y rangos de temperatura
- Generación aleatoria de datos para pruebas con distribución controlada
- Procesamiento con filtrado temporal específico y cálculo de estadísticas
- Visualización gráfica mediante gráficos de asteriscos ASCII
- Sistema de paginación para consulta de datos almacenados

## Stack Tecnológico

| Categoría | Tecnología |
|-----------|------------|
| Lenguaje | Pascal |
| Estructura de Datos | Archivos binarios tipados |

## Arquitectura / Flujo

El sistema implementa una arquitectura basada en cuatro programas independientes que comparten dos archivos binarios como medio de persistencia. Los programas Carga y Generacion actúan como productores de datos, Principal realiza el procesamiento y filtrado, mientras que VerPantalla proporciona la interfaz de consulta final con visualización paginada.

## Instalación y Uso

```bash
# Clonar el repositorio
git clone https://github.com/MauricioCastro16/temperaturas-data-visualization.git
cd temperaturas-data-visualization

# Compilar los programas
fpc Carga.pas
fpc Generacion.pas
fpc Principal.pas
fpc VerPantalla.pas

# Ejecutar el sistema
./Carga.exe          # Para ingreso manual de datos
# o
./Generacion.exe     # Para generación aleatoria
./Principal.exe      # Para procesamiento y estadísticas
./VerPantalla.exe    # Para visualización de datos
```
