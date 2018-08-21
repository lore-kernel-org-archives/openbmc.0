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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vjsw1tjFzF0pD
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 18:05:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7L845PV029761
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 04:05:54 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m0cm7ngnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 04:05:53 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 21 Aug 2018 08:05:51 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 21 Aug 2018 08:05:49 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2018082108054933-203094 ;
 Tue, 21 Aug 2018 08:05:49 +0000 
In-Reply-To: 
Subject: OpenBMC test work group meeting on Thursday (23 Aug) at 9PM IST
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 21 Aug 2018 08:05:48 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-LLNOutbound: False
X-Disclaimed: 12959
X-TNEFEvaluated: 1
x-cbid: 18082108-3107-0000-0000-000007C5CE10
X-IBM-SpamModules-Scores: BY=0.000057; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.002150
X-IBM-SpamModules-Versions: BY=3.00009583; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01076633; UDB=6.00555021; IPR=6.00856603; 
 BA=6.00006081; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022842; XFM=3.00000015;
 UTC=2018-08-21 08:05:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-08-21 04:24:37 - 6.00008860
x-cbparentid: 18082108-3108-0000-0000-0000B0191F87
Message-Id: <OF69496ECF.51F903E5-ON002582F0.002C4471-002582F0.002C7A46@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-21_04:, , signatures=0
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
X-List-Received-Date: Tue, 21 Aug 2018 08:05:57 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Dear Friends,</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As Tomorrow is a local holiday here in India, Hence sendi=
ng a reminder for</div>
<div dir=3D"ltr" >our OpenBMC test work group meeting on Thursday (23 Aug),=
 at 9PM IST.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please do join friends.</div>
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
&nbsp;
<div>9902233500</div>
<div>&nbsp;</div></div></div></div></div></div></div></div></div></div><BR>
