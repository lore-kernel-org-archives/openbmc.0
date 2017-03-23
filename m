Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0Sw1f5hzDq93
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:44:47 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhqMD090423
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:45 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29c4njxsra-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:45 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:44:44 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:41 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLifIp11534818; Thu, 23 Mar 2017 14:44:41 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 683CE78043;
 Thu, 23 Mar 2017 15:44:41 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 2656178037;
 Thu, 23 Mar 2017 15:44:41 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 0/7] drivers: i2c: FSI-attached I2C master
 algorithm
Date: Thu, 23 Mar 2017 16:44:32 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17032321-0020-0000-0000-00000BA1482B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006836; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837963; UDB=6.00412008; IPR=6.00615725; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:44:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0021-0000-0000-00005B1AE552
Message-Id: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=7
 spamscore=7 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:44:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds an I2C bus algorithm to drive the I2C master located on
POWER CPUs. The master is accessed over FSI bus from the service processor.

The driver creates one chardev entry for each port off an I2C master by
registering one i2c adapter per port. This implementation requires locking of
the master in the driver to prevent transfers running into each other. The
master registers are shared between ports.

Edward A. James (7):
  drivers: fsi: Add function to get FSI clock rate
  drivers: i2c: Add FSI-attached I2C master algorithm
  drivers: i2c: Add port structure to FSI algorithm
  drivers: i2c: Add transfer implementation for FSI algorithm
  drivers: i2c: Add I2C master locking to FSI algorithm
  drivers: i2c: Add bus recovery for FSI algorithm
  dts: aspeed: witherspoon: Add an I2C master as FSI device child

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 134 +++++
 drivers/Makefile                                 |   2 +-
 drivers/fsi/fsi-core.c                           |  20 +
 drivers/fsi/fsi-master.h                         |   1 +
 drivers/i2c/busses/Kconfig                       |  11 +
 drivers/i2c/busses/Makefile                      |   1 +
 drivers/i2c/busses/i2c-fsi.c                     | 672 +++++++++++++++++++++++
 include/linux/fsi.h                              |   1 +
 8 files changed, 841 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-fsi.c

-- 
1.8.3.1
