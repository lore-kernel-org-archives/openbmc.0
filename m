Return-Path: <devenrao@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wC3VK2VBszDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 23:10:33 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3PD9U03019933
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 09:10:24 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a206m5shb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 09:10:24 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Tue, 25 Apr 2017 23:10:13 +1000
Received: from d23relay06.au.ibm.com (202.81.31.225)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 25 Apr 2017 23:10:11 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3PDA2Iq6685084
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 23:10:10 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v3PD9X0s028650
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 23:09:33 +1000
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v3PD9VFW028130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 23:09:33 +1000
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Tue, 25 Apr 2017 07:09:28 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 25 Apr 2017 07:09:26 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Tue, 25 Apr 2017 13:09:25 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 25 Apr 2017 13:09:22 -0000
Received: from us1a3-mail121.a3.dal06.isc4sb.com ([10.146.45.16])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2017042513092168-158355 ;
 Tue, 25 Apr 2017 13:09:21 +0000 
In-Reply-To: 
Subject: phosphor-logging: Create a friendlier "create and commit" error
 interface #1155
From: "Devender Rao" <devenrao@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 25 Apr 2017 13:09:21 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build
 SCN_20170403T2153_FP6.1 April 19, 2017 at 09:53
X-LLNOutbound: False
X-Disclaimed: 3299
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17042513-0004-0000-0000-000001FA8D60
X-IBM-SpamModules-Scores: BY=0.113018; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=; MB=0.003270
X-IBM-SpamModules-Versions: BY=3.00006971; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00852252; UDB=6.00421248; IPR=6.00631090; 
 BA=6.00005312; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015168; XFM=3.00000013;
 UTC=2017-04-25 13:09:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-04-25 10:28:02 - 6.00006648
x-cbparentid: 17042513-5102-0000-0000-000039B8D1B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFC9064FBF.2BD00217-ON0025810D.0034A550-0025810D.004844BA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704250239
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
X-List-Received-Date: Tue, 25 Apr 2017 13:10:33 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div class=3D"socmaildefaultfont" d=
ir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10.5=
pt" ><div dir=3D"ltr" >Hi,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Existing mechanism to create an error (Creation of a jour=
nal log entry) and commit( Creation of a d-bus object representing the erro=
r,&nbsp; to indicate the error has been acknowledged or acted upon by the r=
ight recipient ) is not user friendly.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >In the existing mechanism the error log creation method t=
hrows back the error error after creating the journal entry which the calle=
r need to catch&nbsp; and then commit the errror.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Introduced a new method(report) which in one shot will cr=
eate and commit the error.</div>
<div>&nbsp;</div>
<div>Link to the report api</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-logging/co=
mmit/d41e995d71b14f2c552b4da58eedbe1030cbf002" >https://github.com/openbmc/=
phosphor-logging/commit/d41e995d71b14f2c552b4da58eedbe1030cbf002</a></div>
<div dir=3D"ltr" ><div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Link to the usage of the report API</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-hwmon/comm=
it/05711eb061d7f8a7d3b11a4d7d09d60a6afc2583" >https://github.com/openbmc/ph=
osphor-hwmon/commit/05711eb061d7f8a7d3b11a4d7d09d60a6afc2583</a></div></div>
<div dir=3D"ltr" >Regards</div>
<div dir=3D"ltr" >Devender</div></div></div><BR>
