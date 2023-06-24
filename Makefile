.PHONY: all

CC = xelatex
PDF_DIR = pdfs
CL_DIR = coverletter
CV_DIR = cv
CONSULTANT_NAME = TurtleSec
CV_EN_NAME = $(CONSULTANT_NAME)_CV_EN
CV_NO_NAME = $(CONSULTANT_NAME)_CV_NO
CL_EN_NAME = $(CONSULTANT_NAME)_CL_EN
PR_NO_NAME = $(CONSULTANT_NAME)_PR_NO

CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

docx: $(foreach x, coverletter cv_en cv_no pr_no, $x.docx)
pdfs: $(foreach x, coverletter cv_en cv_no pr_no, $x.pdf)
all: docx

cv_en.pdf: $(CV_SRCS)
	$(CC) -jobname=$(CV_EN_NAME) -output-directory=$(PDF_DIR) $(CV_DIR)/english_cv.tex

cv_no.pdf: $(CV_SRCS)
	$(CC) -jobname=$(CV_NO_NAME) -output-directory=$(PDF_DIR) $(CV_DIR)/norsk_cv.tex

coverletter.pdf: $(CL_DIR)/coverletter.tex
	$(CC) -jobname=$(CL_EN_NAME) -output-directory=$(PDF_DIR) $(CL_DIR)/coverletter.tex

pr_no.pdf: $(CV_DIR)/tech_no.tex
	$(CC) -jobname=$(PR_NO_NAME) -output-directory=$(PDF_DIR) $(CV_DIR)/tech_no.tex

cv_en.docx: cv_en.pdf
	libreoffice --headless --infilter="writer_pdf_import" --convert-to docx --outdir $(PDF_DIR) $(PDF_DIR)/$(CV_EN_NAME).pdf

cv_no.docx: cv_no.pdf
	libreoffice --headless --infilter="writer_pdf_import" --convert-to docx --outdir $(PDF_DIR) $(PDF_DIR)/$(CV_NO_NAME).pdf

coverletter.docx: coverletter.pdf
	libreoffice --headless --infilter="writer_pdf_import" --convert-to docx --outdir $(PDF_DIR) $(PDF_DIR)/$(CL_EN_NAME).pdf

pr_no.docx: pr_no.pdf
	libreoffice --headless --infilter="writer_pdf_import" --convert-to docx --outdir $(PDF_DIR) $(PDF_DIR)/$(PR_NO_NAME).pdf

clean:
	find -name "*.log" -exec rm {} +
	find -name "*.aux" -exec rm {} +
	find -name "*.out" -exec rm {} +

realclean:
	find -name "*.pdf" -exec rm {} +
	find -name "*.docx" -exec rm {} +

