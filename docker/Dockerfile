FROM debian:bullseye-slim

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    texlive-xetex \
    fonts-roboto \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /cv

# Default command
CMD ["pdflatex", "-shell-escape", "main.tex"] 