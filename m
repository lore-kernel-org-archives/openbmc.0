Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLyPp4n6YzDsQS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:49:18 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710moC8060280
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:16 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c28y506kn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:15 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:49:14 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:49:13 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710nC0822479018; Tue, 1 Aug 2017 00:49:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E637B112040;
 Mon, 31 Jul 2017 20:49:05 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 9229D112034;
 Mon, 31 Jul 2017 20:49:05 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 0/6] drivers/i2c: Add FSI-attached I2C master
 algorithm
Date: Mon, 31 Jul 2017 19:49:00 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17080100-0008-0000-0000-0000026796A3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895760; UDB=6.00448039; IPR=6.00675947; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:49:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0009-0000-0000-00003638D2AF
Message-Id: <1501548546-21096-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010009
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
X-List-Received-Date: Tue, 01 Aug 2017 00:49:19 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds an algorithm for an I2C master physically located on an FSI
slave device. The I2C master has multiple ports, each of which may be connected
to an I2C slave. Access to the I2C master registers is achieved over FSI bus.

Due to the multi-port nature of the I2C master, the driver instantiates a new
I2C adapter for each port connected to a slave. The connected ports should be
defined in the device tree under the I2C master device.

Edward A. James (6):
  drivers/i2c: Add FSI-attached I2C master algorithm
  drivers/i2c: Add port structure to FSI algorithm
  drivers/i2c: Add transfer implementation for FSI algorithm
  drivers/i2c: Add I2C master locking to FSI algorithm
  drivers/i2c: Add bus recovery for FSI algorithm
  dt-bindings: i2c: Add FSI-attached I2C master dt binding documentation

 Documentation/devicetree/bindings/i2c/i2c-fsi.txt |  40 ++
 drivers/i2c/busses/Kconfig                        |  11 +
 drivers/i2c/busses/Makefile                       |   1 +
 drivers/i2c/busses/i2c-fsi.c                      | 643 ++++++++++++++++++++++
 4 files changed, 695 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 drivers/i2c/busses/i2c-fsi.c

-- 
1.8.3.1
