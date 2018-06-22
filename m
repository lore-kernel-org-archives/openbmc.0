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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Blry2vjGzF0Vt
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 14:26:54 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5M4OE2J044361
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 00:26:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2jrpmf61g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jun 2018 00:26:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Fri, 22 Jun 2018 04:26:51 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 Jun 2018 04:26:46 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2018062204264649-536 ; Fri, 22 Jun 2018 04:26:46 +0000 
Subject: Re: OpenBMC Release Planning Working Group
In-Reply-To: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: kurt.r.taylor@gmail.com
Cc: alirhas@microsoft.com, bradleyb@fuzziesquirrel.com, james.mihm@intel.com, 
 openbmc@lists.ozlabs.org
Date: Fri, 22 Jun 2018 04:26:46 +0000
Sensitivity: 
MIME-Version: 1.0
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1809300_20180403T0021_FP2 April 18, 2018 at 18:02
X-LLNOutbound: False
X-Disclaimed: 37255
X-TNEFEvaluated: 1
x-cbid: 18062204-5101-0000-0000-00000B19D186
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.055184
X-IBM-SpamModules-Versions: BY=3.00009236; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000265; SDB=6.01050504; UDB=6.00538367; IPR=6.00829474; 
 BA=6.00006014; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00021798; XFM=3.00000015;
 UTC=2018-06-22 04:26:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-06-22 01:09:32 - 6.00008604
x-cbparentid: 18062204-5102-0000-0000-000034340C3D
Message-Id: <OF1A1B8FDD.7DACE5AD-ON002582B4.00185D76-002582B4.00186C86@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-22_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2018 04:26:59 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thank you Kurt Ta=
ylor.</div>
<div dir=3D"ltr" ><tt><font size=3D"3" face=3D"" >Thursdays, 8:00am Central=
 US (1300 UTC) works good to us. </font></tt></div>
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
margin-right:0px" >----- Original message -----<br>From: krtaylor &lt;kurt.=
r.taylor@gmail.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=
=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &lt;op=
enbmc@lists.ozlabs.org&gt;<br>Cc: alirhas@microsoft.com, bradleyb@fuzziesqu=
irrel.com, james.mihm@intel.com<br>Subject: OpenBMC Release Planning Workin=
g Group<br>Date: Fri, Jun 22, 2018 12:38 AM<br>&nbsp;<br><tt><font size=3D"=
3" face=3D"" >Hi all,</font></tt><br><br><tt><font size=3D"3" face=3D"" >Th=
e long anticipated OpenBMC Release Planning working group is now</font></tt=
><br><tt><font size=3D"3" face=3D"" >forming and will have its first meetin=
g next week. I would like to keep</font></tt><br><tt><font size=3D"3" face=
=3D"" >the meeting small at first so that we can move quickly, but I do nee=
d</font></tt><br><tt><font size=3D"3" face=3D"" >complete representation. P=
lease let me know if you'd like to participate</font></tt><br><tt><font siz=
e=3D"3" face=3D"" >and what day a meeting would work best for you. Those on=
 copy should</font></tt><br><tt><font size=3D"3" face=3D"" >plan on attendi=
ng or at least make sure someone is covering for your</font></tt><br><tt><f=
ont size=3D"3" face=3D"" >organization.</font></tt><br><br><tt><font size=
=3D"3" face=3D"" >Let me know if you have any questions.</font></tt><br><br=
><tt><font size=3D"3" face=3D"" >Regards, Kurt Taylor (krtaylor)</font></tt=
><br><br><br><tt><font size=3D"3" face=3D"" >Proposed times:</font></tt><br=
><br><tt><font size=3D"3" face=3D"" >1) Tuesdays, 2:00pm Central US (1900 U=
TC)</font></tt><br><br><tt><font size=3D"3" face=3D"" >2) Thursdays, 8:00am=
 Central US (1300 UTC)</font></tt><br><br><tt><font size=3D"3" face=3D"" >3=
) Thursdays, 3:00pm Central US (2000 UTC)</font></tt><br><br><br><tt><font =
size=3D"3" face=3D"" >Initial Agenda:</font></tt><br><br><tt><font size=3D"=
3" face=3D"" >1) Agree on the release process and set an initial release da=
te in</font></tt><br><tt><font size=3D"3" face=3D"" >November (see email fr=
om May 21)</font></tt><br><br><tt><font size=3D"3" face=3D"" >2) Set design=
 and freeze milestones</font></tt><br><br><tt><font size=3D"3" face=3D"" >3=
) "Must" deliver items for November release</font></tt><br><br><tt><font si=
ze=3D"3" face=3D"" >4) How to open the design and development for a needed =
feature</font></tt></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
