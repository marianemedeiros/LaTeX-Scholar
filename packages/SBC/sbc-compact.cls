% LaTeX definitions for SBC 2001 style
%
% Created by Jomi Hubner & Rafael Bordini, june 2001
% updated march 2005
%
% Changed by Marco Aur�lio Graciotto Silva (Oct/2006).
% Now it is a class, not a package

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbc}[2006/10/26 Customized SBC article]

\DeclareOption{onecolumn}{
	\PassOptionsToClass{11pt,onecolumn}{article}
}

\DeclareOption{twocolumn}{
	\PassOptionsToClass{10pt,twocolumn}{article}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{oneside,a4paper}
\ProcessOptions

\LoadClass{article}


% Habilitar a utiliza��o de figuras
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}

\RequirePackage{url}
\def\UrlFont{\tt\fontseries{uc}\fontsize{10}{1}\selectfont}


% Altera��o das margens das p�ginas
\RequirePackage[pdftex]{geometry}
% margem sup 3.5 cm: h� 1,5 cm para header, + 2 cm para top
% margem inf 2.5 cm: h� 1,5 cm para foot, + 1 cm para bottom
% margem esq/dir 3 cm
\geometry{a4paper,top=3.5cm,left=3cm,right=3cm,bottom=2.5cm}

% Impede a hifeniza��o do conte�do definido na macro \srccode.
\RequirePackage{hyphenat}

% Macro utilizada para termos em ingl�s.
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Macro utilizada para trechos de c�digo-fonte inseridos no meio do texto.
\newcommand\srccode[1]{\foreignlanguage{english}{\textnhtt{\small{#1}}}}

% Utilizado para listagens de c�digo-fonte
\RequirePackage{listings}

% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
\renewcommand{\lstlistingname}{Exemplo}
\renewcommand{\lstlistlistingname}{Lista de exemplos}

% Define os estilos a serem utilizados nos ambientes lstlistings.
\lstset{basicstyle=\tiny}
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

\setlength{\parindent}{1cm}
\setlength{\parskip}{1pt}

% TODO: captions2 is obsoleted by new 'caption'.
% captions
\RequirePackage[bf,sf,footnotesize]{caption2}
\setlength{\captionmargin}{0.0cm}
\renewcommand{\captionfont}{\sffamily\footnotesize\bfseries}
\renewcommand{\captionlabeldelim}{.}

% font
% \RequirePackage{times} % Obsoleted
\RequirePackage{mathptmx}
\RequirePackage[scaled=.9]{helvet}
\RequirePackage{courier}

\renewcommand{\normalsize}{\@setfontsize\normalsize\@xiipt\@xivpt}
\newcommand{\XIIIPT}{\@setfontsize\xiiipt{13}{17}}
\newcommand{\XVIPT}{\@setfontsize\xvipt{16}{20}}

% new commands
\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\texttt{#1}}
\renewcommand{\and}{, }

% to avoid [...] in the bibliography
% \item[] instead of \item[\@biblabel{#1}\hfill]
\def\@lbibitem[#1]#2{\item[]\if@filesw
      {\let\protect\noexpand
       \immediate
       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}
\renewenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \itemindent -\leftmargin
            \itemsep 0pt
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


% itens
\setlength\leftmargini   {1.27cm}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength  \labelsep    {.5em}
\setlength  \labelwidth  {\leftmargini}
\addtolength\labelwidth  {-\labelsep}
\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ \@plus1\p@ \@minus\p@
            \topsep 0\p@ \@plus2\p@ \@minus4\p@
            \itemsep0\p@}
\let\@listi\@listI
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus2\p@ \@minus\p@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    0\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@}


% sections
\renewcommand\section{\@startsection
	{section}
	{1}
	{\z@}%
	{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\normalfont\XIIIPT\bfseries\boldmath\rightskip=\z@ \@plus 8em\pretolerance=10000 }
}

\RequirePackage{titlesec}
\titlelabel{\thetitle.\hspace{1ex}}


\pagestyle{empty}

\newcommand{\authortag}[1]{$^{#1}$}

\def\address#1{\gdef\@address{#1}}

\def\@maketitle{
	\newpage
	\begin{center}
	\vspace*{-.7cm}
	{\XVIPT\bf\@title\par}
	\vglue 6pt plus 3pt minus 3pt
	{
		\normalsize
		\textbf{
			\begin{tabular}[t]{c}
				\@author
			\end{tabular}
		}
	}
	\vglue 6pt plus 3pt minus 3pt
	{
		\normalsize
		\begin{tabular}[t]{c}
			\inst{\instnum}\@address
		\end{tabular} \par
	}
	\vglue 6pt plus 3pt minus 3pt
	\end{center}
	\par
}
\let\maketitleOLD\maketitle
\renewcommand{\maketitle}{\maketitleOLD\thispagestyle{empty}}

\renewenvironment{abstract}{%
      \list{}{\advance\topsep by6pt\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Abstract.]\itshape}%
      {\endlist}

\newenvironment{resumo}{%
      \list{}{\advance\topsep by6pt\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Resumo.]\itshape}%
      {\endlist}
