Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh7mv5JmxzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:50:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJyjBH6Y"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id v14so5396343pgn.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 01:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=BwfGR1nFySlkl9/hostZIkGd+uX2mrM6N8rIWYF1zWM=;
 b=mJyjBH6YWocwn43IWmWR0Gfq87p/yCGzsAjEtNGr0XwPcXhRBpk2yum0bdKN3NtRlF
 dxUZE0x3VDU90ioR0agNLPrq230IhJKlGaDzLrBfcbWuiKtkcxgLoAapPtkKRUaoKvlP
 FTRXaOWbBnlTBpZmS+50cV8AE2vdyA7aiQ6ml/fVqsiPiiZpA7aQryFtHVcte2hVo3IR
 ottNWgiSWSNB3p3WgcAxZzQf/b6fNFx8iIzPi3wS5qvyaZGJiliGaoebZtQCqiAQfyVI
 gEmkrbRGi10dP/C55htRkGcIq9Ikxjd/gOA+JL2jf7tlr098KbgJEABUglW/WOro6UHD
 suxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=BwfGR1nFySlkl9/hostZIkGd+uX2mrM6N8rIWYF1zWM=;
 b=W0ALbjuumiWq6X/U3tL/FJUPMhcXQBfbRLEw3hNfPHEbmiPDreb6WxPVc5v1JoMVXi
 Vjvi3dYcS286Y1OlYOyaAk4xFY6DLSv+/sEGTNtmsXnVVQLucv1zRQa+76l8Qlv7vPW3
 3fatdNQFs/3Xl7ScBzrr4riOIi+msgV4UEINVb5kqISdiqg9nbfP58a52s+7S+c70luO
 rhR9Lxf4SBR1XWOj3CMn8q7NvyDFzOO155uXfu+ymZCSCnQmQDIwpnNFLBMUYOmuj1Lb
 t0rMRaaW6hmgXRsxJPMJNQOGh9HFGj0kMS7m0DIvwcq6X7QYuHpTTtfyRk2S9L5U6M1r
 GAQg==
X-Gm-Message-State: AODbwcCncO4Ld2oyncz6HzcTSccYgp/+/uSwiIfTyFYVBZcmgRnkygmB
 6Uy2rEmyyn7XbfzdB3cV0Q==
X-Received: by 10.98.217.155 with SMTP id b27mr18235561pfl.17.1496652604868;
 Mon, 05 Jun 2017 01:50:04 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u9sm54694618pgn.55.2017.06.05.01.50.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Jun 2017 01:50:04 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 05 Jun 2017 18:19:59 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10] hwmon (occ): Fix kconfig and makefile
Date: Mon,  5 Jun 2017 18:19:54 +0930
Message-Id: <20170605084954.8512-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 05 Jun 2017 08:50:08 -0000

The OCC driver was not buildable. Clean up the makefile and kconfig.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/Makefile     |  2 +-
 drivers/hwmon/occ/Kconfig  | 15 +--------------
 drivers/hwmon/occ/Makefile |  8 +-------
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index f03dd0a15933..2e803f56446e 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
+obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ/
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
@@ -170,7 +171,6 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
-obj-$(CONFIG_SENSORS_OCC)	+= occ/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index 34488de15900..8196b50c1693 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -2,23 +2,10 @@
 # On-Chip Controller configuration
 #
 
-menuconfig SENSORS_OCC
-	tristate "POWER On-Chip Controller"
-	help
-	  If you say yes here you get support for monitoring the IBM POWER
-	  processor sensors via the On-Chip Controller (OCC).
-
-	  This driver can also be built as a module. If so, the module will be
-	  called occ-hwmon.
-
-if SENSORS_OCC
-
 config SENSORS_OCC_P9_SBE
 	bool "POWER9 OCC via SBE"
-	depends on SBEFIFO_OCC
+	depends on OCCFIFO
 	help
 	  If you say yes here you get support for monitoring the POWER9
 	  processor sensors via the OCC, from a service processor, over SBE
 	  engine on FSI bus.
-
-endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index adc7a9c458d6..3b0ddc6c1e52 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,7 +1 @@
-occ-hwmon-objs := common.o
-
-ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
-occ-hwmon-objs += p9.o p9_sbe.o
-endif
-
-obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
+obj-y += p9.o p9_sbe.o common.o
-- 
2.11.0
