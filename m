Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg19J5WbxzDqGk
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:48:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2ALY4sD006062
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:33 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 293p3b5mwr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 16:48:32 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Mar 2017 16:48:31 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Mar 2017 16:48:29 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2ALmTFO44630040; Fri, 10 Mar 2017 21:48:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D4F11204B;
 Fri, 10 Mar 2017 16:48:27 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 840A8112040;
 Fri, 10 Mar 2017 16:48:27 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 0/4] drivers: i2c: FSI-attached I2C master
 algorithm
Date: Fri, 10 Mar 2017 15:48:21 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17031021-0008-0000-0000-000001B78DCD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006759; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832829; UDB=6.00408758; IPR=6.00610416; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014600; XFM=3.00000013;
 UTC=2017-03-10 21:48:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031021-0009-0000-0000-000033B5C5FC
Message-Id: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 spamscore=1 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703100168
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
X-List-Received-Date: Fri, 10 Mar 2017 21:48:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds an I2C bus algorithm to drive the I2C master located on
POWER CPUs. The master is accessed over FSI bus from the service processor.

The driver is functional for some basic read/write ops. There are a couple of
details regarding the device tree and chardev entries that need working out.

Mainly, do we want a char device for each port? There are 15 ports off one P9
master, so that'll be a lot of /dev/i2c-<x> entries. One issue is that
i2c_add_adapter always names it's device i2c-%d, regardless of adapter name.
Furthermore, you can specify the number to label it with
i2c_add_numbered_adapter, but how to prevent collisions with regular i2c
devices?

The driver will currently set up one chardev for each master (each proc).
The port is then specified by hacking the addr field of i2c_msg. It works,
but not a clean solution.

FSI clocking details are not defined in the device tree, so FSI clock is
hardcoded for now.

Edward A. James (4):
  drivers: fsi: Add function to get FSI clock rate
  drivers: i2c: Add FSI-attached I2C master algorithm
  drivers: i2c: Add transfer implementation for FSI algorithm
  drivers: i2c: Add bus recovery for FSI algorithm

 drivers/Makefile             |   2 +-
 drivers/fsi/fsi-core.c       |   7 +
 drivers/i2c/busses/Kconfig   |  11 +
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-fsi.c | 608 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h          |   1 +
 6 files changed, 629 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-fsi.c

-- 
1.8.3.1
