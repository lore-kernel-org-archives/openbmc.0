Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Ctf70hvtzDqGT
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 08:37:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x24LZNoK073133
 for <openbmc@lists.ozlabs.org>; Mon, 4 Mar 2019 16:37:09 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r1c2gg264-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 16:37:09 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Mon, 4 Mar 2019 21:37:08 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Mar 2019 21:37:04 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x24Lb3GN9568474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Mar 2019 21:37:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 821EF136053;
 Mon,  4 Mar 2019 21:37:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB97136051;
 Mon,  4 Mar 2019 21:37:02 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 Mar 2019 21:37:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jk@ozlabs.org, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 0/6] drivers/misc: Add XDMA engine driver
Date: Mon,  4 Mar 2019 15:36:54 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19030421-0004-0000-0000-000014E9E80E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010705; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01169658; UDB=6.00611233; IPR=6.00950286; 
 MB=3.00025831; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-04 21:37:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030421-0005-0000-0000-00008ACB430F
Message-Id: <1551735420-16202-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-04_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=662 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903040151
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
X-List-Received-Date: Mon, 04 Mar 2019 21:37:19 -0000

The XDMA engine embedded in the AST2500 SOC performs PCI DMA operations
between the SOC (acting as a BMC) and a host processor in a server.

This series adds a driver to control the XDMA engine in order to easily
perform DMA operations to and from the host processor.

Eddie James (6):
  dt-bindings: misc: Add Aspeed XDMA engine binding documentation
  drivers/misc: Add Aspeed XDMA engine driver
  drivers/misc: xdma: Add user interface
  drivers/misc: xdma: Add PCI device configuration sysfs
  drivers/misc: xdma: Add debugfs entries
  ARM: dts: aspeed: Add XDMA engine

 .../devicetree/bindings/misc/aspeed,xdma.txt       |  23 +
 MAINTAINERS                                        |   9 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   8 +
 drivers/misc/Kconfig                               |   8 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/aspeed-xdma.c                         | 924 +++++++++++++++++++++
 include/uapi/linux/aspeed-xdma.h                   |  26 +
 7 files changed, 999 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed,xdma.txt
 create mode 100644 drivers/misc/aspeed-xdma.c
 create mode 100644 include/uapi/linux/aspeed-xdma.h

-- 
1.8.3.1
