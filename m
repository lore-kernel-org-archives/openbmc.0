Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkgyq5T2DzDwYj
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBM64WBK008039
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:56 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27g1v0nj14-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:06:56 -0500
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 22 Dec 2016 16:06:54 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 22 Dec 2016 16:06:51 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id BC8A82BB0045
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:50 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBM66odX49676506
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:50 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBM66oHp030213
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:50 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBM66oWg030210; Thu, 22 Dec 2016 17:06:50 +1100
Received: from camb691.ibm.com (unknown [9.81.194.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E4529A0114;
 Thu, 22 Dec 2016 17:06:49 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Subject: [PATCH v2 0/5] LPC/MBOX work
Date: Thu, 22 Dec 2016 17:06:05 +1100
X-Mailer: git-send-email 2.11.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122206-0004-0000-0000-000001CB5A45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122206-0005-0000-0000-0000095BD013
Message-Id: <20161222060610.29695-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-22_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612220102
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
X-List-Received-Date: Thu, 22 Dec 2016 06:07:00 -0000

Hi all,

Sending this v2 a little prematurely but it will be good to have some eyes on it.

I haven't been able to boot the host with this as there are quite a few caveats.
First of all hostboot expects the flash at a very specific place on the host LPC
bus per platform. This creates problems when a machine of a certain type has a
flash chip of a different size as to what it should have. This renders the UNMAP
ioctl() somewhat useless. We should be able to compensate for this in userspace,
which is good since I don't want any of these caveats worked around in the kernel.

I have had some troubles with regmap_write() but it is possible the bug has been
fixed. I will test in the coming days and confirm.

I have attempted to address all the review comments:
 - Use of regmap
 - Open counts to avoid opening by different processes
 - Style fixes
 - Move mbox to drivers/mailbox
 - Extra descriptions

Notable exception that I haven't gotten around to but will happily do once we
get to a working state is preventing mutiple threads from writing mbox registers
at once

Thanks,

Cyril 

Cyril Bur (5):
  ARM: dts: aspeed: Reserve BMC ram for host to BMC communication
  ARM: dts: aspeed: Put the lpc_ctrl under lpc_host node for regmap
  ARM: dts: aspeed: Move mbox under lpc_host node
  drivers/mailbox: Add aspeed ast2400/ast2500 mbox driver
  drivers/misc: Add aspeed ast2400/ast2500 lpc controlling driver

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |   7 +
 arch/arm/boot/dts/aspeed-g4.dtsi               |  36 +++
 drivers/mailbox/Kconfig                        |   9 +
 drivers/mailbox/Makefile                       |   3 +
 drivers/mailbox/aspeed-mbox.c                  | 354 +++++++++++++++++++++++++
 drivers/misc/Kconfig                           |   9 +
 drivers/misc/Makefile                          |   1 +
 drivers/misc/aspeed-lpc-ctrl.c                 | 292 ++++++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h           |  25 ++
 include/uapi/linux/aspeed-mbox.h               |  23 ++
 13 files changed, 777 insertions(+)
 create mode 100644 drivers/mailbox/aspeed-mbox.c
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h
 create mode 100644 include/uapi/linux/aspeed-mbox.h

-- 
2.11.0
