# MIR LaTeX 模板

<p align="center">
  <a href="README.md"><strong>简体中文</strong></a>
  ·
  <a href="README.en.md">English</a>
</p>

[![LaTeX](https://img.shields.io/badge/LaTeX-2e-blue)](https://www.latex-project.org/)
[![XeLaTeX](https://img.shields.io/badge/compiler-XeLaTeX-blue)](https://tug.org/xetex/)
[![BibTeX](https://img.shields.io/badge/bibliography-BibTeX-lightgrey)](https://www.bibtex.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status](https://img.shields.io/badge/status-unofficial-orange)](#免责声明)

这是一个非官方的 *Machine Intelligence Research* (MIR) LaTeX 投稿模板，用于在 `IEEEtran` 的基础上复现 MIR Word/PDF 样张的主要版式。

> 本项目由社区维护，不是 MIR 编辑部或出版社的官方模板。正式投稿前，请务必核对期刊官网的最新作者指南。

## 特性

- 基于 `IEEEtran`，并通过 `mir-template.sty` 覆盖 MIR 样张格式。
- 保留标准 LaTeX/IEEE 写法：`abstract`、`IEEEkeywords`、`figure`、`table`、`equation`、`\cite`、`\bibliography`、`IEEEbiography`。
- 提供完整示例论文 `main.tex`。
- 使用 `reference.bib` 和 `mir.bst` 管理参考文献。
- 包含示例图、表、公式、参考文献和作者简介。
- 使用 XeLaTeX 编译，以支持 Times New Roman 等系统字体。
- 编译中间文件输出到 `build/`；成功后会把 `build/main.pdf` 复制到根目录 `main.pdf` 方便预览。

## 项目结构

```text
MIR-LaTeX-Template/
|-- .vscode/             # VS Code LaTeX Workshop 配置
|-- main.tex             # 示例论文入口
|-- mir-template.sty     # MIR 版式样式文件
|-- mir.bst              # MIR 参考文献样式
|-- reference.bib        # 示例参考文献数据库
|-- latexmkrc            # latexmk 编译配置
|-- main.pdf             # 已编译示例 PDF
|-- figures/             # 图片和作者照片
|-- tables/              # 表格源文件
|-- build/               # 编译输出和中间文件
|-- README.md            # 中文说明
`-- README.en.md         # English README
```

## 快速开始

### 本地编译

建议安装较新的 TeX 发行版，例如 TeX Live 或 MiKTeX。此模板推荐使用 XeLaTeX。

```powershell
latexmk -xelatex main.tex
```

`latexmkrc` 会把中间文件输出到 `build/`。编译完成后：

- `build/main.pdf` 是实际生成的 PDF。
- 根目录的 `main.pdf` 会从 `build/main.pdf` 自动复制而来，方便直接预览。

如果根目录 `main.pdf` 无法更新，通常是 PDF 阅读器或编辑器正在占用该文件。关闭预览窗口后重新编译即可；此时 `build/main.pdf` 通常已经正常生成。

### 清理并重新编译

```powershell
latexmk -C
latexmk -xelatex main.tex
```

### Overleaf

将整个项目上传到 Overleaf，把编译器设置为 **XeLaTeX**，并以 `main.tex` 作为主文件。不要使用 `pdflatex`，因为本模板依赖 `fontspec` 和系统字体。

### VS Code

仓库包含 `.vscode/settings.json`，已经为 LaTeX Workshop 配置了 `MIR latexmk (xelatex)` 编译 recipe。在 VS Code 中打开项目后，可以直接使用该 recipe 编译。

## 使用方式

### 标题、作者和单位

在 `main.tex` 开头修改标题、作者和单位：

```latex
\title{Preparation of Papers for Machine Intelligence Research}
\author{First Author\textsuperscript{1}\qquad Second Author\textsuperscript{1,2}}
\miraffiliation{%
\textsuperscript{1}Editorial Office of Machine Intelligence Research, Institute of Automation, CAS, Beijing 100190, China\\[3pt]
\textsuperscript{2}Department of Academic Journals, Institute of Automation, CAS, Beijing 100190, China}
```

### 摘要和关键词

使用标准环境：

```latex
\begin{abstract}
Your abstract text.
\end{abstract}

\begin{IEEEkeywords}
Keyword 1, keyword 2, keyword 3.
\end{IEEEkeywords}
```

### 图、表和公式

使用标准 LaTeX 环境：

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

双栏通栏表格使用 `table*`：

```latex
\begin{table*}[!t]
  \centering
  \caption{Wide table caption.}
  \input{tables/table1.tex}
\end{table*}
```

### 参考文献

将参考文献条目添加到 `reference.bib`，在正文中使用 `\cite{...}` 引用，并在 `main.tex` 末尾保留：

```latex
\bibliographystyle{mir}
\bibliography{reference}
```

模板使用 `cite` 宏包，多篇引用例如 `\cite{key1,key2,key3}` 会自动压缩为数字方括号格式。

### 作者简介

作者简介使用 IEEE 风格的 `IEEEbiography` 环境。作者照片建议放在 `figures/` 目录。

```latex
\begin{IEEEbiography}[{\includegraphics[width=\mirauthorphotowidth]{author-first.png}}]{First Author}
Biography text.
\end{IEEEbiography}
```

样式文件会自动处理作者头像大小和文字环绕排版。

## 维护说明

- `main.tex` 应保持为标准 LaTeX 示例，不应依赖私有图表或公式命令。
- `mir-template.sty` 负责模板版式。
- `mir.bst` 负责 BibTeX 参考文献输出格式。
- `build/` 中是生成文件，一般不需要手动编辑。
- 如果将本项目发布到 GitHub，请在仓库根目录补充与下方声明一致的 `LICENSE` 文件。

## 免责声明

本模板为非官方模板，未得到 *Machine Intelligence Research* 编辑部、Springer Nature 或相关机构的官方认可。使用本模板并不保证稿件符合最新投稿要求，也不保证稿件被接收。

作者在正式投稿前应自行核对期刊官网的最新作者指南。

## 许可证

本仓库中的 LaTeX 模板文件和文档计划采用 MIT License 发布。正式开源前，请在仓库根目录添加包含 MIT License 完整文本的 `LICENSE` 文件。

该许可证仅适用于模板代码和文档。使用本模板撰写的论文本身，其版权归作者或所属机构所有，并受作者后续签署的出版协议约束。

## 贡献

欢迎提交 issue 或 pull request。请尽量保持改动聚焦，避免引入不必要依赖，并确保示例文档仍可用 XeLaTeX 正常编译。
