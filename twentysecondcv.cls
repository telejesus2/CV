\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage{tabulary}
\RequirePackage{dashrule}



\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
%\definecolor{darkblue}{HTML}{36486B}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{black}{RGB}{0,0,0}
\colorlet{body}{black!80!white}


%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{2cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{4cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\Large #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-8.22221pt}% Modifier to remove overfull box warning
	\vspace{0pt}% Whitespace before the section title
	{\color{black} \bf \Large #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
% \newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvfirstname}[1]{\renewcommand{\cvfirstname}{#1}}
\newcommand{\cvlastname}[1]{\renewcommand{\cvlastname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvjobdate}[1]{\renewcommand{\cvjobdate}{#1}}
\newcommand{\cvcar}[1]{\renewcommand{\cvcar}{#1}}
\newcommand{\cvnation}[1]{\renewcommand{\cvnation}{#1}}
\newcommand{\cvin}[1]{\renewcommand{\cvin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvwebsite}[1]{\renewcommand{\cvwebsite}{#1}}


% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=char.base]{\node[shape=circle,draw,inner sep=0.1pt, fill=mainblue,mainblue,text=white, minimum size=0.7cm, maximum size=0.7cm] (char) {#1};}}

\newcommand{\divider}{\textcolor{black!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y 
			}
		\end{flushleft}
	}
}

\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex, fill=blue!05]{#1};
}

\newcommand{\cvtagg}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex, fill=blue!15]{#1};
}

\newcommand\languagestext[1]{ 
	\renewcommand{\languagestext}{
	\foreach [count=\i] \x/\y/\z in {#1}{ \hspace{1}
		\large {\bf\color{mainblue}\x}  \color{black}\y \\ \ifthenelse{\equal{\i}{2}}{\hspace*{1}}{\hspace*{0.0}}   \normalsize \emph{\z} \\ \ifthenelse{\equal{\i}{2}}{}{\divider}
		
	}
	}
}

\newcommand{\languagestextsingle}[1]{
\renewcommand{\languagestextsingle}{
\foreach [count=\i] \x/\y in {#1}{ \hspace{1}
\large {\bf\color{mainblue}\x} \color{black}\y \\ \divider

}
}
}


\newcommand{\intereststext}[1]{
\renewcommand{\intereststext}{
\foreach [count=\i] \x/\y in {#1}{ \hspace{1}
\large {\bf\color{mainblue}\x} \color{black}\y \\ \ifthenelse{\equal{\i}{4}}{}{\divider}

}
}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=8cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{5}(0.1, 0.2)
		
		\vspace{2mm}
		
		%------------------------------------------------
		\begin{center}
			{\Large\color{black}\cvfirstname}
		\end{center}

		\vspace{1mm}

		\begin{center}
			{\Large\color{black}\cvlastname}
		\end{center}

		\vspace{4mm}

		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		\vspace{4mm}
		
		%------------------------------------------------

        \renewcommand{\arraystretch}{1.5}
		\begin{table}[hbtp]
        \settowidth\tymin{\textbf{Activities}}
        \setlength\extrarowheight{2pt}
        \begin{tabulary}{1.0\textwidth}{@{\hskip 0.1cm}L@{\hskip 0.2cm}m{3.7cm}}
            \textsc{\Large\icon{\faHome}} & \cvaddress\\
            \textsc{\Large\icon{\faPhone}} & \cvnumberphone\\
            \textsc{\Large\icon{\faAt}} & \cvmail\\
            \textsc{\large\icon{\faCalendar}} & \cvdate \\
            \textsc{\large\icon{\faCar}} & \cvcar\\
            \textsc{\Large\icon{\faGlobe}} & \cvnation\\
            \textsc{\Large\icon{\faLinkedin}} & \cvin\\
            %\textsc{\Large\icon{\faGithub}} & \cvgithub\\
            \textsc{\Large\icon{\faLaptop}} & \cvwebsite\\
        \end{tabulary}
        \end{table}

		%------------------------------------------------3
		
		\ifthenelse{\equal{\aboutme}{}}{}{
			\profilesection{About me}
			\begin{flushleft}
				\aboutme
			\end{flushleft}
		}

		%------------------------------------------------
		
		\vspace{5mm}

		\profilesection{\textbf{Languages}}

		\vspace{2mm}

		\languagestextsingle

		\languagestext
		
		\vspace{2mm}

		\profilesection{Hobbies}

		\vspace{2mm}

		\intereststext
		
		\vspace{2mm}
		%------------------------------------------------

		%\profilesection{Skills}

		%\skills
		%\skillstext
		%\scriptsize
		%(*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		%------------------------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline]\node[anchor=base, draw,rectangle, rounded corners, inner sep=2pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		%\round{#1}{
		%	\ifcase\value{colorCounter}%
		%	maingray\or%
		%	mainblue\or%
		%	maingray\or%
		%	mainblue\or%
		%	maingray\or%
		%	mainblue\or%
		%	maingray\or%
		%	mainblue\or%
 		%	maingray\or%
		%	mainblue\else%
		%	maingray\fi%
		%}%
		\round{#1}{
			%\ifcase\value{colorCounter}%
			mainblue%\or%
			%mainblue\or%
			%mainblue\or%
			%mainblue\or%
			%mainblue\or%
			%mainblue\or%
			%maingray\or%
			%mainblue\or%
 			%maingray\or%
			%mainblue\else%
			%maingray\fi%
		}%
	}%
	%\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{2pt}

% New environment for the long list
\newenvironment{twenty}{%
	% \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemskill}[4]{\large
	#1&\parbox[t]{0.80\textwidth}{%
		{\bf\large#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

\newcommand{\twentyitem}[4]{
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{\large#2}%
		\hfill%
		{\it\color{gray}{#3}}\\%
		\large#4\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\large#2%
		\vspace{1mm}
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=6.1cm,top=0.05cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=purple,
}
 
\urlstyle{same}
