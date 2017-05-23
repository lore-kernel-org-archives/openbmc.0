Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXTDR5NJ9zDqQ8
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 07:28:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4NLIZ0G011491
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 17:28:49 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2amu7745n2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 17:28:49 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 23 May 2017 15:28:48 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 23 May 2017 15:28:47 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4NLSldT16777520; Tue, 23 May 2017 14:28:47 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27A0CC6043;
 Tue, 23 May 2017 15:28:47 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id E4719C6037;
 Tue, 23 May 2017 15:28:46 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] drivers/watchdog: Add user space access to
 aspeed ext signal and reset
Date: Tue, 23 May 2017 16:28:45 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17052321-0016-0000-0000-000006CE077D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007107; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00864650; UDB=6.00429251; IPR=6.00644430; 
 BA=6.00005369; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015555; XFM=3.00000015;
 UTC=2017-05-23 21:28:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052321-0017-0000-0000-000039C7571C
Message-Id: <20170523212845.89898-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705230108
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
X-List-Received-Date: Tue, 23 May 2017 21:28:56 -0000

Add sysfs files for 'ext signal' mode and 'system reset' mode within
the aspeed watchdog device driver for wdt1 and wdt2

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 .../ABI/testing/sysfs-platform-aspeed-wdt          | 40 ++++++++++
 drivers/watchdog/aspeed_wdt.c                      | 89 +++++++++++++++++++++-
 2 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-aspeed-wdt

diff --git a/Documentation/ABI/testing/sysfs-platform-aspeed-wdt b/Documentation/ABI/testing/sysfs-platform-aspeed-wdt
new file mode 100644
index 0000000..a582176
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-aspeed-wdt
@@ -0,0 +1,40 @@
+What:           /sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
+		reset_system
+Date:           May 2017
+KernelVersion:  4.12
+Contact:        Christopher Bostic <cbostic@linux.vnet.ibm.com>
+Description:
+                Value indicates if a watchdog time out results in a reset of
+		system.  'off': no system reset on timeout.  'on' there will
+		be a system reset on timeout.
+
+                Default: off
+
+                - Enable 'reset system' on watchdog timeout:
+                echo on > /sys/bus/platform/devices/1e785000.wdt/watchdog/
+			watchdog0/reset_system;
+
+                - Disable 'reset system' on watchdog timeout:
+                echo off > /sys/bus/platform/devices/1e785000.wdt/watchdog/
+			watchdog0/reset_system;
+
+What:           /sys/bus/platform/devices/1e785000.wdt/watchdog/watchdog0/
+		ext_signal
+Date:           May 2017
+KernelVersion:  4.12
+Contact:        Christopher Bostic <cbostic@linux.vnet.ibm.com>
+Description:
+                Value indicates if a watchdog time out results in an active
+		high pulse sent out an output pin.  'off': No output pulse
+		generated on watchdog time out.  'on': output pulse
+		generated on watchdog time out.
+
+                Default: off
+
+                - Enable 'external signal' on watchdog timeout:
+                echo on > /sys/bus/platform/devices/1e785000.wdt/watchdog/
+			watchdog0/ext_signal;
+
+                - Disable 'external signal' on watchdog timeout:
+                echo off > /sys/bus/platform/devices/1e785000.wdt/watchdog/
+			watchdog0/ext_signal;
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index f5ad802..277948b 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -145,6 +145,93 @@ static int aspeed_wdt_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static ssize_t aspeed_wdt_reset_system_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct aspeed_wdt *wdt = platform_get_drvdata(pdev);
+
+	if (!strncmp(buf, "on", strlen("on"))) {
+		wdt->ctrl |= WDT_CTRL_RESET_SYSTEM;
+		writel(wdt->ctrl, wdt->base + WDT_CTRL);
+	} else if (!strncmp(buf, "off", strlen("off"))) {
+		wdt->ctrl &= ~WDT_CTRL_RESET_SYSTEM;
+		writel(wdt->ctrl, wdt->base + WDT_CTRL);
+	} else {
+		dev_warn(dev, "Unknown reset system mode command: [%s]\n", buf);
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t aspeed_wdt_reset_system_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct aspeed_wdt *wdt = platform_get_drvdata(pdev);
+	int ret;
+
+	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_RESET_SYSTEM)
+		ret = sprintf(buf, "on\n");
+	else
+		ret = sprintf(buf, "off\n");
+
+	return ret;
+}
+
+static DEVICE_ATTR(reset_system, 0644,
+		   aspeed_wdt_reset_system_show, aspeed_wdt_reset_system_store);
+
+static ssize_t aspeed_wdt_ext_signal_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct aspeed_wdt *wdt = platform_get_drvdata(pdev);
+
+	if (!strncmp(buf, "on", strlen("on"))) {
+		wdt->ctrl |= WDT_CTRL_WDT_EXT;
+		writel(wdt->ctrl, wdt->base + WDT_CTRL);
+	} else if (!strncmp(buf, "off", strlen("off"))) {
+		wdt->ctrl &= ~WDT_CTRL_WDT_EXT;
+		writel(wdt->ctrl, wdt->base + WDT_CTRL);
+	} else {
+		dev_warn(dev, "Unknown reset system mode command: %s\n", buf);
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t aspeed_wdt_ext_signal_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct aspeed_wdt *wdt = platform_get_drvdata(pdev);
+	int ret;
+
+	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_WDT_EXT)
+		ret = sprintf(buf, "on\n");
+	else
+		ret = sprintf(buf, "off\n");
+
+	return ret;
+}
+
+static DEVICE_ATTR(ext_signal, 0644,
+		   aspeed_wdt_ext_signal_show, aspeed_wdt_ext_signal_store);
+
+static struct attribute *aspeed_wdt_attrs[] = {
+	&dev_attr_reset_system.attr,
+	&dev_attr_ext_signal.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(aspeed_wdt);
+
 static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct aspeed_wdt *wdt;
@@ -169,7 +256,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.ops = &aspeed_wdt_ops;
 	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
 	wdt->wdd.parent = &pdev->dev;
-
+	wdt->wdd.groups = aspeed_wdt_groups;
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
 
-- 
1.8.2.2
