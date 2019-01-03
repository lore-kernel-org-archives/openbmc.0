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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W1sR6T3HzDqDF
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 08:54:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x03LsF5S120201
 for <openbmc@lists.ozlabs.org>; Thu, 3 Jan 2019 16:54:16 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pssnd2jty-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 16:54:15 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 3 Jan 2019 21:54:13 -0000
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Jan 2019 21:54:11 -0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x03LsAuw22675594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Jan 2019 21:54:10 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 948096A057;
 Thu,  3 Jan 2019 21:54:10 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F7A6A04D;
 Thu,  3 Jan 2019 21:54:10 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Jan 2019 21:54:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH dev-4.19 0/6] Aspeed Video Engine
Date: Thu,  3 Jan 2019 15:54:02 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19010321-0020-0000-0000-00000EA36998
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010339; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000272; SDB=6.01141310; UDB=6.00593987; IPR=6.00921535; 
 MB=3.00024957; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-03 21:54:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010321-0021-0000-0000-000064468123
Message-Id: <1546552448-22621-1-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-03_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901030187
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
X-List-Received-Date: Thu, 03 Jan 2019 21:54:20 -0000
X-List-Received-Date: Thu, 03 Jan 2019 21:54:20 -0000
X-List-Received-Date: Thu, 03 Jan 2019 21:54:20 -0000

From: Eddie James <eajames@linux.vnet.ibm.com>

This series adds all the necessary bits to enable the Aspeed video engine. The
video engine driver has been accepted upstream. I have submitted the clock
changes upstream and responded to Joel's comments on those.

Eddie James (6):
  clk: aspeed: Add video engine reset index definition
  clk: aspeed: Setup video engine clocking
  ARM: dts: aspeed-g5: Add video engine node
  ARM: dts: aspeed: witherspoon: Enable video engine
  media: dt-bindings: media: Add Aspeed Video Engine binding
    documentation
  media: platform: Add Aspeed Video Engine driver

 .../devicetree/bindings/media/aspeed-video.txt     |   26 +
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |   11 +-
 arch/arm/boot/dts/aspeed-g5.dtsi                   |   11 +
 drivers/clk/clk-aspeed.c                           |   41 +-
 drivers/media/platform/Kconfig                     |    9 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/aspeed-video.c              | 1729 ++++++++++++++++++++
 include/dt-bindings/clock/aspeed-clock.h           |    1 +
 9 files changed, 1834 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
 create mode 100644 drivers/media/platform/aspeed-video.c

-- 
1.8.3.1
