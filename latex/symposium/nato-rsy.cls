% Definition of nato-sto.cls
% Clone from: https://github.rcac.purdue.edu/CarloScaloGroup/nato-templates.git
%
% Developed by:
%	Carlo Scalo's Group
%	Purdue University
%	West Lafayette, IN 47907

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{nato-rsy}[2007/09/19 v1.3.3 NATO RTO MP papers or ENs (unofficial)]

% class options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{nato-sto}%
                \typeout{Unknown option: passing ``\CurrentOption"
                         option on to the underlying LaTeX article class.}}
\ProcessOptions

% use NATO sto chapter class as base
\LoadClass{nato-sto}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alterations of the original nato-sto class

% This should be part of the class really, and not part of the document
\RequirePackage{xifthen}
\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}

% Remove Chapter number from headings
\renewcommand\thesection {\@arabic\c@section}

% Use per-section numbering for figures and tables
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\renewcommand{\thefigure}{\@nameuse{thesection}-\arabic{figure}}
\renewcommand{\thetable} {\@nameuse{thesection}-\arabic{table}}

% Start sections with #1
\setcounter{section}{0}

% Set sensible defaults for the running title
\setNumberOfLinesForRunningTitle{1}
\setrunningtitle{\@title} 

% Create an additional author field for email address
\newcounter{nummail}		% Counter for email
\newcommand{\setauthormail}[1]{
	\stepcounter{nummail}
	\expandafter\newcommand\csname authormail\Alph{nummail}\endcsname{#1}
}

% Redefine the \author macro to fit the paper needs
\RequirePackage{url}
\author{
	\forloop[1]{authorloopcounter}{1}{\not{\value{authorloopcounter}>\value{numauthors} }}{
		{\large \bf \csname authorlist\Alph{authorloopcounter}\endcsname}\\
		{\csname authoraffiliation\Alph{authorloopcounter}\endcsname}\\
		{\MakeUppercase{\csname authorcountry\Alph{authorloopcounter}\endcsname}}\\
		\ifnum\value{authorloopcounter}<\value{numauthors}
			\vspace{0.06in}
		\fi
		{\url{\csname authormail\Alph{authorloopcounter}\endcsname}}\\
		\ifnum\value{authorloopcounter}<\value{numauthors}
			\\
		\fi	
	}
}

% Provide some  additional commands for papers to hook into existing provisions
\let\setpapernumber\setchapternumber
\let\papernumber\setchapternumber
\let\subject\publicationreference

% Make author be simpler usable
\def\oneauthor#1\\#2\\#3\\#4\\#5\and{
	\setauthorlist{#1}
	\setauthoraffiliation{#2\newline#3}
	\setauthorcountry{#4}
	\setauthormail{#5}
}
\def\newauthor#1\and#2\done{%
	\def\tmp{#2}
	\oneauthor#1\and
	\ifx\tmp\@empty%
	\else
		\newauthor#2\done
	\fi
}
\def\author#1{\newauthor#1\and\done}

% Pre-set the \bibliographystyle
\bibliographystyle{nato-sto}

% Fix figures always being scaled to columnwidth
\setkeys{Gin}{width=!,totalheight=!,keepaspectratio=false}