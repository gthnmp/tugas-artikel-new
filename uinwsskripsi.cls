\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uinwsskripsi}[2021/02/14 v2.0 class skripsi FST UIN Walisongo Semarang]

%-----------------------------------------
% created by MMF Vlogs 
% YT   : https://youtube.com/c/MMFVlogs
% Blog : https://mmfvlogs.blogspot.com
%-----------------------------------------

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}


\usepackage{caladea}
\usepackage{amsmath,amssymb,latexsym,graphicx}
\usepackage{tabularx}
\usepackage[none]{hyphenat}
\sloppy

%\usepackage[colorlinks=true,linkcolor=blue]{hyperref}

\newif\if@singlesp
\newif\if@doublesp
\newif\if@onehalfsp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse\@onehalfspfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue\@onehalfspfalse}
\DeclareOption{satusetengahspasi}{\@singlespfalse\@onehalfsptrue\@doublespfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{skripsi,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a5paper,12pt,openright]{report}

%-----------------------------------------------------
% Setting bibliografi
%-----------------------------------------------------
\RequirePackage{natbib}
%\bibliographystyle{plainnat}
\usepackage{url}
%\newcommand{\bibTitle}[1]{''#1''}

\renewcommand\@biblabel[1]{#1} % No brackets for the references
\renewenvironment{thebibliography}[1]
      {\chapter*{\refname}%
       \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
       \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
             \leftmargin\labelwidth
             \advance\leftmargin20pt% change 20 pt according to your needs
             \advance\leftmargin\labelsep
             \setlength\itemindent{-20pt}% change using the inverse of the length used before
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
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
%-----------------------------------------------------

\RequirePackage{nomencl}%
\renewcommand{\nomname}{\nomenclaturename}%
\makeglossary%

\RequirePackage[tableposition=above,format=hang,labelsep=period]{caption}

\usepackage{geometry}
 \geometry{
 a5paper,
 total={108mm,170mm},
 left=20mm,
 top=20mm,
 %twoside, 
 %bindingoffset=5mm
% showframe
 }

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{{\slshape\rightmark}\hfil\thepage\hfil}% ditambahi \hfil setelah \thepage biar simetris
  \def\@evenfoot{\hfil\thepage\hfil\slshape\leftmark}% ditambahi \hfil sebelum \thepage biar simetris
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{3}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@section.}
\renewcommand\thesubsection   {\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\@alph\c@subsubsection.}\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@arabic\c@chapter}}
\renewcommand{\chapter}{\cleardoublepage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}%\centering
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

%------------------------------------------------------------
%Mengganti istilah
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\articlename{WAWASAN NUSANTARA SEBAGAI SARANA UNTUK MENGENAL INDONESIA}%
\def\abstractname{ABSTRAK}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{Lampiran}%
\def\refname{DAFTAR PUSTAKA}%
%\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\articlename{WAWASAN NUSANTARA SEBAGAI SARANA UNTUK MENGENAL INDONESIA}%
\def\creator{Ibrahim Pasya Arvianto}
\def\studi{Fakultas Sains Dan Teknologi}
\def\abstractname{ABSTRAK}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{Lampiran}%
\def\refname{DAFTAR PUSTAKA}%
%\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%---------------------------------
%Mengatur dengan tocloft
%---------------------------------

\usepackage{tocloft}

\newcommand{\listappendicesname}{DAFTAR LAMPIRAN}
\newlistof[lampiran]{appendices}{apc}{\listappendicesname}
\newcommand{\appendices}[1]{%
\refstepcounter{appendices}
\cleardoublepage\newpage\par\noindent\textbf{Lampiran \theappendices. #1}\vspace{1cm} 
\addcontentsline{apc}{appendices}{\protect\numberline{\theappendices}#1}\par}

\renewcommand{\cfttoctitlefont}{\hfil \bfseries\large}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{-0.25in} 

\renewcommand{\cftloftitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterloftitle}{\hfil}
\renewcommand{\cftbeforeloftitleskip}{-0.25in} 

\renewcommand{\cftlottitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterlottitle}{\hfil}
\renewcommand{\cftbeforelottitleskip}{-0.25in} 

\renewcommand{\cftapctitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterapctitle}{\hfil}
\renewcommand{\cftbeforeapctitleskip}{-0.25in} 

\renewcommand{\cftchapdotsep}{2}
\renewcommand{\cftsecdotsep}{2}
\setlength{\cftchapnumwidth}{3.5em}
\setlength{\cftbeforechapskip}{1pt}
\setlength{\cftsecindent}{0pt}
\renewcommand{\cftchappresnum}{BAB }

\renewcommand{\cftfigpresnum}{Gambar\; }
\renewcommand{\cftfigaftersnum}{\quad\quad\quad}
\renewcommand{\cftfigaftersnumb}{}
\renewcommand{\cftfigdotsep}{\cftnodots}
\setlength{\cftfignumwidth}{6.5em}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}

\renewcommand{\cftafterloftitle}{%
\\[1cm] \phantom{aaaa}{\normalfont\bfseries Gambar}\hfill{\normalfont\bfseries Judul} \hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterloftitleskip}{0.5cm}

\renewcommand{\cftafterlottitle}{%
\\[1cm] \phantom{aaaa}{\normalfont\bfseries Tabel}\hfill{\normalfont\bfseries Judul} \hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterlottitleskip}{0.5cm}

\renewcommand{\cfttabpresnum}{Tabel\; }
\renewcommand{\cfttabaftersnum}{\quad\quad\quad}
\renewcommand{\cfttabaftersnumb}{}
\renewcommand{\cfttabdotsep}{\cftnodots}
\setlength{\cfttabnumwidth}{6.5em}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

\renewcommand{\cftafterapctitle}{%
\\[1cm]\mbox{}\hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterapctitleskip}{0.5cm}

\renewcommand{\cftappendicespresnum}{Lampiran\; }
\renewcommand{\cftappendicesaftersnum}{\quad\quad\quad}
\renewcommand{\cftappendicesaftersnumb}{}
\renewcommand{\cftappendicesdotsep}{\cftnodots}
\setlength{\cftappendicesnumwidth}{6.5em}
\renewcommand{\theappendices}{\arabic{appendices}}

%------------------------------------------------------------]
%Mendefinisikan parameter masukan
%------------------------------------------------------------
\gdef\@universityind{Universitas Islam Negeri Syarif Hidayatullah}
%\gdef\@programind{}
\gdef\@universityeng{Universitas Islam Negeri Syarif Hidayatullah}
%\gdef\@programeng{}
\gdef\@city{Jakarta}
\gdef\@university{Universitas Islam Negeri Syarif Hidayatullah}
\gdef\@faculty{Fakultas Sains dan Teknologi }
\newcommand{\headdept}[1]{\gdef\@headdept{#1}}
\newcommand{\@headdept}{}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}                        
\newcommand{\titleinddua}[1]{\gdef\@titleinddua{#1}}    %--------------------
\newcommand{\@titleinddua}{}                            %--------------------
\newcommand{\titleindtiga}[1]{\gdef\@titleindtiga{#1}}  %--------------------
\newcommand{\@titleindtiga}{}                           %--------------------
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}
\newcommand{\titleengdua}[1]{\gdef\@titleengdua{#1}}     %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\@titleengdua}{}                             %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\titleengtiga}[1]{\gdef\@titleengtiga{#1}}   %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\@titleengtiga}{}                            %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\deptind}[1]{\gdef\@deptind{#1}}
\newcommand{\@deptind}{}
\newcommand{\depteng}[1]{\gdef\@depteng{#1}}
\newcommand{\@depteng}{}
\newcommand{\tanggalpengesahan}[1]{\gdef\@tanggalpengesahan{#1}}
\newcommand{\@tanggalpengesahan}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\pembimbingpertama}[1]{\gdef\@pembimbingpertama{#1}}
\newcommand{\@pembimbingpertama}{}
\newcommand{\nippembimbingpertama}[1]{\gdef\@nippembimbingpertama{#1}}
\newcommand{\@nippembimbingpertama}{}
\newcommand{\pembimbingkedua}[1]{\gdef\@pembimbingkedua{#1}}
\newcommand{\@pembimbingkedua}{}
\newcommand{\nippembimbingkedua}[1]{\gdef\@nippembimbingkedua{#1}}
\newcommand{\@nippembimbingkedua}{}
\newcommand{\degreeind}[1]{\gdef\@degreeind{#1}}
\newcommand{\@degreeind}{Sarjana S-1}
\newcommand{\degreeeng}[1]{\gdef\@degreeeng{#1}}
%\newcommand{\@degreeeng}{}
\newcommand{\submitdate}[1]{\gdef\@submitdate{#1}}
\newcommand{\@submitdate}{}
\newcommand{\pengujipertama}[1]{\gdef\@pengujipertama{#1}}%
\newcommand{\@pengujipertama}{}
\newcommand{\nippengujipertama}[1]{\gdef\@nippengujipertama{#1}}%
\newcommand{\@nippengujipertama}{}
\newcommand{\pengujikedua}[1]{\gdef\@pengujikedua{#1}}%
\newcommand{\@pengujikedua}{}
\newcommand{\nippengujikedua}[1]{\gdef\@nippengujikedua{#1}}%
\newcommand{\@nippengujikedua}{}
\newcommand{\thirdexaminer}[1]{\gdef\@thirdexaminer{#1}}%
\newcommand{\@thirdexaminer}{}
\newcommand{\tahunterbitskripsi}[1]{\gdef\@tahunterbitskripsi{#1}}
\newcommand{\@tahunterbitskripsi}{}
\newcommand{\tanggalnotabimbingsatu}[1]{\gdef\@tanggalnotabimbingsatu{#1}}
\newcommand{\@tanggalnotabimbingsatu}{}
\newcommand{\tanggalnotabimbingdua}[1]{\gdef\@tanggalnotabimbingdua{#1}}
\newcommand{\@tanggalnotabimbingdua}{}
\newcommand{\tanggalpernyataankeaslian}[1]{\gdef\@tanggalpernyataankeaslian{#1}}
\newcommand{\@tanggalpernyataankeaslian}{}
\newcommand{\jurusan}[1]{\gdef\@jurusan{#1}}
\newcommand{\@jurusan}{}
\newcommand{\prodi}[1]{\gdef\@prodi{#1}}
\newcommand{\@prodi}{}
\newcommand{\pengujiketiga}[1]{\gdef\@pengujiketiga{#1}}
\newcommand{\@pengujiketiga}{}
\newcommand{\nippengujiketiga}[1]{\gdef\@nippengujiketiga{#1}}
\newcommand{\@nippengujiketiga}{}
\newcommand{\pengujikeempat}[1]{\gdef\@pengujikeempat{#1}}
\newcommand{\@pengujikeempat}{}
\newcommand{\nippengujikeempat}[1]{\gdef\@nippengujikeempat{#1}}
\newcommand{\@nippengujikeempat}{}
\newcommand{\katakunci}[1]{\gdef\@katakunci{#1}}
\newcommand{\@katakunci}{}
\newcommand{\gelarsarjana}[1]{\gdef\@gelarsarjana{#1}}
\newcommand{\@gelarsarjana}{}
\newcommand{\filepustaka}[1]{\gdef\@filepustaka{#1}}
\newcommand{\@filepustaka}{}
\newcommand{\fileabstrak}[1]{\gdef\@fileabstrak{#1}}
\newcommand{\@fileabstrak}{}
\newcommand{\filekatapengantar}[1]{\gdef\@filekatapengantar{#1}}
\newcommand{\@filekatapengantar}{}

%------------------------------------------------------------
%Halaman Sampul Berbahasa Indonesia
%------------------------------------------------------------
\def\coverbaru{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \parbox{\linewidth}              
      {\begin{center}
       		\MakeUppercase{\large\normalfont\bfseries\@titleind}\\    
       		\end{center}
      }\par\nobreak %\MakeUppercase
      \vspace{0.3cm}      
      \MakeUppercase{\normalfont Artikel}\\
      \vspace{0.3cm}
      \vfill
         \includegraphics[height=3.45cm,width=4.45cm]{Logo_uin_jakarta.png}
       \vfill
       {\normalfont
        Oleh : \MakeUppercase{\bfseries\@fullname}\\
        NIM : \@idnum}\\
       \vspace{0.5cm}
       {\normalfont 
         
         \MakeUppercase{\normalfont\@faculty}\\
         \MakeUppercase{\normalfont\@university}\\
         \MakeUppercase{\normalfont\@city}\\
         %\vspace{0.5cm}
         {\normalfont\bfseries\@tahunterbitskripsi}}\\
      \end{singlespace}
      \end{center}
      \addcontentsline{toc}{chapter}{HALAMAN JUDUL}
      
%\addtocounter{page}{-1}
}  

%------------------------------------------------------------
% Kata Pengantar
%------------------------------------------------------------
\def\katapengantar{%
  \cleardoublepage\chapter*{\prefacename}%
  \input{\@filekatapengantar}
\addcontentsline{toc}{chapter}{KATA PENGANTAR}
}

%------------------------------------------------------------
% Nomenclature
%------------------------------------------------------------
\def\lambang{%
  \cleardoublepage\thispagestyle{chapterheading}%
  \printglossary%
\addcontentsline{toc}{chapter}{\nomenclaturename}
\halamankosong

}

%------------------------------------------------------------
% Daftar Isi
%------------------------------------------------------------
\def\daftarisi{%
	\cleardoublepage\thispagestyle{chapterheading}%
	%\setlength{\topmargin}{-3.4cm}
	\begin{singlespace}
	\addcontentsline{toc}{chapter}{\contentsname}
	\tableofcontents           								\end{singlespace}
	
}

%------------------------------------------------------------
% Daftar Gambar
%------------------------------------------------------------

\def\daftargambar{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listfigurename}
	\listoffigures	
	
}

%------------------------------------------------------------
% Daftar Tabel
%------------------------------------------------------------

\def\daftartabel{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listtablename}
	\listoftables	
}

%------------------------------------------------------------
% Daftar Lampiran
%------------------------------------------------------------
\def\daftarlampiran{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listappendicesname}
	\listofappendices
}

%------------------------------------------------------------
% Lampiran
%------------------------------------------------------------
\def\lampiran{%
	\appendix 
	\cleardoublepage
	\addcontentsline{toc}{chapter}{Lampiran-lampiran}
	\addtocontents{toc}{\setcounter{tocdepth}{-1}}
	\renewcommand{\theequation}{L\theappendices.\arabic{equation}}
}

%------------------------------------------------------------
% Daftar Pustaka
%------------------------------------------------------------
\def\daftarpustaka{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\refname}
	\begin{thebibliography}{1}
		\input{\@filepustaka}
	\end{thebibliography}	
}

%------------------------------------------------------------
% Halaman Kosong
%------------------------------------------------------------

\def\halamankosong{%
	\clearpage
	\thispagestyle{empty}
	\phantom{a}
	%\vfill
	%{\centering This page intentionally left blank \par}
	%\vfill
	%\addtocounter{page}{-1}
}

%------------------------------------------------------------
% Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstrak{%
  \cleardoublepage\thispagestyle{chapterheading}%
  {\parindent \z@ \normalfont
  
    \begin{center}	   
    {\large\textbf{\articlename}} 
    \end{center}
    \vspace{0cm}
    
    \begin{center}	   
      {\small\textbf{Oleh: \creator}}\\ \vspace{-0.1cm} 
    {\small\textbf{\studi}} 
    \end{center}
    \vspace{-0.2cm}
    
   \begin{center}	   
   {\small\textbf{\abstractname}} 
   \end{center}
   \vspace{.2cm}
   }
   \begin{singlespace}
  %{\centering\section*{\abstractname}}%
  %\vskip 20\p@
  %\addcontentsline{toc}{chapter}{\abstractname}
%} 
%\def\endabstractind{
   \input{\@fileabstrak}
\vspace{0.3cm}\noindent\textbf{\emph{Kata kunci}} : \@katakunci\par\vfil\null\end{singlespace}%
}

\AtBeginDocument{%
\if@doublesp%
	\doublespacing%
\else\if@singlesp%
	\singlespacing%
\else
	\onehalfspacing%
\fi%
}

\renewcommand*\theequation{\textup{\arabic{chapter}.\arabic{equation}}}

%\AtBeginDocument{%
%\if@langindo%
%\selectlanguage{bahasa}%
%\else
%\selectlanguage{english}%
%\fi
%}

\endinput
