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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424WKy2MxJzF3Qm
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 01:42:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w84FdUDa116961
 for <openbmc@lists.ozlabs.org>; Tue, 4 Sep 2018 11:42:09 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2m9ubgvvqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Sep 2018 11:42:09 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 4 Sep 2018 15:42:08 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 4 Sep 2018 15:42:04 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018090415420463-694277 ;
 Tue, 4 Sep 2018 15:42:04 +0000 
In-Reply-To: 
Subject: MoM of Aug 28 instance of test work group meeting uploaded in the
 test work group wiki
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 4 Sep 2018 15:42:04 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: 10EAF13E:6548843F-002582FE:0055D2A3;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 20871
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18090415-8243-0000-0000-00000470BBFF
X-IBM-SpamModules-Scores: BY=0.021631; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.405782; ST=0; TS=0; UL=0; ISC=; MB=0.075158
X-IBM-SpamModules-Versions: BY=3.00009670; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01083468; UDB=6.00559139; IPR=6.00863468; 
 BA=6.00006093; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023107; XFM=3.00000015;
 UTC=2018-09-04 15:42:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-09-04 10:28:44 - 6.00008923
x-cbparentid: 18090415-8244-0000-0000-0000B83EBE4D
Message-Id: <OF10EAF13E.6548843F-ON002582FE.0055D2A3-002582FE.00563FF0@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-04_09:, , signatures=0
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
X-List-Received-Date: Tue, 04 Sep 2018 15:42:15 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Dear All,</div>
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
ork-group" >https://github.com/openbmc/openbmc/wiki/Test-work-group</a></di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Coming Thursday (6 Sep 2018) meeting is on. Just a gentle=
 reminder.</div>
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
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div></div></div></div></div></div></div></div></div></div><BR>
