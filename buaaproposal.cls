%%%%%%%%%%%%%%%%% 模板声明 %%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{buaaproposal}[a LaTeX template for BUAA graduate thesis proposal]
\typeout{Document Class `buaaproposal' v0.1 by Yunduo (2025/01/10)}

%%%%%%%%%%%%%%%%% 模板选项 %%%%%%%%%%%%%%%%%
\newif\ifbuaaatmaster\buaaatmasterfalse
\newif\ifbuaaatdoctor\buaaatdoctorfalse
\newif\ifbuaaatproposal\buaaatproposalfalse
\newif\ifbuaaatreview\buaaatreviewfalse
\newif\ifbuaaatcolor\buaaatcolorfalse

\DeclareOption{master}{\buaaatmastertrue}
\DeclareOption{doctor}{\buaaatdoctortrue}
\DeclareOption{proposal}{\buaaatproposaltrue}
\DeclareOption{review}{\buaaatreviewtrue}
\DeclareOption{color}{\buaaatcolortrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
% 引用ctexart及基本设置
\LoadClass[a4paper,UTF8,titlepage,zihao=-4,AutoFakeBold,fontset=none]{ctexart}

%%%%%%%%%% 宏包 %%%%%%%%%%
% 全局通用宏包
\RequirePackage{ifthen}

% 数学相关和字体设置
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
% \RequirePackage{mathptmx}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
% \RequirePackage{txfonts}
\RequirePackage{anyfontsize}

% 设置 main font
\setmainfont{Times New Roman}
% 使用指定路径字体文件设置 main CJK font
\setCJKmainfont[AutoFakeBold={1.25}, Path=\string fonts/]{simsun.ttc}

\let\songti\relax
\let\heiti\relax
\let\fangsong\relax

% \setCJKfamilyfont {⟨family⟩}[⟨font features⟩]{⟨font name⟩}
% 声明新的 CJK 字体族 ⟨family⟩ 并指定字体
\setCJKfamilyfont{song}[AutoFakeBold={3}, Path=\string fonts/]{simsun.ttc}
\setCJKfamilyfont{hei}[AutoFakeBold={2}, Path=\string fonts/]{simhei.ttf}
\setCJKfamilyfont{kai}[AutoFakeBold={2}, Path=\string fonts/]{KaiTiGB2312.TTF}
\setCJKfamilyfont{fangsong}[AutoFakeBold={1.25}, Path=\string fonts/]{FangSongGB2312.TTF}
\setCJKfamilyfont{hwxingkai}[AutoFakeBold={1.25}, Path=\string fonts/]{STXINGKA.TTF}

% \CJKfamily {⟨family⟩}
% \CJKfamily + {⟨family⟩}
% \CJKfamily - {⟨family⟩
% 用于在文档中切换 CJK 字体族，⟨family⟩ 必须预先声明。\CJKfamily 仅对 CJK 字符类有效，
% \CJKfamily+ 对所有字符类均有效，\CJKfamily- 对非 CJK 字符类有效。当 \CJKfamily+ 和 \CJKfamily- 的参数为空时，则使用当前的 CJK 字体族。
\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fangsong}}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
% \renewcommand{\textbf}[1]{{\bfseries\songti #1}}

% 预定义的字体大小，以后用得着
\newcommand{\xiaochu}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\thirtytwo}{\fontsize{32pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{rowgray}{gray}{0.5}


%%%%%%%%%% 信息 %%%%%%%%%%
% 学校名称
\gdef\buaaatuniversity{北京航空航天大学}
\newcommand{\university}[1]{%
    \gdef\buaaatuniversity{#1}
}

% 题目
\gdef\buaaatthesistitle{论文题目}
\newcommand{\thesistilte}[1]{%
    \gdef\buaaatthesistitle{#1}
}
% 封面题目
\gdef\buaaatfronttitlefirst{论文题目第一行}
\gdef\buaaatfronttitlesecond{论文题目第二行}
\newcommand{\frontthesistilte}[2]{%
    \gdef\buaaatfronttitlefirst{#1}
    \gdef\buaaatfronttitlesecond{#2}
}

% 姓名
\gdef\buaaatauthorname{作者姓名}
\newcommand{\authorname}[1]{%
    \gdef\buaaatauthorname{#1}
}
% 学号
\gdef\buaaatstuno{学生学号}
\newcommand{\stuno}[1]{%
    \gdef\buaaatstuno{#1}
}
% 学院
\gdef\buaaatschool{XX学院}
\newcommand{\school}[1]{%
    \gdef\buaaatschool{#1}
}
% 领域
\gdef\buaaatdomain{XX领域}
\newcommand{\domain}[1]{%
    \gdef\buaaatdomain{#1}
}
% 专业
\gdef\buaaatmajor{XX专业}
\newcommand{\major}[1]{%
    \gdef\buaaatmajor{#1}
}
% 联培单位
\gdef\buaaatcompany{XX单位}
\newcommand{\company}[1]{%
    \gdef\buaaatcompany{#1}
}
% 导师
\gdef\buaaattutor{导师}
\newcommand{\tutor}[1]{%
    \gdef\buaaattutor{#1}
}
\gdef\buaaattutorone{导师1}
\newcommand{\tutorone}[1]{%
    \gdef\buaaattutorone{#1}
}
\gdef\buaaattutortwo{导师2}
\newcommand{\tutortwo}[1]{%
    \gdef\buaaattutortwo{#1}
}
% 日期
\gdef\buaaproposaldate{\@date}
\renewcommand{\date}[1]{
    \gdef\buaaproposaldate{#1}
}

% 中文关键词
\gdef\buaaatckeyword{中文关键词}
\newcommand{\ckeyword}[1]{%
    \gdef\buaaatckeyword{#1}
}
% 英文关键词
\gdef\buaaatekeyword{English keywords}
\newcommand{\ekeyword}[1]{%
    \gdef\buaaatekeyword{#1}
}


\ifbuaaatdoctor
    \gdef\buaaatdegree{博士}
\else
    \gdef\buaaatdegree{硕士}
\fi

\ifbuaaatproposal
    \gdef\buaaatdoctype{学位论文开题报告}
\else
    \gdef\buaaatdoctype{文献综述}
\fi

%%%%%%%%%% 页面设置 %%%%%%%%%%
% 页面边距
\RequirePackage{geometry}
\newgeometry{
    top=25.4mm, bottom=25.4mm, left=31.7mm, right=31.7mm,
    headsep=5mm, headheight=10mm, footskip=10mm,
}
\savegeometry{a4pagesize}

\newgeometry{
    top=25mm, bottom=25mm, left=25mm, right=25mm,
    headsep=5mm, footskip=10mm,
}
\savegeometry{custompagesize}

\loadgeometry{custompagesize}

%%%%%%%%%% 其他间距 %%%%%%%%%%
\renewcommand{\baselinestretch}{1.625}
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

% 页眉页脚
\RequirePackage{fancyhdr}
\newif\iff@nch@compatViii
\let\f@nch@gbl\relax
\let\f@nch@gbl\global
    \f@nch@compatViiitrue

\fancypagestyle{frontmatter}{
    \fancyhead{}
    \fancyfoot{}
    \pagenumbering{Roman}

    \fancyfoot[C]{
        \zihao{5}
        \uppercase{\thepage}
    }

    % \renewcommand{\footrulewidth}{0.4bp}
    \renewcommand{\headrulewidth}{0bp} % 页眉线宽度
}

\fancypagestyle{mainmatter}{
    \fancyhead{}
    \fancyfoot{}
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \fancyhead[CE]{
        \zihao{-5}\songti
        \leftmark
    }
    \fancyhead[CO]{
        \zihao{-5}\songti
        \buaaatuniversity 工程硕博士培养改革专项试点\buaaatdegree\buaaatdoctype
    }

    \fancyfoot[C]{
        \zihao{5}\thepage
    }

    \renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}


%%%%%%%%%% 封面 %%%%%%%%%%
\RequirePackage{booktabs}
\RequirePackage{titling}
\RequirePackage{wasysym}
\RequirePackage{multirow}
% \RequirePackage{array}
% \newcolumntype{L}{>{\arraybackslash}m{0.6\linewidth}}
\renewcommand*\maketitle{
    \begin{titlepage}
        \linespread{1.2}
        \begin{center}
            \begin{figure}[H]
                \centering
                \vspace{10mm}
                \includegraphics[width=0.515\linewidth]{cls/figs/logo.pdf}
            \end{figure}

            {
                \vspace{-2mm}
                \xiaochu \hwxingkai
                \renewcommand{\CJKglue}{\hskip -6.5pt plus 0.08\baselineskip}
                工程硕博士培养改革专项试点 \par
                \vspace{2mm}
                \buaaatdegree \buaaatdoctype \par
            }

            {
                \vspace{14mm}
                \thirtytwo \songti
                \textbf{\buaaatfronttitlefirst} \par
                \vspace{6mm}
                \textbf{\buaaatfronttitlesecond} \par
                \vspace{13mm}
            }

            {
                \sihao \heiti
                \renewcommand{\arraystretch}{1.26}
                \begin{tabular}{c l c l}
                    {姓~~~~~~~~名}\hspace{10pt} & {~~~\buaaatauthorname\hspace{55pt}} & \hspace{10pt}{学~~~~~~~~号}\hspace{10pt} & {~~~\buaaatstuno} \\ \cline{2-2} \cline{4-4}
                    {培养学院}\hspace{10pt} & \multicolumn{3}{l}{~~~\buaaatschool} \\ \cline{2-4}
                    {关键领域}\hspace{10pt} & \multicolumn{3}{l}{~~~\buaaatdomain} \\ \cline{2-4}
                    {专~~~~~~~~业}\hspace{10pt} & \multicolumn{3}{l}{~~~\buaaatmajor} \\ \cline{2-4}
                    {联培单位}\hspace{10pt} & \multicolumn{3}{l}{~~~\buaaatcompany} \\ \cline{2-4}
                    {指导教师}\hspace{10pt} & \multicolumn{3}{l}{~~~\buaaattutor} \\ \cline{2-4}
                    \hspace{10pt} & \multicolumn{3}{l}{~~~\buaaattutorone} \\ \cline{2-4}
                    \hspace{10pt} & \multicolumn{3}{l}{~~~\buaaattutortwo} \\ \cline{2-4}
                    {攻读学位\hspace{10pt}} & \multicolumn{3}{l}{~~~\CheckedBox 全日制直博 \hspace{6pt}  $\Box$全日制普博 \hspace{6pt} $\Box$非全日制博士} \hspace{4pt} \\ \cline{2-4}
                    {开题时间\hspace{10pt}} & \multicolumn{3}{l}{~~~\buaaproposaldate} \\ \cline{2-4}
                    \\
                \end{tabular}
                \par
            }
        \end{center}
        % \vspace{\fill}
    \end{titlepage}
}

%%%%%%%%%% cross reference %%%%%%%%%%
\RequirePackage{hyperref}
\ifbuaaatcolor
    \hypersetup{colorlinks, linkcolor=blue}
\else
    \hypersetup{hidelinks}
\fi
\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={\buaaatthesistitle},
    pdfauthor={\buaaatauthorname},
    pdfsubject={\buaaatuniversity \buaaatschool \buaaatdegree 研究生\buaaatdoctype},
    pdfcreator={LaTeXed~By~BUAA},
}

\RequirePackage{bookmark}

%%%%%%%%%% 参考文献 %%%%%%%%%%
\RequirePackage[sort,compress]{natbib}
\bibpunct{[}{]}{,}{n}{}{}
\setlength{\bibsep}{0pt}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

\RequirePackage{gbt7714}
\citestyle{numerical}


%%%%%%%%%% 交叉引用 %%%%%%%%%%
\RequirePackage[noabbrev,capitalize,nameinlink]{cleveref}
\crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{page}{页}{页}
\crefname{chapter}{章}{章}
\crefname{section}{节}{节}
\crefname{appendix}{附录}{附录}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\crefname{definition}{定义}{定义}
\crefname{example}{例}{例}
\crefname{algorithm}{算法}{算法}
\crefname{listing}{列表}{列表}
\crefname{line}{行}{行}

\crefformat{chapter}{#2第#1章#3}
\crefformat{section}{#2#1#3}
\crefformat{subsection}{#2第#1节#3}
\crefformat{subsubsection}{#2第#1节#3}

\crefrangeformat{chapter}{#3第#1章#4至#5第#2章#6}
\crefrangeformat{section}{#3第#1节#4至#5第#2节#6}
\crefrangeformat{subsection}{#3第#1节#4至#5第#2节#6}
\crefrangeformat{subsubsection}{#3第#1节#4至#5第#2节#6}

\crefmultiformat{chapter}{#2第#1章#3}{和#2第#1章#3}{，#2第#1章#3}{和#2第#1章#3}
\crefmultiformat{section}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}
\crefmultiformat{subsection}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}
\crefmultiformat{subsubsection}{#2第#1节#3}{和#2第#1节#3}{，#2第#1节#3}{和#2第#1节#3}

\newcommand{\crefpairconjunction}{~和~}
\newcommand{\crefmiddleconjunction}{, }
\newcommand{\creflastconjunction}{~和~}
\newcommand{\crefpairgroupconjunction}{~和~}
\newcommand{\crefmiddlegroupconjunction}{, }
\newcommand{\creflastgroupconjunction}{~和~}
\newcommand{\crefrangeconjunction}{~至~}


%%%%%%%%%% 标题 %%%%%%%%%%
\newcommand{\contentname}{目~~~~录}
\newcommand{\figurecontentname}{图清单}
\newcommand{\tablecontentname}{表清单}

\renewcommand{\contentsname}{\centerline{\xiaoer \heiti \textbf{\contentname}}}
\renewcommand{\listfigurename}{\centerline{\xiaoer \heiti \textbf{\figurecontentname}}}
\renewcommand{\listtablename}{\centerline{\xiaoer \heiti \textbf{\tablecontentname}}}
\renewcommand{\bibname}{参考文献}
\renewcommand{\refname}{\hspace*{\fill} \bibname \hspace*{\fill}}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 格式
\ctexset{
    section={
        name={第,章},
        number={\chinese{section}},
        format={\centering\zihao{3}\heiti},
        aftername={~~},
        beforeskip={.25\baselineskip},
        afterskip={.25\baselineskip},
    },
    subsection={
        format={\zihao{4}\heiti},
        aftername={~~},
        beforeskip={.25\baselineskip},
        afterskip={.25\baselineskip},
    },
    subsubsection={
        format={\zihao{-4}\heiti},
        aftername={~~},
        beforeskip={.25\baselineskip},
        afterskip={.25\baselineskip},
    },
    section/break={},
    paragraph={
        % format={\bfseries \zihao{-4}\songti},
        beforeskip={.0\baselineskip},
        indent={2em}
    }
}


%%%%%%%%% 公式 %%%%%%%%%%
\newcommand{\splitatcommas}[1]{%
    \begingroup
    \begingroup\lccode`~=`, \lowercase{\endgroup
        \edef~{\mathchar\the\mathcode`, \penalty0 \noexpand\hspace{0pt plus 1em}}%
    }\mathcode`,="8000 #1%
    \endgroup
}

%%%%%%%%% 公式 %%%%%%%%%%
\newcommand{\bfemph}[1]{\textbf{#1}}
% \renewcommand{\emph}[1]{\bfemph{#1}}

% 取消强制换页
% \renewcommand{\clearpage}{\par}

%%%%%%%%%% 目录 %%%%%%%%%%
\RequirePackage{titletoc}

% 表目录图目录的格式设置
% 表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致
\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel~~}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel~~}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\DeclareMathOperator*{\Bigcdot}{\scalerel*{\cdot}{\bigodot}}
\titlecontents{section}[0em]
    {\heiti \zihao{-4} \vspace{0.2\baselineskip}}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*[5pt]{$\boldsymbol{\cdot}$}{\zihao{-4}\contentspage}}
\titlecontents{subsection}[1.5em]
    {\songti \zihao{-4} \vspace{0.1\baselineskip}}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*[4pt]{.}{\zihao{-4}\contentspage}}
\titlecontents{subsubsection}[3em]
    {\songti \zihao{5} \vspace{0.1\baselineskip}}
    {\thecontentslabel~~}{}
    {\hspace{.5em}\titlerule*[4pt]{.}{\zihao{-4}\contentspage}}

%%%%%%%%%% 图 %%%%%%%%%%
\RequirePackage{graphicx}
\graphicspath{{./figs/}{./fig/}{./figures/}{./figure/}}
\RequirePackage{pifont}  % “秘级”后的五角星
\RequirePackage{overpic}
\RequirePackage{subfigure}
\RequirePackage{booktabs}
\RequirePackage{caption}

\DeclareCaptionFormat{buaathesiscaption}{
    \zihao{5} \songti \textbf{#1 #2 #3}
}

\captionsetup[figure]{
    format=buaathesiscaption,
    labelsep=quad,
    position=bottom, margin=0mm,
    aboveskip=0pt, belowskip=-15pt,
    justification=centerlast}
\captionsetup[table]{
    format=buaathesiscaption,
    labelsep=quad,
    position=top, margin=0mm,
    aboveskip=0pt, belowskip=0pt,justification=centerlast}

%%%%%%%%%% 表 %%%%%%%%%%
\RequirePackage{makecell}
\RequirePackage{colortbl}
\RequirePackage{enumerate}
\RequirePackage{ulem}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][!ht]
{\renewcommand{\arraystretch}{1}
\oldtable[#1] \zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

% \let\oldtabular\tabular
% \let\endoldtabular\endtabular
% \renewenvironment{tabular}[1][h!]
% {\renewcommand{\arraystretch}{1.5}
% \oldtabular[#1] \zihao{5}}
% {\renewcommand{\arraystretch}{1}
% \endoldtabular}

\RequirePackage{tabularx}
% \let\oldtabularx\tabularx
% \let\endoldtabularx\endtabularx
% \renewenvironment{tabularx}[2]
% {\renewcommand{\arraystretch}{1.5}
% \zihao{5}\oldtabularx{#1}{#2}}
% {\renewcommand{\arraystretch}{1}
% \endoldtabularx}

%%%%%%%%%% 列表 %%%%%%%%%%
\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{wide, label=（\arabic*）, labelsep=0pt, noitemsep}
\setlist[enumerate,2]{label=\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% 交叉引用 %%%%%%%%%%
\RequirePackage{tcolorbox}
\RequirePackage{minted}
\RequirePackage{xcolor}
\definecolor{Gray}{gray}{0.85}
\definecolor{LightCyan}{rgb}{0.88,1,1}
\definecolor{bg}{rgb}{0.95,0.95,0.95}

\setminted{
    frame=single,
    bgcolor=bg,
    breaklines=true,
    breakanywhere=true,
    linenos,
    tabsize=4,
    tabcolor=black,
    encoding=utf8
}


%%%%%%%%%% 附录 %%%%%%%%%%
\RequirePackage[toc,page]{appendix}

\renewcommand{\appendix}{
    \newpage
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{figure}{0}
    \setcounter{table}{0}

    \ctexset{
        section={
            name={附录},
            number={\Alph{section}},
            format={\zihao{3}\heiti}
        }
    }

    % \captionsetup[figure]{list=no}
    \captionsetup[table]{list=no}

    \renewcommand{\tablename}{附表}
    \renewcommand{\figurename}{附图}
    \renewcommand{\thesection}{附录 \Alph{section}}
}

%%%%%%%%%% 摘要 %%%%%%%%%%
% 中文摘要
\newcommand{\cabstractname}{摘~~~~~~~~要}
\newenvironment{cabstract}{%
    \vspace{5ex}
    \centerline{\heiti\zihao{3} \cabstractname}
    \vspace{5ex}
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    {\heiti\zihao{-4} 关键词：} \buaaatckeyword
}

% 英文摘要
\newcommand{\eabstractname}{Abstract}
\newenvironment{eabstract}{%
    \vspace{5ex}
    \centerline{\bfseries \zihao{3} \eabstractname}
    \vspace{5ex}
    \setlength{\parindent}{24bp}
    }{%
    \vskip 21bp
    {\bfseries \zihao{-4} Key words: } \buaaatekeyword
}

