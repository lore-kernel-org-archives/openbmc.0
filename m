Return-Path: <ngorugan@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ngorugan@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437ps36vZjzDqSG
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 02:32:23 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wB3FTdsU000565
 for <openbmc@lists.ozlabs.org>; Mon, 3 Dec 2018 10:32:20 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2p56u7s9v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 10:32:20 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ngorugan@in.ibm.com>;
 Mon, 3 Dec 2018 15:32:19 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 3 Dec 2018 15:32:17 -0000
Received: from us1b3-mail128.a3dr.sjc03.isc4sb.com ([10.160.11.13])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018120315321690-733557 ;
 Mon, 3 Dec 2018 15:32:16 +0000 
Subject: Re: Utility to Sync BMC's UUID to U-Boot environment
In-Reply-To: <OF43E90413.B5F754D3-ON00258355.00221DAA-65258355.0022B453@notes.na.collabserv.com>
From: "Nagaraju Goruganti" <ngorugan@in.ibm.com>
To: "Milton Miller II" <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 3 Dec 2018 15:32:16 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF43E90413.B5F754D3-ON00258355.00221DAA-65258355.0022B453@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP17 November 02, 2018 at 16:08
X-KeepSent: 7F27D6C3:EF055CB1-00258358:0054EC38;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 13715
X-TNEFEvaluated: 1
x-cbid: 18120315-9695-0000-0000-000004E86DD8
X-IBM-SpamModules-Scores: BY=0.259316; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.022116
X-IBM-SpamModules-Versions: BY=3.00010165; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01126420; UDB=6.00584997; IPR=6.00906555; 
 BA=6.00006169; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024426; XFM=3.00000015;
 UTC=2018-12-03 15:32:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-12-03 09:44:28 - 6.00009296
x-cbparentid: 18120315-9696-0000-0000-00001D977F0C
Message-Id: <OF7F27D6C3.EF055CB1-ON00258358.0054EC38-00258358.00555A2B@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-03_09:, , signatures=0
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
X-List-Received-Date: Mon, 03 Dec 2018 15:32:24 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" ><div>Hi Milton,</=
div>
<div><br>Do you have any idea why we need to write UUID to U-boot environme=
nt ?</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Best Regards,<br>Nagaraju G</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Nagaraju Gorugant=
i" &lt;ngorugan@in.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+ng=
orugan=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.org<br=
>Cc:<br>Subject: Utility to Sync BMC's UUID to U-Boot environment<br>Date: =
Fri, Nov 30, 2018 11:49 AM<br>&nbsp;<br><span style=3D" font-size:11pt;font=
-family:sans-serif" >Hi All,</span><br><br><span style=3D" font-size:11pt;f=
ont-family:sans-serif" >We are planning to port UUID synching related code =
from current python script: <b>openbmc/skeleton/pyinventorymgr/sync=5Finven=
tory=5Fitems.py</b>to new bash script.</span><br><br><span style=3D" font-s=
ize:11pt;font-family:sans-serif" >The current py(invoked by systemd on the =
way to BMC ready state) is doing below given actions to sync BMC's UUID to =
U-Boot environment.</span><br><span style=3D" font-size:11pt;font-family:sa=
ns-serif" >1. Getting the UUID from inventory.</span><br><span style=3D" fo=
nt-size:11pt;font-family:sans-serif" >2. Getting the UUID from U-boot envir=
onment</span><br><span style=3D" font-size:11pt;font-family:sans-serif" >3.=
 If the both are differing, write the UUID form inventory to U-Boot environ=
ment.</span><br><span style=3D" font-size:11pt;font-family:sans-serif" >4. =
It also it has TODO task to reboot the BMC to make sure UUID from U-Boot en=
v to &nbsp;sync with /etc/machine-id.</span><br><br><span style=3D" font-si=
ze:11pt;font-family:sans-serif" >But this script is in broken state now: It=
 is not updating UUID in U-boot env by reading it from inventory.</span><br=
><br><span style=3D" font-size:11pt;font-family:sans-serif" >We have few th=
ings to understand here:</span><br><span style=3D" font-size:11pt;font-fami=
ly:sans-serif" >1. Is there a need to write UUID to U-Boot environment?</sp=
an><br><span style=3D" font-size:11pt;font-family:sans-serif" >2. Can machi=
ne-id be the source for UUID? or UUID is the source for machine-id?</span><=
br><span style=3D" font-size:11pt;font-family:sans-serif" >3. If UUID (from=
 inventory) is the source for machine-id, from where should the inventory g=
et UUID? (on openpower systems the UUID is fetched from BMC &nbsp;VPD, if p=
resent)</span><br><span style=3D" font-size:11pt;font-family:sans-serif" >4=
. If machine-id is the source to UUID, how machine-id is getting its value?=
</span><br><br><span style=3D" font-size:11pt;font-family:sans-serif" >We n=
eed an inputs from community members who are having better understand on th=
ese things.</span><br><br><span style=3D" font-size:11pt;font-family:sans-s=
erif" >Best Regards,</span><br><span style=3D" font-size:11pt;font-family:s=
ans-serif" >Nagaraju G</span></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
