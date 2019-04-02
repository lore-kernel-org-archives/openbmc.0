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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YD5V1P3XzDqKP
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 13:42:37 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x322YNAb140195
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 22:42:34 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rkutjyy5t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 22:42:34 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 2 Apr 2019 03:42:34 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 03:42:32 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x322gV1V15335640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 02:42:31 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 710F46E04C;
 Tue,  2 Apr 2019 02:42:31 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 325406E050;
 Tue,  2 Apr 2019 02:42:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 02:42:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jae.hyun.yoo@linux.intel.com
Subject: [PATCH dev-5.0 v4 0/7] Enable video engine
Date: Tue,  2 Apr 2019 02:42:23 +0000
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19040202-0020-0000-0000-00000ED23864
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010858; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01183052; UDB=6.00619336; IPR=6.00963797; 
 MB=3.00026252; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 02:42:33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040202-0021-0000-0000-000065495C64
Message-Id: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=753 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020017
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
X-List-Received-Date: Tue, 02 Apr 2019 02:42:38 -0000

This series adds the necessary clocks for the video engine to the Aspeed clock
driver. It also adds the video engine node to the AST2500 dts and enables that
node in the witherspoon and romulus dts. It also removes the use of the reset
line in the video engine driver.

Changes since v3:
 - fix reset indices on video engine/video capture clock
 - add info to commit messages for machine dts

Changes since v2:
 - make memory-region dts property optional
 - document the memory-region property
 - only reserve 32MB for video memory
 - remove delay after clock enable - my original testing couldn't detect the
   video resolution without that delay, but now I can't repro that problem, so
   I assume it was a test setup issue?

Changes since v1:
 - new reserved memory node for video engine
 - remove reset line from video engine driver
 - no more addition of reset line to clock driver

Eddie James (7):
  media: platform: Aspeed: Remove use of reset line
  media: platform: Aspeed: Make reserved memory optional
  media: dt-bindings: aspeed-video: Add missing memory-region property
  clk: Aspeed: Setup video engine clocking
  ARM: dts: aspeed-g5: Add video engine
  ARM: dts: witherspoon: Enable video engine
  ARM: dts: romulus: Enable video engine

 .../devicetree/bindings/media/aspeed-video.txt     |  6 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       | 12 +++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   | 12 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   | 10 ++++++
 drivers/clk/clk-aspeed.c                           | 42 ++++++++++++++++++++--
 drivers/media/platform/aspeed-video.c              | 33 ++++-------------
 6 files changed, 85 insertions(+), 30 deletions(-)

-- 
1.8.3.1
