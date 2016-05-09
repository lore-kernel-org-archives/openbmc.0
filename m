Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r34z92yFjzDq5v
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:21 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Mon, 9 May 2016 11:48:19 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 11:48:18 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 5BFD13578052
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 11:48:17 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u491m9AJ53411852
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:48:17 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u491ljmi020883
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 11:47:45 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u491lihL020149; Mon, 9 May 2016 11:47:44 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 5AA03A023F;
 Mon,  9 May 2016 11:47:20 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 53697E3A5A;
 Mon,  9 May 2016 11:47:20 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 486E0942B91; Mon,  9 May 2016 11:47:20 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH 0/8] NSCI Improvement
Date: Mon,  9 May 2016 11:47:11 +1000
Message-Id: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050901-0017-0000-0000-000004805895
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2016 01:48:21 -0000

This series bases on branch dev-4.4. Couple of things are improved as below:

   * Remove netlink stuff as nobody starts to use it. Lets focus on the core
     for now.
   * The available packages and channels are enumerated for once when user
     brings up the network interface for the first time. Afterwords, less
     time (3 to 4 seconds) are reduced to bring up the interface.
   * Explicitly enable AEN that is disabled by default.
   * The LSC (Link Status Change) AEN handler helps switching active channel
     properly after the packet can be received without problem. In order to
     listen for ingress AEN packet, the MAC has to be ready for reception
     after the interface is brought up.

This series is to fix the bug: https://github.com/openbmc/linux/issues/61
With this series applied (based on dev-4.4), it should fix the issue. Note
that I had the test on palm4-bmc.

   * From uboot, download the kernel image;
   * Unplug the ethernet cable;
   * From uboot, boot the kernel image;
   * Configure the ethernet interface when the kernel boots up completely.
     The NCSI interface should be down;
   * Plug the cable, the NCSI interface is up automatically. The interface
     is pingable from external. 

Gavin Shan (8):
  net/ncsi: Remove netlink support
  net/ncsi: Add NCSI_DEV_PRIV_FLAG_POPULATED
  net/ncsi: Enumerate NCSI channels in advance
  net/ncsi: Remove ncsi_stop_dev()
  net/ncsi: Enable AEN on active channel
  net/ncsi: Improvement for ncsi_dev_suspend()
  net/farady: Keep MAC always active for NCSI packets
  net/ncsi: LSC AEN handler improvement

 drivers/net/ethernet/faraday/ftgmac100.c |   21 +-
 include/net/ncsi.h                       |   10 +-
 include/uapi/linux/netlink.h             |    1 -
 net/ncsi/Makefile                        |    2 +-
 net/ncsi/internal.h                      |   36 +-
 net/ncsi/ncsi-aen.c                      |    6 +-
 net/ncsi/ncsi-cmd.c                      |    8 -
 net/ncsi/ncsi-manage.c                   |  226 ++++---
 net/ncsi/ncsi-netlink.c                  | 1042 ------------------------------
 net/ncsi/ncsi-rsp.c                      |    7 +-
 net/ncsi/ncsi.c                          |   49 --
 11 files changed, 134 insertions(+), 1274 deletions(-)
 delete mode 100644 net/ncsi/ncsi-netlink.c
 delete mode 100644 net/ncsi/ncsi.c

-- 
2.1.0
