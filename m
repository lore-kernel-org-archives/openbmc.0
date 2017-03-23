Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0T14LS5zDqZf
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:44:53 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhkvK054215
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:46 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29cffkeuj5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:46 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:44:45 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:44 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLihg015925578; Thu, 23 Mar 2017 14:44:43 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 889F878037;
 Thu, 23 Mar 2017 15:44:43 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 46B8778038;
 Thu, 23 Mar 2017 15:44:43 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 1/7] drivers: fsi: Add function to get FSI clock
 rate
Date: Thu, 23 Mar 2017 16:44:33 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17032321-0016-0000-0000-0000066E4854
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006837; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837963; UDB=6.00412008; IPR=6.00615726; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:44:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0017-0000-0000-000038694B9D
Message-Id: <1490305479-17065-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:44:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

client drivers (I2C, etc) may need to know FSI bus clock rate.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  6 ++++++
 drivers/fsi/fsi-core.c                           | 20 ++++++++++++++++++++
 drivers/fsi/fsi-master.h                         |  1 +
 include/linux/fsi.h                              |  1 +
 4 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4d26d47..6772b53 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -57,6 +57,12 @@
 		mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
 		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+
+		fsi_clock {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <8333333>;
+		};
 	};
 };
 
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d382e6..43c8636 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/idr.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/delay.h>
@@ -26,6 +27,7 @@
 
 #define DEBUG
 
+#define FSI_DEFAULT_CLK	8333333
 #define FSI_N_SLAVES	4
 #define FSI_BREAK	0xc0de0000
 
@@ -139,6 +141,12 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
 }
 
+unsigned long fsi_device_get_clk_rate(struct fsi_device *dev)
+{
+	return dev->slave->master->clk;
+}
+EXPORT_SYMBOL_GPL(fsi_device_get_clk_rate);
+
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
@@ -854,9 +862,21 @@ DEVICE_ATTR(fsi_ipoll_period, S_IRUGO | S_IWUSR, fsi_ipoll_period_show,
 
 int fsi_master_register(struct fsi_master *master)
 {
+	struct device_node *np;
+	u32 clk;
+
 	if (!master || !master->dev)
 		return -EINVAL;
 
+	master->clk = FSI_DEFAULT_CLK;
+
+	for_each_child_of_node(master->dev->of_node, np) {
+		if (of_device_is_compatible(np, "fixed_clock")) {
+			if (!of_property_read_u32(np, "clock-frequency", &clk))
+				master->clk = clk;
+		}
+	}
+
 	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
 	master->slave_list = false;
 	get_device(master->dev);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 54723a7..f187269 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -72,6 +72,7 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	uint32_t	ipoll;
+	unsigned long	clk;
 	int		(*read)(struct fsi_master *, int link,
 				uint8_t slave, uint32_t addr,
 				void *val, size_t size);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index d22d0c5..57c8fdb 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -35,6 +35,7 @@ extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
 extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
 		const void *val, size_t size);
 extern int fsi_device_peek(struct fsi_device *dev, void *val);
+extern unsigned long fsi_device_get_clk_rate(struct fsi_device *dev);
 
 struct fsi_device_id {
 	u8	engine_type;
-- 
1.8.3.1
