Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyR4m2q4DzDqK5
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:52 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0A943wN055000
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:50 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27vvbxrtfd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:50 -0500
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 10 Jan 2017 19:07:47 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 Jan 2017 19:07:45 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 636072BB0057
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:45 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0A97kOO56361050
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:46 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0A97jtJ018946
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:45 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0A97jcb018930
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:45 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E2F54A0222
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:44 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/5] LPC/MBOX work
Date: Tue, 10 Jan 2017 20:06:35 +1100
X-Mailer: git-send-email 2.11.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011009-0052-0000-0000-000002081408
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011009-0053-0000-0000-00000792E053
Message-Id: <20170110090640.12608-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701100129
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
X-List-Received-Date: Tue, 10 Jan 2017 09:07:52 -0000

I thought I would put it one final time on here mostly because
patch 5/5, the mbox driver, got quite a rework today thanks for the
review Ben!

Notable differences is that I've completely ditched the ioctl() in
favour of arbitrary reads and writes. This gives userspace the
ability to touch only one reg which was the aim of the ioctl() anyway.
The userspace complexity is similar, or perhaps a little more simple,
no sacrifice there.

In the process of having the kernel allow access of any sized
read/write to all 16 of the data regs I realise that some of the
intended protocol had snuck in, or rather hadn't been completed
removed, that got addressed too.

Also added a mutex to avoid multiple writers.

Thanks,

Cyril

Cyril Bur (5):
  Documentation: dt: mailbox: Add Aspeed ast2400/2500 bindings
  Documentation: dt: misc: Add Aspeed ast2400/2500 LPC Control bindings
  ARM: dts: aspeed: Add mailbox and LPC Control nodes
  drivers/misc: Add aspeed ast2400/ast2500 lpc controlling driver
  drivers/mailbox: Add aspeed ast2400/ast2500 mbox driver

 .../devicetree/bindings/mailbox/aspeed-mbox.txt    |  44 +++
 .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   |  78 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |   6 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   7 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  38 +++
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   3 +
 drivers/mailbox/aspeed-mbox.c                      | 365 +++++++++++++++++++++
 drivers/misc/Kconfig                               |   9 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/aspeed-lpc-ctrl.c                     | 282 ++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h               |  25 ++
 14 files changed, 879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
 create mode 100644 drivers/mailbox/aspeed-mbox.c
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

-- 
2.11.0
