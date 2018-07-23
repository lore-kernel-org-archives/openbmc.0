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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z2vn07jbzDqmj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jul 2018 23:51:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6NDoUft074292
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jul 2018 09:51:13 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kdectwqyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jul 2018 09:51:13 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 23 Jul 2018 13:51:13 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 23 Jul 2018 13:51:10 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2018072313510972-580899 ;
 Mon, 23 Jul 2018 13:51:09 +0000 
Subject: Re: openbmc test work group - wiki
In-Reply-To: <CALLMt=qUzt55cL47j3+vKOKaqFQpKXiMps0FVJHVwd8jJeF-aQ@mail.gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: geissonator@gmail.com
Cc: kurt.r.taylor@gmail.com, openbmc@lists.ozlabs.org
Date: Mon, 23 Jul 2018 13:51:09 +0000
Sensitivity: 
References: <CALLMt=qUzt55cL47j3+vKOKaqFQpKXiMps0FVJHVwd8jJeF-aQ@mail.gmail.com>,
 <OFC1A0F558.EB78B1DD-ON002582D0.00149A34-002582D0.0014CFBF@notes.na.collabserv.com>
 <d8ebd772-7566-cd23-28f8-b2e98982f2c7@gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-LLNOutbound: False
X-Disclaimed: 19543
X-TNEFEvaluated: 1
x-cbid: 18072313-5101-0000-0000-00000B8D9624
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410169; ST=0; TS=0; UL=0; ISC=; MB=0.000151
X-IBM-SpamModules-Versions: BY=3.00009417; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01064981; UDB=6.00547025; IPR=6.00842839; 
 BA=6.00006054; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022279; XFM=3.00000015;
 UTC=2018-07-23 13:51:12
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-07-23 09:38:47 - 6.00008739
x-cbparentid: 18072313-5102-0000-0000-000034CDA3A6
Message-Id: <OFBC71A75E.C9C8F28D-ON002582D3.004AAE2A-002582D3.004C186B@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-23_02:, , signatures=0
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
X-List-Received-Date: Mon, 23 Jul 2018 13:51:17 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thank you Brad Bi=
shop (For offline review),&nbsp; Kurt Taylor and Andrew Geissler for your k=
ind support.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Yes CI can be included.</div>
<div dir=3D"ltr" >( In my opinion, If we want to do good CI, we may have to=
 do more left shift from CT bucket</div>
<div dir=3D"ltr" >as well). Dynamic CI, It should be. If major code drop as=
sociate with a feature/Area,</div>
<div dir=3D"ltr" >then test bucket of that CT bucket should be executed as =
part of CI. We can discuss on this.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For eg. IPMI user management features getting enabled the=
n entire IPMI bucket can be run part of CI.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Test work group meeting:</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As test based on release planning, Would like to have thi=
s meeting&nbsp; either on the same day after the release plan meeting or a =
day after the release plan meeting.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Currently release plan meeting happens on Thursday 3 PM C=
ST.</div>
<div dir=3D"ltr" >Proposal to have test work group meeting is either on Thu=
rsday evening 7 or 8 PM CST.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thank you again for all your inputs.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
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
margin-right:0px" >----- Original message -----<br>From: Andrew Geissler &l=
t;geissonator@gmail.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas=
.srr=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: Kurt Taylor &lt;kurt.r.taylor=
@gmail.com&gt;<br>Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>=
Subject: Re: openbmc test work group - wiki<br>Date: Fri, Jul 20, 2018 11:1=
2 PM<br>&nbsp;<br><tt><font size=3D"3" face=3D"" >On Fri, Jul 20, 2018 at 1=
0:58 AM krtaylor &lt;kurt.r.taylor@gmail.com&gt; wrote:</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&nbsp;On 7/19/18 10:47 PM, Sivas Srr wrote:</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D=
"" >&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Hi All,</=
font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font=
 size=3D"3" face=3D"" >&gt;&nbsp;Have <a href=3D"https://github.com/openbmc=
/openbmc/wiki/Test-work---group" target=3D"_blank">https://github.com/openb=
mc/openbmc/wiki/Test-work---group</a> &nbsp;created this page in our</font>=
</tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;wiki for upcoming test w=
ork group. Please review and provide your inputs / raise questions if you n=
eed any clarification.</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;<=
/font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><fon=
t size=3D"3" face=3D"" >&gt;&nbsp;Thanks Sivas! I'll join and help however =
I can. When would be a good time for a kickoff meeting?</font></tt><br><tt>=
<font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D"3" face=
=3D"" >&gt;&nbsp;It looks like the initial list is a good summary, where do=
 we start, what is the most painful thing to fix? Also, is there room for r=
emote (third-party) CI testing in this WG?</font></tt><br><br><tt><font siz=
e=3D"3" face=3D"" >Second this one, Brad and I were just chatting a bit on =
this the other</font></tt><br><tt><font size=3D"3" face=3D"" >day, how coul=
d we scale the HW CI testing with third parties. &nbsp;Would</font></tt><br=
><tt><font size=3D"3" face=3D"" >def like it if we could discuss within thi=
s WG (and any other</font></tt><br><tt><font size=3D"3" face=3D"" >improvem=
ents to our CI process)</font></tt><br><br><tt><font size=3D"3" face=3D"" >=
&gt;</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Kurt Taylor (=
krtaylor)</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><b=
r><tt><font size=3D"3" face=3D"" >&gt;&nbsp;Sivas R. S</font></tt><br><tt><=
font size=3D"3" face=3D"" >&gt;&nbsp;E-mail: sivas.srr@in.ibm.com</font></t=
t><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><font size=3D=
"3" face=3D"" >&gt;&nbsp;Automation is good, Identifying Defect earlier is =
better always</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;9902=
233500</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;&nbsp;08046678273=
</font></tt><br><tt><font size=3D"3" face=3D"" >&gt;</font></tt><br><tt><fo=
nt size=3D"3" face=3D"" >&gt;</font></tt></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
