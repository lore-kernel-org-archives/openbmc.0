Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZh432GwKzDw7k
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:47 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB95ejm8003626
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 00:43:43 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0a-001b2d01.pphosted.com with ESMTP id 277me78wff-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Dec 2016 00:43:43 -0500
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Fri, 9 Dec 2016 15:43:40 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 9 Dec 2016 15:43:37 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id EC7F22BB0059
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB95haFv17432742
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uB95haHI032235
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uB95haUB032230
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 73B98A0240
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/3] LPC/MBOX work
Date: Fri,  9 Dec 2016 16:43:20 +1100
X-Mailer: git-send-email 2.10.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120905-0004-0000-0000-000001C543A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120905-0005-0000-0000-00000946089D
Message-Id: <20161209054323.7320-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-09_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612090079
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
X-List-Received-Date: Fri, 09 Dec 2016 05:43:47 -0000

Hello all,

I sent an email a while ago about my work to be able for the host to
be able to access to contents of the pnor without nessesarily being
able to modify it.

This involves a protocol for requests through the mbox regsters on the
BMC and moving the HOST<->BMC LPC bus mapping to a region of BMC RAM.

These are the kernel patches required to do this. I am going to do the
changes for the dts for all platforms but I have some questions as to
how much RAM these platforms truely have. You'll notice I bumped the
palmetto from 256 to 512, this was in response to my palmetto having
512 megs. Part of the reason for this is that while I'm at it, I may
as well reserve off the framebuffer memory (which there is work to
perhaps use as well), the location of which depends on how much ram
the BMC has. I'm thinking everything is actually 512, if that is
accurate, I'll add those changes to a v2.

Cedric (or anyone really): Do you know of a way the lpc-ctrl driver
could query the MTD subsystem for the size of the PNOR? There is
currently a hack in the UNMAP ioctl() which can't hang around.

I'm not sure driver/misc is the place for these, thoughts?

Thanks,

Cyril

Cyril Bur (3):
  ARM: dts: aspeed: Update palmetto device tree
  drivers/misc: Add aspeed mbox driver
  drivers/misc: Add aspeed lpc controlling driver

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  25 +-
 arch/arm/boot/dts/aspeed-g4.dtsi              |   6 +
 drivers/misc/Kconfig                          |  14 ++
 drivers/misc/Makefile                         |   2 +
 drivers/misc/lpc-ctrl.c                       | 251 ++++++++++++++++++++
 drivers/misc/mbox-host.c                      | 326 ++++++++++++++++++++++++++
 include/uapi/linux/lpc-ctrl.h                 |  25 ++
 include/uapi/linux/mbox-host.h                |  18 ++
 8 files changed, 666 insertions(+), 1 deletion(-)
 create mode 100644 drivers/misc/lpc-ctrl.c
 create mode 100644 drivers/misc/mbox-host.c
 create mode 100644 include/uapi/linux/lpc-ctrl.h
 create mode 100644 include/uapi/linux/mbox-host.h

-- 
2.10.2
