Return-Path: <clg@kaod.org>
X-Greylist: delayed 501 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Oct 2016 18:06:42 AEDT
Received: from 9.mo68.mail-out.ovh.net (9.mo68.mail-out.ovh.net
 [46.105.78.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3h023BFNzDvHX
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 18:06:41 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 9BB6D9874
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 08:58:22 +0200 (CEST)
Received: from hermes.kaod.org.com (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 7CF64180085;
 Wed, 26 Oct 2016 08:58:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 8/8] ipmi: add a sysfs file for configure
 maximum response time
Date: Wed, 26 Oct 2016 08:57:47 +0200
Message-Id: <1477465067-19034-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477465067-19034-1-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6056778551222176514
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrieekgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 26 Oct 2016 07:06:42 -0000

We could also use an ioctl for that purpose. sysfs seems a better
approach.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/char/ipmi/bt-bmc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 228ecdb689de..1ebb0171c724 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -84,6 +84,33 @@ struct bt_bmc {
 
 static atomic_t open_count = ATOMIC_INIT(0);
 
+static ssize_t bt_bmc_show_response_time(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct bt_bmc *bt_bmc = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", bt_bmc->response_time);
+}
+
+static ssize_t bt_bmc_set_response_time(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct bt_bmc *bt_bmc = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+	bt_bmc->response_time = val;
+	return count;
+}
+
+static DEVICE_ATTR(response_time, S_IWUSR | S_IRUGO,
+		bt_bmc_show_response_time, bt_bmc_set_response_time);
+
 static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
 {
 	return ioread8(bt_bmc->base + reg);
@@ -572,6 +599,10 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	bt_bmc_config_irq(bt_bmc, pdev);
 
 	bt_bmc->response_time = BT_BMC_RESPONSE_TIME;
+	rc = device_create_file(&pdev->dev, &dev_attr_response_time);
+	if (rc)
+		dev_warn(&pdev->dev, "can't create response_time file\n");
+
 
 	if (bt_bmc->irq) {
 		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
-- 
2.7.4
