Return-Path: <mtritz@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xd0Ns3m2jzDrJr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 07:07:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7NL4B36140530
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:07:06 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2chh2y0xac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:07:06 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <mtritz@us.ibm.com>;
 Wed, 23 Aug 2017 21:07:05 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 23 Aug 2017 21:07:03 -0000
Received: from us1a3-mail200.a3.dal06.isc4sb.com ([10.146.77.116])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2017082321070322-992174 ;
 Wed, 23 Aug 2017 21:07:03 +0000 
In-Reply-To: 
Subject: Issue #2149 - BMC patching - service file changes
From: "Michael Tritz" <mtritz@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 23 Aug 2017 21:07:03 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 15207-1237 | IBM Domino Build SCN17206_20170725T0035
 July 25, 2017 at 00:35
X-LLNOutbound: False
X-Disclaimed: 22719
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17082321-5101-0000-0000-000006216873
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=; MB=0.000022
X-IBM-SpamModules-Versions: BY=3.00007599; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000224; SDB=6.00906646; UDB=6.00454441; IPR=6.00686847; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016833; XFM=3.00000015;
 UTC=2017-08-23 21:07:04
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-23 18:07:59 - 6.00007223
x-cbparentid: 17082321-5102-0000-0000-0000D2A2FB83
Message-Id: <OF4E02A31F.E0F17469-ON00258185.0073368B-00258185.007400A6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-23_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 21:07:10 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Per commit <a href=3D"https://gerrit.openbmc-project.xyz/=
#/c/6009/" >https://gerrit.openbmc-project.xyz/#/c/6009/</a>&nbsp;(related =
to issue&nbsp;<a href=3D"https://github.com/openbmc/openbmc/issues/2149" >h=
ttps://github.com/openbmc/openbmc/issues/2149</a>), service file references=
 to {sbindir} and {bindir} are changing to "/usr/bin/env ". Additionally, w=
e're using the SyslogIdentifier parameter to ensure that all executables ha=
ve their output recorded in an identifiable format in the logs.&nbsp;Please=
 follow this example for new service files.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The purpose of this change is&nbsp;to enable patching fro=
m the /usr/local/bin and /usr/local/sbin paths - these directories are high=
er priority in the PATH than the typical executable directories /usr/bin an=
d /usr/sbin, so developers will be able to patch specific executables witho=
ut overwriting the files in those locations.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please let me know if you have any further questions.</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Michael Tritz</div></div><BR>
