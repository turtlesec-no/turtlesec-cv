.PHONY: all

CC = xelatex
PDF_DIR = pdfs
COVER_LETTER_DIR = coverletter
TECH_DIR = technical_experience
CV_DIR = cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CONSULTANT_NAME = TurtleSec

all: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(CV_SRCS)
	$(CC) -jobname=$(CONSULTANT_NAME)_CV_EN -output-directory=$(PDF_DIR) $(CV_DIR)/cv.tex

coverletter.pdf: $(COVER_LETTER_DIR)/coverletter.tex
	$(CC) -jobname=$(CONSULTANT_NAME)_CL_EN -output-directory=$(PDF_DIR) $(COVER_LETTER_DIR)/coverletter.tex

clean:
	find -name "*.log" -exec rm {} +
	find -name "*.aux" -exec rm {} +
	find -name "*.out" -exec rm {} +
