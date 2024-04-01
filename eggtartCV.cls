%%  minimalcv.cls
%%  Resume and cover letter template. Extends article class. Modified by Chongfeng Ling.
%%  Mandy Tao, March 2023
%%  Chongfeng Ling, March 2024


%---------------------------------------------------------------------
%                Identification
%---------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eggtartCV}[2023-03-21 v2.0.0 Minimal + Ling CV class]


%---------------------------------------------------------------------
%                Class options
%---------------------------------------------------------------------
% Declare any class options here.
% ...

% Set default options, and pass all unknown to article class.
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ExecuteOptions{a4paper}
\ProcessOptions\relax

% Extend article as base class.
\LoadClass{article}

%---------------------------------------------------------------------
%                Packages
%---------------------------------------------------------------------
% Standard encoding
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Language settings
\RequirePackage[UKenglish]{babel}
\RequirePackage[UKenglish]{isodate}
\cleanlookdateon

% Margin settings
\RequirePackage{geometry}

% Text settings
% \RequirePackage{parskip}
\RequirePackage{setspace}

% if... then... else... constructs
\RequirePackage{ifthen}

% String comparison
\RequirePackage{stringstrings}

% Calculate lengths
% \RequirePackage{calc}

% Graphics for signature
\RequirePackage{graphicx}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}

% Load necessary packages for section formatting and title settings
\RequirePackage{titlesec}
\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large\bfseries
}{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]

% Load necessary packages for PDF and Unicode settings
\RequirePackage{pdfescape} % for PDF strings
\input{glyphtounicode}
\pdfgentounicode=1

% Load other necessary packages
\RequirePackage{marvosym} % for additional symbols

% Load necessary packages for fonts and symbols
\RequirePackage{latexsym}       % For additional symbols
\RequirePackage{marvosym}       % For additional symbols
\RequirePackage{fontawesome5}   % For Font Awesome icons

\RequirePackage{enumitem} % for customizing itemize environments
\RequirePackage{xcolor} % for color customization
\RequirePackage{hyperref} % for hyperlinks

%---------------------------------------------------------------------
%                Resume command definitions
%---------------------------------------------------------------------
\newcommand{\resumeItem}[1]{
	\item\small{
		{#1 \vspace{-2pt}}
	}
}


\newcommand{\classesList}[4]{
	\item\small{
		{#1 #2 #3 #4 \vspace{-2pt}}
	}
}

\newcommand{\resumeSubheading}[4]{
	\vspace{-2pt}\item
	\begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
		\textbf{#1} & \textbf{\small #2} \\
		\textit{\small#3} & \textit{\small #4} \\
	\end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubSubheading}[2]{
	\item
	\begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
		\textit{\small#1} & \textit{\small #2} \\
	\end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeProjectHeading}[2]{
	\item
	\begin{tabular*}{1.001\textwidth}{l@{\extracolsep{\fill}}r}
		\small#1 & \textbf{\small #2}\\
	\end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubItem}[1]{\resumeItem{#1}\vspace{-4pt}}

\renewcommand\labelitemi{$\vcenter{\hbox{\tiny$\bullet$}}$}
\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=0.0in, label={}]}
		\newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
\newcommand{\resumeItemListStart}{\begin{itemize}}
		\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}

\newcommand{\customSubheading}[6]{
	\vspace{-2pt}\item
	\begin{tabular*}{1.0\textwidth}[t]{l@{\extracolsep{\fill}}r}
		\ifx&#1&%
		\textbf{#2} & \textbf{\small #3} \\
		\else
		\textbf{#2} \href{#1}{\small  \color{blue}[#4]} & \textbf{\small #3} \\
		\fi
		\textit{\small#5} & \textit{\small #6} \\
	\end{tabular*}\vspace{-7pt}
}

\newcommand{\updateinfo}{\par\vfill\hfill\scriptsize\color{gray} Last updated on \today}

\newcommand{\projectItem}[3]{
	\item
	\textbf{#1}  $|$ \emph{#2} \href{#3}{\small\color{blue}[repo]}
	\vspace{-7pt}
}

\newcommand{\projectItemNoRepo}[2]{
	\item
	\textbf{#1}  $|$ \emph{#2}
	\vspace{-7pt}
}

\newcommand{\skill}[2]{
    \item 
    \textbf{#1} : {\small #2}
    \vspace{-7pt}
}

%---------------------------------------------------------------------
%                Base layout configuration
%---------------------------------------------------------------------
\RequirePackage{fullpage}

% Adjust page margins
\addtolength{\oddsidemargin}{-0.6in}
\addtolength{\evensidemargin}{-0.5in}
\addtolength{\textwidth}{1.19in}
\addtolength{\topmargin}{-0.7in}
\addtolength{\textheight}{1.4in}
% \addtolength{\footskip}{0in}

% Set text alignment and table column separation
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

% Define page style
\pagestyle{empty}


%---------------------------------------------------------------------
%                Profile command definitions
%---------------------------------------------------------------------
% elements

\newcommand*{\name}[2]{
    \def\@firstname{#1}\def\@lastname{#2}
    \author{\@firstname~\@lastname}
}
\newcommand*{\signature}[2][2.5em]{
    \def\@signaturesize{#1}
    \def\@signatureimage{#2}
}
\renewcommand*{\title}[1]{\def\@title{#1}}
\newcommand*{\city}[1]{\def\@city{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[2]{\def\@homepage{#1}\def\@homepagetitle{#2}}

% makes a generic hyperlink
% usage: \link[optional text]{link}
\newcommand*{\link}[2][]{
    \ifthenelse{\equal{#1}{}}
        {\href{#2}{#2}}
        {\href{#2}{#1}}
}

% makes a http hyperlink
% usage: \httplink[optional text]{link}
\newcommand*{\httplink}[2][]{
    \ifthenelse{\equal{#1}{}}
        {\href{https://#2}{#2}}
        {\href{https://#2}{#1}}
}

% makes an email hyperlink
% usage: \emaillink[optional text]{link}
\newcommand*{\emaillink}[2][]{
    \ifthenelse{\equal{#1}{}}
        {\href{mailto:#2}{#2}}
        {\href{mailto:#2}{#1}}
}

% makes profile section as document letterhead
% usage: \makeprofile
\newcommand*{\makeprofile}{
    \begin{center}
    	{\Huge \scshape {\@firstname~\@lastname}}\\
        \vspace{2mm}
    	\@city~$\cdot$~\emaillink{\@email}~$\cdot$~{\@phone}\\
    \end{center}
}

%---------------------------------------------------------------------
%                Cover letter command definitions
%---------------------------------------------------------------------
% elements
\newcommand*{\recipient}[3]{
    \def\@recipienttitle{#1}
    \def\@recipientfirstname{#2}
    \def\@recipientlastname{#3}
}
\newcommand*{\jobtitle}[1]{\def\@recipientjobtitle{#1}}
\newcommand*{\company}[1]{\def\@recipientcompany{#1}}
\newcommand*{\address}[1]{\def\@recipientaddress{#1}}
\renewcommand*{\date}[1]{\def\@date{#1}}\date{\today}
\newcommand*{\subject}[1]{\def\@subject{#1}}

% Define cover letter
\newenvironment{coverletter}{
    % page settings
    \clearpage
    \newgeometry{vmargin=1.2cm, hmargin=2.5cm}
    % build header area
    \makeprofile
    \hrulefill\\[1ex]
    % text settings
    \setstretch{1.1}
    \parskip=12pt plus1pt
    % fill address and subject block
    \makelettertitle
    % salutation
    \makeletteropening
}{
    % valediction
    \makeletterclosing
    % restore geometry
    \restoregeometry
}

% makes the letter title block
% usage: \makelettertitle
\newcommand*{\makelettertitle}{
    % recipient block
    \begin{minipage}[t]{.5\textwidth}
        \normalsize\mdseries\slshape
        \ifthenelse{\isundefined{\@recipientlastname}}
            {{\bfseries\upshape\@recipientjobtitle}\\}
            {
                {\bfseries\upshape\@recipienttitle~\@recipientfirstname~\@recipientlastname}\\
                \@recipientjobtitle\\
            }
        \@recipientcompany\\
        \@recipientaddress
    \end{minipage}
    % date
    \hfill \@date\\[2em]
    % subject
    {\bfseries\centering\@subject\\[1.2em]}
    % ensure no extra spacing after \makelettertitle due to a possible blank line
    %  \ignorespacesafterend% not working
    \hspace{0pt}\par\vspace{-\baselineskip}\vspace{-\parskip}
}

% makes the letter opening salutation
% usage: \makeletteropening
\newcommand*{\makeletteropening}{
    \ifthenelse{\isundefined{\@recipientlastname}}
        {Dear Sir or Madam,}
        {Dear \@recipienttitle~\@recipientlastname,}
    \par
}

% makes the letter closing
% usage: \makeletterclosing
\newcommand*{\makeletterclosing}{
    \vspace{2em}
    % valediction
    \ifthenelse{\isundefined{\@recipientlastname}}
        {Yours faithfully,}
        {Yours sincerely,}
    \par
    % signature
    \ifthenelse{\isundefined{\@signatureimage}}
        {}
        {\includegraphics[height=\@signaturesize]{\@signatureimage}\\}
    % name
    \@firstname~\@lastname
}

\endinput
