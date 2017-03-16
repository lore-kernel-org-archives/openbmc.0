Return-Path: <maxims@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcm1vsgzDqY5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RcN8qiPD"; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id o126so30112909pfb.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dXhmAoFIWwfIC2XtE1M6uaSzNL4HEa5yBeJ1jgMXGJQ=;
 b=RcN8qiPDLOtzLRcJxQcf6Nhw80spvJqh1+twYXnNrkUHayMoD/77urRUqiNv6Jjzyq
 dA82U3xmQdRZK8G10GCv6g5CA6aaIbyRmBuo/G2SYR45VKEXPzBtpACIGTJ9a0NoQa8N
 4vMVS/G2Q4a8kB02uXgM8Xg0g4rzp4d43muu4hJa3t/JBuKSNDU6nFwweov8zdORK0i6
 83NVKpFtJeCscCGgYw3V4KV1wmDzcKV2goRn3ND3AGgeOd5mBGBnVMsRGRygkxwO4PZc
 IKb/k3LSPz9Lu/qZ81UXVLXcfLDdH4AUU0BfJqegQu6Gt8boNvRcrE2TAxj8Qq5JuehJ
 mC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dXhmAoFIWwfIC2XtE1M6uaSzNL4HEa5yBeJ1jgMXGJQ=;
 b=Tu7AhR6KnBGH4bFfSgMTPmRUfmxFYWd61vQsfQ+bRJqJ5tUcxXzGS2oaH0HKnmWq17
 w9EVq7jH7lutj1WOHEiM7uCGIqrF4M4fJyO2RwYLWFiR4HeqWdBpuWfEI1ioUSTM9lOZ
 A0gzreQFoXcBuNQrksbex1MX0QMCdrxGXCndMWnShnJqL3wES6CGkcbEq9oaN2hB7+vS
 16UBO0V3EO6rEVmGjti78Xf5cvdduajaB/Cs32kOlSg8ECxqqgYQUfQw2UpbsSFYECWW
 wSTIiblF3rtiJyXYLbg9xzO9ChCg1z7Wxr9GttYaVo5sFOp9Nc5jE7zX/f2mvnNf/ZeK
 lbrg==
X-Gm-Message-State: AFeK/H0xypTC5o3rVtCuVgumvWVJvIdle85zAGvCuy1xEWhhp3ASaqxlDbPTAwnr8nN7/Iup
X-Received: by 10.84.138.1 with SMTP id 1mr15208849plo.29.1489700198103;
 Thu, 16 Mar 2017 14:36:38 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 Mar 2017 14:36:37 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org,
	Maxim Sloyko <maxims@google.com>
Subject: [PATCH 02/17] dm: Simple Watchdog uclass
Date: Thu, 16 Mar 2017 14:36:09 -0700
Message-Id: <20170316213624.140344-3-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
In-Reply-To: <20170316213624.140344-1-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
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
X-List-Received-Date: Thu, 16 Mar 2017 21:36:40 -0000

This is a simple uclass for Watchdog Timers. It has four operations:
start, restart, reset, stop. Drivers must implement start, restart and
stop operations, while implementing reset is optional: It's default
implementation expires watchdog timer in one clock tick.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

 drivers/watchdog/Kconfig      | 11 +++++
 drivers/watchdog/Makefile     |  1 +
 drivers/watchdog/wdt-uclass.c | 79 +++++++++++++++++++++++++++++++++++
 include/dm/uclass-id.h        |  1 +
 include/wdt.h                 | 97 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 drivers/watchdog/wdt-uclass.c
 create mode 100644 include/wdt.h

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e69de29bb2..0d7366f3df 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -0,0 +1,11 @@
+menu "Watchdog Timer Support"
+
+config WDT
+	bool "Enable driver model for watchdog timer drivers"
+	depends on DM
+	help
+	  Enable driver model for watchdog timer. At the moment the API
+	  is very simple and only supports four operations:
+	  start, restart, stop and reset (expire immediately).
+	  What exactly happens when the timer expires is up to a particular
+	  device/driver.
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a007ae8234..1aabcb97ae 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_XILINX_TB_WATCHDOG) += xilinx_tb_wdt.o
 obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
 obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
 obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
+obj-$(CONFIG_WDT) += wdt-uclass.o
diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
new file mode 100644
index 0000000000..98a8b529f9
--- /dev/null
+++ b/drivers/watchdog/wdt-uclass.c
@@ -0,0 +1,79 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <wdt.h>
+#include <dm/lists.h>
+#include <dm/device-internal.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+/*
+ * Implement a simple watchdog uclass. Watchdog is basically a timer that
+ * is used to detect or recover from malfunction. During normal operation
+ * the watchdog would be regularly reset to prevent it from timing out.
+ * If, due to a hardware fault or program error, the computer fails to reset
+ * the watchdog, the timer will elapse and generate a timeout signal.
+ * The timeout signal is used to initiate corrective action or actions,
+ * which typically include placing the system in a safe, known state.
+ */
+
+int wdt_start(struct udevice *dev, u64 timeout, ulong flags)
+{
+	const struct wdt_ops *ops = device_get_ops(dev);
+
+	if (!ops->start)
+		return -ENOSYS;
+
+	return ops->start(dev, timeout, flags);
+}
+
+int wdt_stop(struct udevice *dev)
+{
+	const struct wdt_ops *ops = device_get_ops(dev);
+
+	if (!ops->stop)
+		return -ENOSYS;
+
+	return ops->stop(dev);
+}
+
+int wdt_restart(struct udevice *dev)
+{
+	const struct wdt_ops *ops = device_get_ops(dev);
+
+	if (!ops->restart)
+		return -ENOSYS;
+
+	return ops->restart(dev);
+}
+
+int wdt_reset(struct udevice *dev, ulong flags)
+{
+	const struct wdt_ops *ops;
+
+	debug("WDT Resettting: %lu\n", flags);
+	ops = device_get_ops(dev);
+	if (ops->reset) {
+		return ops->reset(dev, flags);
+	} else {
+		if (!ops->start)
+			return -ENOSYS;
+
+		ops->start(dev, 1, flags);
+		while (1)
+			;
+	}
+
+	return 0;
+}
+
+UCLASS_DRIVER(wdt) = {
+	.id		= UCLASS_WDT,
+	.name		= "wdt",
+};
diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
index 8c92d0b030..b73a7fd436 100644
--- a/include/dm/uclass-id.h
+++ b/include/dm/uclass-id.h
@@ -83,6 +83,7 @@ enum uclass_id {
 	UCLASS_VIDEO,		/* Video or LCD device */
 	UCLASS_VIDEO_BRIDGE,	/* Video bridge, e.g. DisplayPort to LVDS */
 	UCLASS_VIDEO_CONSOLE,	/* Text console driver for video device */
+	UCLASS_WDT,		/* Watchdot Timer driver */
 
 	UCLASS_COUNT,
 	UCLASS_INVALID = -1,
diff --git a/include/wdt.h b/include/wdt.h
new file mode 100644
index 0000000000..1da5a962df
--- /dev/null
+++ b/include/wdt.h
@@ -0,0 +1,97 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef _WDT_H_
+#define _WDT_H_
+
+/*
+ * Start the timer
+ *
+ * @dev: WDT Device
+ * @timeout: Number of ticks before timer expires
+ * @flags: Driver specific flags. This might be used to specify
+ * which action needs to be executed when the timer expires
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_start(struct udevice *dev, u64 timeout, ulong flags);
+
+/*
+ * Stop the timer
+ *
+ * @dev: WDT Device
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_stop(struct udevice *dev);
+
+/*
+ * Restart the timer, typically restoring the counter to
+ * the value configured by start()
+ *
+ * @dev: WDT Device
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_restart(struct udevice *dev);
+
+/*
+ * Expire the timer, thus executing its action immediately
+ *
+ * Will either use chosen wdt, based on reset-wdt
+ * chosen property, or the first one available.
+ *
+ * @flags: Driver specific flags
+ * @return 0 if OK -ve on error. If wdt action is system reset,
+ * this function may never return.
+ */
+int wdt_reset(struct udevice *dev, ulong flags);
+
+/*
+ * struct wdt_ops - Driver model wdt operations
+ *
+ * The uclass interface is implemented by all wdt devices which use
+ * driver model.
+ */
+struct wdt_ops {
+	/*
+	 * Start the timer
+	 *
+	 * @dev: WDT Device
+	 * @timeout: Number of ticks before the timer expires
+	 * @flags: Driver specific flags. This might be used to specify
+	 * which action needs to be executed when the timer expires
+	 * @return: 0 if OK, -ve on error
+	 */
+	int (*start)(struct udevice *dev, u64 timeout, ulong flags);
+	/*
+	 * Stop the timer
+	 *
+	 * @dev: WDT Device
+	 * @return: 0 if OK, -ve on error
+	 */
+	int (*stop)(struct udevice *dev);
+	/*
+	 * Restart the timer, typically restoring the counter to
+	 * the value configured by start()
+	 *
+	 * @dev: WDT Device
+	 * @return: 0 if OK, -ve on error
+	 */
+	int (*restart)(struct udevice *dev);
+	/*
+	 * Expire the timer, thus executing the action immediately (optional)
+	 *
+	 * If this function is not provided, default implementation
+	 * will be used for wdt_reset(), which is set the counter to 1
+	 * and wait forever. This is good enough for system level
+	 * reset, but not good enough for resetting peripherals.
+	 *
+	 * @dev: WDT Device
+	 * @flags: Driver specific flags
+	 * @return 0 if OK -ve on error. May not return.
+	 */
+	int (*reset)(struct udevice *dev, ulong flags);
+};
+
+#endif  /* _WDT_H_ */
-- 
2.12.0.367.g23dc2f6d3c-goog
