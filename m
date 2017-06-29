Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz5791H82zDr4s
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 02:42:44 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5TGd7vd081303
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 12:42:41 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bd4ewjecs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 12:42:40 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 29 Jun 2017 12:42:40 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 29 Jun 2017 12:42:38 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5TGga5s42139894; Thu, 29 Jun 2017 16:42:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86848B2052;
 Thu, 29 Jun 2017 12:40:10 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 401ADB2046;
 Thu, 29 Jun 2017 12:40:10 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 0/2] arm/dts: Add I2C master and ports to
 FSI cfam
Date: Thu, 29 Jun 2017 11:42:34 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17062916-0008-0000-0000-00000251688B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007294; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880462; UDB=6.00438925; IPR=6.00660614; 
 BA=6.00005447; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016010; XFM=3.00000015;
 UTC=2017-06-29 16:42:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062916-0009-0000-0000-000035DA08C6
Message-Id: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706290272
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
X-List-Received-Date: Thu, 29 Jun 2017 16:42:45 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Fix the devicetree parsing in the driver, and add the FSI-attached I2C devices
to the devicetree.

changes since v1:
 * Change port entries to i2c-bus.
 * Label the i2c-buses and disable them in the POWER9 include file, include
   them in the specific machine files.
 * Add driver changes.

Edward A. James (2):
  arm/dts: Add I2C master and ports to FSI cfam
  drivers/i2c: Fix devicetree parsing in FSI-attached I2C master algo

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 120 +++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 120 +++++++++++++++++
 arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
 drivers/i2c/busses/i2c-fsi.c                     |  11 +-
 4 files changed, 410 insertions(+), 5 deletions(-)

-- 
1.8.3.1
