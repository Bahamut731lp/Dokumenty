\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{newsletter}[KDR Newsletter]

% Load standard article class as base
\LoadClass[12pt]{article}

% Set up packages
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{parskip}
\RequirePackage{xcolor}  % For color
\RequirePackage{tcolorbox} % For creating colored boxes
\RequirePackage{graphicx} % For including images
\RequirePackage{background} % For setting background images
\RequirePackage{hyperref}
\RequirePackage[none]{hyphenat}

% Page layout
\geometry{a4paper, margin=1in}
\setlength{\parskip}{1em}

% Lists
\setlength\itemsep{0.75em}

% Fonts
\RequirePackage{fontspec}
\setmainfont{Geogrotesque}

% Title format
\titleformat{\section}{\normalfont\Large\bfseries}{\thesection.}{1em}{}
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection.}{1em}{}

\newfontface\GeogrotesqueSemibold{Geogrotesque Semibold.ttf}
\newfontface\GeogrotesqueBold{Geogrotesque Bold.ttf}
\newfontface\GeogrotesqueCondensedBold{Geogrotesque Condensed Bold.ttf}

% Quotes
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}[2][]
{\if\relax\detokenize{#1}\relax
\def\quoteauthor{#2}%
\else
\def\quoteauthor{#2~---~#1}%
\fi
\oldquote}
{\par\nobreak\smallskip\quoteauthor%
\endoldquote\addvspace{\bigskipamount}}

% New commands

%% Heading
\newcommand{\clanek}[2]{
\begingroup
    \vspace{4em} % Adjust the space size as needed

    \setlength{\parskip}{0pt} % Temporarily set \parskip to zero

    % Title at ~64px (48pt)
    {\fontsize{32pt}{44pt}\GeogrotesqueSemibold\MakeUppercase{#1}} % Main title

    \vspace{0.5em}

    % Subtitle at ~48px (36pt)
    {\fontsize{22pt}{36pt}\GeogrotesqueSemibold\MakeUppercase{#2}} % Subtitle

    \endgroup
}

%% Title
\newcommand{\kdrtitle}[1]{\def\@kdrtitle{#1}}
\newcommand{\kdrsubtitle}[1]{\def\@kdrsubtitle{#1}}
\newcommand{\kdrbackground}[1]{\def\@kdrbackground{#1}}

\newcommand{\settitlepagebackground}{%
    \backgroundsetup{
        scale=1, % Scale the image to the entire page
        color=black, % Color (can be used for transparency)
        opacity=1.0, % Opacity level (0.0 to 1.0)
        angle=0, % Angle of the image
        placement=bottom,
        position=current page.south, % Positioning
        vshift=0cm, % Vertical shift
        hshift=0cm, % Horizontal shift
        contents={\includegraphics[width=\paperwidth,height=\paperheight,keepaspectratio]{\@kdrbackground}} % Use the variable path
    }%
}


% Admonitions
\definecolor{bordergray}{HTML}{9E9E9E}   % Border color
\definecolor{cfred}{HTML}{DB1C30}
\definecolor{cfgreen}{HTML}{179015}
\definecolor{cfblue}{HTML}{102D69}
\colorlet{titlebgcolor}{bordergray!10} % Create a transparent version by mixing

\newtcolorbox{admonition-quote}[2][]{
    colback=white, % Body background color
    colframe=gray!60, % Border color (approximation of #9E9E9E)
    colbacktitle=gray!10, % Background color of the title (approximation of #9E9E9E1A)
    coltitle=black!80, % Title text color (approximation of #9E9E9E)
    title={\vspace{0.5em} #2 \vspace{0.25em}}, % Title of the box
    fonttitle=\normalfont, % Title font style
    rounded corners=all, % Optional: rounded corners
    boxrule=0.2mm, % Border thickness
    before=\vspace{1em}, % Space before the box
    after=\vspace{1em}, % Space after the box
}

\newtcolorbox{admonition-info}[2][]{
    colback=white, % Body background color
    colframe=cfblue, % Border color (approximation of #9E9E9E)
    colbacktitle=cfblue, % Background color of the title (approximation of #9E9E9E1A)
    coltitle=white, % Title text color (approximation of #9E9E9E)
    title={\vspace{0.5em}\MakeUppercase{\textbf{#2}}\vspace{0.5em}}, % Title of the box
    fonttitle=\normalfont, % Title font style
    rounded corners=all, % Optional: rounded corners
    boxrule=0.2mm, % Border thickness
    before=\vspace{1em}, % Space before the box
    after=\vspace{1em}, % Space after the box
}

\newtcolorbox{borderedquote}[1][]{
    colback=white,           % Background color
    colframe=gray!60,        % Border color (adjust as needed)
    coltitle=black!80,       % Text color inside the box
    fonttitle=\normalfont,   % Title font style
    rounded corners=all,     % Optional: rounded corners
    boxrule=0.2mm,           % Border thickness
    before=\vspace{1em},     % Space before the box
    after=\vspace{1em},      % Space after the box
    width=\textwidth,        % Full width of the text
    #1,
}

\newenvironment{pravidlo}[3] {
    \begin{admonition-quote}{#1}
        \begin{enumerate}
            \addtocounter{enumi}{\numexpr#3-1\relax}
            \item \textbf{#2}
            \begin{flushleft}
}{
            \end{flushleft}
        \end{enumerate}
    \end{admonition-quote}
}
% Links

\hypersetup{
    colorlinks=true,
    urlcolor=blue,
    urlbordercolor=blue,
    pdfborder={0 0 1},
}

\settitlepagebackground % Set the background image using the variable path

% Begin document content
\AtBeginDocument{
\hypersetup{pdfborderstyle={/S/U/W 1}}
\sloppy
\begin{titlepage}
    \begingroup
    \setlength{\parskip}{0pt} % Temporarily set \parskip to zero
    \backgroundsetup{
    scale=1, % Scale the image to the entire page
    color=black, % Color (can be used for transparency)
    opacity=1.0, % Opacity level (0.0 to 1.0)
    angle=0, % Angle of the image
    position=current page.north, % Positioning
    vshift=0cm, % Vertical shift
    hshift=0cm, % Horizontal shift
    contents={\includegraphics[width=\paperwidth,height=\paperheight]{background.png}} % Path to your image
    }
    
    \begin{flushleft}
        \raisebox{-0.5\height}{\includegraphics[width=2.6cm, keepaspectratio]{cf-logo-white}} % Replace with your logo file
        \hspace{0.5em} % Space between logo and text
        \parbox{8cm}{ % Width of the parbox can be adjusted
        \textcolor{white}{\vspace{0.5em}{\fontsize{32pt}{16pt}\GeogrotesqueBold{\begin{flushleft}ČESKÝ FLORBAL\end{flushleft}}} 
        {\fontsize{20pt}{20pt}\GeogrotesqueBold{LIBERECKÝ\\A ÚSTECKÝ KRAJ}}}
        }
    \end{flushleft}
    
    \vspace*{\fill}
    
    {\textcolor{white}{\fontsize{48pt}{52pt}\GeogrotesqueBold \MakeUppercase{\@kdrtitle}}} % Main title with font size
    \vspace{20pt} % Space between title and subtitle
    
    {\textcolor{white}{\fontsize{22pt}{36pt}\selectfont \@kdrsubtitle}} % Subtitle with font size
    \endgroup
\end{titlepage}
\backgroundsetup{contents={}}
}

\endinput