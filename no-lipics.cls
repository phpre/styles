%%
%% This is file `no-lipics.cls'.
%%
%% -----------------------------------------------------------------
%% Author:     Dagstuhl Publishing & le-tex publishing services
%%             modified by Philip Wellnitz.
%%
%% This file is part of the lipics package for preparing
%% LIPICS articles. This is a modified version. Do not use to prepare official LIPICS
%% articles.
%%
%% Copyright (C) 2018 Schloss Dagstuhl
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% -----------------------------------------------------------------
%%
\ProvidesClass{no-lipics}
    [2024/11/18 v1.11.4 No-LIPIcs article]
\NeedsTeXFormat{LaTeX2e}[2022/11/01]
\ClassWarningNoLine{no-lipics}{This is a modified version of LIPIcs.\MessageBreak%
DO NOT USE TO PREPARE OFFICIAL LIPICS-STYLE DOCUMENTS\MessageBreak}{}
\newif\if@nobotseplist  \@nobotseplistfalse
\newif\if@claimmode  \@claimmodefalse
\def\@endparenv{%
\addpenalty\@endparpenalty\if@nobotseplist\else\addvspace\@topsepadd\fi\@endpetrue}
\def\@doendpe{%
    \@endpetrue
    \def\par{\@restorepar
        \everypar{}%
        \par
        \if@nobotseplist
            \addvspace\topsep
            \addvspace\partopsep
            \global\@nobotseplistfalse
        \fi
    \@endpefalse}%
    \everypar{{\setbox\z@\lastbox}%
        \everypar{}%
        \if@nobotseplist\global\@nobotseplistfalse\fi
\@endpefalse}}

\def\@title{\textcolor{red}{Author: Please provide a title}}
\let\@subtitle\@empty
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\subtitleseperator{: }

\def\i@parindent{5mm}
\setlength\parindent{\i@parindent}

\def\partn{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@partn\@spart%
}
\def\@partn[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{part}%
        \addcontentsline{toc}{part}{%
            \protect\numberline{\bfseries\partname{} \thepart:}\;
          #1}%
    \else
        \addcontentsline{toc}{part}{ #1}%
    \fi
    {\parindent \z@ \raggedright
        \interlinepenalty \@M
        \normalfont
        \ifnum \c@secnumdepth >\m@ne
            \Large\bfseries \partname\nobreakspace\thepart:
        \fi
        \Large\bfseries #2%
    \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
\@afterheading}

\def\@sect#1#2#3#4#5#6[#7]#8{%
    \ifnum #2>\c@secnumdepth
        \let\@svsec\@empty
    \else
        \refstepcounter{#1}%
        \protected@edef\@svsec{\@seccntformat{#1}\relax}%
    \fi
    \@tempskipa #5\relax
    \ifdim \@tempskipa>\z@
        \begingroup
        #6{%
            \@hangfrom{\hskip #3\relax
                \ifnum #2=1
                    \makebox[\i@parindent]{\colorbox{lightgray}{\kern0.15em\@svsec\kern0.15em}}\kern\i@parindent%
                \else
                    \makebox[\i@parindent]{\@svsec}\kern\i@parindent
            \fi}%
        \interlinepenalty \@M #8\@@par}%
        \endgroup
        \csname #1mark\endcsname{#7}%
        \addcontentsline{toc}{#1}{%
            \ifnum #2>\c@secnumdepth \else
                \ifnum #2>1
                    \protect\numberline{\csname the#1\endcsname}%
                \else
                    \protect\numberline{\bfseries\csname the#1\endcsname}%
                \fi
            \fi
             #7%
        }%
        \else
        \def\@svsechd{%
            #6{\hskip #3\relax
            \@svsec #8}%
            \csname #1mark\endcsname{#7}%
            \addcontentsline{toc}{#1}{%
                \ifnum #2>\c@secnumdepth \else
                    \ifnum #2>1
                        \protect\numberline{\csname the#1\endcsname}%
                    \else
                        \protect\numberline{\bfseries\csname the#1\endcsname}%
                    \fi
                \fi
                 #7%
            }%
        }%
    \fi
    \@xsect{#5}%
}

\def\@seccntformat#1{\csname the#1\endcsname}
\def\@biblabel#1{\textcolor{darkgray}{\bfseries#1}}

\def\ps@plain{\let\@mkboth\@gobbletwo
    \let\@evenhead\@empty
    \let\@oddhead\@empty
    \let\@oddfoot\@empty
\let\@oddfoot\@empty}
\def\lipics@opterrshort{Option  "\CurrentOption" not supported}
\def\lipics@opterrlong{The option "\CurrentOption" from article.cls is not supported by lipics.cls.}
\DeclareOption{a5paper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{b5paper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{legalpaper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{executivepaper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{landscape}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{10pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{11pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{12pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{oneside}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{twoside}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{titlepage}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{notitlepage}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{onecolumn}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{twocolumn}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{openbib}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{autoref}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{stoc}{\let\usestocmargin\relax}
\DeclareOption{numberwithinsect}{\let\numberwithinsect\relax}
\DeclareOption{anonymous}{\let\authoranonymous\relax}
\DeclareOption{lmodern}{\let\uselmodern\relax}
\DeclareOption{footnotebackref}{\let\fnotebackref\relax}
\DeclareOption{authorcolumns}{\let\authorcolumns\relax}
\DeclareOption{refcheck}{\let\userefcheck\relax}
\let\compactauthor\relax
\DeclareOption{oldauthorstyle}
{\let\compactauthor\@empty}
\DeclareOption{compactauthor}{\let\compactauthor\relax}
\DeclareOption{pdfa}{\let\pdfa\relax}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[twoside,notitlepage]{article}

\setcounter{tocdepth}{2}

% redefine contentsline
\renewcommand*\l@section[2]{%
    \ifnum \c@tocdepth >\z@
        \addpenalty\@secpenalty
        \addvspace{.5em \@plus\p@}%
        \setlength\@tempdima{\parindent}%
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak\hfil
        \nobreak\hb@xt@\@pnumwidth{\hss #2%
        \kern-\p@\kern\p@}\par
        \endgroup
\fi}

\let\mtl@section\l@section
\renewcommand*\l@section[2]{\mtl@section{{#1}}{ #2\hspace{-.04em}}}
\renewcommand*\l@part[2]{%
    \ifnum \c@tocdepth >-2\relax
        \addpenalty\@secpenalty
        \addvspace{1em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        {\leavevmode
            \large \bfseries #1\hfil
            \hb@xt@\@pnumwidth{\hss #2%
        \kern-\p@\kern\p@}}\par
        \nobreak
        \if@compatibility
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \fi
        \endgroup
    \fi}

\let\mtl@part\l@part
\renewcommand*\l@part[2]{\mtl@part{{#1}}{}}

\let\old@dottedcontentsline\@dottedtocline
\def\@dottedtocline#1#2#3#4#5{%
\old@dottedcontentsline{#1}{#2}{#3}{#4}{{{#5}}}}

\renewcommand\small{%
    \@setfontsize\small\@ixpt{11.5}%
    \abovedisplayskip 3.5\p@ \@plus2\p@ \@minus2\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 3.5\p@ \@plus2\p@ \@minus2\p@
    \def\@listi{\leftmargin\leftmargini
        \topsep 3.5\p@ \@plus2\p@ \@minus2\p@
        \parsep 2\p@ \@plus\p@ \@minus\p@
\itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
    \@setfontsize\footnotesize{8.5}{9.5}%
    \abovedisplayskip 3.5\p@ \@plus2\p@ \@minus2\p@
    \abovedisplayshortskip \z@ \@plus\p@
    \belowdisplayshortskip 3.5\p@ \@plus\p@ \@minus2\p@
    \def\@listi{\leftmargin\leftmargini
        \topsep 3\p@ \@plus\p@ \@minus\p@
        \parsep 2\p@ \@plus\p@ \@minus\p@
\itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
}
\renewcommand\large{\@setfontsize\large{11}{13}}
\renewcommand\Large{\@setfontsize\Large{12}{14}}

\def\@listi{\leftmargin\leftmargini%
    \parsep\z@ \@plus\p@%
    \topsep 8\p@ \@plus6\p@ \@minus4\p@%
    \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
    \labelwidth\leftmarginii
    \advance\labelwidth-\labelsep
    \topsep    4\p@ \@plus2\p@ \@minus\p@
    \parsep\z@ \@plus\p@
    \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii
    \advance\labelwidth-\labelsep
    \topsep    2\p@ \@plus\p@\@minus\p@
    \parsep    \z@
    \partopsep \p@ \@plus\z@ \@minus\p@
    \itemsep   \z@ \@plus\p@}
\renewcommand\maketitle{\par
    \begingroup
    \thispagestyle{plain}
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \if@twocolumn
        \ifnum \col@number=\@ne
            \@maketitle
        \else
            \twocolumn[\@maketitle]%
        \fi
    \else
        \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
    \endgroup
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@subtitle\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}
\def\@maketitle{%
    \newpage
    \setcounter{page}{0}
    \null\vskip-2\baselineskip
    \vskip-\headsep
    \@titlerunning
    \@authorrunning
    %%\let \footnote \thanks
    \parindent\z@ \raggedright
    \if!\@title!\def\@title{\textcolor{red}{Author: Please fill in a title}}\fi
    {\centering\LARGE\bfseries\mathversion{bold}\@title \if!\@subtitle!\else{\\\Large\bfseries\mathversion{bold}\@subtitle}\fi \par}%
    \vskip 1em
    \ifx\@author\orig@author
        \textcolor{red}{Author: Please provide author information}%
    \else
        {\def\thefootnote{\@arabic\c@footnote}%
            \setcounter{footnote}{0}%
        \fontsize{9.5}{12}\selectfont\@author}%
    \fi
\par}
\renewcommand\tableofcontents{%
    \section*{\contentsname}%
    \@starttoc{toc}}
\setcounter{secnumdepth}{4}
\renewcommand\section{\@startsection {section}{1}{\z@}%
    {-2.3ex \@plus -1ex \@minus -.2ex}%
    {1.8ex \@plus.2ex}%
    {\Large\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {-1.8ex\@plus -1ex \@minus -.2ex}%
    {1.3ex \@plus .2ex}%
    {\Large\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-1.8ex\@plus -1ex \@minus -.2ex}%
    {1.3ex \@plus .2ex}%
    {\normalsize\bfseries\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
    {-1.8ex \@plus-1ex \@minus-.2ex}%
    {1.3ex \@plus .2ex}%
    {\normalsize\bfseries\raggedright}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
    {.5ex \@plus1ex \@minus .2ex}%
    {-1em}%
    {\normalsize\bfseries}}
\renewcommand\labelitemi{%
    \textcolor{bulletgray}{%
        \ifnum\@listdepth=\@ne%
            \@lipicsTriangleRight%
        \else%
            $\lipicsClaimTriangleRight$%
    \fi}}
\renewcommand\labelitemii{%
    \textcolor{bulletgray}{$\lipicsClaimTriangleRight$}}
\renewcommand\labelitemiii{%
    \textcolor{bulletgray}{\bfseries\textasteriskcentered}}
\renewcommand\labelitemiv{%
    \textcolor{bulletgray}{\bfseries\textperiodcentered}}


\renewenvironment{description}
{\list{}{\advance\partopsep\topsep\topsep\z@\@plus\p@
        \labelwidth\z@ \itemindent-\leftmargin
\let\makelabel\descriptionlabel}}
{\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\renewcommand*\descriptionlabel[1]{%
\hspace\labelsep\textcolor{darkgray}{\bfseries\mathversion{bold}#1}}
\def\topmattervskip{0.7}
\renewenvironment{abstract}{%
    \vskip\topmattervskip\bigskipamount
    \noindent
    \rlap{\color{linegray}\vrule\@width\textwidth\@height1\p@}%
    {\null\hfill\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
    \large\selectfont\bfseries\abstractname}}\hfill\null}%
    \vskip3\p@
    \fontsize{9}{12}\selectfont
\noindent\ignorespaces}
{
    \ifx\@ccsdescString\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \subjclassHeading\@ccsdescString\par\noindent
    \fi
    \ifx\@keywords\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \keywordsHeading\@keywords\par\noindent
        \fi
    \ifx\@category\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \categoryHeading\@category\par\noindent
    \fi
    \ifx\authoranonymous\relax\else
    \ifx\@relatedversion\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \relatedversionHeading\@relatedversion\par\noindent
    \fi
    \ifx\@supplement\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \supplementHeading\@supplement\par\noindent
    \fi
    \ifx\@funding\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \fundingHeading\@funding\par\noindent
    \fi
    \ifx\@acknowledgements\@empty\else
        \vskip\topmattervskip\baselineskip\noindent
        \fontsize{7}{8}\selectfont%
        \acknowledgementsHeading\@acknowledgements\par\noindent
    \fi
    \fi
}

\renewenvironment{thebibliography}[1]
{%
    \clearpage
    \section*{\bibname}
    \addcontentsline{toc}{section}{\bibname}
    \par
    \noindent
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \fontsize{8}{11}\selectfont
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
\sfcode`\.\@m}
{\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
\endlist}
\renewcommand\footnoterule{%
    \kern-8\p@
    {\vspace{.5ex}\color{bulletgray}\hrule\@width40mm\@height1\p@}%
\kern6.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent\z@\hangindent\i@parindent
    \leavevmode
\hb@xt@\i@parindent{\@makefnmark\hss}#1}

\usepackage{microtype}
\RequirePackage{textcomp}
\RequirePackage[mathscr]{eucal}
\RequirePackage{amssymb}
\PassOptionsToPackage{retainmissing}{MnSymbol}
\AtBeginDocument{\@ifpackageloaded{MnSymbol}%
    {\expandafter\let\csname ver@amssymb.sty\endcsname\relax
        \let\complement\@undefined
\RequirePackage{amssymb}}{}}

\RequirePackage{soul}
\sodef\textsolittle{}{.12em}{.5em\@plus.08em\@minus.06em}%
{.4em\@plus.275em\@minus.183em}

\ifx\uselmodern\relax
    \RequirePackage{lmodern}
    \RequirePackage[USenglish]{babel}
    \RequirePackage{amsmath}
\else
    \RequirePackage{iftex}
    \ifluatex
        \RequirePackage{fontspec}
        \RequirePackage[USenglish]{babel}
        \RequirePackage{newpxtext}
        \RequirePackage[fracspacing]{newpxmath}[2019/10/02]
        \RequirePackage[nomath]{lmodern}

        \RequirePackage[mathscr]{eucal}

        % from impnattypo, adapted
        \RequirePackage{luatexbase,luacode}
        \begin{luacode}
            local glyph_id = node.id "glyph"
            local glue_id  = node.id "glue"
            local hlist_id = node.id "hlist"

            last_line_twice_parindent = function (head)
                while head do
                    local _w,_h,_d = node.dimensions(head)
                    if head.id == glue_id and head.subtype ~= 15 and (4.5 * _w < tex.dimen.textwidth) then
                        local p = node.new("penalty")
                        p.penalty = 10000
                        node.insert_after(head,head.prev,p)
                    end
                    head = head.next
                end
                return true
            end

            luatexbase.add_to_callback("pre_linebreak_filter",last_line_twice_parindent,"lastparline")
        \end{luacode}

        % adapted from
        % https://tex.stackexchange.com/questions/396134/how-to-perform-an-action-when-an-overfull-or-underfull-box-is-encountered/493311#493311

        \directlua{
            GLYPH = node.id("glyph")
            GLUE  = node.id("glue")
            %
            function hpackshow (indicator,num,nd,f,l)
            print('HPACK: ' .. indicator .. ' ' .. num)
            if (indicator == 'overfull') then
            local pt = num / 65536.0
            str = string.format("| overfull \@percentchar #.2fpt",pt)
            nds = {}
            nds[0]=node.new(GLYPH,1)
                for i = 1,string.len(str) do
                  nds[i] = node.new(GLYPH,1)
                  nds[i].font = font.current()
                  nds[i-1].next = nds[i]
                end

                j = 1
                for s in string.utfvalues(str) do
                  local char = unicode.utf8.char(s)
                  nds[j].char = s
                  if unicode.utf8.match(char,"\@percentchar s") then
                    nds[j] = node.new(GLUE)
                    nds[j].width = space
                    nds[j].shrink = shrink
                    nds[j].stretch = stretch
                  end
                  j = j+1
                end
            return nds[0]
            end
            end
            %
            luatexbase.add_to_callback('hpack_quality',hpackshow,'my hpack logger')
        }
    \else
        \ClassWarningNoLine{no-lipics}{Overfull hbox messages available only with LuaLatex}{}

        \RequirePackage[USenglish]{babel}

        \RequirePackage{newpxtext}
        \RequirePackage[OT1]{fontenc}
        \RequirePackage[mathscr]{eucal}
        \RequirePackage[fracspacing]{newpxmath}[2019/10/02]
        \renewcommand{\sfdefault}{lmss}
        \renewcommand{\ttdefault}{lmtt}
        \SetMathAlphabet{\mathsf}{normal}{OT1}{lmss}{m}{n}
        \SetMathAlphabet{\mathtt}{normal}{OT1}{lmtt}{m}{n}
        \SetMathAlphabet{\mathsf}{bold}  {OT1}{lmss}{bx}{n}
        \SetMathAlphabet{\mathtt}{bold}  {OT1}{lmtt}{m}{n}
    \fi
\fi

\brokenpenalty=10000
\doublehyphendemerits=1000000000

\AtBeginDocument{%
    \let\mathshift=$
    \DeclareRobustCommand\({% from fixltx2e
        \ifdim\lastskip>\z@ \unskip~\fi%
        \ifmmode \@badmath \else \mathshift\fi
    }%
}

\let\openbox\undefined

\setlength{\skip\footins}{1\baselineskip \@plus 4\p@ \@minus 2\p@}
\ifx\usestocmargin\@undefined
    % trick to suppress typearea warning.
    % while lines are indeed ~20% too long, for scientific papers this is barely
    % acceptable.
    \renewcommand\normalsize{%
        \@setfontsize\normalsize{13}{14}%
        \abovedisplayskip 5\p@ \@plus3\p@ \@minus3\p@
        \abovedisplayshortskip \z@ \@plus3\p@
        \belowdisplayshortskip 5\p@ \@plus3\p@ \@minus3\p@
        \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
    \PassOptionsToPackage{headinclude,BCOR=13.125mm,DIV=15}{typearea}
    \RequirePackage{typearea}

    \renewcommand\normalsize{%
        \@setfontsize\normalsize{10}{13.5}%
        \abovedisplayskip 5\p@ \@plus3\p@ \@minus3\p@
        \abovedisplayshortskip \z@ \@plus3\p@
        \belowdisplayshortskip 5\p@ \@plus3\p@ \@minus3\p@
        \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}

\else
    \RequirePackage[margin=1in]{geometry}
    \renewcommand\normalsize{%
        \@setfontsize\normalsize\@xipt{13}%
        \abovedisplayskip 6.5\p@ \@plus3\p@ \@minus3\p@
        \abovedisplayshortskip \z@ \@plus3\p@
        \belowdisplayshortskip 6.5\p@ \@plus3\p@ \@minus3\p@
        \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\fi
\normalsize

\ifx\usestocmargin\@undefined
\def\ps@headings{%
    \def\@evenhead{\large\bfseries
    \makebox[0pt][r]{\thepage\hspace*{\i@parindent}}\leftmark\hfil}%
    \def\@oddhead{\large\bfseries\ifx\authoranonymous\relax\leftmark\else\rightmark\fi\hfil
    \makebox[0pt][l]{\hspace*{\i@parindent}\thepage}}%
    \let\@evenfoot\@empty%
    \let\@oddfoot\@empty
    \let\@mkboth\markboth
    \let\sectionmark\@gobble
\let\subsectionmark\@gobble}
\else
\def\ps@headings{%
    \def\@oddhead{\large\bfseries\leftmark\hfil
    \makebox[0pt][l]{\hspace*{\i@parindent}\thepage}}%
    \def\@evenhead{\large\bfseries
    \makebox[0pt][r]{\thepage\hspace*{\i@parindent}}\leftmark\hfil}%
    \let\@evenfoot\@empty%
    \let\@oddfoot\@empty
    \let\@mkboth\markboth
    \let\sectionmark\@gobble
\let\subsectionmark\@gobble}
\fi
\pagestyle{headings}

\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{thm-restate}
\RequirePackage{tikz}

% IBM Design Library color-blind optimized palette
\definecolor{color1}{HTML}{648FFF} % blue
\definecolor{color2}{HTML}{785EF0} % purple
\definecolor{color3}{HTML}{DC267F} % magenta
\definecolor{color4}{HTML}{FE6100} % orange
\definecolor{color5}{HTML}{FFB000} % yellow
\definecolor{linegray}{rgb}{0.6,0.59,0.61}
\definecolor{lightgray}{rgb}{0.8,0.8,0.8}
\colorlet{color6}{linegray}
\colorlet{color7}{lightgray}

\colorlet{c1}{color1!60!black}
\colorlet{c2}{color2!60!black}
\colorlet{c3}{color3!60!black}
\colorlet{c4}{color4!60!black}
\colorlet{c5}{color5!60!black}
\definecolor{darkgray}{rgb}{0.31,0.31,0.33}
\definecolor{bulletgray}{rgb}{0.45,0.45,0.46}
\colorlet{c6}{darkgray}
\colorlet{c7}{bulletgray}

\def\displaypalette{{\color{color1}\rule{2em}{2em}}{\color{color2}\rule{2em}{2em}}{\color{color3}\rule{2em}{2em}}{\color{color4}\rule{2em}{2em}}{\color{color5}\rule{2em}{2em}}{\color{linegray}\rule{2em}{2em}}{\color{lightgray}\rule{2em}{2em}}}
\def\displayfgpalette{{\color{c1}\rule{2em}{2em}}{\color{c2}\rule{2em}{2em}}{\color{c3}\rule{2em}{2em}}{\color{c4}\rule{2em}{2em}}{\color{c5}\rule{2em}{2em}}{\color{darkgray}\rule{2em}{2em}}{\color{bulletgray}\rule{2em}{2em}}}



\ifx\pdfa\relax%
\IfFileExists{glyphtounicode.tex}{
    \input glyphtounicode
    \pdfgentounicode=1
}{}%
\fi
\IfFileExists{fontawesome5.sty}{%
    \RequirePackage{fontawesome5}%
    \def\orcidsymbol{\raisebox{.2ex}{\textcolor{darkgray}{\fontsize{9}{12}\bfseries\faOrcid}}}%
    \def\mailsymbol{\textcolor{darkgray}{\fontsize{9}{12}\bfseries \faIcon[regular]{envelope}}}%
    \def\homesymbol{\textcolor{darkgray}{\fontsize{9}{12}\bfseries \faHome}}%
}{%
    \ClassWarning{Package fontawesome5 not installed}{Please install package fontawesome5}
    \def\orcidsymbol{\textcolor{darkgray}{\fontsize{9}{12}\bfseries ORCID}}
    \def\mailsymbol{\textcolor{darkgray}{\fontsize{9}{12}\bfseries @}}%
    \def\homesymbol{\textcolor{darkgray}{\fontsize{9}{12}\bfseries H}}%
}%


\AtBeginDocument{
    \@ifpackageloaded{enumerate}{\ClassWarning{Package 'enumerate' incompatible}{Don't use package 'enumerate'; Package enumerate preloaded!}}{}
    \@ifpackageloaded{paralist}{\ClassWarning{Package 'paralist' incompatible}{Don't use package 'paralist'; Package enumerate preloaded!}}{}
    \@ifpackageloaded{algorithmic}{\ClassWarning{Package 'algorithmic' incompatible}{Don't use package 'algorithmic'; Package algorithm2e preloaded!}}{}
    \@ifpackageloaded{algorithmicx}{\ClassWarning{Package 'algorithmic' incompatible}{Don't use package 'algorithmic'; Package algorithm2e preloaded!}}{}
    \@ifpackageloaded{algpseudocode}{\ClassWarning{Package 'algorithmic' incompatible}{Don't use package 'algorithmic'; Package algorithm2e preloaded!}}{}
}

\RequirePackage[shortlabels, inline]{enumitem}
\setlist{left= 0pt .. \i@parindent, topsep=0ex}
\setlist[enumerate]{format=\color{bulletgray}\small\bfseries\upshape\mathversion{bold}}
\setlist[itemize, 1]{labelindent={-.15em}}
\setlist[itemize, 2]{labelindent={-.15em}}
\setlist[itemize, 3]{labelindent={-.1em}}
\setlist[enumerate, 1]{\@lipicsDotRight\hspace{-.05em}1, ref=\arabic*, align=left, labelindent=-.17em}
\setlist[enumerate, 2]{\lipicsClaimDotRight\hspace{-.1em}a, ref=\theenumi.\alph*,
format=\color{bulletgray}\small\bfseries\upshape\mathversion{bold}, align=left, labelindent=-.15em}
\setlist[enumerate, 3]{\bfseries\textasteriskcentered 1, ref=\theenumii.\arabic*,
format=\color{bulletgray}\small\bfseries\upshape\mathversion{bold}, align=left,
labelindent=0em}
\setlist[enumerate, 4]{\bfseries\textperiodcentered a, ref=\theenumiii.\alph*,
format=\color{bulletgray}\small\bfseries\upshape\mathversion{bold}, align=left,
labelindent=0em}

\def\romanenumerate{\enumerate[(i)]}
\let\endromanenumerate\endenumerate
\def\alphaenumerate{\enumerate[(a)]}
\let\endalphaenumerate\endenumerate
\def\bracketenumerate{\enumerate[(1)]}
\let\endbracketenumerate\endenumerate

\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{xstring}
\let\@classzold\@classz
\def\@classz{%
    \expandafter\ifx\d@llarbegin\begingroup
        \toks \count@ =
        \expandafter{\expandafter\small\the\toks\count@}%
    \fi
\@classzold}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage[online]{threeparttable}
\def\TPTtagStyle#1{#1)}
\def\tablenotes{\small\TPT@defaults
\@ifnextchar[\TPT@setuptnotes\TPTdoTablenotes} % ]
\RequirePackage{listings}
\lstset{basicstyle=\small\ttfamily,%
    backgroundcolor=\color{lightgray},%
frame=single,framerule=0pt,xleftmargin=\fboxsep,xrightmargin=\fboxsep}
\RequirePackage[left,mathlines]{lineno}
\renewcommand\linenumberfont{\normalfont\tiny}
%%%% patch to cope with amsmath
%%%% http://phaseportrait.blogspot.de/2007/08/lineno-and-amsmath-compatibility.html
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
    \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
    \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
    \renewenvironment{#1}%
    {\linenomath\csname old#1\endcsname}%
{\csname oldend#1\endcsname\endlinenomath}}%
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
    \patchAmsMathEnvironmentForLineno{#1}%
\patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
    \patchBothAmsMathEnvironmentsForLineno{equation}%
    \patchBothAmsMathEnvironmentsForLineno{align}%
    \patchBothAmsMathEnvironmentsForLineno{flalign}%
    \patchBothAmsMathEnvironmentsForLineno{alignat}%
    \patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}}


\ifx\pdfa\relax%
  \RequirePackage[pdfa,unicode,pagebackref]{hyperref}%
\else%
  \RequirePackage[unicode,pagebackref]{hyperref}%
\fi%

\ifx\fnotebackref\relax
    % from footnotebackref.sty

    % A new counter to create an unambiguous label-tag for all hyperfootnotes
    \newcounter{nolipicsBackrefHyper}

    % Store the original LaTeX footnote macros to separate macros
    \NewCommandCopy{\BHFN@OldFootnote}{\footnote}
    \NewCommandCopy{\BHFN@OldMakefntext}{\@makefntext}

    % Redefine the original footnote macro to
    % branch between the footnote with/without optional argument
    \renewcommand*\footnote{%
        \refstepcounter{nolipicsBackrefHyper}%
        \edef\BackrefFootnoteTag{bhfn:\thenolipicsBackrefHyper}%
        \label{\BackrefFootnoteTag}%
        \@ifnextchar[\Backref@OptHyperFootnote\Backref@HyperFootnote}

    % Define an new footnote without optional argument
    \newcommand\Backref@HyperFootnote[1]{%
        \BHFN@OldFootnote{#1}}

    % Define an new footnote with optional argument
    \newcommand\Backref@OptHyperFootnote[2][\empty]{%
        \BHFN@OldFootnote[#1]{#2}}

    % If the footnote number should be the reference
    % than redefine the \@makefntext and \@makefnmark
    % The \@makefnmark macro is redefined in the space of
    % the \@makefntext macro
    % So the footnote numbers in the main text are not influenced
    \renewcommand\@makefntext[1]{%
        \renewcommand\@makefnmark{%
            \mbox{\textsuperscript{\normalfont%
        \hyperref[\BackrefFootnoteTag]{\@thefnmark}}}\,}%
    \BHFN@OldMakefntext{#1}}%
\fi

\let\usehyperxmp\@empty%
\ifx\pdfa\relax%
  \IfFileExists{hyperxmp.sty}{%
    \RequirePackage{hyperxmp}%
    \@ifpackagelater{hyperxmp}{2019/04/05}{%
      \let\usehyperxmp\relax%
    }{%
      \ClassWarning{Package hyperxmp outdated}{You are using an outdated version of the package hyperxmp. Please update!}%
    }}{}%
\fi%

\let\C\relax%
\let\G\relax%
\let\F\relax%
\let\U\relax%
\pdfstringdefDisableCommands{%
    \let\thanks\@gobble%
    \let\footnote\@gobble%
    \def\footnotemark{}%
    \def\cs#1{\textbackslash #1}%
    \let\normalfont\@empty%
    \let\scshape\@empty%
    \def\and{and }%
    \def\,{ }%
    \def\textrightarrow{ -> }%
    \let\mathsf\@empty%
}%
\hypersetup{
    colorlinks=true,
    citecolor=c2,
    linkcolor=c2,
    urlcolor=c1,
    pdfencoding=unicode,
    bookmarksnumbered,
    pdfborder={0 0 0},
    pdfauthor={ }
}%

\AtBeginDocument{
    \ifx\usehyperxmp\relax
        \hypersetup{
        pdftitle={\@title \if!\@subtitle!\else\subtitleseperator \@subtitle\fi},
        pdfauthor={\ifx\authoranonymous\relax Anonymous author(s) \else \@authorsforpdf \fi},
        pdfkeywords={\@keywords},
        pdflang={en},
        pdfmetalang={en},
        pdflicenseurl={https://creativecommons.org/licenses/by/4.0/},
        pdfpubtype={LIPIcs},
        pdfapart=3,
        pdfaconformance=B
    }
    \else%
        \hypersetup{
            pdftitle={\@title \if!\@subtitle!\else\subtitleseperator \@subtitle\fi},
            pdfauthor={\ifx\authoranonymous\relax Anonymous author(s) \else \@authorsforpdf \fi},
            pdfkeywords={\@keywords},
        }%
    \fi%
}

\ifx\usehyperxmp\relax
    \pdfobjcompresslevel=0
    \pdfinclusioncopyfonts=1

    \IfFileExists{colorprofiles.tex}{
        \RequirePackage{colorprofiles}%
        \IfFileExists{sRGB.icc}{
            \immediate\pdfobj stream attr{/N 3} file{sRGB.icc}
            \pdfcatalog{%
/OutputIntents [
<<
/Type /OutputIntent
/S /GTS_PDFA1
/DestOutputProfile \the\pdflastobj\space 0 R
/OutputConditionIdentifier (sRGB)
/Info (sRGB)
>>
]
            }}{}
    }{%
        \ClassWarning{Package colorprofiles not installed}{Please install package colorprofiles}
    }
\fi

\RequirePackage[labelsep=space,singlelinecheck=false,%
font={up,small},labelfont={bf},%
listof=false]{caption}%"listof" instead of "list" for backward compatibility
\@ifpackagelater{hyperref}{2009/12/09}
{\captionsetup{compatibility=false}}%cf. http://groups.google.de/group/comp.text.tex/browse_thread/thread/db9310eb540fbbd8/42e30f3b7b3aa17a?lnk=raot
{}
\DeclareCaptionLabelFormat{boxed}{%
    \kern0.05em{\color{bulletgray}\rule{0.73em}{0.73em}}%
\hspace*{\i@parindent}\hspace*{-.7em}\bothIfFirst{#1}{~}#2.}
\captionsetup{labelformat=boxed}
\captionsetup[table]{position=top}
\RequirePackage[figuresright]{rotating}
\caption@AtBeginDocument{\@ifpackageloaded{subfig}{\ClassError{lipics}{%
Do not load the subfig package}{The more recent subcaption package is already loaded}}{}}
\RequirePackage[labelformat=simple]{subcaption}
\DeclareCaptionLabelFormat{opening}{\@lipicsDotRight\hspace{-.05em}#2~}
\subcaptionsetup{labelformat=opening}

\def\titlerunning#1{\gdef\@titlerunning{{\let\footnote\@gobble\markboth{#1}{#1}}}}
\def\authorrunning#1{%
\gdef\@authorrunning{\markright{\ifx\authoranonymous\relax{Anonymous author(s)} \else\if!#1!\textcolor{red}{Author: Please fill in the \string\authorrunning\space macro}\else#1\fi\fi}}}
\titlerunning{\@title}
\authorrunning{\textcolor{red}{Author: Please use the \string\authorrunning\space macro}}

\def\and{\newline}
\let\orig@author\@author
\let\@authorsfortoc\@empty
\let\@authorsforpdf\@empty
\newcount\c@author
\newcounter{currentauthor}
\def\@authornum{0}

\def\author#1#2#3#4#5{%
    \ifx\@author\orig@author\let\@author\@empty\fi
    \g@addto@macro\@author{%
        \noexpandarg\StrBehind{#2}{\and \url}[\homepageTemp]\IfSubStr{#2}{\and \url}{\StrBefore{#2}{\and \url}[\affiliation]}{\def\affiliation{#2}}%
        \expandarg\exploregroups\StrRemoveBraces{\homepageTemp}[\homepage]%
        \stepcounter{currentauthor}
        \ifx\authoranonymous\relax%
            \ifnum\value{currentauthor}=1%
                \ifx\authorcolumns\relax
                    \begin{minipage}[t]{.99\textwidth}%
                        \centering%
                \fi
                    {\Large\bfseries%
                    Anonymous author(s)}%
                    {\\* {Anonymous affiliation(s)}}%
                \ifx\authorcolumns\relax
                    \end{minipage}
                \fi
            \fi
        \fi
        \ifx\authoranonymous\relax%
            \setcounter{currentauthor}{1}%
            \def\@authornum{1}%
            \setcounter{author}{1}%
        \fi%
        \ifx\authorcolumns\relax
            \ifx\authoranonymous\relax\else%
            \ifodd\c@author%
                \ifnum\c@author=\value{currentauthor}%
                    \begin{minipage}[t]{\textwidth}%
                        \begin{minipage}[t]{\textwidth}%
                            \centering%
                \else%
                    \ifodd\value{currentauthor}%
                        \begin{minipage}[t]{\textwidth}%
                            \begin{minipage}[t]{0.49\textwidth}%
                                \centering%
                    \else%
                        \hfill \begin{minipage}[t]{0.49\textwidth}%
                            \centering%
                    \fi%
                \fi%
            \else%
                \ifodd\value{currentauthor}%
                    \begin{minipage}[t]{\textwidth}%
                        \begin{minipage}[t]{0.49\textwidth}%
                            \centering%
                \else%
                    \hfill \begin{minipage}[t]{0.49\textwidth}%
                        \centering%
                \fi%
            \fi%
            \fi%
        \else%
            \ifx\authoranonymous\relax\else\addvspace{0.5\baselineskip}\fi%
        \fi%
        {\Large\bfseries%
            \if!#1!%
                \textcolor{red}{Author: Please enter author name}%
            \else%
                \ifx\authoranonymous\relax%
                \else%
                    #1\,%
                    \if!#4!\else{\href{#4}{\raisebox{-1pt}{\orcidsymbol}}}\fi%
                    \ifx\compactauthor\relax\if!#3!\else{\;\href{mailto:#3}{\mailsymbol}}\fi%
                    \ifx\homepage\@empty\else{\;\href{\homepage}{\homesymbol}}\fi\fi%
                \fi%
                \if!#5!\else%
                    \ifx\@funding\@empty%
                        \expandafter\g@addto@macro\expandafter\@funding{\textit{\expandafter{\let\footnote\@gobble%
                        #1}}:\space{#5}}%
                    \else%
                        \expandafter\g@addto@macro\expandafter\@funding{;\space\textit{\expandafter{\let\footnote\@gobble%
                        #1}}:\space{#5}}%
                    \fi%
                \fi%
            \fi%
        }%
        {\small%
            \if!#2!%
                \textcolor{red}{Author: Please enter affiliation as second parameter of
                the author macro}%
            \else\ifx\authoranonymous\relax%
            \else\ifx\compactauthor\relax{\\* \affiliation}\else{\\* #2}\fi\fi\fi%
            \ifx\compactauthor\relax\else\if!#3!\else{%
                \ifx\authoranonymous\relax\else\\*\href{mailto:#3}{\texttt{#3}}\fi%
            }\fi\fi%
        }\ifx\authoranonymous\relax\else\par\fi%
        \ifx\authorcolumns\relax%
            \ifx\authoranonymous\relax\else%
                \end{minipage}%
                \ifnum\c@author=\value{currentauthor}%
                    \end{minipage}%
                \else%
                    \ifodd\value{currentauthor}%
                    \else%
                        \end{minipage}%
                        \ifx\authoranonymous\relax\else\medskip\fi%
                    \fi%
                \fi%
            \fi%
        \fi%
    }%
    \global\advance\c@author\@ne%
    \protected@write\@auxout{}{\string\gdef\string\@authornum{\the\c@author}}%
    \ifnum\c@author=\@ne%
        \gdef\@authorsfortoc{#1}%
        \gdef\@authorsforpdf{#1}%
    \else%
        \expandafter\g@addto@macro\expandafter\@authorsforpdf\expandafter{,\space #1}%
        \expandafter\g@addto@macro\expandafter\@authorsfortoc\expandafter{\expandafter\csname\the\c@author authand\endcsname#1}%
        \@namedef{\the\c@author authand}{,\space}%
        \AtBeginDocument{%
            \expandafter\ifnum\@authornum=2%
                \@namedef{2authand}{\space and\space}%
            \else%
                \@namedef{\@authornum authand}{,\space and\space}%
            \fi}%
    \fi%
}
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords\@empty
\def\keywordsHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Keywords and phrases\enskip}}

\RequirePackage{comment}
\excludecomment{CCSXML}
% inspired by https://tex.stackexchange.com/questions/12810/how-do-i-split-a-string
\global\newcommand\ccsdesc[2][100]{\@ccsdesc#1~#2~~\relax}
\let\orig@ccsdesc\@ccsdesc
\let\@ccsdesc\@empty
\let\@ccsdescString\@empty
\gdef\@ccsdesc#1~#2~#3~{
    \ifx\@ccsdesc\orig@ccsdesc\let\@ccsdesc\@empty\fi
    \ifx!#3!
        \ifx\@ccsdescString\@empty
            \g@addto@macro\@ccsdescString{{#2}}
        \else
            \g@addto@macro\@ccsdescString{; {#2}}
        \fi
    \else
        \ifx\@ccsdescString\@empty
            \g@addto@macro\@ccsdescString{{#2} $\rightarrow$ {#3}}
        \else
            \g@addto@macro\@ccsdescString{; {#2} $\rightarrow$ {#3}}
        \fi
    \fi
    \ccsdescEnd
}
\def\ccsdescEnd#1\relax{}
\def\subjclass#1{
    \ClassError{lipics}
    {\string\subjclass\space deprecated: Please enter subject classification in 1 or more ccsdesc macros}
{Since 2019, \string\subjclass\space is obsolete in lipics.}}
\let\@subjclass\@empty
\def\subjclassHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
2012 ACM Subject Classification\enskip}}
\def\doiHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Digital Object Identifier\enskip}}
\def\category#1{\def\@category{#1}}
\let\@category\@empty
\def\categoryHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Category\enskip}}
\def\relatedversion#1{\def\@relatedversion{#1}}
\let\@relatedversion\@empty
\define@key{relatedversiondetails}{linktext}{\def\relatedversiondetails@linktext{#1}}
\define@key{relatedversiondetails}{cite}{\def\relatedversiondetails@cite{#1}}
\newcommand*\addtorelatedversionmacro[2]{%
    \ifx\@relatedversion\@empty%
        \g@addto@macro\@relatedversion{#1}%
    \else%
        \g@addto@macro\@relatedversion{\\#1}%
    \fi%
}%
\newcommand{\relatedversiondetails}[3][]{%
    \begingroup%
    \let\relatedversiondetails@linktext\@empty
    \let\relatedversiondetails@cite\@empty
    \setkeys{relatedversiondetails}{#1}%
    \ifx\relatedversiondetails@linktext\@empty%
        \protected@edef\tmp{\textit{#2}:\space{\url{#3}}}%
    \else%
        \protected@edef\tmp{\textit{#2}:\space{\href{#3}{\texttt{\relatedversiondetails@linktext}}}}%
    \fi%
    \ifx\relatedversiondetails@cite\@empty%
\else%
    \protected@edef\tmp{\tmp\nobreakspace\cite{\relatedversiondetails@cite}}%
\fi%
\expandafter\addtorelatedversionmacro\expandafter{\tmp}{#1}%
\endgroup%
}%
\def\relatedversionHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Related Version\enskip}}
\def\supplement#1{\def\@supplement{#1}}
\let\@supplement\@empty
\define@key{supplementdetails}{linktext}{\def\supplementdetails@linktext{#1}}
\define@key{supplementdetails}{cite}{\def\supplementdetails@cite{#1}}
\define@key{supplementdetails}{subcategory}{\def\supplementdetails@subcategory{#1}}
\define@key{supplementdetails}{swhlinktext}{\def\supplementdetails@swhlinktext{#1}}
\let\supplementdetails@swhlinktext\@empty
\define@key{supplementdetails}{swhid}{
    \ifx\supplementdetails@swhlinktext\@empty%
        \StrBefore{#1}{;}[\supplementdetails@swhlinktext]%
    \fi%
    \def\supplementdetails@swhid{#1}%
}

\define@key{supplementdetails}{swhdelimiter}{\def\supplementdetails@swhdelimiter{#1}}
\def\supplementdetails@swhdelimiter{\\ \hspace*{1.2em}}
\newcommand*\addtosupplementmacro[2]{%
    \ifx\@supplement\@empty%
        \g@addto@macro\@supplement{#1}%
    \else%
        \g@addto@macro\@supplement{\\#1}%
    \fi%
}%
\newcommand{\supplementdetails}[3][]{%
    \begingroup%
    \let\supplementdetails@linktext\@empty
    \let\supplementdetails@cite\@empty
    \let\supplementdetails@subcategory\@empty
    \let\supplementdetails@swhid\@empty
    \setkeys{supplementdetails}{#1}%
    \ifx\supplementdetails@subcategory\@empty%
        \protected@edef\tmp{\textit{#2}}
    \else
        \protected@edef\tmp{\textit{#2\,\,(\supplementdetails@subcategory)}}%
    \fi
    \ifx\supplementdetails@linktext\@empty%
        \protected@edef\tmp{\tmp:\space{\url{#3}}}%
    \else%
        \protected@edef\tmp{\tmp:\space{\href{#3}{\texttt{\supplementdetails@linktext}}}}%
    \fi%
    \ifx\supplementdetails@cite\@empty%
\else%
    \protected@edef\tmp{\tmp\nobreakspace\cite{\supplementdetails@cite}}%
\fi
\ifx\supplementdetails@swhid\@empty%
\else%
    \ifx\supplementdetails@swhlinktext\@empty%
        \protected@edef\tmp{\tmp \supplementdetails@swhdelimiter{} archived at %
        \href{https://archive.softwareheritage.org/\supplementdetails@swhid}{\nolinkurl{\supplementdetails@swhid}}}%
    \else%
        \protected@edef\tmp{\tmp \supplementdetails@swhdelimiter{} archived at %
        \href{https://archive.softwareheritage.org/\supplementdetails@swhid}{\nolinkurl{\supplementdetails@swhlinktext}}}%
    \fi%
    \fi%
    \expandafter\addtosupplementmacro\expandafter{\tmp}{#1}%
    \endgroup%
}%

\def\supplementHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Supplementary Material\enskip}}
\newcommand\flag[2][0.9cm]{%
    \leavevmode\marginpar{%
        \raisebox{\dimexpr-\totalheight+\ht\strutbox\relax}%
        [\dimexpr\ht\strutbox+3mm][\dp\strutbox]{\expandafter\includegraphics[width=#1]{#2}}%
}}
\def\funding#1{\def\@funding{#1}}
\let\@funding\@empty
\def\fundingHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Funding\enskip}}
\def\acknowledgements#1{\def\@acknowledgements{#1}}
\let\@acknowledgements\@empty
\def\acknowledgementsHeading{%
    \textcolor{darkgray}{\fontsize{7}{8}\bfseries
Acknowledgements\enskip}}



\AtBeginDocument{
    \colorlet{itemColor}{bulletgray}%
    \def\@dis@clr{bulletgray}%
    \def\@dis@bg{bulletgray}%
}

\tikzset{
    pics/hookleft/.style args={#1}{
        code = {
            \path[#1] (0,-.5em) -- (.2em,-.5em) -- (.2em,-.2em) -- (.5em,-.2em) -- (.5em,-0em) -- (0,-  0em) -- cycle;
            \node (-text) at (.5em,0) {};
        }
    }
}
\tikzset{
    pics/hookright/.style args={#1}{
        code = {
            \path[#1] (0,.3em) -- (-.2em, .3em) -- (-.2em,.0em) -- (-.5em, .0em) -- (-.5em,-.2em) --    (0,-.2em) -- cycle;
            \node (-text) at (-1em,0) {};
        }
    }
}
\tikzset{
    pics/figurebox/.style args={#1}{
        code = {
            \path[#1] (0,0.73em) rectangle (0.73em,0em); \node(-text) at (.1em,.55ex) {};
        }
    }
}
\tikzset{
    pics/itembox/.style args={#1}{
        code = {
            \path[#1] (0,.3em) rectangle (.5em,.1em); \node(-text) at (.1em,.35ex) {};
        }
    }
}
\tikzset{
    pics/enumbox/.style args={#1}{
        code = {
            \path[#1] (0,.3em) rectangle (.2em,.1em); \node(-text) at (.1em,.35ex) {};
        }
    }
}


\newcommand{\@theoremstartsym}[1]{\raisebox{1.5ex}{%
\tikz[baseline=(t-text.base)]{\pic (t) at (0,0) {hookleft={#1}}; }}}
\newcommand{\@theoremendsym}[1]{\raisebox{.3ex}{%
\tikz[baseline=(t-text.base)]{\pic (t) at (0,0) {hookright={#1}}; }}}
\newcommand{\@figuresym}[1]{\raisebox{.51ex}{%
\tikz[baseline=(t-text.base)]{\pic (t) at (0,0) {figurebox={#1}}; }}}
\newcommand{\@itemsym}[1]{\raisebox{.5ex}{%
\tikz[baseline=(t-text.base)]{\pic (t) at (0,0) {itembox={#1}}; }}}
\newcommand{\@enumsym}[1]{\raisebox{.5ex}{%
\tikz[baseline=(t-text.base)]{\pic (t) at (0,0) {enumbox={#1}}; }}}

\DeclareRobustCommand{\lipicsTriangleUp}[1][thick,draw=\@dis@clr, fill=\@dis@bg]{\@theoremstartsym{#1}}
\DeclareRobustCommand{\lipicsClaimTriangleUp}[1][thin,draw=\@dis@clr,
fill=white]{\@theoremstartsym{#1}}
\DeclareRobustCommand{\lipicsTriangleDown}[1][thick,draw=\@dis@clr, fill=\@dis@bg]{\@theoremendsym{#1}}
\DeclareRobustCommand{\lipicsClaimTriangleDown}[1][thin,draw=\@dis@clr,
fill=white]{\@theoremendsym{#1}}
\DeclareRobustCommand{\lipicsBox}[1][thick,draw=\@dis@clr, fill=\@dis@bg]{\@figuresym{#1}}
\DeclareRobustCommand{\lipicsClaimBox}[1][thin,draw=\@dis@clr, fill=white]{\@figuresym{#1}}
\DeclareRobustCommand{\lipicsTriangleRight}[1][thick,draw=\@dis@clr, fill=\@dis@bg]{\@itemsym{#1}}
\DeclareRobustCommand{\lipicsClaimTriangleRight}[1][thin,draw=\@dis@clr,
fill=white]{\@itemsym{#1}}
\DeclareRobustCommand{\@lipicsTriangleRight}{\if@claimmode\lipicsClaimTriangleRight\else\lipicsTriangleRight\fi}
\DeclareRobustCommand{\lipicsDotRight}[1][thick,draw=\@dis@clr,
fill=\@dis@bg]{{\normalsize\@enumsym{#1}}}
\DeclareRobustCommand{\lipicsClaimDotRight}[1][thin,draw=\@dis@clr,
fill=white]{{\normalsize\@enumsym{#1}}}
\DeclareRobustCommand{\@lipicsDotRight}{\if@claimmode\lipicsClaimDotRight\else\lipicsDotRight\fi}

\thm@headfont{%
  \textcolor{bulletgray}{$\lipicsTriangleUp$}\nobreakspace\quad\bfseries}
\def\th@remark{%
  \thm@headfont{%
    \textcolor{bulletgray}{$\lipicsTriangleUp$}\nobreakspace\quad}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}
\def\@endtheorem{\endtrivlist}

\renewcommand\qedsymbol{\textcolor{bulletgray}{\ensuremath{\lipicsTriangleDown}}}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{darkgray}\bfseries
    #1\@addpunct{\bfseries.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

\newcommand{\claimqedhere}{\renewcommand\qedsymbol{\textcolor{darkgray}{\ensuremath{\lipicsClaimTriangleDown}}}%
\qedhere%
\renewcommand\qedsymbol{\textcolor{darkgray}{\ensuremath{\lipicsTriangleDown}}}}

\newenvironment{claimproof}[1][\proofname]{%
  \@claimmodetrue%
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{darkgray}
    #1\@addpunct{.}]\ignorespaces
}{%
  \renewcommand\qedsymbol{\textcolor{bulletgray}{\ensuremath{\lipicsClaimTriangleDown}}}
  \popQED\endtrivlist\@endpefalse%
  \@claimmodefalse%
  \renewcommand\qedsymbol{\textcolor{bulletgray}{\ensuremath{\lipicsTriangleDown}}}
}

% inspired by qed of amsthm class
\DeclareRobustCommand{\lipicsEnd}{%
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\textcolor{bulletgray}{$\lipicsTriangleDown$}}%
}
\DeclareRobustCommand{\lipicsClaimEnd}{%
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\textcolor{bulletgray}{$\lipicsClaimTriangleDown$}}%
}

\AtBeginDocument{
    \@ifpackageloaded{algorithm2e}{
        \renewcommand{\algorithmcfname}{\bfseries{}Algorithm}
        \SetAlgoCaptionSeparator{\textbf{.}~}
        \SetAlCapHSkip{0pt}
        \renewcommand{\algocf@captiontext}[2]{%
            \kern0.05em{\raisebox{-.1ex}{\color{bulletgray}\rule{0.73em}{0.73em}}}%
        \hspace*{0.67em}\small #1\algocf@capseparator\nobreakspace#2}
        \renewcommand{\algocf@makecaption}[2]{%
            \parbox[t]{\textwidth}{\algocf@captiontext{#1}{#2}}%
        }%
        \renewcommand{\@algocf@capt@boxed}{above}
        \renewcommand{\@algocf@capt@ruled}{above}
        \setlength\algotitleheightrule{0pt}
    }{}
    \@ifpackageloaded{algorithm}{
        \captionsetup[algorithm]{name=Algorithm, labelformat=boxed, position=top}
        \newcommand\fs@ruled@notop{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
            \def\@fs@pre{}%
            \def\@fs@post{\kern2pt\hrule\relax}%
            \def\@fs@mid{\kern2pt\hrule\kern2pt}%
        \let\@fs@iftopcapt\iftrue}
            \renewcommand\fst@algorithm{\fs@ruled@notop}
        }{}
    \ifx\userefcheck\relax\else
        \@ifpackageloaded{refcheck}{\ClassWarning{Use document option 'refcheck'
        instead}{Use document option 'refcheck' instead directly loading package 'refcheck'}}{}
    \fi
}

\RequirePackage[noend,noline,ruled,linesnumbered]{algorithm2e}
\RequirePackage[capitalise, noabbrev]{cleveref}
\crefname{algocf}{Algorithm}{Algorithms}
\Crefname{algocf}{Algorithm}{Algorithms}
\crefname{algocfline}{Line}{Lines}
\Crefname{algocfline}{Line}{Lines}

\ifx\userefcheck\relax
    \RequirePackage{refcheck}
    \overfullrule 1em
    \newcommand{\refcheckize}[1]{%
        \expandafter\let\csname @@\string#1\endcsname#1%
        \expandafter\DeclareRobustCommand\csname relax\string#1\endcsname[1]{%
        \csname @@\string#1\endcsname{##1}\wrtusdrf{##1}}%
        \expandafter\let\expandafter#1\csname relax\string#1\endcsname
    }
    \refcheckize{\cref}
    \refcheckize{\Cref}

    \RequirePackage{labelschanged}
\fi

% from https://tex.stackexchange.com/questions/561963/how-to-avoid-parentheses-brackets-in-the-title-in-amsthm-when-only-using-cite?noredirect=1&lq=1
% (remove extra parenthesis around optional parameter for theorems if the parameter
% contains only a citation)

\ExplSyntaxOn
\NewDocumentCommand{\checkcite}{m}
{%
    \regex_match:nnTF {\A\Z} { #1 }{}{
    \regex_match:nnTF {\A \c{cite}(?:\[[^]]*\])?\{.*\} \Z} { #1 }
    {% only \cite
        \thmt@space\mdseries#1
    }
    {%
        \regex_match:nnTF {\A .*[,;][\s\~]+\{*?\c{cite}(\[[^]]*\])?\{.*?\}\}*? \Z} { #1 }{
            \tl_set:Nn \l_tl { #1 }
            \regex_replace_all:nnN {\A (.*)[,;]([\s\~]+)((?:\{)*\c{cite}(?:\[[^]]*\])?\{.*\}(?:\})*) \Z} {(\1)\~\{\3\}} \l_tl
            \thmt@space\mdseries\l_tl
        }{
            \thmt@space\mdseries(#1)
        }
    }%
    }
}
\ExplSyntaxOff

% from thmtools
\def\thmt@setheadstyle#1{%
    \thmt@style@headstyle{%
        \def\NAME{\the\thm@headfont ##1}%
        \def\NUMBER{\bgroup\@upn{##2}\egroup}%
        \def\NOTE{\checkcite{##3}}%
    }%
    \def\thmt@tmp{#1}%
    \@onelevel@sanitize\thmt@tmp
    %\tracingall
    \ifcsname thmt@headstyle@\thmt@tmp\endcsname
        \thmt@style@headstyle\@xa{%
            \the\thmt@style@headstyle
            \csname thmt@headstyle@#1\endcsname
        }%
    \else
        \thmt@style@headstyle\@xa{%
            \the\thmt@style@headstyle
            #1%
        }%
    \fi
    %\showthe\thmt@style@headstyle
}

\declaretheoremstyle[
    spaceabove=\topsep, spacebelow=\topsep,
    headfont=\normalfont\bfseries,
    headpunct=\normalfont\bfseries.,
    notefont=\mdseries, notebraces={}{},
    bodyfont=\normalfont,
    postheadspace=5pt plus 1pt minus 1pt,
    headformat=\null\lipicsTriangleUp\hskip.61em{\bfseries\NAME~\NUMBER}{\NOTE},
    qed={\lipicsTriangleDown},
]{remstyle}

\declaretheoremstyle[
    spaceabove=\topsep, spacebelow=\topsep,
    headfont=\normalfont\bfseries,
    headpunct=\normalfont\bfseries.,
    notefont=\mdseries, notebraces={}{},
    bodyfont=\itshape,
    postheadspace=5pt plus 1pt minus 1pt,
    headformat=\null\lipicsTriangleUp\hskip.61em{\bfseries\NAME~\NUMBER}{\NOTE},
]{plainstyle}
\declaretheoremstyle[
    spaceabove=\topsep, spacebelow=\topsep,
    headfont=\normalfont\bfseries,
    headpunct=\normalfont\bfseries.,
    notefont=\mdseries, notebraces={}{},
    bodyfont=\itshape,
    postheadspace=5pt plus 1pt minus 1pt,
    headformat=\null\lipicsTriangleUp\hskip.61em{\bfseries\NAME~\NUMBER}{\NOTE},
    qed={\lipicsTriangleDown},
]{plainqstyle}

\declaretheoremstyle[
    spaceabove=\topsep, spacebelow=\topsep,
    headfont=\normalfont,
    headpunct=\normalfont.,
    notefont=\mdseries, notebraces={}{},
    bodyfont=\itshape,
    postheadspace=5pt plus 1pt minus 1pt,
    headformat=\null\lipicsClaimTriangleUp\hskip.61em{\NAME~\NUMBER}{\NOTE},
]{claimstyle}
\declaretheoremstyle[
    spaceabove=\topsep, spacebelow=\topsep,
    headfont=\normalfont,
    headpunct=\normalfont.,
    notefont=\mdseries, notebraces={}{},
    bodyfont=\itshape,
    postheadspace=5pt plus 1pt minus 1pt,
    headformat=\null\lipicsClaimTriangleUp\hskip.61em{\NAME~\NUMBER}{\NOTE},
    qed={\lipicsClaimTriangleDown},
]{claimqstyle}

\declaretheorem[
    name=Main Theorem,
    style=plainstyle,
    refname={Main~Theorem,Main~Theorems},
    Refname={Main~Theorem,Main~Theorems}
]{mtheorem}
\declaretheorem[
    name=Main Theorem,
    style=plainqstyle,
    sibling=mtheorem,
    refname={Main~Theorem,Main~Theorems},
    Refname={Main~Theorem,Main~Theorems}
]{mtheoremq}
\declaretheorem[
    name=Main Theorem,
    style=plainqstyle,
    sibling=mtheorem,
    refname={Main~Theorem,Main~Theorems},
    Refname={Main~Theorem,Main~Theorems}
]{mtheoremqq}

\ifx\numberwithinsect\relax
    \declaretheorem[
        style=plainstyle,
        parent=section,
        refname={Theorem,Theorems},
        Refname={Theorem,Theorems}
    ]{theorem}
\else
    \declaretheorem[
        style=plainstyle,
        refname={Theorem,Theorems},
        Refname={Theorem,Theorems}
    ]{theorem}
\fi

\declaretheorem[
    name=Theorem,
    style=plainqstyle,
    sibling=theorem,
    refname={Theorem,Theorems},
    Refname={Theorem,Theorems}
]{theoremq}
\declaretheorem[
    name=Theorem,
    style=plainqstyle,
    sibling=theorem,
    refname={Theorem,Theorems},
    Refname={Theorem,Theorems}
]{theoremqq}

\declaretheorem[
    style=plainstyle,
    sibling=theorem,
    refname={Lemma,Lemmas},
    Refname={Lemma,Lemmas}
]{lemma}
\declaretheorem[
    name=Lemma,
    style=plainqstyle,
    sibling=theorem,
    refname={Lemma,Lemmas},
    Refname={Lemma,Lemmas}
]{lemmaq}
\declaretheorem[
    name=Lemma,
    style=plainqstyle,
    sibling=theorem,
    refname={Lemma,Lemmas},
    Refname={Lemma,Lemmas}
]{lemmaqq}

\declaretheorem[
    style=plainstyle,
    sibling=theorem,
    refname={Corollary,Corollaries},
    Refname={Corollary,Corollaries}
]{corollary}
\declaretheorem[
    name=Corollary,
    style=plainqstyle,
    sibling=theorem,
    refname={Corollary,Corollaries},
    Refname={Corollary,Corollaries}
]{corollaryq}
\declaretheorem[
    name=Corollary,
    style=plainqstyle,
    sibling=theorem,
    refname={Corollary,Corollaries},
    Refname={Corollary,Corollaries}
]{corollaryqq}


\declaretheorem[
    style=plainstyle,
    sibling=theorem,
    refname={Proposition,Propositions},
    Refname={Proposition,Propositions}
]{proposition}
\declaretheorem[
    name=Proposition,
    style=plainqstyle,
    sibling=theorem,
    refname={Proposition,Propositions},
    Refname={Proposition,Propositions}
]{propositionq}
\declaretheorem[
    name=Proposition,
    style=plainqstyle,
    sibling=theorem,
    refname={Proposition,Propositions},
    Refname={Proposition,Propositions}
]{propositionqq}

\declaretheorem[
    style=plainqstyle,
    sibling=theorem,
    refname={Exercise,Exercises},
    Refname={Exercise,Exercises}
]{exercise}
\declaretheorem[
    name=Exercise,
    style=plainqstyle,
    sibling=theorem,
    refname={Exercise,Exercises},
    Refname={Exercise,Exercises}
]{exerciseq}
\declaretheorem[
    name=Exercise,
    style=plainqstyle,
    sibling=theorem,
    refname={Exercise,Exercises},
    Refname={Exercise,Exercises}
]{exerciseqq}

\declaretheorem[
    style=plainqstyle,
    sibling=theorem,
    refname={Definition,Definitions},
    Refname={Definition,Definitions}
]{definition}
\declaretheorem[
    name=Definition,
    style=plainqstyle,
    sibling=theorem,
    refname={Definition,Definitions},
    Refname={Definition,Definitions}
]{definitionq}
\declaretheorem[
    name=Definition,
    style=plainqstyle,
    sibling=theorem,
    refname={Definition,Definitions},
    Refname={Definition,Definitions}
]{definitionqq}

\declaretheorem[
    style=plainqstyle,
    sibling=theorem,
    refname={Fact,Facts},
    Refname={Fact,Facts}
]{fact}
\declaretheorem[
    name=Fact,
    style=plainqstyle,
    sibling=theorem,
    refname={Fact,Facts},
    Refname={Fact,Facts}
]{factq}
\declaretheorem[
    name=Fact,
    style=plainqstyle,
    sibling=theorem,
    refname={Fact,Facts},
    Refname={Fact,Facts}
]{factqq}

\declaretheorem[
    style=plainqstyle,
    sibling=theorem,
    refname={Hypothesis,Hypotheses},
    Refname={Hypothesis,Hypotheses}
]{hypothesis}
\declaretheorem[
    name=Hypothesis,
    style=plainqstyle,
    sibling=theorem,
    refname={Hypothesis,Hypotheses},
    Refname={Hypothesis,Hypotheses}
]{hypothesisq}
\declaretheorem[
    name=Hypothesis,
    style=plainqstyle,
    sibling=theorem,
    refname={Hypothesis,Hypotheses},
    Refname={Hypothesis,Hypotheses}
]{hypothesisqq}

\declaretheorem[
    style=plainqstyle,
    sibling=theorem,
    refname={Conjecture,Conjectures},
    Refname={Conjecture,Conjectures}
]{conjecture}
\declaretheorem[
    name=Conjecture,
    style=plainqstyle,
    sibling=theorem,
    refname={Conjecture,Conjectures},
    Refname={Conjecture,Conjectures}
]{conjectureq}
\declaretheorem[
    name=Conjecture,
    style=plainqstyle,
    sibling=theorem,
    refname={Conjecture,Conjectures},
    Refname={Conjecture,Conjectures}
]{conjectureqq}

\declaretheorem[
    style=remstyle,
    sibling=theorem,
    refname={Example,Examples},
    Refname={Example,Examples}
]{example}
\declaretheorem[
    name=Example,
    style=remstyle,
    sibling=theorem,
    refname={Example,Examples},
    Refname={Example,Examples}
]{exampleq}
\declaretheorem[
    name=Example,
    style=remstyle,
    sibling=theorem,
    refname={Example,Examples},
    Refname={Example,Examples}
]{exampleqq}

\declaretheorem[
    style=remstyle,
    sibling=theorem,
    refname={Remark,Remarks},
    Refname={Remark,Remarks}
]{remark}
\declaretheorem[
    name=Remark,
    style=remstyle,
    sibling=theorem,
    refname={Remark,Remarks},
    Refname={Remark,Remarks}
]{remarkq}
\declaretheorem[
    name=Remark,
    style=remstyle,
    sibling=theorem,
    refname={Remark,Remarks},
    Refname={Remark,Remarks}
]{remarkqq}

\declaretheorem[
    style=remstyle,
    sibling=theorem,
    refname={Thought,Thoughts},
    Refname={Thought,Thoughts}
]{thought}
\declaretheorem[
    name=Thought,
    style=remstyle,
    sibling=theorem,
    refname={Thought,Thoughts},
    Refname={Thought,Thoughts}
]{thoughtq}
\declaretheorem[
    name=Thought,
    style=remstyle,
    sibling=theorem,
    refname={Thought,Thoughts},
    Refname={Thought,Thoughts}
]{thoughtqq}

\declaretheorem[
    preheadhook={\@claimmodetrue},
    postfoothook={\@claimmodefalse},
    style=claimstyle,
    sibling=theorem,
    refname={Claim,Claims},
    Refname={Claim,Claims}
]{claim}
\declaretheorem[
    preheadhook={\@claimmodetrue},
    postfoothook={\@claimmodefalse},
    name=Claim,
    style=claimqstyle,
    sibling=theorem,
    refname={Claim,Claims},
    Refname={Claim,Claims}
]{claimq}
\declaretheorem[
    preheadhook={\@claimmodetrue},
    postfoothook={\@claimmodefalse},
    name=Claim,
    style=claimqstyle,
    sibling=theorem,
    refname={Claim,Claims},
    Refname={Claim,Claims}
]{claimqq}


\theoremstyle{plainstyle}

% modify thm-restate: endsymbol whenever printing not the numbered variant
% from thm-restate.sty:
\renewenvironment{thmt@restatable}[3][]{%
    \thmt@toks{}% will hold body
    \stepcounter{thmt@dummyctr}% used for data storage label.
    \long\def\thmrst@store##1{%
        \@xa\gdef\csname #3\endcsname{%
            \@ifstar{%
                \thmt@thisistheonefalse\csname thmt@stored@#3\endcsname
            }{%
                \thmt@thisistheonetrue\csname thmt@stored@#3\endcsname
            }%
        }%
        \@xa\long\@xa\gdef\csname thmt@stored@#3\@xa\endcsname\@xa{%
            \begingroup
            \ifthmt@thisistheone
                % these are the valid numbers, store them for the other
                % occasions.
                \thmt@rst@storecounters{#3}%
            \else
                % this one should use other numbers...
                % first, fake the theorem number.
                \@xa\protected@edef\csname the#2q\endcsname{%
                %\thmt@trivialref{thmt@@#3}{??}}%
                \ref{thmt@@#3}}%
                % if the number wasn't there, have a "re-run to get labels right"
                % warning.
                \ifcsname r@thmt@@#3\endcsname\else
                    \G@refundefinedtrue
                \fi
                % prevent stepcountering the theorem number,
                % but still, have some number for hyperref, just in case.
                \@xa\let\csname c@#2q\endcsname=\c@thmt@dummyctr
                \@xa\let\csname theH#2q\endcsname=\theHthmt@dummyctr
                % disable labeling.
                \let\label=\thmt@gobble@label
                \let\ltx@label=\@gobble% amsmath needs this
                % We shall need to restore the counters at the end
                % of the environment, so we get
                % (4.2) [(3.1 from restate)] (4.3)
                \def\thmt@restorecounters{}%
                \@for\thmt@ctr:=\thmt@innercounters\do{%
                    \protected@edef\thmt@restorecounters{%
                        \thmt@restorecounters
                        \protect\setcounter{\thmt@ctr}{\arabic{\thmt@ctr}}%
                    }%
                }%
                % pull the new semi-static definition of \theequation et al.
                % from the aux file.
                \thmt@trivialref{thmt@@#3@data}{}%
            \fi
            \ifthmt@thisistheone
                % call the proper begin-env code, possibly with optional argument
                % (omit if stored via key-val)
                \ifthmt@restatethis
                    \thmt@restatethisfalse
                \else
                    \csname #2\@xa\endcsname\ifx\@nx#1\@nx\else[{#1}]\fi
                \fi
                \ifthmt@thisistheone
                    % store a label so we can pick up the number later.
                    \label{thmt@@#3}%
                \fi
                % this will be the collected body.
                ##1%
                \csname end#2\endcsname
            \else
                % call the proper begin-env code, possibly with optional argument
                % (omit if stored via key-val)
                \ifthmt@restatethis
                    \thmt@restatethisfalse
                \else
                    \csname #2q\@xa\endcsname\ifx\@nx#1\@nx\else[{#1}]\fi
                \fi
                % this will be the collected body.
                ##1%
                \csname end#2q\endcsname
            \fi
            % if we faked the counter values, restore originals now.
            \ifthmt@thisistheone\else\thmt@restorecounters\fi
            \endgroup
        }% thmt@stored@#3
        % in either case, now call the just-created macro,
        \csname #3\@xa\endcsname\ifthmt@thisistheone\else*\fi
        % and artificially close the current environment.
        \@xa\end\@xa{\@currenvir}
    }% thm@rst@store
    \thmt@collect@body\thmrst@store
}{%
    %% now empty, just used as a marker.
}

\ifx\usestocmargin\@undefined
    \def\makeLineNumber{{\makebox[0pt][r]{\linenumberfont\LineNumber\hspace*{3.1em}}}}
\else
    \def\makeLineNumber{{\makebox[0pt][r]{\linenumberfont\LineNumber\hspace*{3.2em}}}}
    \linenumbers
\fi
\ifx\authoranonymous\relax
    \linenumbers
\fi

\RequirePackage[defaultlines=4,all]{nowidow}

\AtBeginDocument{
    \emergencystretch 2em%
    \hfuzz 1\p@
}
\endinput
%%
%% End of file `no-lipics-v2022.cls'.
