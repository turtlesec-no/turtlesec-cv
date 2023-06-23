.PHONY: all

CC = xelatex
PDF_DIR = pdfs
COVER_LETTER_DIR = coverletter
CV_DIR = cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CONSULTANT_NAME = TurtleSec

all: $(foreach x, coverletter cv_en cv_no tech_no, $x.pdf)

cv_en.pdf: $(CV_SRCS)
	$(CC) -jobname=$(CONSULTANT_NAME)_CV_EN -output-directory=$(PDF_DIR) $(CV_DIR)/english_cv.tex

cv_no.pdf: $(CV_SRCS)
	$(CC) -jobname=$(CONSULTANT_NAME)_CV_NO -output-directory=$(PDF_DIR) $(CV_DIR)/norsk_cv.tex

coverletter.pdf: $(COVER_LETTER_DIR)/coverletter.tex
	$(CC) -jobname=$(CONSULTANT_NAME)_CL_EN -output-directory=$(PDF_DIR) $(COVER_LETTER_DIR)/coverletter.tex

tech_no.pdf: $(CV_DIR)/tech_no.tex
	$(CC) -jobname=$(CONSULTANT_NAME)_Tech_NO -output-directory=$(PDF_DIR) $(CV_DIR)/tech_no.tex

clean:
	find -name "*.log" -exec rm {} +
	find -name "*.aux" -exec rm {} +
	find -name "*.out" -exec rm {} +

