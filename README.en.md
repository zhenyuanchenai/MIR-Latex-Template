# 📄 MIR LaTeX Template

<p align="center">
  <a href="README.md">简体中文</a>
  ·
  <a href="README.en.md"><strong>English</strong></a>
</p>

[![LaTeX](https://img.shields.io/badge/LaTeX-2e-blue)](https://www.latex-project.org/)
[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-blue)](https://tug.org/xetex/)
[![BibTeX](https://img.shields.io/badge/bibliography-BibTeX-lightgrey)](https://www.bibtex.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status](https://img.shields.io/badge/status-unofficial-orange)](#-disclaimer)

An unofficial LaTeX template for preparing manuscripts in the style of
*Machine Intelligence Research* (MIR).

> This project is community-maintained and is not an official template from the
> MIR editorial office or publisher. Always check the latest author instructions
> before submission.

## ✨ Features

- Based on `IEEEtran`, with MIR-specific formatting provided by `mir-template.sty`.
- Uses standard LaTeX interfaces: `abstract`, `IEEEkeywords`, `figure`, `table`, `equation`, `\cite`, `\bibliography`, and `IEEEbiography`.
- Provides a complete sample manuscript in `main.tex`.
- Uses `reference.bib` and `mir.bst` for bibliography generation.
- Includes sample figures, tables, equations, references, and author biographies.
- Uses XeLaTeX so the template can use Times New Roman and other system fonts.
- Writes intermediate files to `build/`; after a successful build, `build/main.pdf` is copied to the project root as `main.pdf` for easy preview.

## 📁 Repository Structure

```text
MIR-LaTeX-Template/
|-- .vscode/             # VS Code LaTeX Workshop settings
|-- main.tex             # Sample manuscript entry point
|-- mir-template.sty     # MIR layout and formatting
|-- mir.bst              # MIR bibliography style
|-- reference.bib        # Sample bibliography database
|-- latexmkrc            # latexmk build configuration
|-- main.pdf             # Compiled sample PDF
|-- figures/             # Figures and author photos
|-- tables/              # Table source files
|-- build/               # Build output and intermediate files
|-- README.md            # Chinese README
`-- README.en.md         # English README
```

## 🚀 Quick Start

### 💻 Local Build

Install a recent TeX distribution such as TeX Live or MiKTeX. This template is
intended to be compiled with XeLaTeX.

```powershell
latexmk -xelatex main.tex
```

The `latexmkrc` file sends intermediate files to `build/`. After compilation:

- `build/main.pdf` is the generated PDF.
- `main.pdf` in the project root is copied from `build/main.pdf` for convenient preview.

If the root `main.pdf` cannot be updated, close any PDF viewer or editor tab
that is locking the file, then compile again. `build/main.pdf` is usually still
generated correctly.

### 🧹 Clean Build

```powershell
latexmk -C
latexmk -xelatex main.tex
```

### ☁️ Overleaf

Upload the whole project to Overleaf, set the compiler to **XeLaTeX**, and use
`main.tex` as the main file. Do not use `pdflatex`, because this template relies
on `fontspec` and system fonts.

### 🛠️ VS Code

The repository includes `.vscode/settings.json`, which configures a LaTeX
Workshop recipe named `MIR latexmk (xelatex)`. Open the project in VS Code and
use that recipe to compile the sample document.

## 📝 How to Use

### 👥 Title, Authors, and Affiliations

Edit the title and author information near the top of `main.tex`:

```latex
\title{Preparation of Papers for Machine Intelligence Research}
\author{First Author\textsuperscript{1}\qquad Second Author\textsuperscript{1,2}}
\miraffiliation{%
\textsuperscript{1}Editorial Office of Machine Intelligence Research, Institute of Automation, CAS, Beijing 100190, China\\[3pt]
\textsuperscript{2}Department of Academic Journals, Institute of Automation, CAS, Beijing 100190, China}
```

### 🔎 Abstract and Keywords

Use the standard environments:

```latex
\begin{abstract}
Your abstract text.
\end{abstract}

\begin{IEEEkeywords}
Keyword 1, keyword 2, keyword 3.
\end{IEEEkeywords}
```

### 📊 Figures, Tables, and Equations

Use standard LaTeX environments:

```latex
\begin{figure}[!bp]
  \centering
  \includegraphics[width=\columnwidth]{fig1.png}
  \caption{Figure caption.}
\end{figure}
```

```latex
\begin{table}[!t]
  \centering
  \caption{Table caption.}
  \input{tables/table2.tex}
\end{table}
```

```latex
\begin{equation}
E = mc^2
\end{equation}
```

Use `table*` for a table spanning both columns:

```latex
\begin{table*}[!t]
  \centering
  \caption{Wide table caption.}
  \input{tables/table1.tex}
\end{table*}
```

### 📚 References

Add entries to `reference.bib`, cite them with `\cite{...}`, and keep the
bibliography commands near the end of `main.tex`:

```latex
\bibliographystyle{mir}
\bibliography{reference}
```

The template uses the `cite` package, so multiple citations such as
`\cite{key1,key2,key3}` are compressed and formatted as numeric bracketed
citations.

### 🧑‍💼 Author Biographies

Use the IEEE-style `IEEEbiography` environment. Author photos should be placed in
`figures/`.

```latex
\begin{IEEEbiography}[{\includegraphics[width=\mirauthorphotowidth]{author-first.png}}]{First Author}
Biography text.
\end{IEEEbiography}
```

The style file formats the biography photo and text wrapping automatically.

## 🔧 Maintainer Notes

- `main.tex` should remain a normal LaTeX example and should avoid private layout commands for figures, tables, and equations.
- `mir-template.sty` contains the visual formatting rules.
- `mir.bst` controls the BibTeX output format.
- `build/` contains generated files and does not need manual editing.
- If you publish this repository on GitHub, add a root-level `LICENSE` file that matches the license statement below.

## ⚠️ Disclaimer

This is an unofficial template. It is not endorsed by the editorial board of
*Machine Intelligence Research*, Springer Nature, or any related organization.
Using this template does not guarantee that a manuscript satisfies the latest
submission requirements or will be accepted for publication.

Authors are responsible for checking the latest official author guidelines before
submission.

## 📜 License

The LaTeX template files and documentation in this repository are intended to be
released under the MIT License. Before publishing the repository, add a
root-level `LICENSE` file containing the full MIT License text.

This license applies only to the template code and documentation. The copyright
of any manuscript written with this template belongs to its authors or their
institutions, subject to any publication agreements they sign.

## 🤝 Contributing

Issues and pull requests are welcome. Please keep changes focused, avoid adding
unnecessary dependencies, and verify that the sample document still compiles with
XeLaTeX.
