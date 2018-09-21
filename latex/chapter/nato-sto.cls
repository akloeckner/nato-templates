% Definition of nato-sto.cls
% Clone from: https://github.rcac.purdue.edu/CarloScaloGroup/nato-templates.git
%
% Developed by:
%	Danish Patel and Carlo Scalo
%	Purdue University
%	West Lafayette, IN 47907

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{nato-sto}[2007/09/19 v1.3.3 NATO RTO MP papers or ENs (unofficial)]

% class options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}%
                \typeout{Unknown option: passing ``\CurrentOption"
                         option on to the underlying LaTeX article class.}}
\ProcessOptions

% use article class as base
\LoadClass[letterpaper,twoside,11pt]{article}

%%
% page layout
\RequirePackage[letterpaper,
                hmargin=0.87in,
                tmargin=1.3in,
                headheight=1in,
                headsep=0.3in,
                footskip=2\baselineskip,
                bmargin=1.06in]{geometry}

%%
% accommodate images
\RequirePackage{graphicx}

% default behavior
\setkeys{Gin}{ width=\linewidth, totalheight=\textheight, keepaspectratio }

% image search path
\graphicspath{{graphics/}}


% page header/footer
\RequirePackage{fancyhdr}

% The variable \papernumber has been made obsolete in this version
% paper number, publication reference, and classification commands
% parallel to \title/\@title definitions from base/latex.ltx
%\def\papernumber#1{\gdef\@nato@sto@paper@number{#1}}
%\def\@nato@sto@paper@number{%
%  \@latex@error{No \noexpand\papernumber supplied}\@ehc}

\def\publicationreference#1{\gdef\@nato@sto@publication@reference{#1}}
\def\@nato@sto@publication@reference{%
  \@latex@error{No \noexpand\publicationreference supplied}\@ehc}

\def\classification#1{\gdef\@nato@sto@classification{#1}}
\def\@nato@sto@classification{%
  \@latex@warning@no@line{No \noexpand\classification given,
                          leaving empty => UNCLASSIFIED/UNLIMITED}
  \gdef\@nato@sto@classification{}}

% header/footer rules
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}

% plain page style used by \maketitle (first page)
\fancypagestyle{plain}{%
  \fancyhf{} % clear all fields
  \lhead{\includegraphics[width=1in]{nato-otan_logo}\vspace{0.0002in}}
  \rhead{\includegraphics[width=0.7in]{nato-sto_logo}\hspace{-0.35cm}\vspace{0.0002cm}}
  \lfoot{\bfseries\sffamily\footnotesize \@nato@sto@publication@reference}
  \rfoot{\bfseries\sffamily\footnotesize \@nato@sto@paper@number - \thepage}
  \rfoot{\bfseries\sffamily\footnotesize\chapternumber\thepage}
  \chead{\raisebox{2.5\baselineskip}%
                  {\bfseries\sffamily\small
                   \MakeUppercase{\@nato@sto@classification}}}
  \cfoot{
  		\raisebox{-1.75\baselineskip}%
                  {\bfseries\sffamily\small
                   \MakeUppercase{\@nato@sto@classification}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chapter number and name commands
\newcommand{\setchapternumber}[1]{\newcommand{\chapternumber}{#1~--~}\setrawchapternumber{#1}}
\newcommand{\setchaptername}[1]{\title{Chapter \chapternumber \MakeUppercase{#1}} \setrawchaptername{#1}}
\newcommand{\setrawchapternumber}[1]{\newcommand\rawchapternumber{#1}}
\newcommand{\setrawchaptername}[1]{\newcommand\rawchaptername{\MakeUppercase{#1}}}
\newcommand{\setrunningtitle}[1]{\newcommand\headerTitleSplit{#1}}
\newcommand{\setNumberOfLinesForRunningTitle}[1]{
    \begin{switch}{#1}
        \case{1}{

        }
        \case{2}{

        }
        \case{3}{

       }
        \case{4}{

        }
    \end{switch}
}

% nominal page style
\pagestyle{fancy}
\fancyhf{} % clear all fields

%% RO header
\fancyhead[RO]{\begin{minipage}[b]{0.8\textwidth}\flushright \bfseries\sffamily 
\headerTitleSplit
\vspace{0.0502in}\end{minipage}}
%% LE header
\fancyhead[LE]{\begin{minipage}[b]{0.8\textwidth}\bfseries\sffamily 
\headerTitleSplit
\vspace{0.0502in}\end{minipage}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\fancyhead[LO]{\includegraphics[width=0.91in]{nato-otan_logo}\vspace{0.0002in}}
\fancyhead[RE]{\includegraphics[width=0.7in]{nato-sto_logo}\hspace{-0.35cm}\vspace{0.0002in}}
\fancyfoot[LO,RE]{\bfseries\sffamily\footnotesize
                  \@nato@sto@publication@reference}
\fancyfoot[RO,LE]{\bfseries\sffamily\footnotesize
                  \chapternumber\thepage}
\fancyhead[C]{\raisebox{2.5\baselineskip}
                       {\bfseries\sffamily\small
                        \MakeUppercase{\@nato@sto@classification}}}
\fancyfoot[C]{\raisebox{-1.75\baselineskip}
                       {\bfseries\sffamily\small
                        \MakeUppercase{\@nato@sto@classification}}}
%% Legend for letters
% E: Even page
% O: Odd page
% L: Left field
% C: Center field
% R: Right field
% H: Header
% F: Footer



% Use required font
\RequirePackage{times}

%%
% Colors
\RequirePackage{xcolor}

\definecolor{darkblue}{rgb}{0.0,0.0,0.5}
\definecolor{natoblue}{rgb}{0.95,0.84,0.31}

% Enable hyperlinks
\RequirePackage[hyperfootnotes=false,
                hyperfigures,
                breaklinks,
                colorlinks,
                urlcolor=natoblue,
                filecolor=natoblue,
                citecolor=black,
                linkcolor=natoblue,
                pagecolor=black,
                menucolor=black,
                anchorcolor=black]{hyperref}

% Citations
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{hypernat}

%%
% Titling -- modified version of latex/base/article.cls

\renewcommand\maketitle{
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@
    \@maketitle
    \thispagestyle{plain}\@thanks
%    \enlargethispage{-2cm}% reserve space NATO-sto publication footnote
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \begin{center}%
    \let \footnote \thanks
    {\titlefontsize\bfseries \textcolor[rgb]{0.5,0,0}{\@title} \par}%
    \vskip 1em%
    {\normalsize
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%

\vspace{-0.18cm}
}

%%
% Abstract

\renewenvironment{abstract}%
  {\section*{\itshape\MakeUppercase\abstractname}\itshape}%
  {\vskip 1em}

% Author name settings --- need to expand to multiple authors
\newcounter{numauthors}		% This counter keeps track of how many authors have been added
\newcounter{numaffil}		% Counter for affiliations
\newcounter{numcountry}		% Counter for country

%\setcounter{numauthors}{1} \setcounter{numaffil}{1} \setcounter{numcountry}{1}

\newcommand{\setauthorlist}[1]{
	\stepcounter{numauthors}
	\expandafter\newcommand\csname authorlist\Alph{numauthors}\endcsname{#1}
}

\newcommand{\setauthoraffiliation}[1]{
	\stepcounter{numaffil}
	\expandafter\newcommand\csname authoraffiliation\Alph{numaffil}\endcsname{#1}
}

\newcommand{\setauthorcountry}[1]{
	\stepcounter{numcountry}
	\expandafter\newcommand\csname authorcountry\Alph{numaffil}\endcsname{#1}
}

\RequirePackage{forloop}
%%%%%%%%%%%%%%
%\author{
%		{\large \bf \authorlistA}\\ 
%		\authoraffiliationA\\ 
%		\MakeUppercase{\authorcountryA}\\
%		{\large \bf \authorlistB}\\ 
%		\authoraffiliationB\\ 
%		\MakeUppercase{\authorcountryB}
%	  }

\newcounter{authorloopcounter}
\author{
	\forloop[1]{authorloopcounter}{1}{\not{\value{authorloopcounter}>\value{numauthors} }}{
		{\large \bf \csname authorlist\Alph{authorloopcounter}\endcsname}\\
		{\csname authoraffiliation\Alph{authorloopcounter}\endcsname}\\
		\ifnum\value{authorloopcounter}<\value{numauthors}
			\vspace{0.06in}
		\fi
		{\MakeUppercase{\csname authorcountry\Alph{authorloopcounter}\endcsname}}
		\ifnum\value{authorloopcounter}<\value{numauthors}
			\\
		\fi	
	}
}


%%%%%%%%%%%%%%

% Section headers -- modifying those from base/article.cls

\RequirePackage{titlecaps}
\setcounter{secnumdepth}{4}

\renewcommand\Large{\@setfontsize\Large{13pt}{18}}
\newcommand\titlefontsize{\@setfontsize\LARGE{15pt}{21}}

\renewcommand\thesection      {\rawchapternumber.\@arabic\c@section}
%\renewcommand\thesubsection   {\thesubsection}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                     {-3.5ex \@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus.2ex}%
                                     {\normalfont\Large\bfseries\uppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\large\bfseries\titlecap}}		% subsections font size 12
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\normalsize\bfseries\titlecap}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                      {-3.25ex \@plus -1ex \@minus -.2ex}%
                                      {1ex \@plus .2ex}%
                                      {\normalfont\normalsize\itshape\titlecap}}

%%
% List of words to be made lowercase even in titles
\Addlcwords{for a is but and with of in as the etc on to if}
%%

% To make references section name upper case -- original from latex.ltx
\renewenvironment{thebibliography}[1]
     {\section{references}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
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
%%

% Defining bullet points
\RequirePackage{enumitem}

%\renewcommand{\labelitemi}{{\tiny\textbullet}}
%\renewcommand{\labelitemii}{{\tiny\textbullet}}
%\renewcommand{\labelitemiii}{{\tiny\textbullet}}

\renewcommand{\labelenumi}{\theenumi)}
\renewcommand{\labelenumii}{\theenumii)}
\renewcommand{\labelenumiii}{\theenumiii)}

%\setlist[itemize,1]{leftmargin=\dimexpr 26pt-.5in}

\setlist[itemize,1]{leftmargin=*, labelindent=0.65cm, labelsep=0.65cm, label={\tiny\textbullet}}
\setlist[itemize, 2, 3, 4, 5]{leftmargin=0.65cm, labelsep=0.65cm, label={\tiny\textbullet}}

\setlist[enumerate, 1]{leftmargin=*, labelindent=0.65cm, labelsep=0.65cm}
\setlist[enumerate, 2, 3, 4, 5]{leftmargin=0.65cm, labelsep=0.65cm}

% Caption font -- original from base/article.cls
\renewcommand{\thefigure}{\rawchapternumber-\@arabic\c@figure}
\renewcommand{\thetable}{\rawchapternumber-\@arabic\c@table}

\RequirePackage{stringstrings}
%\RequirePackage{titlesec}

\long\def\@makecaption#1#2{%
%  \vskip\abovecaptionskip
 \sbox\@tempboxa{\footnotesize\bfseries\sffamily #1: #2}%
  \ifdim \wd\@tempboxa > \hsize
    \footnotesize\bfseries\sffamily
    #1: {#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\abovecaptionskip}

% Footnotes
\RequirePackage{scrextend}
%\deffootnote[0.6cm]{1cm}{1cm}{\textsuperscript{\thefootnotemark}\hspace{0.25cm}}
\deffootnote[0.65cm]{0.65cm}{0em}{\textsuperscript{\thefootnotemark}\hspace{0.25cm}}


% Setting paragraph spacing
\setlength{\parskip}{12pt}
%%
% Insert NATO logo page if document has an odd number of pages --
% adapted from Piet van Oostrum's fancyhdr documentation

% Danish -- this might be needed in the collection/book but is definitely not needed for individual chapters
\AtEndDocument{
  \clearpage
  \ifodd\c@page
    \relax
  \else
    \hbox{}
    \vspace*{\fill}
    \begin{center}
      \includegraphics[width=0.51in]{nato_star_black}
    \end{center}
    \vspace{\fill}
    \newpage
  \fi
}

