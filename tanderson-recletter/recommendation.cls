%% $Header: https://repository.cs.ru.is/svn/foley-research/trunk/Assessment/recommendations/recommendation.cls 568 2015-12-08 21:02:11Z foley $
%% $Id: recommendation.cls 28 2018-02-19 22:41:23Z foley $
%% Reykjavik University Recommendation Class file
%% Initial version by Joe Foley <foley@RU.IS>
%% Created on 2015-01-06
%% This code is distributed under the Perl Artistic License
%% http://language.per.com/misc/Artistic.html
%% Some code is derived from the IEEE LaTeX class, RU ad-hoc
%% wireless project labeling system, and RU CS M.Sc. Thesis and Report template

%% --------------- Identification ----------------------------
\newcommand{\fileversion@recommendation}{v0.1}
\newcommand{\filedate@recommendation}{2015/01/06}
\newcommand{\fileauthor@recommendation}{Joe Foley, foley@RU.IS}
\ProvidesClass{recommendation}[\filedate@recommendation by \fileauthor@recommendation]
\NeedsTeXFormat{LaTeX2e}
%\typeout{Reykjavik University Report Basic template for School of
 % Science and Engineering: \fileversion@recommendation from <\filedate@recommendation>, by \fileauthor@recommendation}

%% ---------------- Initial Code -----------------------------
\RequirePackage{ifthen}
% This package allows you to create conditionals on booleans
\RequirePackage{ifdraft}
\RequirePackage{ifxetex}
\newboolean{letterhead}

%% ---------------- Declaration of Options--------------------
%% Remember that we have \AtEndOfClass{},\AtEndOfPackage{}
%%     \AtBeginDocument{}, \AtEndDocument{}
%% If you want execution conditional on file existence
%%     \IfFileExists{filename}{true}{false}
%%     \InputIfFileExists{filename}{true}{false}
%% For error reporting
%%     \ClassError{class-name}{error-text}{help-text}
%%     \PackageError{class-name}{error-text}{help-text}


%% Fake the letterhead by putting the graphic header and footer in the PDF?
\DeclareOption{letterhead}{
  \setboolean{letterhead}{true}
}

\DeclareOption{isbabel}{ % set Icelandic labels on figures, tables, etc.
  \AtEndOfClass{
    \RequirePackage[icelandic]{babel}
  }
}

\DeclareOption{bibmagic}{
  %% Bibliography magic for letter class if you are using bibtex
  %% This is not needed in the latest template because it uses biblatex/biber
  %%    which are much easier to work with.
%% http://tex.stackexchange.com/questions/18033/using-bibtex-with-letter-class
%\makeatletter
  \AtEndOfClass{
    \newenvironment{thebibliography}[1]
    {\list{\@biblabel{\@arabic\c@enumiv}}%
      {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth{}
        \advance\leftmargin\labelsep{}
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty{}
      \widowpenalty4000%
      \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
    \newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
    % \makeatother
    \bibliographystyle{IEEEtran}
  }}


%% now we pass the remaining unused options to our parent class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
%% ---------------- Execution of Options -----------------------------
\ProcessOptions\relax% this stops searching for a * in
                       % \ProcessOtions*

%% Alternative way to subclass.  Disable the other option processing
%% if you enable it.  This will dump all options onto the parent class
%\ProcessOptions\LoadClassWithOptions{letter}
%% ---------------- Package Loading -----------------------------
\LoadClass{letter}  % our parent class.

%% We give the "final" option so that it always includes graphics
%% Take out this option if you want draft mode to skip pics
\PassOptionsToPackage{final}{graphicx}
\RequirePackage{graphicx}

%% Setting up International character support
\ifxetex{}
  \RequirePackage{fontspec} % font selecting commands
  \RequirePackage{xunicode} % unicode character macros
  \RequirePackage{xltxtra} % a few fixes and extras
\else % pdftex or latex
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}  % allows UTF encoding, needed for Icelandic characters
\fi

%% Nice options for tweaking the header and footer
\RequirePackage{fancyhdr}

% Some useful fonts, particularly for listings
% \RequirePackage{lipsum}
% \RequirePackage{courier}




\DeclareGraphicsExtensions{.pdf,.jpeg,.jpg,.png,.gif,.PDF,.JPEG,.JPG,.PNG,.GIF}
%% The extensions that it will search for as valid graphics files
%% We need To include the UPPERCASE versions For windows people

\graphicspath{{graphics/}{Graphics/}{./}}
%% This is a list of folders to search for graphics files to include
%% Each path should be in a {}.  
%% Make sure that the upper/lowercase of the letters matches the folder or
%% you may have weird problems with partners using other operating systems.
%% Note that you don't have to put the folder where the .tex file is, it is
%% included automatically, though it is bad practice to put your 
%% graphics there
%% declare the paths(s) where you graphics files can be found
%% This allows you to skip putting the full path in
%% If you put a // at the end, it will recursively search for graphics
%% files, but be careful!


\RequirePackage{lastpage}
% The "lastpage" package allows you to set a command that knows
% what the last page was e.g. page 1 of 4

\RequirePackage{url}
%% The url package typesets url's and unix file paths nicely when they
%% become long.  Warning: windows paths such as C:\window do not work!
%% You need another verbatime to make those typeset properly.

\RequirePackage{xspace}
%% The xspace package will try to figure out if you meant to have a
%% space after a new command if you don't give it any arguments (in
%% braces: {} ).  

%% Creates macros to adjust the line spacing more easily
%\onehalfspacing
%% By default, set to 1.5 spacing
\linespread{1}  % this method does not require the setspace package

% % some font package possibilities
% % From http://www.macfreek.nl/memory/Fonts_in_LaTeX
\RequirePackage{lmodern}
%\RequirePackage{times}
%\RequirePackage{palatino}
%\RequirePackage{bookman}
%\RequirePackage{newcent}
%\RequirePackage{helvet}

% If we want san-serif
%\renewcommand{\familydefault}{\sfdefault}

%% ---------------- Main Code -----------------------------
%%  Remember that we can declar commands (to make fragile things safe)
%%  The * form is for ``short'' commands, not longer than a paragraph
%%       \DeclareRobustCommand{cmd}[num][default]{definition}
%%       \DeclareRobustCommand*{cmd}[num][default]{definition}
%%  For checking if commands are redefined
%%       \CheckCommand{cmd}[num][default]{definition}

% this is for the picture environment
\setlength{\unitlength}{1cm}

\RequirePackage{siunitx}  % replacement for SIunits, less problems

\RequirePackage[layout=inline]{fixme}
% FIXME system for making notes to each other for what needs to 
% be completed in a group document.

% internal layouts: inline, margin, footnote, index, marginclue
% % Warning! The pdf external layouts do not play well with hyperref
% % and must be loaded by doing \fxuselayouts{}
% external layouts: marginnote, pdfnote, pdfmargin, pdfsignote, pdfsigmargin
%     pdfcnote, pdfcmargin, pdfcsignote, pdfcsigmargin
%  pdfc stands for pdf color
%\fxuselayouts{pdfcmargin}


%%%% Some packages that RUMSC.sty includes.  Enable as needed
%\RequirePackage[absolute]{textpos}
%\RequirePackage[overload]{textcase}

\RequirePackage{xcolor}
\definecolor{rugray}{rgb}{0.2,0.2,0.2}
\definecolor{rured}{rgb}{0.84,0.10,0.13}
%% The "color" package allows us to set the color of text and other
%% objects in a document

%\AtBeginDocument{
%%  \RequirePackage[final]{hyperref}
%% Hyper references (clickable links) in the document.  Very nice, but
%% MUST be the last package loaded.  If you are in draft mode, it will
%% disable itself, so we force it to be in final mode.
%%}

%% First we need to create some "variables" with defaults and commands
%% defaults
\newcommand{\author@recommendation}{Aaron}
\renewcommand{\author}[1]{\renewcommand{\author@recommendation}{#1\xspace}}


\ifxetex%
%% This fontspec magic allows us to put the required fonts into a fonts/ directory.
%% http://tex.stackexchange.com/questions/12565/load-fonts-that-are-in-a-fonts-directory
%% TODO: \IfFontExistsTF{fontname}{truebranch}{falsebranch}

%\newfontfamily{\rufooterfont}{HelveticaNeueLTStd}
%[ Path = ./fonts/, %% path must end in slash
%UprightFont = *-Roman, SizeFeatures={Size=6},]
\newcommand{\rufooterfont}{\fontspec{HelveticaNeueLTStd}[Path = ./fonts/,%% path must end in slash
  UprightFont = *-Th,  BoldFont = {*-Roman}]}%
\newcommand{\infoline}[1]{{\rufooterfont{}\fontsize{7pt}{7pt}\selectfont #1}}%
\else%
\newcommand{\infoline}[1]{\tiny\textsf{#1}}%
%
\fi%

%% Header/footer adjustments on fake letterhead
%% http://tex.stackexchange.com/questions/42492/put-an-image-header-in-documentclassletter
% first page style if \address not used
\newlength{\logosize}
\setlength{\logosize}{30.4mm}

%% On Top:  RU logo is 30.4mm diameter.  Top gap is 9.4mm.  Bottom is 40mm from top edge.
%% On bottom:  Font base height is 1.80mm, width 130.5mm.   Bottom gap 8.9mm

\newcommand{\rulogofile@ruletter}{ru-logo}
\newcommand{\setlogo}[1]{\renewcommand{\rulogofile@ruletter}{#1}}

\ifthenelse{\boolean{letterhead}}{

  \RequirePackage[margin=20mm, top=20mm, bottom=46mm, headsep=5mm, a4paper]{geometry}
  %% Some slighly more sensible margins on an A4 page

  \newcommand{\letterheadstyle}{
    \fancyhf{}
    \fancyhead[C]{
      \includegraphics[height=\logosize]{\rulogofile@ruletter}
    }
    \fancyfoot[C]{
      \infoline{\color{rugray}{\textbf{Aaron Hale}} | 17 Gauss Way Berkeley, CA 94720 | ahale@msri.org | {www.msri.org | Written in \LaTeX{}}}
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
  }
  \setlength{\headheight}{\logosize}  % make header bigger by the size of the logo
  \addtolength{\headheight}{4.1pt}  % apparently that is not enough
  \letterheadstyle{}

  % first page style if \address is NOT used
  \fancypagestyle{firstpage}{\letterheadstyle}
  % first page style if \address used
  \fancypagestyle{empty}{\letterheadstyle}
  \fancypagestyle{plain}{\letterheadstyle}
  
  \pagestyle{firstpage}
  \thispagestyle{firstpage}
}% End letterhead
{\RequirePackage[margin=20mm, top=44mm, a4paper]{geometry}
  %% Page numbers conflict with the footer
  \thispagestyle{empty}
  \pagestyle{empty}
}% End no letterhead

%% Article style sections
%% http://tex.stackexchange.com/questions/65962/sectioning-in-letter-type-documents
\newcounter{section}
\newcounter{subsection}[section]
\setcounter{secnumdepth}{3}
%\makeatletter
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand \thesection{\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}

%\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   CUSTOMIZATION
%% This will load custom.tex with your custom macros and definitions if it exists
%% We load this last so that it can overrite any existing settings
\IfFileExists{custom.sty}{\input{custom.sty}}{}
\IfFileExists{custom.tex}{\input{custom.tex}}{}
%% set these for if you need to adjust the footers. 

%% ---------------- End of Class --------------------------

% Local Variables:
%%% mode: latex
%%% TeX-master: recommendation-template.tex
%%% TeX-engine: xetex
%%% End:
