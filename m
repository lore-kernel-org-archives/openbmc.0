Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wN9Rp5ZYJzDqKv
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 19:09:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4A93d5D043532
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 05:09:55 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2abhaxr46p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 05:09:55 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 10 May 2017 05:09:54 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 05:09:51 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4A99pch10092814; Wed, 10 May 2017 09:09:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D02FD28048;
 Wed, 10 May 2017 05:09:45 -0400 (EDT)
Received: from vishwa.in.ibm.com (unknown [9.193.99.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id DFB2C2803F;
 Wed, 10 May 2017 05:09:44 -0400 (EDT)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] witherspoon: leds: Use underscore in led names than hyphen
Date: Wed, 10 May 2017 14:40:11 +0530
X-Mailer: git-send-email 1.9.1
X-TM-AS-GCONF: 00
x-cbid: 17051009-0048-0000-0000-0000017D0D14
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007042; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858585; UDB=6.00425437; IPR=6.00638058; 
 BA=6.00005340; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015391; XFM=3.00000015;
 UTC=2017-05-10 09:09:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051009-0049-0000-0000-000041126BB2
Message-Id: <1494407411-2614-1-git-send-email-vishwa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100065
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
X-List-Received-Date: Wed, 10 May 2017 09:09:59 -0000

udev rule for leds subsystem in Witherspoon launches a systemd
service file with $devpath. If the devpath is
sys-devices-platform-leds-leds-rear-fault, systemd service file
interprets it as /sys/devices/platform/leds/leds/rear/fault.

However, what is really needed by the service file is
/sys/devices/platform/leds/leds/rear-fault.

This is a limitation in current systemd with template argument
containing hyphen. Short term solution is to have $name contain
underscores.

It would then become: /sys/devices/platform/leds/leds/rear_fault
and hence will work.

Refer systemd bug: https://github.com/systemd/systemd/issues/5072

Change-Id: Ie45dbf92e5ea96b8d8461856415bae6ce0bbd7d8
Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index ca228be..da0ff4a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -50,15 +50,15 @@
 	leds {
 		compatible = "gpio-leds";
 
-		rear-fault {
+		rear_fault {
 			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
 		};
 
-		rear-id {
+		rear_id {
 			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
 		};
 
-		rear-power {
+		rear_power {
 			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
 		};
 	};
-- 
1.9.1
