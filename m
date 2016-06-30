Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG335YMYzDqn7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:15 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANbRR014686
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:14 -0400
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23v6yecu0q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:14 -0400
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 15:58:10 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 15:58:09 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id B15073940064
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:08 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UAS8ww62521396
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:08 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UAS4GL015824
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 15:58:07 +0530
Received: from gwshan ([9.192.205.20])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UARxvT015549; Thu, 30 Jun 2016 15:58:00 +0530
Received: by gwshan (Postfix, from userid 1000)
 id 4976E943470; Thu, 30 Jun 2016 20:27:53 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 00/10] NCSI Support
Date: Thu, 30 Jun 2016 20:27:41 +1000
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0052-0000-0000-0000028C585F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0053-0000-0000-00000D2902D8
Message-Id: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300099
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:16 -0000

This series rebases on David's linux-net git repo ("master" branch). It's
to support NCSI stack on net/farady/ftgmac100.c

The following figure gives an example about how NCSI is deployed: The NCSI is
specified by DSP0222, which can be downloaded from the following link here
(http://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf).

   * The NC-SI (aka NCSI) is defined as the interface between a (Base) Management
     Controller (BMC) and one or multiple Network Controlers (NC) on host side.
     The interface is responsible for providing external network connectivity
     for BMC.
   * Each BMC can connect to multiple packages, up to 8. Each package can have
     multiple channels, up to 32. Every package and channel are identified by
     3-bits and 5-bits in NCSI packet. At one moment, one channel is active to
     provide service.
   * NCSI packet, encapsulated in ethernet frame, has 0x88F8 in the protocol
     field. The destination MAC address should be 0xFF's while the source MAC
     address can be arbitrary one.
   * NCSI packets are classified to command, response, AEN (Asynchronous Event
     Notification). Commands are sent from BMC to host for configuration and
     information retrival. Responses, corresponding to commands, are sent from
     host to BMC for confirmation and requested information. One command should
     have one and only one response. AEN is sent from host to BMC for notification
     (e.g. link down on active channel) so that BMC can take appropriate action.

   +------------------+        +----------------------------------------------+
   |                  |        |                     Host                     |
   |        BMC       |        |                                              |
   |                  |        | +-------------------+  +-------------------+ |
   |    +---------+   |        | |     Package-A     |  |     Package-B     | |
   |    |         |   |        | +---------+---------+  +-------------------+ |
   |    |   NIC   |   |        | | Channel | Channel |  | Channel | Channel | |
   +----+----+----+---+        +-+---------+---------+--+---------+---------+-+
             |                             |                      |
             |                             |                      |
             +-----------------------------+----------------------+

The design for the patchset is highlighted as below:

   * The NCSI interface is abstracted with "struct ncsi_dev". It's registered
     when net_device is created, started to work by calling ncsi_start_dev()
     when net_device is opened (ndo_open()). For the first time, NCSI packets
     are sent and received to/from the far end (host in above figure) to probe
     available NCSI packages and channels. After that, one channel is chosen as
     active one to provide service.
   * The NCSI stack is driven by workqueue and state machine internally.
   * AEN (Asychronous Event Notification) might be received from the far end
     (host). The currently active NCSI channel fails over to another available
     one if possible. Otherwise, the NCSI channel is out of service.
   * NCSI stack should be configurable through netlink or another mechanism,
     but it's not implemented in this patchset. It's something TBD.
   * The first NIC driver that is aware of NCSI: drivers/net/ethernet/faraday/ftgmac100.c

Gavin Shan (10):
  net/ncsi: Resource management
  net/ncsi: NCSI command packet handler
  net/ncsi: NCSI response packet handler
  net/ncsi: Package and channel management
  net/ncsi: NCSI AEN packet handler
  net/farady: Helper functions to create or destroy MDIO interface
  net/farady: Read MAC address from chip
  net/farady: Support NCSI mode
  net/farady: Match driver according to compatible property
  net/farady: Mask PHY interrupt with NCSI mode

 drivers/net/ethernet/faraday/ftgmac100.c |  266 +++++--
 include/uapi/linux/if_ether.h            |    1 +
 net/Kconfig                              |    1 +
 net/Makefile                             |    1 +
 net/ncsi/Kconfig                         |   10 +
 net/ncsi/Makefile                        |    4 +
 net/ncsi/internal.h                      |  308 ++++++++
 net/ncsi/ncsi-aen.c                      |  190 +++++
 net/ncsi/ncsi-cmd.c                      |  372 ++++++++++
 net/ncsi/ncsi-manage.c                   |  910 +++++++++++++++++++++++
 net/ncsi/ncsi-pkt.h                      |  395 ++++++++++
 net/ncsi/ncsi-rsp.c                      | 1169 ++++++++++++++++++++++++++++++
 12 files changed, 3563 insertions(+), 64 deletions(-)
 create mode 100644 net/ncsi/Kconfig
 create mode 100644 net/ncsi/Makefile
 create mode 100644 net/ncsi/internal.h
 create mode 100644 net/ncsi/ncsi-aen.c
 create mode 100644 net/ncsi/ncsi-cmd.c
 create mode 100644 net/ncsi/ncsi-manage.c
 create mode 100644 net/ncsi/ncsi-pkt.h
 create mode 100644 net/ncsi/ncsi-rsp.c

-- 
2.1.0
