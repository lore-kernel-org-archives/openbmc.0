Return-Path: <jrey@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RVjR0TwwzDqvH
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 08:19:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6CMJ9V1049863
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:19:34 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2k6echar6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:19:34 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jrey@us.ibm.com>;
 Thu, 12 Jul 2018 22:19:33 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 Jul 2018 22:19:30 -0000
Received: from us1b3-mail269.a3dr.sjc03.isc4sb.com ([10.160.11.243])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018071222193059-1055959 ;
 Thu, 12 Jul 2018 22:19:30 +0000 
In-Reply-To: 
Subject: How to handle security vulnerabilities (was: OpenBMC security
 workgroup status)
From: "Joseph Reynolds" <jrey@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Thu, 12 Jul 2018 22:19:29 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16007-1287 | IBM Domino Build
 SCN1812108_20180501T0841 May 01, 2018 at 08:41
X-KeepSent: E1ABED0B:13DF2F69-002582C8:007A50D4;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 28815
X-TNEFEvaluated: 1
X-LLNXfer: False
x-cbid: 18071222-7845-0000-0000-0000041388E8
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.247892
X-IBM-SpamModules-Versions: BY=3.00009359; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01060452; UDB=6.00544339; IPR=6.00838370; 
 BA=6.00006046; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022122; XFM=3.00000015;
 UTC=2018-07-12 22:19:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-07-12 21:19:19 - 6.00008694
x-cbparentid: 18071222-7846-0000-0000-000010509362
Message-Id: <OFE1ABED0B.13DF2F69-ON002582C8.007A50D4-002582C8.007AA270@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-12_07:, , signatures=0
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
X-List-Received-Date: Thu, 12 Jul 2018 22:19:39 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>&gt; What's =
the short-term strategy for handling [security] vulnerability reports recei=
ved in the gap between now and getting some formal process in place?</div>
<div>&nbsp;</div>
<div>We don't have a strategy.&nbsp; Let's discuss it here.</div>
<div>&nbsp;</div>
<div>Officially (<a href=3D"https://github.com/openbmc/openbmc/" >https://g=
ithub.com/openbmc/openbmc/</a> section "Bug Reporting") issues are managed =
on GitHub.</div>
<div>&nbsp;</div>
<div>Unofficially, Brad volunteered to accept one batch of security vulnera=
bility reports and distribute them, presumably to the OpenBMC TSC members (=
<a href=3D"https://github.com/openbmc/docs" >https://github.com/openbmc/doc=
s</a> section "Technical Steering Committee ") or their delegates.&nbsp; I =
assume they would privately contact a trusted OpenBMC contributor who could=
 address the problem.</div>
<div>&nbsp;</div>
<div>We could adapt the Linux model (<a href=3D"https://www.kernel.org/doc/=
html/v4.16/admin-guide/security-bugs.html" >https://www.kernel.org/doc/html=
/v4.16/admin-guide/security-bugs.html</a>), although I am still looking for=
 information on what the Linux security team does with the bug report.&nbsp=
; For example, how security group members track and discuss problems among =
themselves, how they pull in additional resources to fix or mitigate the pr=
oblem, and how they inform downstream distros before announcing the problem=
, etc.</div>
<div>&nbsp;</div>
<div>I think the first step for the OpenBMC team is to establish an email a=
ddress (like security@openbmc.org), subscribe only trusted people to that e=
mail list, and update the docs to explain that you should email the securit=
y team for security questions, and use issues for everything else.&nbsp; Pr=
esumably, the security team would communicate privately among themselves an=
d the submitter to assess the situation, and contact OpenBMC community memb=
ers privately to address the problem.</div>
<div>&nbsp;</div>
<div>This would be an easy step to take, and would move the team in the rig=
ht direction.&nbsp; What do you think?</div></div></div><BR>
