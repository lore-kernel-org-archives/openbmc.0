Return-Path: <sivas.srr@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fLrB2K7dzF09Y
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 00:03:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6UDxUxf077705
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 10:03:03 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kj314bfyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 10:03:02 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 30 Jul 2018 14:03:00 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 30 Jul 2018 14:02:02 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2018073014020145-586373 ;
 Mon, 30 Jul 2018 14:02:01 +0000 
Subject: Re: openbmc test work group - wiki
In-Reply-To: <OF458BA789.AF22BC1D-ON002582DA.001B42BC-002582DA.001B4B34@notes.na.collabserv.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: bradleyb@fuzziesquirrel.com
Cc: kurt.r.taylor@gmail.com, openbmc@lists.ozlabs.org, yuenn@google.com
Date: Mon, 30 Jul 2018 14:02:01 +0000
Sensitivity: 
References: <OF458BA789.AF22BC1D-ON002582DA.001B42BC-002582DA.001B4B34@notes.na.collabserv.com>,
 <CADfYTpEGA5tahs9dNMyCvUuc65SNd3jnE3A8MyVOHi5PXsYQFA@mail.gmail.com>, 
 <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
 <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
 <CALLMt=qUzt55cL47j3+vKOKaqFQpKXiMps0FVJHVwd8jJeF-aQ@mail.gmail.com>
 <OFBC71A75E.C9C8F28D-ON002582D3.004AAE2A-002582D3.004C186B@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-LLNOutbound: False
X-Disclaimed: 9855
X-TNEFEvaluated: 1
x-cbid: 18073014-6059-0000-0000-00000A72E56B
X-IBM-SpamModules-Scores: BY=0.081319; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=; MB=0.000131
X-IBM-SpamModules-Versions: BY=3.00009456; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01068098; UDB=6.00549035; IPR=6.00846186; 
 BA=6.00006061; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022404; XFM=3.00000015;
 UTC=2018-07-30 14:02:56
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-07-30 07:42:48 - 6.00008768
x-cbparentid: 18073014-6060-0000-0000-0000AA58F4FD
Message-Id: <OFCB332DD4.36F24D9C-ON002582DA.004CE92F-002582DA.004D171E@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-30_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 14:03:08 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi Brad Bishop,</=
div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Had sent a mail from google email account to our communit=
y&nbsp; with the google poll</div>
<div dir=3D"ltr" >link (<a href=3D"https://docs.google.com/forms/d/e/1FAIpQ=
LScYu8fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/viewform"> https://docs.=
google.com/forms/d/e/1FAIpQLScYu8fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv=
-A/viewform</a> ) and it seems waiting for your approval.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Have requested our team to check it and works fine.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Could you pls approve the same.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D=
"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div class=3D"socmailde=
faultfont" dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div c=
lass=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;font-siz=
e:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-fami=
ly:Arial;font-size:10.5pt" ><div dir=3D"ltr" style=3D"margin-top: 20px;" ><=
div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-serif; c=
olor: #7C7C5F;" >Sivas R. S</div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div><span style=3D"font-weight: bold; color: #336699;" >E-mail: </span><a =
href=3D"mailto:sivas.srr@in.ibm.com" style=3D"color: #555">sivas.srr@in.ibm=
.com</a></div>
<div>E2E FSP Test Architecture, OpenBMC Test Lead, Lab Management</div>
<div>Automation is good, Identifying Defect earlier is better always</div>
<div>9902233500</div>
<div>08046678273</div></div></div></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Sivas Srr" &lt;si=
vas.srr@in.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=
=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: yuenn@google.com<br>Cc: kurt.r.ta=
ylor@gmail.com, openbmc@lists.ozlabs.org<br>Subject: Re: openbmc test work =
group - wiki<br>Date: Mon, Jul 30, 2018 10:28 AM<br>&nbsp;<br><font size=3D=
"3" >Sure Nancy, Thank you for representing Google in our openbmc-test-grou=
p community.</font><br><font size=3D"3" >Appreciate it.</font><br><font siz=
e=3D"3" >Sivas R. S</font><br><font size=3D"3" >E-mail: </font><a href=3D"m=
ailto:sivas.srr@in.ibm.com" target=3D"_blank"><u><font size=3D"3" color=3D"=
#0000ff" >sivas.srr@in.ibm.com</font></u></a><br><font size=3D"3" >E2E FSP =
Test Architecture, OpenBMC Test Lead, Lab Management</font><br><font size=
=3D"3" >Automation is good, Identifying Defect earlier is better always</fo=
nt><br><font size=3D"3" >9902233500</font><br><font size=3D"3" >08046678273=
</font><br><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >&nbsp;</fon=
t><br><font size=3D"3" >----- Original message -----</font><br><font size=
=3D"3" >From: Nancy Yuen &lt;yuenn@google.com&gt;</font><br><font size=3D"3=
" >To: Sivas Srr &lt;sivas.srr@in.ibm.com&gt;</font><br><font size=3D"3" >C=
c: Andrew Geissler &lt;geissonator@gmail.com&gt;, OpenBMC Maillist &lt;open=
bmc@lists.ozlabs.org&gt;, krtaylor &lt;kurt.r.taylor@gmail.com&gt;</font><b=
r><font size=3D"3" >Subject: Re: openbmc test work group - wiki</font><br><=
font size=3D"3" >Date: Fri, Jul 27, 2018 1:50 AM</font><br><font size=3D"3"=
 >&nbsp;</font><br><font size=3D"3" >Please include me when you have the ki=
ck off meeting</font><br><br><font size=3D"3" >Thanks,</font><br><br><font =
size=3D"3" >----------</font><br><font size=3D"3" >Nancy</font><br><br><fon=
t size=3D"3" >On Mon, Jul 23, 2018 at 6:51 AM, Sivas Srr </font><font size=
=3D"3" >&lt;</font><a href=3D"mailto:sivas.srr@in.ibm.com" target=3D"_blank=
"><u><font size=3D"3" color=3D"#0000ff" >sivas.srr@in.ibm.com</font></u></a=
><font size=3D"3" >&gt;</font><font size=3D"3" >&nbsp;</font><font size=3D"=
3" >wrote:</font><br><font size=3D"3" >Thank you Brad Bishop (For offline r=
eview),&nbsp; Kurt Taylor and Andrew Geissler for your kind support.</font>=
<font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Yes CI can be included=
.</font><br><font size=3D"3" >( In my opinion, If we want to do good CI, we=
 may have to do more left shift from CT bucket</font><br><font size=3D"3" >=
as well). Dynamic CI, It should be. If major code drop associate with a fea=
ture/Area,</font><br><font size=3D"3" >then test bucket of that CT bucket s=
hould be executed as part of CI. We can discuss on this.</font><font size=
=3D"3" >&nbsp;</font><br><font size=3D"3" >For eg. IPMI user management fea=
tures getting enabled then entire IPMI bucket can be run part of CI.</font>=
<font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Test work group meetin=
g:</font><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >As test based=
 on release planning, Would like to have this meeting&nbsp; either on the s=
ame day after the release plan meeting or a day after the release plan meet=
ing.</font><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Currently r=
elease plan meeting happens on Thursday 3 PM CST.</font><br><font size=3D"3=
" >Proposal to have test work group meeting is either on Thursday evening 7=
 or 8 PM CST.</font><font size=3D"3" >&nbsp;</font><br><font size=3D"3" >Th=
ank you again for all your inputs.</font><font size=3D"3" >&nbsp;</font><fo=
nt size=3D"3" >&nbsp;</font><font size=3D"3" >&nbsp;</font><br><font size=
=3D"3" >Sivas R. S</font><br><font size=3D"3" >E-mail: </font><a href=3D"ma=
ilto:sivas.srr@in.ibm.com" target=3D"_blank"><u><font size=3D"3" color=3D"#=
0000ff" >sivas.srr@in.ibm.com</font></u></a><br><font size=3D"3" >E2E FSP T=
est Architecture, OpenBMC Test Lead, Lab Management</font><font size=3D"3" =
>&nbsp;</font><br><font size=3D"3" >Automation is good, Identifying Defect =
earlier is better always</font><br><font size=3D"3" >9902233500</font><br><=
font size=3D"3" >08046678273</font><font size=3D"3" >&nbsp;</font><font siz=
e=3D"3" >&nbsp;</font><br><font size=3D"3" >----- Original message -----</f=
ont><br><font size=3D"3" >From: Andrew Geissler &lt;</font><a href=3D"mailt=
o:geissonator@gmail.com" target=3D"_blank"><u><font size=3D"3" color=3D"#00=
00ff" >geissonator@gmail.com</font></u></a><font size=3D"3" >&gt;</font><br=
><font size=3D"3" >Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=3D</fon=
t><a href=3D"mailto:in.ibm.com@lists.ozlabs.org" target=3D"_blank"><u><font=
 size=3D"3" color=3D"#0000ff" >in.</font></u><u><font size=3D"3" color=3D"#=
0000ff" >ibm.com@lists.ozlabs.org</font></u></a><font size=3D"3" >&gt;</fon=
t><br><font size=3D"3" >To: Kurt Taylor &lt;</font><a href=3D"mailto:kurt.r=
.taylor@gmail.com" target=3D"_blank"><u><font size=3D"3" color=3D"#0000ff" =
>kurt.r.taylor@gmail.com</font></u></a><font size=3D"3" >&gt;</font><br><fo=
nt size=3D"3" >Cc: OpenBMC Maillist &lt;</font><a href=3D"mailto:openbmc@li=
sts.ozlabs.org" target=3D"_blank"><u><font size=3D"3" color=3D"#0000ff" >op=
enbmc@lists.ozlabs.org</font></u></a><font size=3D"3" >&gt;</font><br><font=
 size=3D"3" >Subject: Re: openbmc test work group - wiki</font><br><font si=
ze=3D"3" >Date: Fri, Jul 20, 2018 11:12 PM</font><br><font size=3D"3" >&nbs=
p;</font><br><tt><font size=3D"3" face=3D"" >On Fri, Jul 20, 2018 at 10:58 =
AM krtaylor &lt;</font></tt><a href=3D"mailto:kurt.r.taylor@gmail.com" targ=
et=3D"_blank"><tt><u><font size=3D"3" face=3D"" color=3D"#0000ff" >kurt.r.t=
aylor@gmail.com</font></u></tt></a><tt><font size=3D"3" face=3D"" >&gt;&nbs=
p;wrote:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br=
><tt><font size=3D"3" face=3D"" >&gt;&nbsp;On 7/19/18 10:47 PM, Sivas Srr w=
rote:</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><t=
t><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&nbsp;Hi All,</font></tt><br><tt><font size=3D"3" face=3D"" >&gt=
;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Have </font></tt=
><a href=3D"https://github.com/openbmc/openbmc/wiki/Test-work---group" targ=
et=3D"_blank"><tt><u><font size=3D"3" face=3D"" color=3D"#0000ff" >https://=
github.com/openbmc/</font></u></tt><tt><u><font size=3D"3" face=3D"" color=
=3D"#0000ff" >openbmc/wiki/Test-work---group</font></u></tt></a><tt><font s=
ize=3D"3" face=3D"" >&nbsp;</font></tt><tt><font size=3D"3" face=3D"" >&nbs=
p;created this page in our</font></tt><br><tt><font size=3D"3" face=3D"" >&=
gt;&nbsp;wiki for upcoming test work group. Please review and provide your =
inputs / raise questions if you need any clarification.</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Thanks=
 Sivas! I'll join and help however I can. When would be a good time for a k=
ickoff meeting?</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font><=
/tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;It looks like the initial=
 list is a good summary, where do we start, what is the most painful thing =
to fix? Also, is there room for remote (third-party) CI testing in this WG?=
</font></tt><br><br><tt><font size=3D"3" face=3D"" >Second this one, Brad a=
nd I were just chatting a bit on this the other</font></tt><br><tt><font si=
ze=3D"3" face=3D"" >day, how could we scale the HW CI testing with third pa=
rties.&nbsp; Would</font></tt><br><tt><font size=3D"3" face=3D"" >def like =
it if we could discuss within this WG (and any other</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >improvements to our CI process)</font></tt><br><br=
><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" f=
ace=3D"" >&gt;&nbsp;Kurt Taylor (krtaylor)</font></tt><br><tt><font size=3D=
"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbs=
p;Sivas R. S</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;E-mai=
l: </font></tt><a href=3D"mailto:sivas.srr@in.ibm.com" target=3D"_blank"><t=
t><u><font size=3D"3" face=3D"" color=3D"#0000ff" >sivas.srr@in.ibm.com</fo=
nt></u></tt></a><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt=
><font size=3D"3" face=3D"" >&gt;&nbsp;Automation is good, Identifying Defe=
ct earlier is better always</font></tt><br><tt><font size=3D"3" face=3D"" >=
&gt;&nbsp;9902233500</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nb=
sp;08046678273</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></=
tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><font size=3D"3" >&n=
bsp;</font><br><font size=3D"3" >&nbsp;</font></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
