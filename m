Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3WVH3dNDzDr4v
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 07:44:39 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66LiNVL038208
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 17:44:36 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bhuuv3b24-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 17:44:36 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 17:44:34 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 17:44:32 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66LiWUg52756718; Thu, 6 Jul 2017 21:44:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C257E112047;
 Thu,  6 Jul 2017 17:44:31 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 67D77112040;
 Thu,  6 Jul 2017 17:44:31 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 0/3] Add I2C busses to P9 device tree
Date: Thu,  6 Jul 2017 16:44:26 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17070621-0048-0000-0000-000001BCEFB8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007332; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883845; UDB=6.00440963; IPR=6.00664032; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016117; XFM=3.00000015;
 UTC=2017-07-06 21:44:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070621-0049-0000-0000-000041CAA6F1
Message-Id: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060372
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
X-List-Received-Date: Thu, 06 Jul 2017 21:44:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds FSI-attached I2C controller and associated busses to the P9
FSI cfam device tree node. It also enables the devices in the P9 machine-
specific files, and adds aliases to preserve the expected /dev/ entries.
Also does a couple of dt parsing fixes in the driver.

Changes since v2:
 - Split adding and enabling busses into two patches.
 - Add aliases.
 - Add the device node to the I2C adapter dev (needed for alias).

Edward A. James (3):
  arm/dts: Add I2C master and ports to FSI cfams
  arm/dts: Enable FSI I2C busses for P9
  drivers/i2c: Fix devicetree parsing in FSI-attached I2C master algo

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 150 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 150 +++++++++++++++++++++
 arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
 drivers/i2c/busses/i2c-fsi.c                     |  12 +-
 4 files changed, 471 insertions(+), 5 deletions(-)

-- 
1.8.3.1
