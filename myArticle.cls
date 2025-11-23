%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% myArticle.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myArticle}[2025/11/23 v2.3 Stable Template]

% 显式开启 @ 字符支持
\makeatletter

\ProcessOptions\relax
\LoadClass[10pt]{article}

% --- 1. 基础宏包 ---
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage[scheme=plain, fontset=fandol]{ctex}

% --- 2. 页面布局 ---
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{setspace}
\onehalfspacing 

% --- 3. 摘要设置 ---
\RequirePackage[style]{abstract}
\renewcommand{\abstitlestyle}[1]{}
\renewcommand{\abstracttextfont}{\bfseries\normalsize}
\setlength{\absleftindent}{1in}
\setlength{\absrightindent}{1in}

% --- 4. 版权框定义 ---
\newcommand{\myCopyrightText}{Copyright \copyright\ \the\year\ by the authors.\\
This is an Open Access article distributed under the terms of the Creative Commons Attribution License (CC BY 4.0), which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.}
\newcommand{\setcopyright}[1]{\renewcommand{\myCopyrightText}{#1}}
\newcommand{\makecopyright}{%
  \par\vspace{1.5em}
  \noindent
  \hspace{\absleftindent}%
  \fbox{%
    \parbox{\dimexpr\textwidth-\absleftindent-\absrightindent-2\fboxsep-2\fboxrule\relax}{%
      \vspace{0.5em} 
      \footnotesize\normalfont
      \textbf{Copyright \& License Statement}\par\vspace{0.3em}
      \myCopyrightText
      \vspace{0.5em} 
    }%
  }%
  \par
}

% --- 5. 常用学术宏包 ---
\RequirePackage{amsmath}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[tableposition=top]{caption}

% --- 6. 代码环境设置 ---
\RequirePackage{xcolor}
\RequirePackage{listings}

% 定义浅灰背景色
\definecolor{codebg}{gray}{0.95} 

\lstset{
    basicstyle=\small\ttfamily, % 字号与字体
    backgroundcolor=\color{codebg}, % 浅灰背景
    frame=single,               % 简洁方框
    framesep=5pt,               % 框内边距
    rulecolor=\color{black},    % 框线颜色
    breaklines=true,            % 自动换行
    captionpos=b,               % 标题在底部
    tabsize=4,
    numbers=none,               % 显示行号
    numberstyle=\tiny\color{gray},
    keywordstyle=\color{blue},  % 关键字颜色 (可选简单高亮)
    commentstyle=\color{gray},  % 注释颜色
    stringstyle=\color{red!70!black} % 字符串颜色
}

% --- 7. 章节标题设置 ---
\RequirePackage[explicit]{titlesec}
\titleformat{\section}{\large\bfseries\singlespacing}{\thesection\quad}{0pt}{#1}[]    
\titlespacing{\section}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsection}{\normalsize\bfseries\singlespacing}{\thesubsection\quad}{0pt}{#1}[]
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}
\titleformat{\subsubsection}{\normalsize\bfseries\singlespacing}{\thesubsubsection\quad}{0pt}{#1}[]
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0pt}

% --- 8. 作者与元数据 ---
\RequirePackage[blocks]{authblk}
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}
\newcommand{\email}[1]{\\ \normalfont\textit{Email:} \texttt{#1}}

\renewcommand{\maketitle}{%
  \begingroup
  \renewcommand\and{\\[\baselineskip]}
  \centering\singlespacing 
  {\LARGE\bfseries\@title\par}
  \vskip2\baselineskip
  \@author\par
  \endgroup
  \vskip\baselineskip
  \setcounter{footnote}{0}
}

% --- 9. 引用与链接 ---
\RequirePackage[sort&compress,numbers]{natbib}
\bibliographystyle{new-aiaa}
\renewcommand{\bibfont}{\small}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}
\RequirePackage{nameref}
\hypersetup{
    colorlinks=true, linkcolor=blue, citecolor=green, 
    urlcolor=cyan, linkbordercolor={1 1 1}, bookmarksnumbered=true
}
\makeatother
\endinput