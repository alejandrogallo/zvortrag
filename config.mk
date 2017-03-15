BUILD_DIR = build
CHECK_SPELL =
DIST_DIR = $(shell git describe --tags)
DEPENDENCIES += config.mk


present: $(BUILD_DOCUMENT)
	nohup pdfpc $(BUILD_DOCUMENT) &> /dev/null &

