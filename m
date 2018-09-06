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
 by lists.ozlabs.org (Postfix) with ESMTPS id 425hbn2yxPzF0pD
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 23:43:16 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w86DdUY9011892
 for <openbmc@lists.ozlabs.org>; Thu, 6 Sep 2018 09:43:14 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mb2a58kdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Sep 2018 09:43:14 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Thu, 6 Sep 2018 13:43:12 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 6 Sep 2018 13:43:08 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2018090613430722-611814 ;
 Thu, 6 Sep 2018 13:43:07 +0000 
Subject: OpenBMC test automation test plan document
In-Reply-To: <OF10EAF13E.6548843F-ON002582FE.0055D2A3-002582FE.00563FF0@LocalDomain>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 6 Sep 2018 13:43:07 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF10EAF13E.6548843F-ON002582FE.0055D2A3-002582FE.00563FF0@LocalDomain>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-LLNOutbound: False
X-Disclaimed: 19107
X-TNEFEvaluated: 1
x-cbid: 18090613-6059-0000-0000-00000B01D107
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.400847; ST=0; TS=0; UL=0; ISC=; MB=0.261372
X-IBM-SpamModules-Versions: BY=3.00009676; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01084386; UDB=6.00559691; IPR=6.00864386; 
 BA=6.00006093; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023143; XFM=3.00000015;
 UTC=2018-09-06 13:43:11
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-06 12:16:56 - 6.00008930
x-cbparentid: 18090613-6060-0000-0000-0000AB18DEE6
Message-Id: <OF560EBAF9.B08A8550-ON00258300.004B0873-00258300.004B5C25@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-06_03:, , signatures=0
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
X-List-Received-Date: Thu, 06 Sep 2018 13:43:18 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As part of last instance of test work group meeting, Here=
 with sending the link</div>
<div dir=3D"ltr" >where had uploaded the test plan documentation in html fo=
rmat (all files in zip).</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><a href=3D"https://drive.google.com/open?id=3D1Fl2faFZfbP=
R456sJ=5F3liSPEmTwcyFJcn" >https://drive.google.com/open?id=3D1Fl2faFZfbPR4=
56sJ=5F3liSPEmTwcyFJcn</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Explored auto generation of test plan into CSV using robo=
tframework not there.</div>
<div dir=3D"ltr" >Exploring further. Once created in CSV / XL sheet way, Wi=
ll upload the same.</div>
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
m.com</a></div>&nbsp;

<div>+919902233500</div>
<div>&nbsp;</div></div></div></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Sivas Srr/India/IB=
M<br>To: openbmc@lists.ozlabs.org<br>Cc:<br>Subject: MoM of Aug 28 instance=
 of test work group meeting uploaded in the test work group wiki<br>Date: T=
ue, Sep 4, 2018 9:12 PM<br>&nbsp;
<div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-siz=
e:10.5pt" ><div dir=3D"ltr" >Dear All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Last instance of test work group was good. We could see n=
ew participants and also</div>
<div dir=3D"ltr" >representations from Google. Now we have representatives =
from Intel, Google and IBM.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Have updated MoM of Aug 28 meeting of test work group.</d=
iv>
<div dir=3D"ltr" >(Sorry for the delay, Had other higher priority stuffs to=
 work with ).</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc/wiki/Test-w=
ork-group" target=3D"=5Fblank" >https://github.com/openbmc/openbmc/wiki/Tes=
t-work-group</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Coming Thursday (6 Sep 2018) meeting is on. Just a gentle=
 reminder.</div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.=
5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div d=
ir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" s=
tyle=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font=
-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" style=3D"margin-top: 20px=
;" ><div style=3D"font-size: 12pt; font-weight: bold; font-family: sans-ser=
if; color: #7C7C5F;" >Sivas R. S</div>
<div style=3D"font-size: 8pt; font-family: sans-serif; margin-top: 10px;" >=
<div><span style=3D"font-weight: bold; color: #336699;" >E-mail: </span><a =
href=3D"mailto:sivas.srr@in.ibm.com" style=3D"color: #555" target=3D"=5Fbla=
nk" >sivas.srr@in.ibm.com</a></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div></div></div></div></div></div></div></div></div></div></bl=
ockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
