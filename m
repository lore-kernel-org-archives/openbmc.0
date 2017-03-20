Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn3m634vTzDqZc
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 05:06:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2KHwdXx140767
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 14:06:02 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29aj6pxkmy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 14:06:02 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 20 Mar 2017 12:06:00 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Mar 2017 12:05:58 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2KI5vPt17170756; Mon, 20 Mar 2017 11:05:57 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AE1E7804D;
 Mon, 20 Mar 2017 12:05:57 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.0.205])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id C2D1278037;
 Mon, 20 Mar 2017 12:05:55 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v3] drivers/fsi: Increase delay before sampling
 input on SDA
Date: Mon, 20 Mar 2017 13:05:49 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17032018-0004-0000-0000-000011CF68EE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006817; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00836452; UDB=6.00411100; IPR=6.00614221; 
 BA=6.00005224; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014729; XFM=3.00000013;
 UTC=2017-03-20 18:05:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032018-0005-0000-0000-00007DF5BBD7
Message-Id: <20170320180549.21903-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-20_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703200154
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
X-List-Received-Date: Mon, 20 Mar 2017 18:06:15 -0000

During high cpu loads the SDA in line can shift relative to the
clock signal which can corrupt the received input data.  Slow
down the time to sample input to account for this.

Add sysfs files to adjust the three main openfsi protocol timing
values: clock delay; sample delay; clock off time.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v3 - Add sysfs files to adjust protocol timings

v2 - Increase delay for SDA in sampling only.

   - Decrease the original delay for SDA sampling from 1us to 200ns
---
 drivers/fsi/fsi-master-gpio.c | 107 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 103 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index a8976d5..0907977 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -14,6 +14,7 @@
 #include "fsi-master.h"
 
 #define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
+#define	FSI_GPIO_SDA_IN_DLY	200	/* Wait to sample SDA line, in nS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
@@ -65,6 +66,10 @@
 
 static DEFINE_SPINLOCK(fsi_gpio_cmd_lock);	/* lock around fsi commands */
 
+static int clock_delay = FSI_GPIO_STD_DLY;
+static int clock_off_time = FSI_GPIO_STD_DLY;
+static int sample_delay = FSI_GPIO_SDA_IN_DLY;
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct gpio_desc	*gpio_clk;
@@ -86,9 +91,11 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		ndelay(FSI_GPIO_STD_DLY);
+		udelay(clock_delay / 1000);
+		ndelay(clock_delay % 1000);
 		gpiod_set_value(master->gpio_clk, 0);
-		ndelay(FSI_GPIO_STD_DLY);
+		udelay(clock_off_time / 1000);
+		ndelay(clock_off_time % 1000);
 		gpiod_set_value(master->gpio_clk, 1);
 	}
 }
@@ -97,7 +104,8 @@ static int sda_in(struct fsi_master_gpio *master)
 {
 	int in;
 
-	ndelay(FSI_GPIO_STD_DLY);
+	udelay(sample_delay / 1000);
+	ndelay(sample_delay % 1000);
 	in = gpiod_get_value(master->gpio_data);
 	return in ? 1 : 0;
 }
@@ -497,10 +505,77 @@ static ssize_t store_scan(struct device *dev,
 
 static DEVICE_ATTR(scan, 0200, NULL, store_scan);
 
+static ssize_t clock_delay_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", clock_delay);
+}
+
+static ssize_t clock_delay_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	unsigned long val = 0;
+
+	rc = kstrtoul(buf, 0, &val);
+	clock_delay = val;
+
+	return count;
+}
+
+DEVICE_ATTR(clock_delay, S_IRUGO | S_IWUSR, clock_delay_show,
+		clock_delay_store);
+
+static ssize_t clock_off_time_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", clock_off_time);
+}
+
+static ssize_t clock_off_time_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	unsigned long val = 0;
+
+	rc = kstrtoul(buf, 0, &val);
+	clock_off_time = val;
+
+	return count;
+}
+
+DEVICE_ATTR(clock_off_time, S_IRUGO | S_IWUSR, clock_off_time_show,
+		clock_off_time_store);
+
+static ssize_t sample_delay_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", sample_delay);
+}
+
+static ssize_t sample_delay_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	unsigned long val = 0;
+
+	rc = kstrtoul(buf, 0, &val);
+	sample_delay = val;
+
+	return count;
+}
+
+DEVICE_ATTR(sample_delay, S_IRUGO | S_IWUSR, sample_delay_show,
+		sample_delay_store);
+
 static int fsi_master_gpio_probe(struct platform_device *pdev)
 {
 	struct fsi_master_gpio *master;
 	struct gpio_desc *gpio;
+	int rc;
 
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
@@ -548,8 +623,29 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
 	platform_set_drvdata(pdev, master);
+	rc = device_create_file(&pdev->dev, &dev_attr_clock_off_time);
+	if (rc)
+		goto done;
+	rc = device_create_file(&pdev->dev, &dev_attr_clock_delay);
+	if (rc)
+		goto rem_clock_off;
+	rc = device_create_file(&pdev->dev, &dev_attr_sample_delay);
+	if (rc)
+		goto rem_clock_delay;
+	rc = device_create_file(&pdev->dev, &dev_attr_scan);
+	if (rc)
+		goto rem_sample_delay;
 
-	return device_create_file(&pdev->dev, &dev_attr_scan);
+	return rc;
+
+rem_sample_delay:
+	device_remove_file(&pdev->dev, &dev_attr_sample_delay);
+rem_clock_delay:
+	device_remove_file(&pdev->dev, &dev_attr_clock_delay);
+rem_clock_off:
+	device_remove_file(&pdev->dev, &dev_attr_clock_off_time);
+done:
+	return rc;
 }
 
 
@@ -576,6 +672,9 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
 		devm_gpiod_put(&pdev->dev, master->gpio_mux);
 	}
 	fsi_master_unregister(&master->master);
+	device_remove_file(&pdev->dev, &dev_attr_clock_off_time);
+	device_remove_file(&pdev->dev, &dev_attr_clock_delay);
+	device_remove_file(&pdev->dev, &dev_attr_sample_delay);
 	device_remove_file(&pdev->dev, &dev_attr_scan);
 
 	return 0;
-- 
1.8.2.2
