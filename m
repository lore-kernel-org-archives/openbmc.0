Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6yPr0zpDzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 07:07:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3IL3a1I039475
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:21 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29wqpuq720-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:07:21 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 18 Apr 2017 15:07:20 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Apr 2017 15:07:17 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3IL7EYY13631752; Tue, 18 Apr 2017 14:07:16 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C04C604F;
 Tue, 18 Apr 2017 15:07:16 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 5A5C8C6047;
 Tue, 18 Apr 2017 15:07:16 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 0/3] drivers: fsi: sbefifo: Add in-kernel API
Date: Tue, 18 Apr 2017 16:07:11 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17041821-0004-0000-0000-000011FC63E9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849295; UDB=6.00419353; IPR=6.00627935; 
 BA=6.00005300; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015089; XFM=3.00000013;
 UTC=2017-04-18 21:07:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041821-0005-0000-0000-00007EBACB18
Message-Id: <1492549634-27369-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-18_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704180166
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
X-List-Received-Date: Tue, 18 Apr 2017 21:07:28 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patchset provides an in-kernel API for the SBEFIFO driver and the first
user, a driver to access the P9 OCC hardware. There are also some potential
devicetree bindings for the SBEFIFO and OCC devices.

The OCC provides a read/write interface, but only performs a single, atomic,
OCC "command and response" operation per write operation. The driver cannot
perform multiple writes in a row without first reading back to the user the
response generated for each command. I can't see a use case for doing multiple
commands without fetching the response.

Any feedback, particularly on how to improve the dt bindings or how to
inform the OCC client that the SBEFIFO device has gone away (via unbinding
FSI, or other means), would be helpful.

Edward A. James (3):
  drivers: fsi: sbefifo: Add in-kernel API
  drivers: fsi: sbefifo: Add OCC driver
  ARM: dts: aspeed: witherspoon: Add example sbefifo and occfifo devices

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  16 +
 drivers/fsi/Kconfig                              |  10 +
 drivers/fsi/Makefile                             |   1 +
 drivers/fsi/fsi-sbefifo.c                        | 173 +++++-
 drivers/fsi/occfifo.c                            | 649 +++++++++++++++++++++++
 include/linux/fsi-sbefifo.h                      |  41 ++
 6 files changed, 861 insertions(+), 29 deletions(-)
 create mode 100644 drivers/fsi/occfifo.c
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1
