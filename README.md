# LaTeX CV Template

This project provides a LaTeX template for creating a professional CV. The build process is containerized using Docker to ensure a consistent environment.

## Prerequisites

- [Docker](https://www.docker.com/get-started) must be installed on your system.

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone <repository-url>
   cd latex-cv-template
   ```

2. **Build the CV:**

   Run the following command to build your CV:

   ```bash
   make
   ```

   This will:
   - Build a Docker image with all necessary LaTeX packages.
   - Compile the LaTeX source files into a PDF.

3. **Output:**

   The generated PDF will be located at `src/main.pdf`.

## Cleaning Up

To remove auxiliary files generated during the build process, run:

```bash
make clean
```

## Packaging

To package the generated PDF into a `dist` directory, run:

```bash
make package
```

## Customization

- Modify the LaTeX source files located in the `src` directory to customize your CV.

## Troubleshooting

- Ensure Docker is running and you have the necessary permissions to execute Docker commands.
