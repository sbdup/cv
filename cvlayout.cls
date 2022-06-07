\ProvidesPackage{cvlayout}
\LoadClass{article}
%-------------------------------------------------------------------------------
%
%                Packages
%
%-------------------------------------------------------------------------------

\RequirePackage[many, breakable]{tcolorbox}
\RequirePackage{geometry}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{listofitems}
\RequirePackage{multirow}
\RequirePackage{fontawesome}
\RequirePackage{xstring}

\geometry{
  a4paper,
  left=0.5cm,
  right=0.5cm,
  top=1cm,
  bottom=1cm
}

\listfiles % List version of package used in the log output

\pagenumbering{gobble} % Remove page numbering

\setitemize{nosep} % Remove blank between items

%-------------------------------------------------------------------------------
%
%                Colors
%
%-------------------------------------------------------------------------------

\definecolor{blue}{RGB}{61, 90, 128}
\colorlet{lightblue}{blue!85!white}

\definecolor{orange}{RGB}{238, 108, 77}
\colorlet{lightorange}{orange!85!white}
\colorlet{palebrown}{lightorange!30!white}

%-------------------------------------------------------------------------------
%                TColorBox
%-------------------------------------------------------------------------------

\tcbset{global-style/.style={left=0cm, right=0cm, top=0cm, bottom=0cm}}

\tcbset{boxcompany-style/.style={
  colframe=white, 
  colbacktitle=blue,
  colback=white,
  fonttitle=\bfseries\large,
  global-style, 
  enhanced,
  enforce breakable
  }}

\tcbset{boxclient-style/.style={
  colframe=lightblue, 
  colbacktitle=lightblue, 
  colback=white, 
  enhanced,
  left=1mm, 
  top=-1.6mm, 
  right=-1.6mm, 
  bottom=1mm, 
  middle=0mm,
  halign lower=center-2mm,
  arc=1mm,
  segmentation hidden
  }}

\tcbset{boxclientinner-style/.style={
  colback=white,
  enhanced,
  left=2mm,
  top=0mm,
  right=2mm,
  bottom=0mm,
  sidebyside,
  sidebyside gap=5mm, 
  lefthand width=2cm,
  valign=top seam,
  frame hidden, 
  segmentation hidden,
  underlay={
    \begin{tcbclipinterior}
      \draw[lightblue,line width=0.3mm, top color=lightblue,bottom color=lightblue] 
        (interior.north east)--([yshift=-.5cm]interior.north east)
        --([xshift=-4.1cm, yshift=-.5cm]interior.north east)
        cos +(-.5,.25)
        sin +(-.5,.25)
        --(interior.north east);          
    \end{tcbclipinterior}
  }}}
  
\tcbset{boxkeys-style/.style={
  colframe=lightorange, 
  colback=lightorange, 
  colbacklower=palebrown,
  before upper=\hfill\textbf{Mots-clés},
  global-style, 
  enhanced,
  arc=0mm, 
  sidebyside,
  bicolor,
  lefthand width=2cm
  }}

\tcbset{boxgrade-style/.style={
  colframe=lightblue, 
  colback=white, 
  global-style, 
  enhanced,
  arc=1mm, 
  sidebyside,
  sidebyside gap=5mm,
  sidebyside align=top seam,
  halign upper=center,
  lefthand width=2.3cm,
  segmentation style={lightblue},
  underlay={
    \begin{tcbclipinterior}
      \draw[lightblue,line width=0.3mm, top color=lightblue,bottom color=lightblue] 
        (interior.north east)--([yshift=-.5cm]interior.north east)
        --([xshift=-1cm, yshift=-.5cm]interior.north east)
        cos +(-.5,.25)
        sin +(-.5,.25)
        --(interior.north east);          
    \end{tcbclipinterior}
  }}}

\tcbset{boxrasterized-style/.style={
  raster columns=2, 
  raster equal height=rows, 
  halign=flush left
  }}

\tcbset{boxcertification-style/.style={
  colframe=lightblue, 
  colback=white, 
  global-style, 
  enhanced,
  arc=1mm, 
  sidebyside,
  sidebyside gap=4mm,
  sidebyside align=top seam,
  halign upper=center,
  lefthand width=2.3cm,
  segmentation style={lightblue},
  underlay={
    \begin{tcbclipinterior}
      \draw[lightblue,line width=0.3mm, top color=lightblue,bottom color=lightblue] 
        (interior.north east)--([yshift=-.5cm]interior.north east)
        --([xshift=-1cm, yshift=-.5cm]interior.north east)
        cos +(-.5,.25)
        sin +(-.5,.25)
        --(interior.north east);          
    \end{tcbclipinterior}
  }}}

\tcbset{boxskills-style/.style={
  colframe=lightblue, 
  colback=lightblue, 
  colbacklower=white,
  global-style, 
  enhanced,
  arc=1mm, 
  sidebyside,
  sidebyside gap=2mm,
  halign upper=center,
  bicolor,
  lefthand width=3cm
  }}

%-------------------------------------------------------------------------------
%
%                Layout
%
%-------------------------------------------------------------------------------
\newlength{\remaining}
\newcommand{\titleline}[1]{%
  \setlength{\remaining}{\textwidth-\widthof{\textsc{#1}}}
  \noindent\underline{\textsc{#1}\hspace*{\remaining}}\par
}

%-------------------------------------------------------------------------------
%                Header
%-------------------------------------------------------------------------------

\newcommand{\makecvheader}{
  \hskip-0.3cm
  \begin{tabular}{ p{.5\linewidth}rc }
    & & \\
    \multirow{2}{*}{\name} & \addressstreet & \multirow{8}{*}{\includegraphics[width=3cm]{\pathprofilphoto}} \\
    & \addresscity & \\
    & \phone & \\
    \multirow{2}{*}{\role} & \mail & \\
    & \linkedin & \\
    & \github & \\
    & & \\
    
    \multicolumn{2}{c}{\multirow{3}{*}{\parbox{.78\linewidth}{
    \setlength{\parindent}{10pt} 
    \large\slshape\textcolor{blue}{\desc}
    }}} & \\
    \multicolumn{2}{c}{} & \\
    \multicolumn{2}{c}{} & \\ 
    \multicolumn{2}{c}{} & \\
  \end{tabular}
  % \vspace*{.15cm}
}

%-------------------------------------------------------------------------------
%                Body
%-------------------------------------------------------------------------------

\newcommand{\boxcompany}[3]{
  \begin{tcolorbox}[title=#1\hfill#2, boxcompany-style]
  #3
  \end{tcolorbox}
}

\newcommand{\boxclient}[5]{
  \begin{tcolorbox}[boxclient-style]
    \begin{tcolorbox}[boxclientinner-style]
      \hskip-1mm\includegraphics[width=2cm]{#1}
      \tcblower
      \textbf{#2}\hfill\hspace*{2mm}\textbf{\textcolor{white}{#3}}
      \vspace*{.25cm}\\
      #4
    \end{tcolorbox}
    \tcblower
    \hskip
    \begin{tcolorbox}[boxkeys-style, width=\textwidth-0.5cm, before skip=0mm]
      \tcblower#5
    \end{tcolorbox}
  \end{tcolorbox}
}

\newcommand{\boxkeys}[1]{
  \begin{tcolorbox}[boxkeys-style]
    \tcblower#1
  \end{tcolorbox}
}

\newcommand{\boxgrade}[5]{
  \begin{tcolorbox}[boxgrade-style]
    \includegraphics[width=1.4cm]{#1}
    \tcblower
    \vspace*{.15cm}
    \begin{minipage}[t]{.75\textwidth}
      \textbf{#2: #4}
      \vspace*{.15cm}\\
      #5
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.15\textwidth}
      \begin{flushright}
        \vspace*{-.4cm}\textbf{\textcolor{white}{#3}}\hspace*{2mm}
      \end{flushright}
    \end{minipage}
  \end{tcolorbox}
}

\newcommand{\boxcertifications}[6]{
  \begin{tcbraster}[boxrasterized-style]
    \begin{tcolorbox}[boxcertification-style]
      \includegraphics[height=1.5cm]{#1}
      \tcblower
      \hfill\textbf{\textcolor{white}{#3}}\hspace*{2mm}
      
      \vspace*{.25cm}
      \textbf{#2}
    \end{tcolorbox}
    \begin{tcolorbox}[boxcertification-style]
      \includegraphics[height=1.5cm]{#4}
      \tcblower
      \hfill\textbf{\textcolor{white}{#6}}\hspace*{2mm}
      
      \vspace*{.25cm}
      \textbf{#5}
    \end{tcolorbox}
  \end{tcbraster}
}

\newcommand{\boxskills}[4]{
  \begin{tcbraster}[boxrasterized-style]
    \ifx&#1&
    \else
      \begin{tcolorbox}[before upper=\textbf{\textcolor{white}{#1}}, boxskills-style]
        \tcblower#2
      \end{tcolorbox}
    \fi
    \ifx&#3&
    \else
      \begin{tcolorbox}[before upper=\textbf{\textcolor{white}{#3}}, boxskills-style]
        \tcblower#4
      \end{tcolorbox}
    \fi
  \end{tcbraster}
}