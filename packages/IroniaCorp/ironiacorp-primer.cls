\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cartilha}[2006/08/11 Cartilha]
\LoadClass[12pt,twoside,a4paper]{book}

%%%%%%%%%%%%%%%%%%%%
% Configura��o de vari�veis globais
%
\def\doctype#1{\gdef\@doctype{#1}}%
% \def\@doctype{\@latex@error{No \noexpand\doctype given}\@ehc}%

\def\subtitle#1{\gdef\@subtitle{#1}}%
\def\@subtitletype{\@latex@error{No \noexpand\subtitle given}\@ehc}%

\def\sponsor#1{\gdef\@sponsor{#1}}%
\def\@sponsor{\@latex@error{No \noexpand\sponsor given}\@ehc}%

\def\project#1{\gdef\@project{#1}}%
\def\@project{\@latex@error{No \noexpand\project given}\@ehc}%

\def\alternativeproject#1{\gdef\@alternativeproject{#1}}%
\def\@alternativeproject{\@latex@error{No \noexpand\alternativeproject given}\@ehc}%



%%%%%%%%%%%%%%%%%%%%
% Configura��o da qualidade do PDF gerado
%
% Par�metros que determinam a qualidade e compress�o utilizada para os documentos PDF
% \pdfcompresslevel=6
% \pdfpkresolution=600
% \pdfimageresolution=72
\pdfcompresslevel=9
\pdfpkresolution=1200
\pdfimageresolution=600

%%%%%%%%%%%%%%%%%%%%
% Comandos b�sicos
%
\newcommand{\allcaps}[1]{\uppercase\expandafter{#1}}
\newcommand{\underln}[1]{$\underline{\text{#1}}$}

%%%%%%%%%%%%%%%%%%%%
% Configura��o das margens das p�ginas
%
\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=3cm,right=2.5cm,top=3cm,bottom=2.5cm}



%%%%%%%%%%%%%%%%%%%
% Configura��o dos idiomas utilizados no texto
%
% Defini��o dos idiomas dispon�veis para escrita (regras de hifeniza��o e tradu��o de termos).
% O idioma padr�o � o �ltimo definido na lista de par�metros (brazil).
\RequirePackage[english,brazil]{babel}

% Macro utilizada para termos em ingl�s.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}


%%%%%%%%%%%%%%%%%%%
% Configura��o para inser��o de figuras
%
\RequirePackage[pdftex]{graphicx}


%%%%%%%%%%%%%%%%%%
% Configura��o de tabelas
%
% Temos tabelas?
\RequirePackage{tabularx}


%%%%%%%%%%%%%%%%%%%%
% Comandos para inser��o de c�digo-fonte, scripts e comandos no texto.

% Utilizado para listagens de c�digos e comandos longos.
\RequirePackage{listings}

% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
% \renewcommand{\lstlistingname}{Exemplo}
% \renewcommand{\lstlistlistingname}{Lista de exemplos}

% Define os estilos a serem utilizados nos ambientes lstlistings.
\lstset{basicstyle=\scriptsize}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{frameround=tttt}
\lstset{aboveskip=.5cm}
\lstset{belowskip=.5cm}
\lstset{xleftmargin=.3cm}
\lstset{xrightmargin=.3cm}
\lstset{resetmargins=true}
\lstset{float}
\lstset{captionpos=b}
\lstset{extendedchars=true}


% Algumas refer�ncias bibliogr�ficas utilizam o comando \url. Provavelmente
% utilizaremos esse comando no corpo do texto tamb�m.
\RequirePackage{url}
 


%%%%%%%%%%%%%%%%%%%%
% Configura��o das refer�ncias

\RequirePackage[numbers,sort&compress]{natbib}
%\usepackage[authoryear,sort&compress]{natbib}

\bibliographystyle{apalike}

% Colocar n�mero (se��o) na parte de refer�ncias
\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}
\renewenvironment{thebibliography}[1]{
        \section*{\bibname}%
        \list{
                \@biblabel{\@arabic\c@enumiv}
        }{
                \settowidth\labelwidth{\@biblabel{#1}}%
                \leftmargin\labelwidth
                \advance\leftmargin\labelsep
                \@openbib@code
                \usecounter{enumiv}%
                \let\p@enumiv\@empty
                \renewcommand\theenumiv{\@arabic\c@enumiv}
        }
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000%
        \sfcode`\.\@m
}{
        \def\@noitemerr
        {\@latex@warning{Empty thebibliography environment}}
        \endlist
}


%%%%%%%%%%%%%%%%%%%
% Configura��o e corre��es nas regras para formata��o de notas de rodap�

% Corretly format the footnotes
% stable: Remove title's footnote mark from TOC.
% multiple: Adds a command between multiple sequencial footnote marks
% marginal,flushmarginal: Keeps the footnotes within the margin and without indentation
% bottom: Footnotes will be inserted always at the page's bottom.
\RequirePackage[bottom,marginal,flushmargin,stable,multiple]{footmisc}

% Keep the footnote mark within the text area.
% http://tug.org/TeXnik/mainFAQ.cgi?file=footnotes/footnotes
\newlength{\myFootnoteWidth}
\newlength{\myFootnoteLabel}
\setlength{\myFootnoteLabel}{.8em}%  <-- can be changed to any valid value
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}%
}



%%%%%%%%%%%%%%%%%%%%
% Miscel�neas

% Par�grafo
\setlength{\parskip}{3pt}

% Configura��o do espa�amento entre linhas (1,5)
\RequirePackage{setspace}
\onehalfspace

%  Forbids widow lines
\widowpenalty = 10000
\clubpenalty = 10000

% Hacks suggested by Axel Reichert at de.comp.text.tex (removes several LaTeX warnings)
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\vfuzz \hfuzz
\raggedbottom

% Control floats placement.
\RequirePackage{float}
\restylefloat{table}
\restylefloat{figure}
\floatplacement{table}{!htb}
\floatplacement{figure}{!htb}


% Folha de rosto e capa
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\thispagestyle{empty}
		\newpage
		\null
		\centering
		\small{\textsf{\allcaps{\@author}}} \par
		\vspace{3cm}
		\Large \textbf{\@doctype} \par
		\Large \textbf{\@title} \par
		\vspace{1cm} 
		\Large \textsf{-- \@subtitle{} --} \par
		\vfill
		\large \@project \par
		\normalsize {\textbf{\allcaps{\@alternativeproject}}} \par
		\large Apoio \@sponsor \par
		\vspace{0.4cm}
		\@date
 	\end{titlepage}
	\clearpage
	\thispagestyle{empty}
	\cleardoublepage
}


\RequirePackage[bf,hang]{caption}

% Remove o nome do cap�tulo dos cabe�alhos das p�ginas
\renewcommand{\chaptermark}[1]{
}

% Remove o nome das se��es dos cabe�alhos das p�ginas
\renewcommand{\sectionmark}[1]{
}

\RequirePackage{fancybox}

%%%%%%%%%%%%%%%%%%%%%%%%
% Title definitions
%
% The 'titlesec' package is fabulous! Changing the \chapter and friends is a nightmare. That
% package makes the job easy, piece of cake actually!
%
% noindentafter: Do not indent the first paragraph after a title definition
% rigidchapters: Set a fixed space for chapters
% nobottontitles*: Do not allow a title hanging at the botton (like a widow line)
% largestsep: Uses the largest space between two following titles.
% clearempty: Do not show the page number in an empty page (pretty common in doubleepage docs).
\RequirePackage[noindentafter,rigidchapters,nobottomtitles*,largestsep,clearempty]{titlesec}

% Add a dot after the section/subsection/etc counters.
\titlelabel{\thetitle.\quad}

% Redefine the 'chapter' title format.
% encoding, family, series, shape, size
\DeclareFixedFont{\chapternumberfont}{T1}{phv}{bx}{n}{100pt}
\DeclareFixedFont{\chaptertextfont}{\encodingdefault}{\sfdefault}{\bfdefault}{\scdefault}{40pt}
\newcommand{\chapterformat}[1]{
	\put(0,50){\parbox[b]{\linewidth}{\chaptertextfont\filright#1}}
%	\parbox[b]{\linewidth}{\Huge\sffamily\filright#1}
}

% \titlespacing{\chapter}{0pt}{-400pt}{100pt}
\titleformat{\chapter}[block]% Shape
	{\begin{picture}(450,180)}% Format (width,height)
	{% Label
		\put(450,160){
			\makebox(0,0)[rb]{
					\shadowbox{\chapternumberfont\thechapter}
			}
		}
	}
	{0pt}% Horizontal separation between label and title body
	{\chapterformat}% Code preceding the title body
	[\end{picture}]% Code after the title body

% titlespacing{<command>}{<left>}{<before>}{<after>}[<right>]
\titlespacing{\section}{0pt}{2.5em}{1em}[0pt]


% Bug 94 (Uso indevido de markboth).
% Causa a inser��o do t�tulo do cap�tulo no cabe�alho da p�gina.
\if@twoside
	\def\ps@headings{
		\let\@oddfoot\@empty
		\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil}
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\else
	\def\ps@headings{
		\let\@oddfoot\@empty
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\fi

% Bug 94
\renewcommand\tableofcontents{
	\cleardoublepage
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\contentsname}
	\@starttoc{toc}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoffigures{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listfigurename}
	\@starttoc{lof}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewcommand\listoftables{
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter*{\listtablename}
	\@starttoc{lot}
	\if@restonecol
		\twocolumn
	\fi
}

% Bug 94
\renewenvironment{theindex}{
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\columnseprule \z@
	\columnsep 35\p@
	\twocolumn[\@makeschapterhead{\indexname}]
	\thispagestyle{plain}\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\let\item\@idxitem
}{
	\if@restonecol
		\onecolumn
	\else
		\clearpage
	\fi
}
