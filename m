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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qYf22MfLzF15Q
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 23:41:13 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7EDYEsZ074777
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 09:41:12 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kuwkr6tnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 09:41:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 14 Aug 2018 13:41:11 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 14 Aug 2018 13:41:08 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018081413410827-506236 ;
 Tue, 14 Aug 2018 13:41:08 +0000 
In-Reply-To: 
Subject: openbmc test work group meeting update - Right shift by 1.5 hrs to
 accommodate more folks 
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 14 Aug 2018 13:41:08 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: FA52FDEB:85FECDEA-002582E9:004AFA38;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 60627
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18081413-6371-0000-0000-000003EB5905
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.405782; ST=0; TS=0; UL=0; ISC=; MB=0.000161
X-IBM-SpamModules-Versions: BY=3.00009543; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073401; UDB=6.00553072; IPR=6.00853359; 
 BA=6.00006075; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022713; XFM=3.00000015;
 UTC=2018-08-14 13:41:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-08-14 10:39:11 - 6.00008830
x-cbparentid: 18081413-6372-0000-0000-00004F575A2B
Message-Id: <OFFA52FDEB.85FECDEA-ON002582E9.004AFA38-002582E9.004B2D5E@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-14_06:, , signatures=0
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
X-List-Received-Date: Tue, 14 Aug 2018 13:41:15 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hi all,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Have invited for next instance of openbmc test workgroup =
meeting. Had right shift by 1.5</div>
<div dir=3D"ltr" >hours to accommodate more of our friends. Please join.</d=
iv>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Have updated MoM of last instance of meeting @ <a href=3D=
"https://github.com/openbmc/openbmc/wiki/Test-work-group" >https://github.c=
om/openbmc/openbmc/wiki/Test-work-group</a></div>
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
<div>08046678273</div></div></div></div></div></div></div></div></div></div=
><BR>
