%% $Header: https://projects.cs.ru.is/svn/foley-research/trunk/Proposals/exchange/2015/volkan.gokturk/recommendation.cls 450 2015-03-09 09:29:59Z foley $
%% $Id: ruletter.cls 28 2018-02-19 22:41:23Z foley $
%% Reykjavik University Recommendation Class file
%% Initial version by Joe Foley <foley@RU.IS>
%% Created on 2015-01-06
%% This code is distributed under the Perl Artistic License
%% http://language.per.com/misc/Artistic.html
%% Some code is derived from the IEEE LaTeX class, RU ad-hoc
%% wireless project labeling system, and RU CS M.Sc. Thesis and Report template

%% --------------- Identification ----------------------------
\newcommand{\fileversion@ruletter}{v0.2}
\newcommand{\filedate@ruletter}{2015/01/06}
\newcommand{\fileauthor@ruletter}{Joe Foley, foley@RU.IS}
\ProvidesClass{ruletter}[\filedate@ruletter by \fileauthor@ruletter]
\NeedsTeXFormat{LaTeX2e}
\typeout{Reykjavik University Letter(with head) class: \fileversion@ruletter from <\filedate@ruletter>, by \fileauthor@ruletter}

%% ---------------- Initial Code -----------------------------
\RequirePackage{ifthen}
% This package allows you to create conditionals on booleans
\RequirePackage{ifdraft}

%% ---------------- Declaration of Options--------------------
%% Remember that we have \AtEndOfClass{},\AtEndOfPackage{}
%%     \AtBeginDocument{}, \AtEndDocument{}
%% If you want execution conditional on file existence
%%     \IfFileExists{filename}{true}{false}
%%     \InputIfFileExists{filename}{true}{false}
%% For error reporting
%%     \ClassError{class-name}{error-text}{help-text}
%%     \PackageError{class-name}{error-text}{help-text}

%% now we pass the remaining unused options to our parent class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
%% ---------------- Execution of Options -----------------------------
\ProcessOptions \relax % this stops searching for a * in
                       % \ProcessOtions*

%% Alternative way to subclass.  Disable the other option processing
%% if you enable it.  This will dump all options onto the parent class
%\ProcessOptions\LoadClassWithOptions{letter}
%% ---------------- Package Loading -----------------------------
\LoadClass{letter}  % our parent class.  
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}  % allows UTF encoding, needed for Icelandic characters
\RequirePackage{calc} % operators to do math with lengths

\RequirePackage[margin=20mm, top=29mm, bottom=19mm, a4paper]{geometry}
%% Some slighly more sensible margins on an A4 page
%% This can be tuned for your given report

\RequirePackage{fancyhdr}
%% Nice options for tweaking the header and footer

%% Some useful fonts
%% http://www.macfreek.nl/memory/Fonts_in_LaTeX
%% http://www.tug.dk/FontCatalogue/
%%
%\RequirePackage{lmodern}
%\RequirePackage{times}
%\RequirePackage{palatino}
%\RequirePackage{bookman}
%\RequirePackage{newcent}
%\RequirePackage{helvet}
%\RequirePackage{courier}

\RequirePackage{lipsum}
%% Test text: \lipsum[1]

\RequirePackage[final]{graphicx}
%% We give the "final" option so that it always includes graphics
%% Take out this option if you want draft mode to skip pics

\DeclareGraphicsExtensions{.pdf,.jpeg,.jpg,.png,.gif,.PDF,.JPEG,.JPG,.PNG,.GIF}
%% The extensions that it will search for as valid graphics files
%% We need To include the UPPERCASE versions For windows people

\graphicspath{{graphics/}{Graphics/}{../graphics}{./}}
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
%% By default, set to 1.5 spacing with a value of 1.3
%% Single spacing: 1
\linespread{1}  % this method does not require the setspace package

% If we want san-serif
%\renewcommand{\familydefault}{\sfdefault}

%% ---------------- Main Code -----------------------------
%%  Remember that we can declar commands (to make fragile things safe)
%%  The * form is for ``short'' commands, not longer than a paragraph
%%       \DeclareRobustCommand{cmd}[num][default]{definition}
%%       \DeclareRobustCommand*{cmd}[num][default]{definition}
%%  For checking if commands are redefined
%%       \CheckCommand{cmd}[num][default]{definition}

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

\RequirePackage{color}
%% The "color" package allows us to set the color of text and other
%% objects in a document
\definecolor{rugray}{rgb}{0.2,0.2,0.2}
\definecolor{rured}{rgb}{0.84,0.10,0.13}
%% We set some of the standard colors used at RU


\AtBeginDocument{
  \RequirePackage[final, hidelinks]{hyperref}
%% Hyper references (clickable links) in the document.  Very nice, but
%% MUST be the last package loaded.  If you are in draft mode, it will
%% disable itself, so we force it to be in final mode.
%% Warning: This doesn't always play well with biblatex.  You may have to put it
%%   manually just before \begin{document}
}

%% Header/footer adjustments on letter
%% On Top:  RU logo is 30.4mm diameter.  Top gap is 9.4mm.  Bottom is 40mm from top edge.
%% On bottom:  Font base height is 1.80mm, width 130.5mm.   Bottom gap 8.9mm
\newcommand{\rulogofile@ruletter}{ru-logo}
\newcommand{\setlogo}[1]{\renewcommand{\rulogofile@ruletter}{#1}}
\newcommand{\letterheadstyle}{
  \fancyhf{}
  \fancyhead[C]{
    \includegraphics[height=31mm]{\rulogofile@ruletter}
  }
  \fancyfoot[C]{
    \tiny\textsf{HÁSKÓLINN Í REYKJAVÍK | Menntavegur 1 | 101 Reykjavík | Ísland/Iceland | Sími/Tel +354-599-6200 | hr@hr.is | \textcolor{red}{www.hr.is}}
  }
  % lastpage doesn't work well with multiple letters
  %\fancyfoot[R]{Page \thepage{} of \pageref{LastPage}}
  \renewcommand{\headrulewidth}{0pt} % no line
  \renewcommand{\footrulewidth}{0pt} % no line
}
\newlength{\mytextsize}
\setlength{\mytextsize}{\f@size pt}
\setlength{\headheight}{92.3pt} % to make fancyhdr happy with RU logo
\addtolength{\textheight}{-\headheight+\mytextsize} % subtract adjustment minus pt size (11)

\letterheadstyle{}

%% To override the pagestyles in the Letter class, we have to set them with the same names
%% This is necessary for the pages to have the letterhead's footer and header.

% first page style if \address is NOT used
\fancypagestyle{firstpage}{\letterheadstyle}
% first page style if \address used
\fancypagestyle{empty}{\letterheadstyle}
\fancypagestyle{plain}{\letterheadstyle}

\pagestyle{firstpage}
\thispagestyle{firstpage}

%% This will load custom.tex with your custom macros and definitions if it exists
%% We load this last so that it can overrite any existing settings
\IfFileExists{custom.tex}{\input{custom.tex}}{}

%% ---------------- End of Class --------------------------
%%% Local Variables:
%%% mode: latex
%%% TeX-master: acceptance-letter.tex
%%% End:
