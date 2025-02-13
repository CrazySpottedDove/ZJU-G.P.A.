\ProvidesClass{Physics_H_Notes}
%模板名称
%-------------------------------------------------------------
\LoadClass[openany, 12pt, a4paper, oneside]{ctexbook}
%使用中文书籍文档类
%-------------------------------------------------------------
\RequirePackage{geometry}
\geometry{left=1.8cm,right=4.7cm,top=3cm,bottom=3cm}
%版面大小设计
%-------------------------------------------------------------
\RequirePackage{comment}
%为编辑方便，允许使用注释环境comment
%-------------------------------------------------------------
\RequirePackage{tikz}
%绘制封面
%-------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{float}
\graphicspath%
{%
    {../figures/figure1/},
    {../figures/figure2/},
    {../figures/figure3/},
    {../figures/figure4/},
    {../figures/figure5/},
    {../figures/figure6/},
    {../figures/figure7/}
    %{../figures/cover/}
}
%图片地址

%-------------------------------------------------------------

\setmainfont{Times New Roman}
%对于没有这个字体的机器，可以注释本行

%-------------------------------------------------------------
\RequirePackage%
[	bookmarksopen=true,
bookmarksnumbered=true,
pdfborder={0 0 0},
colorlinks=true,
linkcolor=thisblue,
hyperfootnotes=false,
urlcolor=thisblue,
anchorcolor=thisblue,
citecolor=thisblue
]{hyperref}
%启用超链接和书签目录
%-------------------------------------------------------------
\RequirePackage{ocgx2}
%启用交互健
\RequirePackage{calc}
%为方便计算交互词长度，使用宏包calc
\newlength{\ItrLenMax}
\newcounter{ItrCtr}

%常用颜色，主要是护眼（）
\RequirePackage{keyval}
\SetupKeyvalOptions%
{
    family=@physicsHNotes,
    prefix=@physicsHNotes@
}
\DeclareBoolOption[false]{stable}
\DeclareBoolOption[false]{dark}
\ProcessKeyvalOptions*
\relax

\if@physicsHNotes@dark
	\colorlet{thisred}{-red}
	\colorlet{thisskyblue}{red}
	\colorlet{thiscyan}{-cyan}
	\colorlet{thisgreen}{-green}
	\colorlet{thisblack}{black!15!white}
	\colorlet{thiswhite}{white!10!black}
	\colorlet{thisyellow}{-yellow}
	\colorlet{thisblue}{-blue}
	\colorlet{thisteal}{-teal}
	\colorlet{thispink}{-pink}
	\colorlet{thisorange}{-orange}
	\definecolor{backgroundcolor}{RGB}{39,38,38}
	\definecolor{textcolor}{RGB}{202,201,201}
	\RequirePackage[DarkBjornstrup]{fncychap}
	\newcommand{\illustyle}{\itshape}
	\NewDocumentCommand{\thisincludegraphics}{O{}m}{\includegraphics[#1]{inversed_#2}}
	\definecolor{titlepagecolor}{cmyk}{0,.40,1,.60}
	\definecolor{c1}{RGB}{193, 158, 128}
	\definecolor{c2}{RGB}{151, 73, 73}
	\definecolor{c3}{RGB}{148, 65, 65}
	\definecolor{c4}{RGB}{155, 93, 91}
	\definecolor{c5}{RGB}{160, 93, 93}
	\definecolor{lawcolbacktitle}{RGB}{44,44,44}
	\definecolor{lawcolback}{RGB}{53,54,55}
	\definecolor{provecolbacktitle}{RGB}{44,44,44}
	\definecolor{provecolback}{RGB}{53,54,55}
	\definecolor{examplecolbacktitle}{RGB}{44,44,44}
	\definecolor{examplecolback}{RGB}{53,54,55}
	\definecolor{excolbacktitle}{RGB}{44,44,44}
	\definecolor{excolback}{RGB}{53,54,55}
	\definecolor{solutioncolbacktitle}{RGB}{44,44,44}
	\definecolor{solutioncolback}{RGB}{53,54,55}
	\definecolor{socolbacktitle}{RGB}{44,44,44}
	\definecolor{socolback}{RGB}{53,54,55}
	\definecolor{colframe}{RGB}{46,45,45}
	\definecolor{thisreftreecolor}{RGB}{203,153,255}
	\definecolor{plaincyan}{RGB}{102,255,178}
\else
	\colorlet{thisred}{red}
	\colorlet{thisskyblue}{-red}
	\colorlet{thiscyan}{cyan}
	\colorlet{thisgreen}{green}
	\colorlet{thisblack}{black}
	\colorlet{thiswhite}{white}
	\colorlet{thisyellow}{yellow}
	\colorlet{thisteal}{teal}
	\colorlet{thisblue}{blue}
	\colorlet{thispink}{pink}
	\colorlet{thisorange}{orange}
	\definecolor{backgroundcolor}{RGB}{255, 255, 255}
	\definecolor{textcolor}{RGB}{0, 0, 0}
	\RequirePackage[Bjornstrup]{fncychap}
	\newcommand{\illustyle}{\itshape}
	\NewDocumentCommand{\thisincludegraphics}{O{}m}{\includegraphics[#1]{#2}}
	\definecolor{titlepagecolor}{cmyk}{1,.60,0,.40}
	\definecolor{c1}{RGB}{62, 97, 127}
	\definecolor{c2}{RGB}{104, 182, 182}
	\definecolor{c3}{RGB}{107, 190, 190}
	\definecolor{c4}{RGB}{100, 172, 174}
	\definecolor{c5}{RGB}{95, 162, 162}
	\colorlet{provecolbacktitle}{thisyellow!7!thiswhite}
	\colorlet{provecolback}{thiscyan!7!thiswhite}
	\colorlet{lawcolbacktitle}{thisyellow!7!thiswhite}
	\colorlet{lawcolback}{thiscyan!7!thiswhite}
	\colorlet{examplecolbacktitle}{thisyellow!7!thiswhite}
	\colorlet{examplecolback}{thisgreen!2!thiswhite}
	\colorlet{excolback}{thiscyan!5!thiswhite}
	\colorlet{excolbacktitle}{thisred!5!thiswhite}
	\colorlet{solutioncolback}{thisgreen!1.5!thiswhite}
	\colorlet{solutioncolbacktitle}{thisyellow!3!thiswhite}
	\colorlet{socolback}{thisgreen!1.5!thiswhite}
	\colorlet{socolbacktitle}{thisyellow!3!thiswhite}
	\colorlet{colframe}{thisblack!50!thiswhite}
	\colorlet{thisreftreecolor}{-green}
	\colorlet{plaincyan}{thiscyan!60!thisblack}
\fi
	\colorlet{plainred}{thisred!80!thisblack}
	\colorlet{plaingreen}{thisgreen!70!thisblack}
	\colorlet{orangepink}{thisorange!20!thispink}
\pagecolor{backgroundcolor}
\color{textcolor}

\NewDocumentEnvironment{singlefigure}{omO{0.95}}%
{%
	\begin{figure}[H]%
		\centering%
		\thisincludegraphics[width=#3\textwidth]{#2}%
		\IfNoValueTF{#1}{\par}{\vspace{-1.2ex}\caption{#1\labelroot{#2}}}%
		\illustyle%
	}%
	{%
	\end{figure}%
}
%单张图片，环境内容为注释，均居中
%根据dark是否启用调整配色方案


\if@physicsHNotes@stable
    \newcommand{\itr}[2]{\textcolor{plaincyan}{\textit{#1}\textrm{(}\textit{#2}\textrm{)}}}
\else
    \newcommand{\itr}[2]%
    {%
        \setlength{\ItrLenMax}{\maxof{\widthof{#1}}{\widthof{#2}}}%记录长度最大值
        \stepcounter{ItrCtr}%
        \ %前后距离修正
        \makebox[\ItrLenMax][c]%
        {%做一个盒子，取最大长度，美观起见居中
            \switchocg{itr\theItrCtr}%
            {%
                \begin{ocg}{itr\theItrCtr}{itr\theItrCtr}{1}%
                    \textcolor{plaincyan}{\textit{#1}}%
                \end{ocg}
            }%
        }%
        \hspace{-\ItrLenMax}%长度修正，防止中英互换时盒子偏移
        \makebox[\ItrLenMax][c]%
        {%
            \begin{ocmd}{\Not{itr\theItrCtr}}%
                \textcolor{plaincyan}{#2}%
            \end{ocmd}%
        }%
    }
\fi

%模板key定制。stable用于支持功能较弱的pdf阅读器。
%可交互词定义
%-------------------------------------------------------------
\newcommand{\En}[1]%
{%
	\textit{#1}%
}
%写英文时使用该命令
%-------------------------------------------------------------
\counterwithin{footnote}{chapter}
%让脚注编号随章改变
\renewcommand{\thefootnote}%
{%
	{\textcolor{thisteal!60!thisblack}{[\arabic{footnote}]}}%
}
%设置脚注样式
\RequirePackage{tcolorbox}
\RequirePackage[father=chapter,width=8.5em,betweensep=1.2ex,numbercolor=thisred,textcolor=textcolor,sidesep=20pt]{mgnote}
%使用自己编写的mgnote包编辑边注
%-------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\makeatletter
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
		\hrule\@height 1.0pt \@width\headwidth\vskip1pt%上面线为1pt粗
		\hrule\@height 0.5pt\@width\headwidth%下面0.5pt粗
		\vskip-2\headrulewidth\vskip-1pt}%两条线的距离1pt
	\vspace{6mm}}%双线与下面正文之间的垂直间距
\makeatother
%双线页眉
\renewcommand{\footrulewidth}{0.4pt}
%单线页脚
\cfoot{\em\large\thepage}
%页面样式设置


%-------------------------------------------------------------
\newcommand{\dove}%
{%
	{%
		\normalsize%
		\mbox%
		{%
			\raisebox{0.2ex}{\itshape\mdseries\large 斑}%
			\hspace{-0.2em}%
			\raisebox{1.4ex}{\tiny\normalfont 咕}%
			\hspace{-0.55em}%
			\raisebox{-0.6ex}{\bfseries\normalsize 鸠}%
			\hspace{-1.4em}%
			\raisebox{-0.75ex}{\tiny\normalfont 咕}%
		}%
		\quad%
	}%
}
\newcommand{\seaMonster}%
{%
    {%
            \normalsize%
            \mbox%
            {%
                \raisebox{0.2ex}{\itshape\mdseries\large 大}%
                \hspace{-0.2em}%
                \raisebox{1.4ex}{\tiny\normalfont 海}%
                \hspace{-0.55em}%
                \raisebox{-0.6ex}{\bfseries\normalsize 怪}%
            }%
            \quad%
        }%
}
%作者：dovelogo
%-------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{bm}
%数学公式排版宏包
\newcommand{\upperline}[1]{\raisebox{1.5ex}{$\dfrac{}{\mbox{$#1$}}$}}
%使用新构建命令\upperline获得带上划线的文字，默认在数学模式下使用
\renewcommand{\vec}[1]{\boldsymbol{#1}}
%向量采用粗体显示
\providecommand{\Romannumeral}[1]{\uppercase\expandafter{\romannumeral #1}}
%支持大写罗马字母显示
%-------------------------------------------------------------

\RequirePackage[clever,framecolor=textcolor,refcolor=thisreftreecolor,labelcolor=thisreftreecolor,width=7em]{reftree}
%交叉引用设置采用自己编写的reftree宏包，实现超链接卡片
%-------------------------------------------------------------
\newcommand{\eg}{{\itshape e.g.}\ }
%举例子e.g.缩写

\def\dif{\mathop{}\hphantom{\mskip-\thinmuskip}\mathrm{d}}%
%微分符号d的定义命令
%来自https://zhuanlan.zhihu.com/p/514579102
%-------------------------------------------------------------
\RequirePackage{tabularray}
%利用tabularray宏包编写表格
%-------------------------------------------------------------

\tcbuselibrary{most}
\newenvironment{Itemize}{\begin{itemize}}{\end{itemize}}

%设计书签格式itemize

\newcounter{law}
\counterwithin{law}{chapter}
\renewcommand{\thelaw}{{\large\arabic{chapter}}.\arabic{law}}
\newtcolorbox{lawbox}[1][1]%
{
	colback=lawcolback,
	colbacktitle=lawcolbacktitle,
	coltitle=plainred,
	title={\itshape 定理\thelaw\labelroot{law\arabic{chapter}.\arabic{law}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{law}{O{未命名定理}}%
{%
	\refstepcounter{law}%
	\begin{lawbox}[#1]%
}%
{%
	\end{lawbox}%
}

%定理环境law

\newcounter{prove}
\counterwithin{prove}{chapter}
\renewcommand{\theprove}{{\large\arabic{chapter}}.\arabic{prove}}
\newtcolorbox{provebox}[1][1]%
{
	colback=provecolback,
	colbacktitle=provecolbacktitle,
	coltitle=plainred,
	title={\itshape 证明\theprove\labelroot{prove\arabic{chapter}.\arabic{prove}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{prove}{O{未知证明目标}}%
{%
	\refstepcounter{prove}%
	\begin{provebox}[#1]%
}%
{%
	\end{provebox}%
}

%证明环境prove
\newcounter{example}
\counterwithin{example}{chapter}
\renewcommand{\theexample}{{\large\arabic{chapter}}.\arabic{example}}
\newtcolorbox{examplebox}[1][1]%
{
	colback=examplecolback,
	colbacktitle=examplecolbacktitle,
	coltitle=plaingreen,
	title={\itshape 习题\theexample\labelroot{example\arabic{chapter}.\arabic{example}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{example}{O{未命名习题}}%
{%
	\refstepcounter{example}%
	\begin{examplebox}[#1]%
}%
{%
	\end{examplebox}%
}
%习题环境example

\newcounter{ex}
\counterwithin{ex}{chapter}
\renewcommand{\theex}{{\large\arabic{chapter}}.\arabic{ex}}
\newtcolorbox{exbox}[1][1]%
{
	colback=excolback,
	colbacktitle=excolbacktitle,
	coltitle=thisblack!70!thiswhite,
	title={\itshape 例题\theex\labelroot{ex\arabic{chapter}.\arabic{ex}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{ex}{O{未命名例题}}%
{%
	\refstepcounter{ex}%
	\begin{exbox}[#1]%
	}%
	{%
	\end{exbox}%
}
%例题环境ex

\newcounter{solution}
\counterwithin{solution}{chapter}
\renewcommand{\thesolution}{{\large\arabic{chapter}}.\arabic{solution}}
\newtcolorbox{solutionbox}[1][1]%
{
	colback=solutioncolback,
	colbacktitle=solutioncolbacktitle,
	coltitle=thisgreen!50!thisblack,
	title={\itshape Solution:\thesolution\labelroot{solution\arabic{chapter}.\arabic{solution}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable,
}
\newcommand{\tcbrule}{\begin{center}\begin{tikzpicture}
		\draw[textcolor, dashed, line width=1.2pt] (0.05\linewidth,0) -- (0.95\linewidth,0);
	\end{tikzpicture}\end{center}}
\NewDocumentEnvironment{solution}{O{未给定习题解答}}%
{%
	\refstepcounter{solution}%
	\begin{solutionbox}[#1]%
}%
{%
	\end{solutionbox}%
}
%解答环境solution

\newcounter{so}
\counterwithin{so}{chapter}
\renewcommand{\theso}{{\large\arabic{chapter}}.\arabic{so}}
\newtcolorbox{sobox}[1][1]%
{
	colback=socolback,
	colbacktitle=socolbacktitle,
	coltitle=thisgreen!50!thisblack,
	title={\itshape {\large 解答\theso\labelroot{so\arabic{chapter}.\arabic{so}}}\ #1},
	colframe=colframe,
	coltext=textcolor,
	boxrule=0.6pt,
	breakable
}
\NewDocumentEnvironment{so}{O{未给定例题解答}}%
{%
	\refstepcounter{so}%
	\begin{sobox}[#1]%
	}%
	{%
	\end{sobox}%
}
%例题解答环境so
\Crefname{law}{定理}{定理}
\Crefname{example}{习题}{习题}
\Crefname{solution}{Solution}{Solution}
\Crefname{prove}{Prove}{Prove}
\Crefname{ex}{例题}{例题}
\Crefname{so}{解答}{解答}
%各环境的引用头
%-------------------------------------------------------------
\newcounter{apart}
\counterwithin{chapter}{apart}
\renewcommand{\thechapter}{\arabic{chapter}}
\linespread{1.5}

\endinput







