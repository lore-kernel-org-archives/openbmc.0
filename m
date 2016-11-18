Return-Path: <clg@kaod.org>
Received: from 15.mo7.mail-out.ovh.net (15.mo7.mail-out.ovh.net [87.98.180.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0fp0yppzDvp7
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:25 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6835C1E16F
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:22 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 399BC480080;
 Fri, 18 Nov 2016 15:26:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 28/38] aspeed: add a temp sensor device on I2C bus 3
Date: Fri, 18 Nov 2016 15:22:08 +0100
Message-Id: <1479478938-13267-29-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1120833358763297538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:26 -0000

Temperatures can be changed from the monitor with :

	(qemu) qom-set /machine/unattached/device[2] temperature0 12000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 24354f700115..2aa15d90cc31 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -268,6 +268,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
 
+    /* add a TMP423 temperature sensor */
+    dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 2),
+                           "tmp423", 0x4c);
+    object_property_set_int(OBJECT(dev), 31000, "temperature0", &err);
+    object_property_set_int(OBJECT(dev), 28000, "temperature1", &err);
+    object_property_set_int(OBJECT(dev), 20000, "temperature2", &err);
+    object_property_set_int(OBJECT(dev), 110000, "temperature3", &err);
+
     /* FMC */
     fmc_num_cs = aspeed_fmc_get_cs(s, &err);
     if (err) {
-- 
2.7.4
