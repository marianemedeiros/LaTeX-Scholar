%==========================================================================
% RITA.cls - estilo de artigo para a Revista RITA
%
% v0.2 2002/07/30 avila
% - corrigida gera��o dos footnotes
% v0.1 2002/07/25 avila
% - vers�o inicial
%
% Copyright (C) 2002 Rafael �vila
% Instituto de Inform�tica - UFRGS
% Porto Alegre, Brasil
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%==========================================================================

%==========================================================================
% Identifica��o
%==========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RITA}[2002/07/30 v0.2 Artigo para a Revista RITA]

%==========================================================================
% Declara��es preliminares
%==========================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twoside]{article}
\RequirePackage{times}

%==========================================================================
% Comandos para informa��es adicionais no pre�mbulo
%==========================================================================
%\newcommand{\inst}[1]{\textsuperscript{#1}}
%\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\RITAvolume}[1]{\gdef\@RITAvolume{#1}}
\newcommand{\RITAnumber}[1]{\gdef\@RITAnumber{#1}}
\newcommand{\RITAyear}[1]{\gdef\@RITAyear{#1}}

%==========================================================================
% Margens e tamanho da p�gina
%==========================================================================
\setlength{\paperwidth}{16cm}\setlength{\paperheight}{23cm}
\setlength{\textwidth}{13cm}\setlength{\textheight}{17cm}
\setlength{\oddsidemargin}{1.5cm}
\setlength{\headheight}{\baselineskip}
\setlength{\topmargin}{1.5cm}
\setlength{\headsep}{1.5cm}\addtolength{\headsep}{-\headheight}
\setlength{\footskip}{1.5cm}\addtolength{\footskip}{.5\baselineskip}
\addtolength{\topmargin}{-1in}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}

%==========================================================================
% Defini��es diversas
%==========================================================================
\setlength{\parindent}{1cm}
\setlength{\parskip}{.21cm \@plus \p@}
\newcommand{\RITAname}{\mbox{RITA}}
\newcommand{\volumename}{Volume}
\newcommand{\numbername}{N{\'u}mero}
\newcommand{\abstractinenglishname}{Abstract}

%==========================================================================
% Cabe�alho e rodap�
%==========================================================================
\def\@RITAfootinfo{%
	\RITAname\ $\bullet$
	\volumename~\@RITAvolume\ $\bullet$
	\numbername~\@RITAnumber\ $\bullet$ \@RITAyear%
}
\def\ps@RITA{
	\def\@oddhead{%
	        \underline{\parbox[b]{\textwidth}{\hspace*{\fill}\@title}}
	}
	\def\@evenhead{%
	        \underline{\parbox[b]{\textwidth}{\@title\hfill}}
	}
	\def\@oddfoot{\@RITAfootinfo\hfill\thepage}
	\def\@evenfoot{\thepage\hfill\@RITAfootinfo}
}
\def\ps@RITAfirstpage{\ps@RITA\let\@oddhead\@empty\let\@evenhead\@empty}
\pagestyle{RITA}

%==========================================================================
% T�tulo
%==========================================================================
\renewcommand{\maketitle}{%
	\thispagestyle{empty}%
	\begin{center}
        \noindent{\Large\textbf{\@title}\par}
	{\let\and\\\@author}
	\end{center}
}

%==========================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==========================================================================
\renewenvironment{abstract}{%
        \begin{center}
	\begin{minipage}{12cm}
	{\large\textbf{\abstractname:}}
}{
        \end{minipage}
	\end{center}
}

\newenvironment{abstractinenglish}{
        \def\abstractname{\abstractinenglishname}
	\begin{abstract}
}{
        \end{abstract}
}

%==========================================================================
% Formata��o das se��es
%==========================================================================
\renewcommand{\section}{%
	\@startsection{section}{1}{0pt}{.49cm}{.21cm}
		      {\reset@font\large\bfseries}
}
\renewcommand{\subsection}{%
	\@startsection{subsection}{2}{0pt}{.42cm}{.07cm}{\reset@font\bfseries}
}
\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{0pt}{.28cm}{-1em}
		      {\reset@font\bfseries}
}
\renewcommand{\paragraph}{%
	\@startsection{paragraph}{4}{0pt}{.28cm}{-1em}{\reset@font\itshape}
}

%==========================================================================
% Formata��o das legendas de figuras e tabelas
%==========================================================================
\def\@makecaption#1#2{
        \vspace{\abovecaptionskip}
        \parbox{\textwidth}{\centering\textbf{#1.}~#2}% nao remover este `%'
        \vspace{\belowcaptionskip}
}

%==========================================================================
% Formata��o das notas de rodap�
%==========================================================================
\renewcommand\@makefntext[1]{%
       \parbox[t]{\textwidth}{\mbox{\@makefnmark}#1}
}
