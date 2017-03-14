BUILD_DIR = build
CHECK_SPELL =


present: $(BUILD_DOCUMENT)
	nohup pdfpc $(BUILD_DOCUMENT) &> /dev/null &

