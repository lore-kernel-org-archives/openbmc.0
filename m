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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q1gM3mf6zDrYj
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 02:40:30 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7DGdAml104280
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 12:40:28 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kucpsjsr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 12:40:28 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 13 Aug 2018 16:40:28 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 13 Aug 2018 16:40:24 -0000
Received: from us1b3-mail64.a3dr.sjc01.isc4sb.com ([10.122.7.93])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018081316402393-690069 ;
 Mon, 13 Aug 2018 16:40:23 +0000 
Subject: Re: openbmc bug management
In-Reply-To: <CALLMt=pDF+AQWZT1hqe4XEedCkv5ypHd5rLmD5=-+FsBFwZ7xg@mail.gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: geissonator@gmail.com
Cc: anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Date: Mon, 13 Aug 2018 16:40:23 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CALLMt=pDF+AQWZT1hqe4XEedCkv5ypHd5rLmD5=-+FsBFwZ7xg@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: 9ADB4CCA:9B5CDFD9-002582E8:0059FA91;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 40891
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18081316-7845-0000-0000-00000466C820
X-IBM-SpamModules-Scores: BY=0.031192; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.363559; ST=0; TS=0; UL=0; ISC=; MB=0.217549
X-IBM-SpamModules-Versions: BY=3.00009536; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01072989; UDB=6.00552820; IPR=6.00852940; 
 BA=6.00006074; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022693; XFM=3.00000015;
 UTC=2018-08-13 16:40:26
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-08-13 15:18:11 - 6.00008826
x-cbparentid: 18081316-7846-0000-0000-000010C6C9F6
Message-Id: <OF9ADB4CCA.9B5CDFD9-ON002582E8.0059FA91-002582E8.005B96C8@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-13_07:, , signatures=0
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
X-List-Received-Date: Mon, 13 Aug 2018 16:40:32 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Good discussion t=
opic, Andrew.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >My thoughts:</div>
<div dir=3D"ltr" >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >First of all, bug should be associate with SLA/some kind =
of metrics on how quickly it gets resolved.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Bug submitter is already started donating/contributing to=
 the community by pointing the issue in the code,</div>
<div dir=3D"ltr" >when bug submitter opens an issue.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >It is the maintainer (other assigned person) responsibili=
ty to accept (fix the bug) or prove it is not in their</div>
<div dir=3D"ltr" >area and pointed out the issue/bug to the other repositor=
y with details.&nbsp; (From the horse's mouth)</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >If the ownership of moving/closing bug to the submitter, =
I feel the point of isolating the bug may not happen accurately.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Second point (back to SLA), If the submitter owns it then=
 SLA/Metrics may not be accurate. This will be totally different than what =
normally industry follows, I guess.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Real Life Scenario:</div>
<div dir=3D"ltr" >=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div dir=3D"ltr" >For eg. if person A points out issue/bug in person B shir=
t, Can person A responsible to change person B shirt?</div>
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
href=3D"mailto:sivas.srr@in.ibm.com" style=3D"color: #555" >sivas.srr@in.ib=
m.com</a></div>
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
.srr=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: Adriana Kobylak &lt;anoo@linu=
x.vnet.ibm.com&gt;, OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>Cc=
:<br>Subject: openbmc bug management<br>Date: Mon, Aug 13, 2018 9:34 PM<br>=
&nbsp;<br><tt><font size=3D"3" face=3D"" >Currently we mostly open bugs aga=
inst openbmc/openbmc. &nbsp;This is nice</font></tt><br><tt><font size=3D"3=
" face=3D"" >in that it provides a single location to search for all bugs r=
elated</font></tt><br><tt><font size=3D"3" face=3D"" >to openbmc, but it do=
esn't provide any clear ownership for someone to</font></tt><br><tt><font s=
ize=3D"3" face=3D"" >drive the bug, and it becomes more and more unmanageab=
le as the</font></tt><br><tt><font size=3D"3" face=3D"" >openbmc project co=
ntinues to grow.</font></tt><br><br><tt><font size=3D"3" face=3D"" >Per the=
 community call topic today, we'd like to start having bugs</font></tt><br>=
<tt><font size=3D"3" face=3D"" >assigned to the specific repo that will pro=
vide the fix to the bug.</font></tt><br><tt><font size=3D"3" face=3D"" >The=
 main concern with this is that if someone is unsure on where the</font></t=
t><br><tt><font size=3D"3" face=3D"" >bug should go and takes a best guess,=
 if the guess is wrong, how do we</font></tt><br><tt><font size=3D"3" face=
=3D"" >ensure the bug gets routed correctly? &nbsp;The idea was that it's t=
he</font></tt><br><tt><font size=3D"3" face=3D"" >responsibility of the cre=
ator of the bug, so the repo owner says</font></tt><br><tt><font size=3D"3"=
 face=3D"" >something to the affect of "not my problem" (with some guidance=
 on</font></tt><br><tt><font size=3D"3" face=3D"" >who's it is if they know=
) and the bug submitter will then use the</font></tt><br><tt><font size=3D"=
3" face=3D"" >zenhub option "Move Issue" to close it in the current repo an=
d copy it</font></tt><br><tt><font size=3D"3" face=3D"" >over to the new re=
po.</font></tt><br><br><tt><font size=3D"3" face=3D"" >Thoughts or concerns=
?</font></tt><br><tt><font size=3D"3" face=3D"" >Andrew</font></tt></blockq=
uote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
