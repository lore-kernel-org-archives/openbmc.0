Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSqMz0Z7PzF0Q8
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2018 06:53:34 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0QJrRL0096524
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:32 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fra54seq3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 14:53:31 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 Jan 2018 12:53:30 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Jan 2018 12:53:27 -0700
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0QJrR5s12910850; Fri, 26 Jan 2018 12:53:27 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E9F06E035;
 Fri, 26 Jan 2018 12:53:27 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.85.176.85])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 85E066E040;
 Fri, 26 Jan 2018 12:53:26 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 0/5] aspeed: watchdog and devicetree updates
Date: Fri, 26 Jan 2018 13:53:19 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18012619-0024-0000-0000-000017D9B971
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008433; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00980763; UDB=6.00497211; IPR=6.00760064; 
 BA=6.00005797; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019231; XFM=3.00000015;
 UTC=2018-01-26 19:53:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012619-0025-0000-0000-00004E76E2D0
Message-Id: <1516996404-25133-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801260259
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 19:53:35 -0000
X-List-Received-Date: Fri, 26 Jan 2018 19:53:35 -0000

This series provides a number of fixes for the AST2500 watchdog driver and
devicetree. It also adds some features such as allowing configuration of
whether or not the watchdog should boot from the alternate flash after a
watchdog timeout.

Milton Miller (5):
  ARM: dts: aspeed-g5: fix watchdog 3 definition
  watchdog: aspeed: update ASPEED reference dev tree properties for
    config
  watchdog: aspeed: Fix translation of reset mode to ctrl register
  arm: dts: aspeed: witherspoon: configure watchdogs
  watchdog: aspeed: Allow configuring for alternate boot

 .../devicetree/bindings/watchdog/aspeed-wdt.txt          |  3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts         |  8 ++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                         |  4 ++--
 drivers/watchdog/aspeed_wdt.c                            | 16 ++++++++++++----
 4 files changed, 25 insertions(+), 6 deletions(-)

-- 
1.8.3.1
