.PHONY: all

CC = xelatex
PDF_DIR = pdfs
COVER_LETTER_DIR = coverletter
CV_DIR = cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(CV_SRCS)
	$(CC) -output-directory=$(PDF_DIR) $(CV_DIR)/cv.tex

coverletter.pdf: $(COVER_LETTER_DIR)/coverletter.tex
	$(CC) -output-directory=$(PDF_DIR) $(COVER_LETTER_DIR)/coverletter.tex

clean:
	find -name "*.log" -exec rm {} +
	find -name "*.aux" -exec rm {} +
	find -name "*.out" -exec rm {} +

