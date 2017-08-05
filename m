Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPQtP3t2RzDqb7
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 11:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n7xe21dB"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id o86so13764858pfj.1
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 18:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mSAPytXHx55lR8Ejm6gFdSvo3RumeYLmra7gQMgaSPU=;
 b=n7xe21dBDLAzNdyHQQkIiBfsOfdNRsYMeHbHGzoChUMns2jwKlAkjiz3s7Z8nuz3FX
 O888CuMsFbqBrPK5RSIy6X3yMclhN2+EMAk6saPplCFEhmRNfWWGC/M2mn4eci9rIyXN
 iewnTFUpz33nfb5cGrc5tAtoHSAqx17qZmxi6PqiYRGzYerF/mhzF2RQTT0EIfitpXzC
 2j2K4XC/F4Q+MWrx5EnrHRhxVHIDBVxIrnfQhJKXpIHyq19Vs30B4JNvEDoIq0hHycho
 DnZ93p9uDYUNUif7AkHa+9b/QlUpJSNJrLUW//n9YTHjkOkiz5HTnpcMrp8ObpYhRERJ
 Aqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mSAPytXHx55lR8Ejm6gFdSvo3RumeYLmra7gQMgaSPU=;
 b=i7yOIX88BXCd4j5r//Nbtn0CCq1kh2AXDq4aKl3bM+IDVdykZzwRLI+lz/x3rM5BsE
 4n1OPf9c9jDlAHGEZgO9VDYI0gfz/SLAUcDwzSENaATDTBj3s+HTVIr755xG34ApZX34
 J/4ayicqEzG1zMgE7mF8j9AoLXdJHDxYpQWUljP8ywW+DARYpE+NZzrwxIpRUEaTtTQA
 54pGboscd1M7loP78qpySzVVJYsnngykoxOZiwcM1WdBCoEJp9lgpCReDxL0V7chO6GG
 8R6nhqP+RiJuA5BQgWfUoOjIiqMgafSx9siMhrQ+KgCE107OoF0L+xwVbazn92uzO58R
 WSpg==
X-Gm-Message-State: AIVw1130hqZHsyzzYiW8wrnRZzoffodzeJnw/JyW80B5bua7P61/zxIn
 1i6qyfqVUcicdCTK
X-Received: by 10.98.86.154 with SMTP id h26mr4353650pfj.250.1501895947751;
 Fri, 04 Aug 2017 18:19:07 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id x81sm5050721pfi.20.2017.08.04.18.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Aug 2017 18:19:07 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org, benjaminfair@google.com
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 4/4] ipmi: bt-bmc: move Aspeed IPMI BMC driver to ipmi_bmc
Date: Fri,  4 Aug 2017 18:18:55 -0700
Message-Id: <20170805011855.1027-5-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
In-Reply-To: <20170805011855.1027-1-brendanhiggins@google.com>
References: <20170805011855.1027-1-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 05 Aug 2017 01:19:10 -0000

From: Benjamin Fair <benjaminfair@google.com>

The ipmi_bmc folder contains drivers for a BMC to communicate using
IPMI. The ipmi folder is only for drivers on the host side using the
OpenIPMI framework.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v2:
---
 drivers/char/ipmi/Kconfig                                     | 9 ---------
 drivers/char/ipmi/Makefile                                    | 1 -
 drivers/char/ipmi_bmc/Kconfig                                 | 9 +++++++++
 drivers/char/ipmi_bmc/Makefile                                | 1 +
 drivers/char/{ipmi/bt-bmc.c => ipmi_bmc/ipmi_bmc_bt_aspeed.c} | 0
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/char/{ipmi/bt-bmc.c => ipmi_bmc/ipmi_bmc_bt_aspeed.c} (100%)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index a8734a369cb0..09ce9f64abf8 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -84,12 +84,3 @@ config IPMI_BT_I2C
 	tristate 'BT IPMI bmc driver over I2c'
 
 endif # IPMI_HANDLER
-
-config ASPEED_BT_IPMI_BMC
-	depends on ARCH_ASPEED || COMPILE_TEST
-       depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
-	tristate "BT IPMI bmc driver"
-	help
-	  Provides a driver for the BT (Block Transfer) IPMI interface
-	  found on Aspeed SOCs (AST2400 and AST2500). The driver
-	  implements the BMC side of the BT interface.
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 323de0b0b8b5..f0b5672cdca9 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_BT_I2C) += ipmi_bt_i2c.o
-obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
diff --git a/drivers/char/ipmi_bmc/Kconfig b/drivers/char/ipmi_bmc/Kconfig
index 26c8e0cb765c..b6af38455702 100644
--- a/drivers/char/ipmi_bmc/Kconfig
+++ b/drivers/char/ipmi_bmc/Kconfig
@@ -19,4 +19,13 @@ config IPMI_BMC_BT_I2C
 	  Provides a driver that uses IPMI Block Transfer messages and
 	  semantics on top of plain old I2C.
 
+config ASPEED_BT_IPMI_BMC
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
+	tristate "BT IPMI bmc driver"
+	help
+	  Provides a driver for the BT (Block Transfer) IPMI interface
+	  found on Aspeed SOCs (AST2400 and AST2500). The driver
+	  implements the BMC side of the BT interface.
+
 endif # IPMI_BMC
diff --git a/drivers/char/ipmi_bmc/Makefile b/drivers/char/ipmi_bmc/Makefile
index dfe5128f8158..8bff32b55c24 100644
--- a/drivers/char/ipmi_bmc/Makefile
+++ b/drivers/char/ipmi_bmc/Makefile
@@ -3,3 +3,4 @@
 #
 
 obj-$(CONFIG_IPMI_BMC_BT_I2C) += ipmi_bmc_bt_i2c.o
+obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += ipmi_bmc_bt_aspeed.o
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
similarity index 100%
rename from drivers/char/ipmi/bt-bmc.c
rename to drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
-- 
2.14.0.rc1.383.gd1ce394fe2-goog
