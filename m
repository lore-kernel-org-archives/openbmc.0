Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2X6hTVzDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:12 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NJHT0026466
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:11 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28c1y7nyce-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:10 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:10 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:07 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9B59219D801C;
 Thu,  2 Feb 2017 16:25:21 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQ7Fb11469238; Thu, 2 Feb 2017 16:26:07 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D69C78047;
 Thu,  2 Feb 2017 16:26:07 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id D17A778041;
 Thu,  2 Feb 2017 16:26:06 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 0/8] drivers: fsi: interrupt polling, i2c client
Date: Thu,  2 Feb 2017 17:25:56 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-8235-0000-0000-00000ADE297B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816378; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-8236-0000-0000-000039475C22
Message-Id: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=8
 spamscore=8 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:13 -0000

From: "Edward A. James" <eajames@us.ibm.com>

First, this series add interrupt polling support to the FSI bus driver.
This implements a loop that constantly polls the FSI slave interrupt
status register and triggers any registered client interrupt handlers upon
detecting an interrupt.

Secondly, this series adds the I2C client driver for FSI bus. This driver
interacts with the IBM BOE engine on an FSI slave device.

Christopher Bostic (3):
  drivers/fsi: Add slave interrupt polling
  drivers/fsi: Add Client IRQ Enable / Disable
  drivers/fsi: Add sysfs file to adjust i-poll period

Edward A. James (5):
  drivers: fsi: Add i2c client driver
  drivers: fsi: i2c: Add engine access wrappers
  drivers: fsi: i2c: probe fsi device for i2c client
  drivers: fsi: i2c: add driver file operations and bus locking
  drivers: fsi: i2c: boe engine

 drivers/fsi/Kconfig           |    6 +
 drivers/fsi/Makefile          |    1 +
 drivers/fsi/fsi-core.c        |  170 +++
 drivers/fsi/fsi-master-gpio.c |    1 +
 drivers/fsi/fsi-master.h      |    2 +
 drivers/fsi/i2c/Makefile      |    1 +
 drivers/fsi/i2c/iic-boe.c     | 1597 +++++++++++++++++++++++++++++
 drivers/fsi/i2c/iic-boe.h     |  180 ++++
 drivers/fsi/i2c/iic-fsi.c     |  715 +++++++++++++
 drivers/fsi/i2c/iic-int.h     |  395 +++++++
 drivers/fsi/i2c/iic-lock.c    |  439 ++++++++
 drivers/fsi/i2c/iic-mstr.c    | 2281 +++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h           |    5 +
 include/uapi/linux/Kbuild     |    1 +
 include/uapi/linux/i2cfsi.h   |  136 +++
 15 files changed, 5930 insertions(+)
 create mode 100644 drivers/fsi/i2c/Makefile
 create mode 100644 drivers/fsi/i2c/iic-boe.c
 create mode 100644 drivers/fsi/i2c/iic-boe.h
 create mode 100644 drivers/fsi/i2c/iic-fsi.c
 create mode 100644 drivers/fsi/i2c/iic-int.h
 create mode 100644 drivers/fsi/i2c/iic-lock.c
 create mode 100644 drivers/fsi/i2c/iic-mstr.c
 create mode 100644 include/uapi/linux/i2cfsi.h

-- 
1.8.3.1
