PROJECT_NAME = cv
SRC_DIR = src
BUILD_DIR = $(SRC_DIR)
DOCKER_IMG = latex-cv-builder

all: build

docker-build:
	@echo "🐋 Building Docker image..."
	docker build -t $(DOCKER_IMG) docker/

build: docker-build
	@echo "🐋 Building LaTeX using Docker..."
	docker run --rm \
		-v $(PWD)/$(SRC_DIR):/cv \
		-w /cv \
		$(DOCKER_IMG) \
		pdflatex -shell-escape main.tex

	@echo "🖨️ Second pass for TOC and references..."
	docker run --rm \
		-v $(PWD)/$(SRC_DIR):/cv \
		-w /cv \
		$(DOCKER_IMG) \
		pdflatex -shell-escape main.tex

	@echo "✅ Done! PDF generated at $(BUILD_DIR)/main.pdf"

clean:
	@echo "🗑 Cleaning auxiliary files..."
	rm -f $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.out $(BUILD_DIR)/*.toc
	@echo "✅ Cleanup done."

rebuild: clean build

package: build
	@echo "📦 Packaging PDF..."
	mkdir -p dist
	cp $(BUILD_DIR)/main.pdf dist/$(PROJECT_NAME).pdf
	@echo "✅ Package created: dist/$(PROJECT_NAME).pdf"

.PHONY: all build clean rebuild package docker-build