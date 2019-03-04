Return-Path: <sivas.srr@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CkHY1DL2zDqBh
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 02:20:39 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x24FKTow000658
 for <openbmc@lists.ozlabs.org>; Mon, 4 Mar 2019 10:20:36 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r165r9e9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 10:20:35 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 4 Mar 2019 15:20:35 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 4 Mar 2019 15:20:30 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019030415203041-603064 ;
 Mon, 4 Mar 2019 15:20:30 +0000 
Subject: Re: [Proposal] End-user impacts and change log + details
In-Reply-To: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: jrey@linux.ibm.com
Cc: andrew@aj.id.au, openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Date: Mon, 4 Mar 2019 15:20:30 +0000
Sensitivity: 
References: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17009-1545 | IBM Domino Build
 SCN1812108_20180501T0841_FP30 February 15, 2019 at 14:01
X-LLNOutbound: False
X-Disclaimed: 43647
X-TNEFEvaluated: 1
x-cbid: 19030415-6357-0000-0000-000009CD933D
X-IBM-SpamModules-Scores: BY=0.286566; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.059081
X-IBM-SpamModules-Versions: BY=3.00010704; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01169532; UDB=6.00611158; IPR=6.00950161; 
 BA=6.00006248; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025829; XFM=3.00000015;
 UTC=2019-03-04 15:20:34
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-03-04 11:51:28 - 6.00009654
x-cbparentid: 19030415-6358-0000-0000-000056219FED
Message-Id: <OF900B6F99.7F842699-ON002583B3.0053ACAE-002583B3.0054463C@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 45 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-04_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2019 15:20:41 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Found it as usefu=
l, And from my perspective, not all git-hub issues should have user impact.=
</div>
<div dir=3D"ltr" >Because some time&nbsp; git-hub issue may not be a bug / =
non recreative / user error too.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I feel only if the issue is a valid one where code change=
s / design changes happens then</div>
<div dir=3D"ltr" >git-hub should automatically ask to populate user-impact =
statement and pull that in release notes automatically.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >May be we can request git-hub to check the user impact&nb=
sp; field / property is populated for issues where a commit is</div>
<div dir=3D"ltr" >getting merged.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Joseph Reynolds &l=
t;jrey@linux.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.sr=
r=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: Andrew Jeffery &lt;andrew@aj.id.=
au&gt;<br>Cc: openbmc@lists.ozlabs.org, openbmc &lt;openbmc-bounces+jrey=3D=
linux.ibm.com@lists.ozlabs.org&gt;<br>Subject: Re: [Proposal] End-user impa=
cts and change log + details<br>Date: Sat, Mar 2, 2019 2:47 AM<br>&nbsp;<br=
><tt><font size=3D"3" face=3D"" >On 2019-02-27 17:10, Andrew Jeffery wrote:=
</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;On Wed, 27 Feb 20=
19, at 01:52, Joseph Reynolds wrote:</font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >&gt;&gt;&nbsp;This is a proposal to improve OpenBMC communication =
and get better</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp=
;release notes.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;** Preamble **</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >&gt;&gt;&nbsp;Teams that use OpenBMC in other pro=
jects will not know OpenBMC as well</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >&gt;&gt;&nbsp;as the development community, and they will not know =
what is in each</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbs=
p;release. &nbsp;The main way for them to find out is by reading the releas=
e</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;notes. &nbsp=
;They will make decisions based on its contents. &nbsp;That makes</font></t=
t><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;the</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&gt;&nbsp;release notes an important commun=
ication between the development</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&gt;&nbsp;community and its end-users.</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >=
&gt;&gt;&nbsp;We need to get better at communicating new and changed OpenBM=
C</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;functions. &=
nbsp;Doing so gives many benefits, including better release</font></tt><br>=
<tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;notes</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >&gt;&gt;&nbsp;[1].</font></tt><br><tt><font size=3D=
"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;=
&gt;&nbsp;** The proposal **</font></tt><br><tt><font size=3D"3" face=3D"" =
>&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;1. A=
dopt a new practice to provide end-user impact statements when and</font></=
tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;where it make sense to=
 do so.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;2. Beg=
in a project level change log to summarize user impacts.</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;&nbsp;** Details **</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&=
nbsp;How do these changes help connect the folks who contribute to OpenBMC<=
/font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;with the folks=
 who use it? &nbsp;The main points are:</font></tt><br><tt><font size=3D"3"=
 face=3D"" >&gt;&gt;&nbsp;1. Contributors write an "end-user impact" statem=
ent to notify users</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;=
&nbsp;that something they might care about has changed.</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&gt;&nbsp;2. Community members use end-user=
 impact statements to create a change</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;&nbsp;log which summarizes changes they consider signific=
ant.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;3. Releas=
e planning summarizes the change log as an input to the</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&gt;&nbsp;release</font></tt><br><tt><font =
size=3D"3" face=3D"" >&gt;&gt;&nbsp;notes.</font></tt><br><tt><font size=3D=
"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;=
&gt;&nbsp;Items in detail:</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;1. Cre=
ate end-user impact statements.</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;A=
n "end-user impact" statement summarizes each change from the point</font><=
/tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;of</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;view of someone familiar with us=
ing the external interfaces. &nbsp;It tells</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;&nbsp;them what they need to know about what chan=
ged from their point of</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;=
&gt;&nbsp;view,</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbs=
p;so they know what to test, how to adapt, etc.</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" =
>&gt;&gt;&nbsp;When there is an impact, it should have details like:</font>=
</tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;- Is there an end-us=
er impact (y/n)?</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nb=
sp;- Is this a new feature or function (where are the docs)?</font></tt><br=
><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;- Is this a bug fix?</font><=
/tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;- What does the end-u=
ser need to know (one liner)?</font></tt><br><tt><font size=3D"3" face=3D""=
 >&gt;&gt;&nbsp;These statements don't have to be perfect. &nbsp;Any inklin=
g you can</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;prov=
ide</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;that there=
 is a user impact is helpful to the community. &nbsp;The impact</font></tt>=
<br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;might change during the r=
elease as the design evolves. &nbsp;Different</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;&nbsp;contributors will see different impacts. &n=
bsp;That's all normal and okay.</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;A=
re the following end-user impacts?</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;- Change to phosphor-webui that affects the browser di=
splay? &nbsp;Answer</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;=
&nbsp;"no" if it doesn't affect usage, or "Yes" if the user will likely</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;notice</font></tt=
><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;or care.</font></tt><br>=
<tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;- Bug fix in fan control? Ans=
wer depends. &nbsp;Answer "yes" if the bug</font></tt><br><tt><font size=3D=
"3" face=3D"" >&gt;&gt;&nbsp;might</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;start a fire.</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;- Refactor code? &nbsp;No</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;- New Redfish API? &nbsp;Yes; new features=
 are positive user impacts.</font></tt><br><tt><font size=3D"3" face=3D"" >=
&gt;&gt;&nbsp;- Adding new documentation? &nbsp;No; although helpful, docs =
don't affect</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;t=
he</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;end-user's =
use of the external interfaces</font></tt><br><tt><font size=3D"3" face=3D"=
" >&gt;&gt;&nbsp;- BMCWeb retires old and accepts new TLS encryption algori=
thms? &nbsp;Yes,</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nb=
sp;it</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;affects =
how you can connect to the BMC</font></tt><br><tt><font size=3D"3" face=3D"=
" >&gt;&gt;&nbsp;- Changes to phosphor-rest or to D-Bus APIs? &nbsp;No, des=
pite their</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;imp=
ortance, these interfaces are technically internal to the BMC. &nbsp;We</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;might want to doc=
ument user-impacts to these as well.</font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >&gt;&gt;&nbsp;- Security fix? &nbsp;Yes, probably, given today's c=
limate</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;Feel fr=
ee to come up with your own criteria, based on your estimation</font></tt><=
br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;of</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >&gt;&gt;&nbsp;an end-user.</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&gt;&nbsp;Writing an "end-user impact" statement bridges two worlds=
. &nbsp;Folks who</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&n=
bsp;work on the code may prefer to leave documentation for others or may</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;not</font></tt><=
br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;fully understand the impac=
t of their change on BMC operations. &nbsp;And</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;nobody else may understand the change. &nb=
sp;So who should write the</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&gt;&nbsp;end-user</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&g=
t;&nbsp;impact statement? &nbsp;Anyone who understands the change and how i=
t</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;impacts</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;end-users. &nbsp;T=
hat could be developers, testers, or project managers.</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&gt;&nbsp;Multiple people can contribute ove=
r time. &nbsp;And it should be okay to</font></tt><br><tt><font size=3D"3" =
face=3D"" >&gt;&gt;&nbsp;document an end-user impact in someone else's chan=
ge.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br>=
<tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;It is important that all of t=
he end-user impact statements be</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;"findable". &nbsp;Adding them as comments on selected =
GitHub issues is an</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;=
&nbsp;obvious solution, and I suggest using the issue associated with the</=
font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;code</font></tt=
><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;change that caused the u=
ser impact. (We could use GitHub labels [8][9]</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;to mark issues which have user impact.)</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >&gt;&gt;&nbsp;2. Create a change log from end-use=
r impact statements.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt=
;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;Groups who c=
are about end-user impacts include testers, security</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;&gt;&nbsp;folks,</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;&nbsp;release managers, and others. &nbsp;They ca=
n scan the issues, read the</font></tt><br><tt><font size=3D"3" face=3D"" >=
&gt;&gt;&nbsp;impact</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt=
;&nbsp;statements, and use them to curate a change log [2] which lists all<=
/font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;changes that m=
ight be interesting to users. &nbsp;Each change log entry</font></tt><br><t=
t><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;should have a brief description=
 of the impact (from the user's point</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;&nbsp;of</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&gt;&nbsp;view) with links back to the issue. &nbsp;The change log could=
 be an</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;openbmc=
</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;wiki page. &n=
bsp;(And yes, some people's job includes curating change</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;logs.)</font></tt><br><tt><font =
size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"=
" >&gt;&gt;&nbsp;We should have a project-wide change log which captures al=
l impacts.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;(It=
 is easy to ignore entries you don't care about.) &nbsp;Anyone who cares</f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;about a user imp=
act can add items to the change log.</font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&n=
bsp;How is the change log useful? &nbsp;Testers will use the change log to =
help</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;ensure te=
st coverage and add facts about where the test cases are</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;stored</font></tt><br><tt><font =
size=3D"3" face=3D"" >&gt;&gt;&nbsp;and whether the tests passed. &nbsp;Rel=
ease managers will use it to gauge</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;progress toward goals. &nbsp;Security folks will cover=
 security changes.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&=
nbsp;Technical writers, etc. &nbsp;Each will contribute significant facts a=
bout</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;their par=
t of the process, and the log is a place to organize links to</font></tt><b=
r><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;demos, etc.</font></tt><br>=
<tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3=
" face=3D"" >&gt;&gt;&nbsp;3. Use the change log to make release notes.</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;&gt;&nbsp;The Release Planning work group [3] =
can refer to the change log as an</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;input to the Release Notes [1][4]. &nbsp;For example, =
multiple changes can</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt=
;&nbsp;be</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;merg=
ed, minor changes can be omitted, important changes can be</font></tt><br><=
tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;highlighted, etc. &nbsp;Having=
 good release notes is a hallmark of a mature</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;&nbsp;development process.</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&gt;&nbsp;Let's be clear about this: Most users will ignore the =
release notes or</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nb=
sp;use it only to answer specific questions about bugs or features. &nbsp;O=
nly</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;a</font></=
tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;few will use it to lea=
rn more about new functions, changed functions</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;they have to adapt to, how to review test =
efforts, what security fixes</font></tt><br><tt><font size=3D"3" face=3D"" =
>&gt;&gt;&nbsp;are included, etc. &nbsp;They will make decisions based on i=
ts content.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;Fo=
r</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;example, som=
e groups may use it as part of a software security</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&gt;&nbsp;assurance</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;process [5].</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&gt;&nbsp;** Conclusion **</font></tt><br><tt><font size=3D"3" face=3D""=
 >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;Tha=
t's the proposal ... create end-user impact statements ...</font></tt><br><=
tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;summarize</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&gt;&nbsp;them in a change log ... and massa=
ge that into release notes. &nbsp;The</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;&nbsp;real</font></tt><br><tt><font size=3D"3" face=3D"" =
>&gt;&gt;&nbsp;trick is to actually write end-user impact statements as the=
 work is</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;being=
 done. &nbsp;We have the test team [6] and the security work group [7]</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;to help with that,=
 along with pressure from groups who use OpenBMC in</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >&gt;&gt;&nbsp;their projects.</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"=
" >&gt;&nbsp;So, I think it's a reasonable proposal, however, I think there=
 needs to</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;be</font=
></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;more concrete descripti=
on of how I as a contributor go about this.</font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&nbsp;There's</font></tt><br><tt><font size=3D"3" fac=
e=3D"" >&gt;&nbsp;a sort-of throw-away suggestion above that the user impac=
t descriptions</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;sho=
uld go in "the github issue associated with the change" - I guess I</font><=
/tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;want</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&nbsp;to see some agreement that this is how=
 we're going to go about it. You</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&nbsp;probably also want to start hassling developers to actuall=
y write the</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;impact=
</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;statement; while =
I don't expect anyone will be opposed to the idea,</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&nbsp;getting</font></tt><br><tt><font size=3D"3=
" face=3D"" >&gt;&nbsp;them to take it up is a separate problem (there may =
also be a problem</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;=
of</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;having a github=
 issue associated with the change to start with).</font></tt><br><br><tt><f=
ont size=3D"3" face=3D"" >Thank you!</font></tt><br><br><tt><font size=3D"3=
" face=3D"" >Here is the next level of detail:</font></tt><br><br><tt><font=
 size=3D"3" face=3D"" >1. Add the "change log process" to the CONTRIBUTING =
doc [101].</font></tt><br><tt><font size=3D"3" face=3D"" >- Motivate the ne=
ed to document end-user impacts and for a change log,</font></tt>
<ul style=3D"padding-left: 12pt; margin-left: 0px; list-style-type: none;" =
>        <li><tt><font size=3D"3" face=3D"" >and show how these flow into t=
he release notes.</font></tt><br>        <tt><font size=3D"3" face=3D"" >- =
Provide guidance for the content of user impact statements.</font></tt><br>=
        <tt><font size=3D"3" face=3D"" >Give examples of impacts, non-impac=
ts, and end-users.</font></tt><br>        <tt><font size=3D"3" face=3D"" >-=
 Say where to document impacts (in github.com/openbmc/REPO/issues).</font><=
/tt></li></ul><tt><font size=3D"3" face=3D"" >2. Agree to use issues to doc=
ument user impact statements. &nbsp;Understand</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >that any indication there is a user impact is helpful. &=
nbsp;Agree it is okay</font></tt><br><tt><font size=3D"3" face=3D"" >to wri=
te a terse impact statement. &nbsp;Agree that mentioning @changelog</font><=
/tt><br><tt><font size=3D"3" face=3D"" >with no other explanation means you=
 want someone else to write the</font></tt><br><tt><font size=3D"3" face=3D=
"" >impact statement. &nbsp;Agree it is okay for someone other than the dev=
eloper</font></tt><br><tt><font size=3D"3" face=3D"" >to write impact state=
ments. &nbsp;Agree that if you write @changelog and</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >nobody takes any action, then nobody cares about yo=
ur change, and that's</font></tt><br><tt><font size=3D"3" face=3D"" >okay.<=
/font></tt><br><br><tt><font size=3D"3" face=3D"" >3. Create a GitHub openb=
mc user called "changelog". &nbsp;Then contributors</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >can @mention [102] @changelog in the issue that des=
cribes the user</font></tt><br><tt><font size=3D"3" face=3D"" >impacts,</fo=
nt></tt><br><tt><font size=3D"3" face=3D"" >and all issues that describe us=
er impacts can be found. &nbsp;I had thought</font></tt><br><tt><font size=
=3D"3" face=3D"" >to create a new label [8][9] called "User impact" for thi=
s purpose, but</font></tt><br><tt><font size=3D"3" face=3D"" >GitHub permis=
sions do not allow most users to add labels.</font></tt><br><br><tt><font s=
ize=3D"3" face=3D"" >4. Create the Change Log wiki here:</font></tt><br><tt=
><font size=3D"3" face=3D"" ><a href=3D"https://github.com/openbmc/openbmc/=
wiki/changelog" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/c=
hangelog</a></font></tt><br><tt><font size=3D"3" face=3D"" >and begin to po=
pulate it with user impact.</font></tt><br><br><tt><font size=3D"3" face=3D=
"" >I am interested in this a way to track the software development process=
.</font></tt><br><tt><font size=3D"3" face=3D"" >Specifically, I would crea=
te user impact statements and changelog</font></tt><br><tt><font size=3D"3"=
 face=3D"" >entries for:</font></tt><br><tt><font size=3D"3" face=3D"" >- R=
elease 2.7 work items as they complete, tracked here: [103].</font></tt><br=
><tt><font size=3D"3" face=3D"" >- Functions being tracked by the test work=
 group [104].</font></tt><br><tt><font size=3D"3" face=3D"" >- Security imp=
acts [105].</font></tt><br><br><tt><font size=3D"3" face=3D"" >- Joseph</fo=
nt></tt><br><br><tt><font size=3D"3" face=3D"" >[101]: <a href=3D"https://g=
ithub.com/openbmc/docs/blob/master/CONTRIBUTING.md" target=3D"_blank">https=
://github.com/openbmc/docs/blob/master/CONTRIBUTING.md</a></font></tt><br><=
tt><font size=3D"3" face=3D"" >[102]: <a href=3D"https://help.github.com/en=
/articles/mentions-on-github-pages" target=3D"_blank">https://help.github.c=
om/en/articles/mentions-on-github-pages</a></font></tt><br><tt><font size=
=3D"3" face=3D"" >[103]: <a href=3D"https://github.com/openbmc/openbmc/labe=
ls/Release2.7" target=3D"_blank">https://github.com/openbmc/openbmc/labels/=
Release2.7</a></font></tt><br><tt><font size=3D"3" face=3D"" >[104]: <a hre=
f=3D"https://github.com/openbmc/openbmc/wiki/Test-work-group" target=3D"_bl=
ank">https://github.com/openbmc/openbmc/wiki/Test-work-group</a></font></tt=
><br><tt><font size=3D"3" face=3D"" >[105]:</font></tt><br><tt><font size=
=3D"3" face=3D"" ><a href=3D"https://github.com/openbmc/openbmc/wiki/Securi=
ty-working-group#current-development-work-with-security-impact" target=3D"_=
blank">https://github.com/openbmc/openbmc/wiki/Security-working-group#curre=
nt-development-work-with-security-impact</a></font></tt><br><br><tt><font s=
ize=3D"3" face=3D"" >&gt;&nbsp;Andrew</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</fon=
t></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;- Joseph Reynolds<=
/font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;&gt;&nbsp;[1]: <a href=3D"https://en.m.wiki=
pedia.org/wiki/Release_notes" target=3D"_blank">https://en.m.wikipedia.org/=
wiki/Release_notes</a></font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&=
gt;&nbsp;[2]: <a href=3D"https://en.m.wikipedia.org/wiki/Changelog" target=
=3D"_blank">https://en.m.wikipedia.org/wiki/Changelog</a></font></tt><br><t=
t><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;[3]: <a href=3D"https://github.=
com/openbmc/openbmc/wiki/Release-Planning" target=3D"_blank">https://github=
.com/openbmc/openbmc/wiki/Release-Planning</a></font></tt><br><tt><font siz=
e=3D"3" face=3D"" >&gt;&gt;&nbsp;[4]:</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&gt;&nbsp;<a href=3D"https://github.com/openbmc/docs/blob/mas=
ter/release/release-notes.md" target=3D"_blank">https://github.com/openbmc/=
docs/blob/master/release/release-notes.md</a></font></tt><br><tt><font size=
=3D"3" face=3D"" >&gt;&gt;&nbsp;[5]: <a href=3D"https://en.wikipedia.org/wi=
ki/Software_security_assurance" target=3D"_blank">https://en.wikipedia.org/=
wiki/Software_security_assurance</a></font></tt><br><tt><font size=3D"3" fa=
ce=3D"" >&gt;&gt;&nbsp;[6]: <a href=3D"https://github.com/openbmc/openbmc/w=
iki/Test-work-group" target=3D"_blank">https://github.com/openbmc/openbmc/w=
iki/Test-work-group</a></font></tt><br><tt><font size=3D"3" face=3D"" >&gt;=
&gt;&nbsp;[7]: <a href=3D"https://github.com/openbmc/openbmc/wiki/Security-=
working-group" target=3D"_blank">https://github.com/openbmc/openbmc/wiki/Se=
curity-working-group</a></font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;&gt;&nbsp;[8]: <a href=3D"https://help.github.com/en/articles/about-labels=
" target=3D"_blank">https://help.github.com/en/articles/about-labels</a></f=
ont></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;&nbsp;[9]: <a href=3D"=
https://github.com/openbmc/openbmc/labels" target=3D"_blank">https://github=
.com/openbmc/openbmc/labels</a></font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&gt;</font>=
</tt><br>&nbsp;</blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
