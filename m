Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNLNl5yK8zDqBH
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 01:52:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4AFmlNS072024
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:48 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ac4ex53cj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:48 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 10 May 2017 09:52:47 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 09:52:45 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4AFqi4C14287198; Wed, 10 May 2017 08:52:44 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5059136040;
 Wed, 10 May 2017 09:52:44 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 87F13136043;
 Wed, 10 May 2017 09:52:44 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/6] drivers: i2c: FSI-attached I2C master
 algorithm
Date: Wed, 10 May 2017 10:52:36 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17051015-8235-0000-0000-00000B7772C0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007043; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858722; UDB=6.00425519; IPR=6.00638195; 
 BA=6.00005342; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015397; XFM=3.00000015;
 UTC=2017-05-10 15:52:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051015-8236-0000-0000-00003BBE12A5
Message-Id: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100107
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
X-List-Received-Date: Wed, 10 May 2017 15:52:56 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patch series adds an I2C bus algorithm to drive the I2C master located on
POWER CPUs. The master is accessed over FSI bus from the service processor.

The driver creates one chardev entry for each port off an I2C master by
registering one I2C adapter for port. This implementation requires locking of
the master in the driver to prevent transfers running into each other. The
master registers are shared between ports.

This patchset also adds the latest in FSI dt bindings from Jeremy Kerr. This
describes the entire FSI tree structure (master -> slaves -> engines ->
engine data (such as i2c master ports)). These bindings are required for the
I2C driver in order to enumerate the ports off each I2C master.

Edward A. James (6):
  drivers: i2c: Add FSI-attached I2C master algorithm
  drivers: i2c: Add port structure to FSI algorithm
  drivers: i2c: Add transfer implementation for FSI algorithm
  drivers: i2c: Add I2C master locking to FSI algorithm
  drivers: i2c: Add bus recovery for FSI algorithm
  dts: aspeed: witherspoon: Add I2C master under FSI masters

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 156 ++++++
 drivers/Makefile                                 |   2 +-
 drivers/i2c/busses/Kconfig                       |  11 +
 drivers/i2c/busses/Makefile                      |   1 +
 drivers/i2c/busses/i2c-fsi.c                     | 654 +++++++++++++++++++++++
 5 files changed, 823 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-fsi.c

-- 
1.8.3.1
