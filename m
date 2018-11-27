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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43413P3vNgzDqjV
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 21:58:06 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wARArowo045874
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 05:58:04 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2p13g5kawu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 05:58:03 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ngorugan@in.ibm.com>;
 Tue, 27 Nov 2018 10:58:03 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 27 Nov 2018 10:58:01 -0000
Received: from us1a3-mail129.a3.dal06.isc4sb.com ([10.146.45.217])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2018112710580103-398232 ;
 Tue, 27 Nov 2018 10:58:01 +0000 
To: openbmc@lists.ozlabs.org
Subject: Proposal to Sync BMC's MAC Address to U-Boot environment
From: "Nagaraju Goruganti" <ngorugan@in.ibm.com>
Date: Tue, 27 Nov 2018 16:28:01 +0530
MIME-Version: 1.0
X-KeepSent: 9015C576:BDD4A20B-00258352:003BDFFF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF252 August 10, 2018
X-LLNOutbound: False
X-Disclaimed: 49963
X-TNEFEvaluated: 1
x-cbid: 18112710-5101-0000-0000-00000D510E71
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.017076
X-IBM-SpamModules-Versions: BY=3.00010129; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01123455; UDB=6.00583214; IPR=6.00903585; 
 BA=6.00006162; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024350; XFM=3.00000015;
 UTC=2018-11-27 10:58:02
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-11-27 08:12:23 - 6.00009272
x-cbparentid: 18112710-5102-0000-0000-00004ACC0ED2
Message-Id: <OF9015C576.BDD4A20B-ON00258352.003BDFFF-65258352.003C4190@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 003C412A65258352_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-27_09:, , signatures=0
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
X-List-Received-Date: Tue, 27 Nov 2018 10:58:10 -0000


--=_alternative 003C412A65258352_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

HI All,

As we want to get rid of python, making this proposal to sync BMC's MAC=20
Address to U-Boot environment(assuming this is a common requirement across =

OpenBMC based systems).

Proposal:

Platform specific code :

a) Get MAC Address from platform specific NV storage (BMC VPD on OpenPOWER =

systems) into an inventory object. It is being done by=20
openpower-vpd-parser on the openpower systems .

Common code:

b) A script (invoked by systemd on the way to BMC ready state) fetches BMC =

MAC Address from (platform specific) inventory object. If this MAC Address =

and the one in u-boot environment are different (or if the u-boot one is=20
empty), then the script writes the inventory MAC Address to u-boot using=20
fw=5Fsetenv.

c) The script can reside in a phosphor layer.

Existing Python script:

The existing python=20
script(openbmc/skeleton/pyinventorymgr/sync=5Finventory=5Fitems.py) does th=
e=20
same thing.


We need a opinion from the community members on this proposal.

Best Regards,

Nagaraju G


--=_alternative 003C412A65258352_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:10pt;font-family:sans-serif">HI All,</span><br><b=
r><span style=3D" font-size:10pt;font-family:sans-serif">As we want to
get rid of python, making this proposal to sync BMC's MAC Address to U-Boot
environment(assuming this is a common requirement across OpenBMC based
systems).</span><br><br><span style=3D" font-size:10pt;font-family:sans-ser=
if">Proposal:</span><br><br><span style=3D" font-size:10pt;font-family:sans=
-serif">Platform specific
code :</span><br><br><span style=3D" font-size:10pt;font-family:sans-serif"=
>a) Get MAC Address
from platform specific NV storage (BMC VPD on OpenPOWER systems) into an
inventory object. It is being done by openpower-vpd-parser on the openpower
systems .</span><br><br><span style=3D" font-size:10pt;font-family:sans-ser=
if">Common code:</span><br><br><span style=3D" font-size:10pt;font-family:s=
ans-serif">b) A script (invoked
by systemd on the way to BMC ready state) fetches BMC MAC Address from
(platform specific) inventory object. If this MAC Address and the one in
u-boot environment are different (or if the u-boot one is empty), then
the script writes the inventory MAC Address to u-boot using fw=5Fsetenv.</s=
pan><br><br><span style=3D" font-size:10pt;font-family:sans-serif">c) The s=
cript
can reside in a phosphor layer.</span><br><br><span style=3D" font-size:10p=
t;font-family:sans-serif">Existing Python
script:</span><br><br><span style=3D" font-size:10pt;font-family:sans-serif=
">The existing python
script(openbmc/skeleton/pyinventorymgr/sync=5Finventory=5Fitems.py) does the
same thing.</span><br><br><br><span style=3D" font-size:10pt;font-family:sa=
ns-serif">We need a opinion
from the community members on this proposal.</span><br><br><span style=3D" =
font-size:10pt;font-family:sans-serif">Best Regards,</span><br><br><span st=
yle=3D" font-size:10pt;font-family:sans-serif">Nagaraju G</span><BR>
--=_alternative 003C412A65258352_=--
