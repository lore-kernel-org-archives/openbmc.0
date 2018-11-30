Return-Path: <ngorugan@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ngorugan@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 435kjw0NN7zDrR2
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 17:18:59 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAU6DkuO131899
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 01:18:58 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p2ydqs1wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 01:18:58 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ngorugan@in.ibm.com>;
 Fri, 30 Nov 2018 06:18:57 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Nov 2018 06:18:54 -0000
Received: from us1a3-mail129.a3.dal06.isc4sb.com ([10.146.45.217])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2018113006185450-217540 ;
 Fri, 30 Nov 2018 06:18:54 +0000 
To: openbmc@lists.ozlabs.org
Subject: Utility to Sync BMC's UUID to U-Boot environment
From: "Nagaraju Goruganti" <ngorugan@in.ibm.com>
Date: Fri, 30 Nov 2018 11:48:53 +0530
MIME-Version: 1.0
X-KeepSent: 43E90413:B5F754D3-00258355:00221DAA;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF252 August 10, 2018
X-LLNOutbound: False
X-Disclaimed: 35903
X-TNEFEvaluated: 1
x-cbid: 18113006-7581-0000-0000-00000A104953
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.025129
X-IBM-SpamModules-Versions: BY=3.00010146; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01124803; UDB=6.00584022; IPR=6.00904930; 
 BA=6.00006167; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024393; XFM=3.00000015;
 UTC=2018-11-30 06:18:56
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-11-30 02:30:22 - 6.00009283
x-cbparentid: 18113006-7582-0000-0000-00006DA6AB15
Message-Id: <OF43E90413.B5F754D3-ON00258355.00221DAA-65258355.0022B453@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0022B2DB65258355_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-30_03:, , signatures=0
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
X-List-Received-Date: Fri, 30 Nov 2018 06:19:00 -0000


--=_alternative 0022B2DB65258355_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi All,

We are planning to port UUID synching related code from current python=20
script: openbmc/skeleton/pyinventorymgr/sync=5Finventory=5Fitems.py to new =

bash script.

The current py(invoked by systemd on the way to BMC ready state) is doing=20
below given actions to sync BMC's UUID to U-Boot environment.
1. Getting the UUID from inventory.
2. Getting the UUID from U-boot environment
3. If the both are differing, write the UUID form inventory to U-Boot=20
environment.
4. It also it has TODO task to reboot the BMC to make sure UUID from=20
U-Boot env to  sync with /etc/machine-id.

But this script is in broken state now: It is not updating UUID in U-boot=20
env by reading it from inventory.

We have few things to understand here:
1. Is there a need to write UUID to U-Boot environment?
2. Can machine-id be the source for UUID? or UUID is the source for=20
machine-id?
3. If UUID (from inventory) is the source for machine-id, from where=20
should the inventory get UUID? (on openpower systems the UUID is fetched=20
from BMC  VPD, if present)
4. If machine-id is the source to UUID, how machine-id is getting its=20
value?

We need an inputs from community members who are having better understand=20
on these things.

Best Regards,
Nagaraju G


--=_alternative 0022B2DB65258355_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:11pt;font-family:sans-serif">Hi All,</span><br><b=
r><span style=3D" font-size:11pt;font-family:sans-serif">We are planning
to port UUID synching related code from current python script: <b>openbmc/s=
keleton/pyinventorymgr/sync=5Finventory=5Fitems.py</b>to new bash script.</=
span><br><br><span style=3D" font-size:11pt;font-family:sans-serif">The cur=
rent py(invoked
by systemd on the way to BMC ready state) is doing below given actions
to sync BMC's UUID to U-Boot environment.</span><br><span style=3D" font-si=
ze:11pt;font-family:sans-serif">1. Getting the
UUID from inventory.</span><br><span style=3D" font-size:11pt;font-family:s=
ans-serif">2. Getting the
UUID from U-boot environment</span><br><span style=3D" font-size:11pt;font-=
family:sans-serif">3. If the both
are differing, write the UUID form inventory to U-Boot environment.</span><=
br><span style=3D" font-size:11pt;font-family:sans-serif">4. It also it
has TODO task to reboot the BMC to make sure UUID from U-Boot env to &nbsp;=
sync
with /etc/machine-id.</span><br><br><span style=3D" font-size:11pt;font-fam=
ily:sans-serif">But this script
is in broken state now: It is not updating UUID in U-boot env by reading
it from inventory.</span><br><br><span style=3D" font-size:11pt;font-family=
:sans-serif">We have few things
to understand here:</span><br><span style=3D" font-size:11pt;font-family:sa=
ns-serif">1. Is there a
need to write UUID to U-Boot environment?</span><br><span style=3D" font-si=
ze:11pt;font-family:sans-serif">2. Can machine-id
be the source for UUID? or UUID is the source for machine-id?</span><br><sp=
an style=3D" font-size:11pt;font-family:sans-serif">3. If UUID (from
inventory) is the source for machine-id, from where should the inventory
get UUID? (on openpower systems the UUID is fetched from BMC &nbsp;VPD,
if present)</span><br><span style=3D" font-size:11pt;font-family:sans-serif=
">4. If machine-id
is the source to UUID, how machine-id is getting its value?</span><br><br><=
span style=3D" font-size:11pt;font-family:sans-serif">We need an inputs
from community members who are having better understand on these things.</s=
pan><br><br><span style=3D" font-size:11pt;font-family:sans-serif">Best Reg=
ards,</span><br><span style=3D" font-size:11pt;font-family:sans-serif">Naga=
raju G</span><BR>
--=_alternative 0022B2DB65258355_=--
