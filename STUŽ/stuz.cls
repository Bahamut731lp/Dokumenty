\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stuz}[STUŽ Dokument]

\LoadClass[12pt,a4paper]{article}

\RequirePackage[czech]{babel}
\RequirePackage[toc,page]{appendix}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{float}
\RequirePackage[none]{hyphenat}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{parskip}

% Cesta k obrazkum
\graphicspath{ {obrazky/} }
% Okraje
\geometry{top=2.5cm, bottom=5cm, left=2.5cm, right=2.5cm}
% Velikost hlavicky
\setlength{\headheight}{2.5cm} % Výška hlavičky

% Hlavicka
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\includegraphics[height=1cm]{logo.png}} % Logo společnosti
\fancyhead[L]{
	\textbf{Společnost pro trvale udržitelný život}\\
	Českolipská regionální pobočka
}

% Nazev dokumentu
\newcommand{\nazev}[2]{
    \begin{center}
        {\Large \textbf{#1}}\\
        {\textbf{#2}}
    \end{center}
}

% Sekce
\newcommand{\sekce}[1]{
	\begin{center}
		\textbf{#1}
	\end{center}
}

\newcommand{\signature}[3]{
	\begin{flushleft}
		\textbf{#1}
		\\
		\textit{#2}
		
		\footnotesize{#3}
	\end{flushleft}
}

\endinput