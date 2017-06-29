Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wygW10vSSzDr4J
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 10:28:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5T0NjUT036865
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 20:28:26 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bc7a4jtjv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 20:28:26 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 28 Jun 2017 20:28:25 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 28 Jun 2017 20:28:22 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5T0SLgC62849238; Thu, 29 Jun 2017 00:28:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F984AE04B;
 Wed, 28 Jun 2017 20:28:24 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.6.33])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id D83FBAE034;
 Wed, 28 Jun 2017 20:28:18 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: wim@iguana.be, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/2] Add ASPEED watchdog device tree properties
Date: Wed, 28 Jun 2017 19:28:09 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17062900-0036-0000-0000-000002398754
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007292; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880137; UDB=6.00438730; IPR=6.00660292; 
 BA=6.00005445; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015997; XFM=3.00000015;
 UTC=2017-06-29 00:28:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062900-0037-0000-0000-000040E71EE7
Message-Id: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-28_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706290006
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
X-List-Received-Date: Thu, 29 Jun 2017 00:28:29 -0000

Document device tree optional properties for ASPEED watchdog.
Reference properties in ASPEED watchdog driver and configure accordingly.

Christopher Bostic (2):
  drivers/watchdog: Add optional ASPEED device tree properties
  drivers/watchdog: ASPEED reference dev tree properties for config

 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24 ++++++++++++++++++++++
 drivers/watchdog/aspeed_wdt.c                      | 20 +++++++++++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
1.8.2.2
