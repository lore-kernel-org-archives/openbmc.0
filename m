Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zyhG50PQ0zF0VN
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 09:03:08 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w29LxI1F069116
 for <openbmc@lists.ozlabs.org>; Fri, 9 Mar 2018 17:03:06 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gm0t83xt6-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 17:03:05 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Mar 2018 17:03:04 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Mar 2018 17:03:02 -0500
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w29M32vc51576842; Fri, 9 Mar 2018 22:03:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D9E28046;
 Fri,  9 Mar 2018 17:02:26 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id AF8A22803F;
 Fri,  9 Mar 2018 17:02:25 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 0/3] aspeed: watchdog: fix reset, read alt-boot,
 and set alt-boot for witherspoon
Date: Fri,  9 Mar 2018 16:02:57 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18030922-0044-0000-0000-000003F13E9C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008643; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000702; UDB=6.00509033; IPR=6.00780032; 
 MB=3.00019945; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-09 22:03:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030922-0045-0000-0000-00000821462B
Message-Id: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803090260
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2018 22:03:09 -0000

This series provides a fix to correctly set the reset mode of the control
register. Previously, configuring anything other than a full chip reset would
not reset anything when the watchdog timer expires. The series also provides a
patch to read in the existing aspeed,alt-boot boolean option from the
device-tree and set the appropriate bit in the control register.

Finally, set the alt-boot option for witherspoon to enable "brick protection".

Eddie James (1):
  ARM: dts: aspeed: witherspoon: set alternate boot

Milton Miller (2):
  watchdog: aspeed: Fix translation of reset mode to ctrl register
  watchdog: aspeed: Allow configuring for alternate boot

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  4 ++++
 drivers/watchdog/aspeed_wdt.c                    | 12 +++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
1.8.3.1
