Return-Path: <ratagupt@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGRw60nN3zDrK8
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 02:41:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6OGcalY086986
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 12:41:22 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bwkyx9uv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 12:41:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 24 Jul 2017 16:41:21 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 24 Jul 2017 16:41:20 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017072416411977-709253 ;
 Mon, 24 Jul 2017 16:41:19 +0000 
In-Reply-To: 
Subject: VLAN support on OpenBMC
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: "Shawn Gavin" <shawn_gavin@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 24 Jul 2017 16:41:19 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14893-1220 | IBM Domino Build
 SCN17178_20170627T0038_FP6.2 July 11, 2017 at 09:53
X-LLNOutbound: False
X-Disclaimed: 61727
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17072416-0327-0000-0000-00000282BF50
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.423878;
 ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00007418; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00892271; UDB=6.00445961; IPR=6.00672435; 
 BA=6.00005489; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016351; XFM=3.00000015;
 UTC=2017-07-24 16:41:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-07-24 13:00:30 - 6.00007072
x-cbparentid: 17072416-0328-0000-0000-000015DB6AF5
Message-Id: <OF84667D4E.6E526AD9-ON00258167.005AB6A0-00258167.005BACA5@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-24_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707240255
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
X-List-Received-Date: Mon, 24 Jul 2017 16:41:26 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>Hi Gavin,</d=
iv>
<div>&nbsp;</div>
<div>OpenBMC has requirement to support the VLAN,After doing the necessary =
VLAN configurations we observed that the openbmc/ncsi chip is not sending t=
he tagged packet out.</div>
<div>&nbsp;</div>
<div>On the other side,if I ping the openbmc machine from some other linux =
machine<br>then tagged packet doesn't reach to openbmc machine.</div>
<div>&nbsp;</div>
<div>In order to simplify the testing setup,We made a direct connection wit=
h some linux machine to openbmc.</div>
<div>&nbsp;</div>
<div>Scenario 1: Ping test from test/linux machine to the openbmc machine.<=
br>=3D=3D=3D=3D=3D=3D=3D=3D<br>Observation:- We captured the packet on the =
test machine which shows that packet<br>were going out from the test machin=
e and it was having 8021.q tag<br>but it was not reaching to openbmc machin=
e.</div>
<div>&nbsp;</div>
<div>Scenario 2: Ping test from openbmc machine to test/linux machine<br>=
=3D=3D=3D=3D=3D=3D=3D=3D<br>Observation:- Captured packet shows that packet=
 were going out<br>from the openbmc machine and it was having 8021.q tag bu=
t it was<br>not reaching to test machine.</div>
<div>&nbsp;</div>
<div>Note:- We made sure that packet were going out from the VLAN interface=
.</div>
<div>&nbsp;</div>
<div>Is it related to the NCSI driver? Do we have NCSI driver support on op=
enbmc to create the<br>VLAN.</div>
<div>&nbsp;</div>
<div>Thanks &amp; Regards<br>Ratan Gupta</div></div></div><BR>
