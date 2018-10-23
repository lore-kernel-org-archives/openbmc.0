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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42fMGJ0Q4zzDrpw
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 16:22:31 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9N5JEhE082858
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 01:22:29 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2n9ujw3qfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 01:22:29 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Tue, 23 Oct 2018 05:22:28 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 23 Oct 2018 05:22:26 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018102305222601-87179 ;
 Tue, 23 Oct 2018 05:22:26 +0000 
In-Reply-To: 
Subject: REST  / curl command to know which user currently logged in
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 23 Oct 2018 05:22:25 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP7 September 27, 2018 at 13:56
X-KeepSent: 515C5E8D:9972A4A3-0025832F:001D45F2;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 42727
X-TNEFEvaluated: 1
x-cbid: 18102305-7845-0000-0000-00000565832B
X-IBM-SpamModules-Scores: BY=0.000169; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.413459; ST=0; TS=0; UL=0; ISC=; MB=0.000018
X-IBM-SpamModules-Versions: BY=3.00009920; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01106663; UDB=6.00573109; IPR=6.00886747; 
 BA=6.00006127; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00023865; XFM=3.00000015;
 UTC=2018-10-23 05:22:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-10-23 00:20:40 - 6.00009127
x-cbparentid: 18102305-7846-0000-0000-00004821AA2A
Message-Id: <OF515C5E8D.9972A4A3-ON0025832F.001D45F2-0025832F.001D84D6@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-23_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2018 05:22:32 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hi All,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Is there a way to find out using REST / curl command to k=
now which user currently logged in.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >If multiple login happens (say 2 user logged in root and =
another LDAP user),</div>
<div dir=3D"ltr" >I am seeing the last login is the one taking the control.=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >And also one logout it logs out both the users.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >It will be helpful if we have command to find out which u=
ser currently logged in via curl / REST.</div>
<div dir=3D"ltr" >If anyone knows / other method to find out, pls let know.=
</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thank you in advance folks.</div></div><BR>
