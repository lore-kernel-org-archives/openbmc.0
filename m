Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WDzr4fJhzDqNg
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 08:15:51 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2TL3bXa118481
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:49 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rht5nab60-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:49 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Fri, 29 Mar 2019 21:15:48 -0000
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Mar 2019 21:15:45 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2TLFiWd15990862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Mar 2019 21:15:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4168A112061;
 Fri, 29 Mar 2019 21:15:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ADE4112064;
 Fri, 29 Mar 2019 21:15:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 29 Mar 2019 21:15:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.0 v2 0/5] Enable video engine
Date: Fri, 29 Mar 2019 21:15:38 +0000
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19032921-0064-0000-0000-000003C2AD2C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010836; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01181526; UDB=6.00618413; IPR=6.00962247; 
 MB=3.00026214; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-29 21:15:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032921-0065-0000-0000-00003CE17239
Message-Id: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=609 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903290145
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
X-List-Received-Date: Fri, 29 Mar 2019 21:15:53 -0000

This series adds the necessary clocks for the video engine to the Aspeed clock
driver. It also adds the video engine node to the AST2500 dts and enables that
node in the witherspoon and romulus dts. It also removes the use of the reset
line in the video engine driver.

Changes since v1:
 - new reserved memory node for video engine
 - remove reset line from video engine driver
 - no more addition of reset line to clock driver

Eddie James (5):
  media: platform: Aspeed: Remove use of reset line
  clk: Aspeed: Setup video engine clocking
  ARM: dts: aspeed-g5: Add video engine
  ARM: dts: witherspoon: Enable video engine
  ARM: dts: romulus: Enable video engine

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 12 +++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 12 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 10 ++++++
 drivers/clk/clk-aspeed.c                         | 40 ++++++++++++++++++++++--
 drivers/media/platform/aspeed-video.c            | 39 +++++++++--------------
 5 files changed, 87 insertions(+), 26 deletions(-)

-- 
1.8.3.1
