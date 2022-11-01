\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\@declarevar}[2][]{
    \expandafter\def\csname #2\endcsname##1{\expandafter\gdef\csname @#2\endcsname{##1}}
    \expandafter\def\csname @#2\endcsname{#1}
    \expandafter\def\csname the#2\endcsname{\csname @#2\endcsname}
}

\@declarevar{doctype}
\@declarevar{titlepagekeyvalues}
\@declarevar{university}
\@declarevar{institute}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unknown options are forwarded to scrartcl
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the class and required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[
	toc=bibnumbered,
	bibliography=numbered,
	listof=totoc,
    listof=entryprefix,
	listof=numbered,
    toc=sectionentrywithdots,
]{scrartcl}
\RequirePackage{etoolbox}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pagestyle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\RequirePackage[headsepline]{scrlayer-scrpage}
\pretocmd{\section}{\cleardoubleoddemptypage}{}{} % sections start on odd pages
\clearpairofpagestyles
\ohead{\pagemark}
\cehead{\normalfont\scshape\leftmark}
\cohead{\normalfont\scshape\@title}
\ihead{}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\makeatother

\RequirePackage[inline]{enumitem}
\setlist[description]{font=\normalfont\itshape}

\RequirePackage[backend=biber, style=numeric]{biblatex}
\renewcommand*{\bibfont}{\normalfont\small}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Glossary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{glossaries}
% First occurence of a glossary term is in emph
\defglsentryfmt{{%
	\ifglsused{\glslabel}{\glsgenentryfmt{}}{\emph{\glsgenentryfmt{}}}%
}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document Structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\frontmatter{\cleardoublepage\pagestyle{plain}\pagenumbering{roman}\setcounter{page}{1}}
\def\mainmatter{\cleardoublepage\pagestyle{headings}\pagenumbering{arabic}\setcounter{page}{1}}
\def\backmatter{\cleardoublepage\appendix\pagenumbering{Roman}\setcounter{page}{1}}
\makeatletter
\newcommand{\insertauthor}{\@author}

\renewcommand{\maketitle}{
	\begin{titlepage}
		\centering
		{\scshape\LARGE \theuniversity \par}
		{\Large \theinstitute\par}
		\vspace{5cm}
		{\Large \thedoctype\par}
		\vspace{1.5cm}
		{\huge\bfseries \@title\par}
		\vspace{2em}
		{\large submitted by\par}
		\vspace{1cm}
		{\Large\itshape \insertauthor\par}
		\vfill
		{\large \begin{tabular}{p{4cm}p{7cm}} \thetitlepagekeyvalues \end{tabular}}
		\vfill
		{\large \today\par}
	\end{titlepage}
}
\makeatother