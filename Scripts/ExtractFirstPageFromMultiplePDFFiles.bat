# Command designed to extract the first page from multiple PDF files in the current directory using the pdftk (PDF Toolkit) utility
# Save as Batch File and Run

for %%I in (*.pdf) do (
  "pdftk.exe" "%%I" cat 1 output "%%~nI-page1.pdf"
)
