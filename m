Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzRWF5pPvzDqH1
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0C0SrZS029117
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:47 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27wxnw99ws-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:30:47 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 12 Jan 2017 10:30:44 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 Jan 2017 10:30:41 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id BDE4D2CE8046
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:40 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0C0UfSh54722640
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:41 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0C0UdgA009494
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 11:30:40 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0C0Udm4009491; Thu, 12 Jan 2017 11:30:39 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EEE82A024F;
 Thu, 12 Jan 2017 11:30:38 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: [PATCH 0/4] ASpeed mailbox and LPC control drivers
Date: Thu, 12 Jan 2017 11:29:06 +1100
X-Mailer: git-send-email 2.11.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011200-0044-0000-0000-0000021BBEC8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011200-0045-0000-0000-00000656A464
Message-Id: <20170112002910.3650-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-11_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=96
 spamscore=96 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701120004
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
X-List-Received-Date: Thu, 12 Jan 2017 00:30:50 -0000

Hello,

I have written some drivers for the ASpeed AST2400/2500 chips. These
chips are designed to be used as BMCs and the core reason for these
drivers has been to introduce a communication channel between two
processors.

The mailbox registers are the channel through which the two processors
can communicate, it is worth noting here that the mailbox driver is
designed to be flexible enough do allow userspace to arbitrarily write
to one or all or a subset of the mailbox registers. This is important
as the ASpeed chip allows for enabling hardware interrupts based on
writes at a per data register level. It is possible that the other
processor will enable interrupts on one of the data registers, as
such, the ASpeed end of the protocol will need to be able to treat
that register specially.

The first intended use of a communication protocol between the ASpeed
and the other processor is so they can arbitrate on board flash chip
access. The goal is to have the ASpeed chip perform the reads and
writes to the flash and present to the other processor in an area of
its RAM across a shared bus. Currently the other processor has the
flash mapped directly on the shared bus. The LPC bus controlling
driver provides a way for the ASpeed userspace to control the mapping
across the LPC bus between the ASpeed and the other processor. The RAM
region that the LPC control driver will use should be specified in the
device tree.

Cyril Bur (4):
  Documentation: dt: mailbox: Add Aspeed ast2400/2500 bindings
  Documentation: dt: misc: Add Aspeed ast2400/2500 LPC Control bindings
  drivers/misc: Add ASpeed LPC control driver
  drivers/mailbox: Add ASpeed mailbox driver

 .../devicetree/bindings/mailbox/aspeed-mbox.txt    |  44 +++
 .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   |  78 +++++
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/aspeed-mbox.c                      | 334 +++++++++++++++++++++
 drivers/misc/Kconfig                               |   9 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/aspeed-lpc-ctrl.c                     | 269 +++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h               |  25 ++
 9 files changed, 771 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed-mbox.txt
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
 create mode 100644 drivers/mailbox/aspeed-mbox.c
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

-- 
2.11.0
