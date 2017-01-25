Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v80CR3nzFzDq5f
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 09:31:47 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0PMNWBn120481
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 17:31:44 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2872hrw1j8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 17:31:44 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 25 Jan 2017 15:31:43 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 25 Jan 2017 15:31:40 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8BBCD19D8026;
 Wed, 25 Jan 2017 15:30:55 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0PMVZs211206912; Wed, 25 Jan 2017 15:31:40 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31FDD78038;
 Wed, 25 Jan 2017 15:31:40 -0700 (MST)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.218])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 086FD78041;
 Wed, 25 Jan 2017 15:31:39 -0700 (MST)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: OpenBMC Image Management
Date: Wed, 25 Jan 2017 16:15:27 -0600
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3259)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17012522-0004-0000-0000-00001163E723
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006498; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000200; SDB=6.00812673; UDB=6.00396360; IPR=6.00590092; 
 BA=6.00005090; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014048; XFM=3.00000011;
 UTC=2017-01-25 22:31:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17012522-0005-0000-0000-00007C7C9049
Message-Id: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-25_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701250209
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
X-List-Received-Date: Wed, 25 Jan 2017 22:31:47 -0000

Hi,

Here is a first draft proposal for image management (code update) in =
OpenBMC for feedback.

General:
* Move to UBI volume management (on the BMC and PNOR chips), which =
provides dynamic partitioning and wear-leveling. In a limited flash =
space environment there might be the need to re-allocate partition space =
and resizing in a static partitioning implementation can be very =
painful.
* Use CRAMFS for read-only partitions, and UBIFS for read-write =
partitions.

PNOR:
* Implement a new mboxd based on Cyril=E2=80=99s (see Cyril=E2=80=99s =
email =E2=80=9CMailbox daemon=E2=80=9D) that handles dbus objects, =
generates a virtual PNOR for UBI content, etc.
* Move to memory-based access instead of the current LPC-to-AHD path.
* Allocate just enough space in the initial window for Hostboot=E2=80=99s =
TOC, HBB, and HBI partitions, grow as required.
* Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin =
into a designated directory (/usr/local/ for example).
* Tool to write from PNOR image to BMC format. Implement UBI initially =
but it could be extended to support different volume managements on =
other BMCs.

BMC:
*Save multiple firmware versions, starting with 2, to provide the =
ability to roll-back if needed. If single BMC chip system, save both =
versions there. If two BMC chip system, save other version in 2nd chip.
* Implement various levels of =E2=80=98persistency=E2=80=99, such as =
dev, factory, field. Dev persistency would allow for local patches =
(/usr/local/ for example) that can be cleared before shipping to =
customers. Factory mode could delete the location where user data such =
as network settings resides but preserves the mac address and uuid for =
example. Etc.

Thanks,

Adriana=
