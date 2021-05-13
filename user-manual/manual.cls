%% manual.cls
%% Copyright 2020 A. Andres
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}[2020/08/11 LaTeX manual template]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[onecolumn,titlepage,twoside,openany]{book}

% Encoding
%--------------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Geometry
%--------------------------------------------------------------------------
\RequirePackage[top=2.5cm,bottom=2.5cm,left=3cm,right=3cm,
                marginparwidth=1.1cm,marginparsep=2mm]{geometry}

% Fonts
%--------------------------------------------------------------------------
\RequirePackage{kpfonts}
\renewcommand\familydefault{\sfdefault}

% Colors
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{amaranth}{RGB}{230,43,79}
\definecolor{blue}{RGB}{23,74,117}
\definecolor{beaublue}{rgb}{0.74, 0.83, 0.9}
\definecolor{forestgreen}{RGB}{21,122,81}
\definecolor{grey}{RGB}{200,200,200}
\definecolor{steelblue}{RGB}{70,130,180}
\definecolor{tangerine}{RGB}{255,185,88}

% Graphics
%--------------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{./images/}}

% Title page
%--------------------------------------------------------------------------
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\titleimage}[1]{\gdef\@titleimage{#1}}
%\newcommand{\logo}[1]{\gdef\@logo{#1}}

\makeatletter
\renewcommand{\maketitle}{
	\begin{titlepage}
		{\fontsize{40}{40}\bfseries\@title\par}
		\vspace{0.25cm}
		\ifcsname subtitle\endcsname
			{\fontsize{30}{30}\bfseries\color{blue}\@subtitle\par}
			\vspace{0.25cm}
		\fi
		{\large{Version \@version}\par}
		\vspace{2.5cm}
		%\ifcsname titleimage\endcsname
		%	\centerline{\includegraphics[width=\paperwidth]{\@titleimage}}
		%\fi
		\vfill
		\begin{center}
			\vspace{1.5cm}
			{\Large\itshape\@author\par}
			\vspace{0.5cm}
			{\large\@date\par}
		\end{center}
	\end{titlepage}
	\global\let\title\relax
}
\makeatother

% Header and footer styling
%--------------------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}

\setlength{\headheight}{15.0pt}
\fancyhf{}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\it\sf\nouppercase{\rightmark}}
\fancyhead[LO]{\it\sf\nouppercase{\leftmark}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Chapter styling
%--------------------------------------------------------------------------
\RequirePackage{titlesec}

\titleformat{\chapter}[block]
  {\color{steelblue}\normalfont\huge\bfseries}{\thechapter.}{18pt}{\Huge}
\titlespacing*{\chapter}{0pt}{-18pt}{16pt}

% Section styling
%--------------------------------------------------------------------------
\titleformat*{\section}{\normalfont\LARGE\bfseries\color{steelblue}}
\titleformat*{\subsection}{\normalfont\Large\bfseries\color{steelblue}}
\titleformat*{\subsubsection}{\normalfont\large\bfseries\color{steelblue}}

% Paragraph styling
%--------------------------------------------------------------------------
\setlength{\parindent}{0pt}
\makeatletter
	\renewcommand\paragraph{
		\@startsection{paragraph}{4}{0mm}
			{-\baselineskip}
			{.5\baselineskip}
			{\normalfont\bfseries}}
\makeatother

% Table styling
%--------------------------------------------------------------------------
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.5}

% Boxes
%--------------------------------------------------------------------------
\RequirePackage[most]{tcolorbox}

\newenvironment{note}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=beaublue!10!white,boxrule=0pt,frame hidden,
 borderline north={1pt}{0pt}{steelblue}, borderline south={1pt}{0pt}{steelblue}]}
{\end{tcolorbox}}

\newenvironment{warning}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=tangerine!10!white,boxrule=0pt,frame hidden,
 borderline north={1pt}{0pt}{amaranth}, borderline south={1pt}{0pt}{amaranth}]}
{\end{tcolorbox}}

\newenvironment{info}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=yellow!10!white,boxrule=0pt,frame hidden,
 borderline west={1.5mm}{-2mm}{forestgreen}]}
{\end{tcolorbox}}

\newenvironment{command}
{\begin{tcolorbox}
[enhanced jigsaw,breakable,pad at break*=1mm,
 colback=grey!20,boxrule=0pt,frame hidden]}
{\end{tcolorbox}}

\newtcbox{\inlinecode}{on line, boxrule=0pt, boxsep=0pt, top=3pt, left=3pt, bottom=3pt, right=3pt, colback=gray!15, colframe=white}

% Bibliography
%--------------------------------------------------------------------------
\RequirePackage[backend=biber]{biblatex}
\addbibresource{bibliography.bib}

% Useful packages
%--------------------------------------------------------------------------
\RequirePackage{algorithm}
\RequirePackage{caption}
\RequirePackage{hyperref}