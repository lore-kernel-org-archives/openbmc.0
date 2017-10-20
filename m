Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KJA4cEBq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OjtOm8ij"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBNY4f8jzDqKX;
 Fri, 20 Oct 2017 14:38:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D28C20683;
 Thu, 19 Oct 2017 23:38:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Dn4ZA2gHALxqqOoAH
 /HtByP0kBRcjbCEn6PakPjdoNA=; b=KJA4cEBq+RIdkc6YZzJRW+UJGKBZW5zCt
 jIHvU5YBX1cmFynW4Ig5SC72ZjzYazawr3mTiNHZOvyU4SruPcWsnuRKbzhFvonN
 MZY8jqsZ0bC0c+57YA47PILBjR2vQU1dtmjgB0ygt/ZazBQYtnzouMV7bDw2qMFR
 fl9NmGcSlMdv56g3721+IisDByxABHCOrTbMywOSxISOdWl9CyIXdD4+9JrO6aeX
 cFo8Z0pr1Xe5G4EpZqupdO2aQ/KZY8gYZKuHRYIEnK3L4Ofn4Zb9Q+ahuskjIoYL
 WoTTW7uUVmQbDugZFVJaPAFZ2K1o6KiJRUv5Y95l1qDJdyELwSfbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Dn4ZA2gHALxqqOoAH/HtByP0kBRcjbCEn6PakPjdoNA=; b=OjtOm8ij
 073/Qfs+z11yct8tyUpZGmkmV8/wIYvUP69s18gCRbfEtsTk6IQax+C+FOno/WLi
 MDMcheiJAsUqs2N6fba3QmaGXvuc5ASpzE1TwGZa1XinVtQKBX/byWtkeRcgskKY
 wA2KQG0ITNuhCBcZk9Q5xDr4J6Jyq73tHHDLFHoAOlzT5eeaEDudvuGavNzthj2M
 LEczvWm4LDuocshN4K+qvfhP0S816+dPkmmQqP/i/e63068GxY84BUyGImPX2/Mh
 OFVqXIEJ/hTUS9Jw2Gu1VJL1zenEq0DcrXVArV53RqyYVzzyRseo755pnqqk5x09
 +C2AtBqFvrj1SA==
X-ME-Sender: <xms:y2_pWferg_gLsz78g2q5mk6aZ2kY-9SE_CcclnKRsljf6gMZOEMxkw>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 213AB2489B;
 Thu, 19 Oct 2017 23:38:45 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 4/5] gpio: gpiolib: Add sysfs support for maintaining GPIO
 values on reset
Date: Fri, 20 Oct 2017 14:07:26 +1030
Message-Id: <20171020033727.21557-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171020033727.21557-1-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 03:38:54 -0000

Expose a new 'maintain' sysfs attribute to control both suspend and
reset tolerance.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/gpio/sysfs.txt |  9 +++++
 drivers/gpio/gpiolib-sysfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index aeab01aa4d00..f447f0746884 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -96,6 +96,15 @@ and have the following read/write attributes:
 		for "rising" and "falling" edges will follow this
 		setting.
 
+	"maintain" ... displays and controls whether the state of the GPIO is
+		maintained or lost on suspend or reset. The valid values take
+	        the following meanings:
+
+	        0: Do not maintain state on either suspend or reset
+	        1: Maintain state for suspend only
+	        2: Maintain state for reset only
+	        3: Maintain state for both suspend and reset
+
 GPIO controllers have paths like /sys/class/gpio/gpiochip42/ (for the
 controller implementing GPIOs starting at #42) and have the following
 read-only attributes:
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3f454eaf2101..bfa186e73e26 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -289,6 +289,74 @@ static ssize_t edge_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(edge);
 
+#define GPIOLIB_SYSFS_MAINTAIN_SUSPEND	BIT(0)
+#define GPIOLIB_SYSFS_MAINTAIN_RESET	BIT(1)
+#define GPIOLIB_SYSFS_MAINTAIN_ALL	GENMASK(1, 0)
+static ssize_t maintain_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	ssize_t	status = 0;
+	int val = 0;
+
+	mutex_lock(&data->mutex);
+
+	if (!test_bit(FLAG_SLEEP_MAY_LOSE_VALUE, &data->desc->flags))
+		val |= GPIOLIB_SYSFS_MAINTAIN_SUSPEND;
+
+	if (test_bit(FLAG_RESET_TOLERANT, &data->desc->flags))
+		val |= GPIOLIB_SYSFS_MAINTAIN_RESET;
+
+	status = sprintf(buf, "%d\n", val);
+
+	mutex_unlock(&data->mutex);
+
+	return status;
+}
+
+static ssize_t maintain_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf,
+			      size_t size)
+{
+	struct gpiod_data *data = dev_get_drvdata(dev);
+	struct gpio_chip *chip;
+	ssize_t	status;
+	long provided;
+
+	mutex_lock(&data->mutex);
+
+	chip = data->desc->gdev->chip;
+
+	if (!chip->set_config)
+		return -ENOTSUPP;
+
+	status = kstrtol(buf, 0, &provided);
+	if (status < 0)
+		goto out;
+
+	if (provided & ~GPIOLIB_SYSFS_MAINTAIN_ALL) {
+		status = -EINVAL;
+		goto out;
+	}
+
+	if (!(provided & GPIOLIB_SYSFS_MAINTAIN_SUSPEND))
+		set_bit(FLAG_SLEEP_MAY_LOSE_VALUE, &data->desc->flags);
+	else
+		clear_bit(FLAG_SLEEP_MAY_LOSE_VALUE,
+			  &data->desc->flags);
+
+	/* Configure reset tolerance */
+	status = gpiod_set_reset_tolerant(data->desc,
+			!!(provided & GPIOLIB_SYSFS_MAINTAIN_RESET));
+out:
+	mutex_unlock(&data->mutex);
+
+	return status ? : size;
+
+}
+static DEVICE_ATTR_RW(maintain);
+
 /* Caller holds gpiod-data mutex. */
 static int gpio_sysfs_set_active_low(struct device *dev, int value)
 {
@@ -378,6 +446,7 @@ static struct attribute *gpio_attrs[] = {
 	&dev_attr_edge.attr,
 	&dev_attr_value.attr,
 	&dev_attr_active_low.attr,
+	&dev_attr_maintain.attr,
 	NULL,
 };
 
@@ -474,11 +543,22 @@ static ssize_t export_store(struct class *class,
 			status = -ENODEV;
 		goto done;
 	}
-	status = gpiod_export(desc, true);
-	if (status < 0)
+
+	/*
+	 * If userspace is requesting the GPIO via sysfs, make them explicitly
+	 * configure reset tolerance each time by unconditionally disabling it
+	 * here, as the export and configuration steps are not atomic.
+	 */
+	status = gpiod_set_reset_tolerant(desc, false);
+	if (status < 0) {
 		gpiod_free(desc);
-	else
-		set_bit(FLAG_SYSFS, &desc->flags);
+	} else {
+		status = gpiod_export(desc, true);
+		if (status < 0)
+			gpiod_free(desc);
+		else
+			set_bit(FLAG_SYSFS, &desc->flags);
+	}
 
 done:
 	if (status)
-- 
2.11.0
