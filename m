Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47WX3vhdzDr8q
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:47:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67LhsHY029490
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:47:50 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjhr6hb7u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:47:49 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 15:47:49 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 15:47:47 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LlkhT65470618; Fri, 7 Jul 2017 14:47:46 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9A4C6042;
 Fri,  7 Jul 2017 15:47:46 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id CE94AC603C;
 Fri,  7 Jul 2017 15:47:45 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 0/3] Add I2C busses to P9 device tree
Date: Fri,  7 Jul 2017 16:47:34 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17070721-0020-0000-0000-00000C52CDF8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884326; UDB=6.00441252; IPR=6.00664514; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:47:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0021-0000-0000-00005D24B49B
Message-Id: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070362
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
X-List-Received-Date: Fri, 07 Jul 2017 21:47:53 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This series adds FSI-attached I2C controller and associated busses to the P9
FSI cfam device tree node. It also enables the devices in the P9 machine-
specific files, and adds aliases to preserve the expected /dev/ entries.
Also does a couple of dt parsing fixes in the driver.

Changes since v3:
 * just rebase

Edward A. James (3):
  arm/dts: Add I2C master and ports to FSI cfams
  arm/dts: Enable FSI I2C busses for P9
  drivers/i2c: Fix devicetree parsing in FSI-attached I2C master algo

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 150 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 150 +++++++++++++++++++++
 arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
 drivers/i2c/busses/i2c-fsi.c                     |  10 +-
 4 files changed, 470 insertions(+), 4 deletions(-)

-- 
1.8.3.1
