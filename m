Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QH1l1cPYzDqSy
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 06:30:17 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LJT8g5144055
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 15:30:14 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rcdm793sv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 15:30:14 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 21 Mar 2019 19:30:12 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Mar 2019 19:30:10 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2LJUAdF60620940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Mar 2019 19:30:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4485BE056;
 Thu, 21 Mar 2019 19:30:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D1EBBE053;
 Thu, 21 Mar 2019 19:30:10 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Mar 2019 19:30:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.0 0/7] Enable video engine
Date: Thu, 21 Mar 2019 14:30:03 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19032119-8235-0000-0000-00000E70A4DD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010790; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01177678; UDB=6.00616089; IPR=6.00958375; 
 MB=3.00026097; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-21 19:30:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032119-8236-0000-0000-000044DB7C1A
Message-Id: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903210137
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 19:30:20 -0000

This series adds the necessary clocks for the video engine to the Aspeed clock
driver. It also adds the video engine node to the AST2500 dts and enables that
node in the witherspoon and romulus dts.

Eddie James (6):
  clk: aspeed: Add video engine reset index definition
  clk: aspeed: Setup video engine clocking
  ARM: dts: aspeed-g5: Add video engine
  ARM: dts: witherspoon: Enable video engine
  ARM: dts: witherspoon: Enable vhub
  ARM: dts: romulus: Enable video engine

Wei Yongjun (1):
  media: platform: Fix missing spin_lock_init()

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  7 +++-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 11 ++++++-
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 11 +++++++
 drivers/clk/clk-aspeed.c                         | 41 ++++++++++++++++++++++--
 drivers/media/platform/aspeed-video.c            |  1 +
 include/dt-bindings/clock/aspeed-clock.h         |  1 +
 6 files changed, 68 insertions(+), 4 deletions(-)

-- 
1.8.3.1
