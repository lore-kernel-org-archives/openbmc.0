Return-Path: <maxims@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfL0NGbzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FN963bVa"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id z127so12279741pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nfJmUX8+0BzQoYyki6LoaEfX+outy81xXuYxP76YClU=;
 b=FN963bVaIhkjWYJ/o2Rpd5caLpRAHE5uyUbDQHEoSb/p/Lidy/YL4wOSMoQa+7h838
 fqw0cU0f0Aliab+EX3PCX603YDG9q0ge4xyDKdp/T7nGWTGrmFE4Lm0vNUgLOpcUwnNj
 6Ng1WwBwm2phGej21tSnsGC9d2JamhXWFarTFhuxI2Xmm6UUXb5n9tptCkL57crzX0pI
 m2nCNVWFDJYNHu2b1RXgLIIXXlSG925d2Xyok3vdDziiONfpWtepYMT6lG6jjBLjWff9
 TwfOmSXBdfmpKFsI/86pcJvk991Os/eWhw+jV4Nz0QZamvfxQSr1NXUJcrVGCWahgbC4
 0R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nfJmUX8+0BzQoYyki6LoaEfX+outy81xXuYxP76YClU=;
 b=XiiZIMTE8s9KBaGJ9Rdo+r385/MOjFCIjTaRsYvwD1g7OFjQIGigEeuGzY0KyLPtHm
 gBvBeHDxIDX188oFQvgxycJUOwq/1R3PTVNNvOGBALKz+NyPGRfKikjl8ja1t9Lh1XNm
 tLBTJbOfwQnPS2hurte4rYaBTAc72e0Jibl71jVacAxZph+KJL9cTFDmk/XrMtGEiRps
 TanVmLquevXgNfoIFpTq/06SP2/lprZOgyd2Ams9PZDIcXa2ZuHq2Hscsb183D5szd6N
 UJtIwZU2u5FCJvubLTz/Hl0Epyql8EgsAS+K5mfVrXWexPZpNvf+AN13813O6kPLfUnH
 hV/A==
X-Gm-Message-State: AN3rC/55S/Q5QFaXe2hjZSoP+07DYnhiaARKi1SNmfhi+9OaBRfM+B4f
 eU64HzVQEn4uk+7L
X-Received: by 10.99.175.7 with SMTP id w7mr13817928pge.170.1492455655652;
 Mon, 17 Apr 2017 12:00:55 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.00.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:00:55 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v1 02/15] dm: Simple Watchdog uclass
Date: Mon, 17 Apr 2017 12:00:21 -0700
Message-Id: <20170417190034.71945-3-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:00:58 -0000

This is a simple uclass for Watchdog Timers. It has four operations:
start, restart, reset, stop. Drivers must implement start, restart and
stop operations, while implementing reset is optional: It's default
implementation expires watchdog timer in one clock tick.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

Changes in v1:
- Rename wdt_reset to wdt_expire_now
- Rename wdt_restart to wdt_reset
- Clarified function documentation in few cases
- Add Sandbox WDT driver and unit tests


---
 arch/sandbox/dts/test.dts        |   4 ++
 arch/sandbox/include/asm/state.h |   9 ++++
 configs/sandbox_defconfig        |   2 +
 drivers/watchdog/Kconfig         |  21 ++++++++
 drivers/watchdog/Makefile        |   2 +
 drivers/watchdog/sandbox_wdt.c   |  76 +++++++++++++++++++++++++++
 drivers/watchdog/wdt-uclass.c    |  72 ++++++++++++++++++++++++++
 include/dm/uclass-id.h           |   1 +
 include/wdt.h                    | 107 +++++++++++++++++++++++++++++++++++++++
 test/dm/Makefile                 |   1 +
 test/dm/wdt.c                    |  40 +++++++++++++++
 11 files changed, 335 insertions(+)
 create mode 100644 drivers/watchdog/sandbox_wdt.c
 create mode 100644 drivers/watchdog/wdt-uclass.c
 create mode 100644 include/wdt.h
 create mode 100644 test/dm/wdt.c

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index fff175d1b7..e04ecc64cc 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -418,6 +418,10 @@
 			};
 		};
 	};
+
+	wdt0: wdt@0 {
+		compatible = "sandbox,wdt";
+	};
 };
 
 #include "sandbox_pmic.dtsi"
diff --git a/arch/sandbox/include/asm/state.h b/arch/sandbox/include/asm/state.h
index 149f28d873..987cc7b49d 100644
--- a/arch/sandbox/include/asm/state.h
+++ b/arch/sandbox/include/asm/state.h
@@ -39,6 +39,12 @@ struct sandbox_spi_info {
 	struct udevice *emul;
 };
 
+struct sandbox_wdt_info {
+	unsigned long long counter;
+	uint reset_count;
+	bool running;
+};
+
 /* The complete state of the test system */
 struct sandbox_state {
 	const char *cmd;		/* Command to execute */
@@ -69,6 +75,9 @@ struct sandbox_state {
 	/* Pointer to information for each SPI bus/cs */
 	struct sandbox_spi_info spi[CONFIG_SANDBOX_SPI_MAX_BUS]
 					[CONFIG_SANDBOX_SPI_MAX_CS];
+
+	/* Information about Watchdog */
+	struct sandbox_wdt_info wdt;
 };
 
 /* Minimum space we guarantee in the state FDT when calling read/write*/
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 01f6f5d5c6..a5f63e027f 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -171,3 +171,5 @@ CONFIG_UNIT_TEST=y
 CONFIG_UT_TIME=y
 CONFIG_UT_DM=y
 CONFIG_UT_ENV=y
+CONFIG_WDT=y
+CONFIG_WDT_SANDBOX=y
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e69de29bb2..7a725f1e6d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -0,0 +1,21 @@
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
+
+config WDT_SANDBOX
+	bool "Enable Watchdog Timer support for Sandbox"
+	depends on SANDBOX && WDT
+	help
+		Enable Watchdog Timer support in Sandbox. This is a dummy device that
+		can be probed and supports all of the methods of WDT, but does not
+		really do anything.
+
+endmenu
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a007ae8234..f523d34d57 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -15,3 +15,5 @@ obj-$(CONFIG_XILINX_TB_WATCHDOG) += xilinx_tb_wdt.o
 obj-$(CONFIG_BFIN_WATCHDOG)  += bfin_wdt.o
 obj-$(CONFIG_OMAP_WATCHDOG) += omap_wdt.o
 obj-$(CONFIG_DESIGNWARE_WATCHDOG) += designware_wdt.o
+obj-$(CONFIG_WDT) += wdt-uclass.o
+obj-$(CONFIG_WDT_SANDBOX) += sandbox_wdt.o
diff --git a/drivers/watchdog/sandbox_wdt.c b/drivers/watchdog/sandbox_wdt.c
new file mode 100644
index 0000000000..34d90bee7e
--- /dev/null
+++ b/drivers/watchdog/sandbox_wdt.c
@@ -0,0 +1,76 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <asm/state.h>
+#include <wdt.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+static int sandbox_wdt_start(struct udevice *dev, u64 timeout, ulong flags)
+{
+	struct sandbox_state *state = state_get_current();
+
+	state->wdt.counter = timeout;
+	state->wdt.running = true;
+
+	return 0;
+}
+
+static int sandbox_wdt_stop(struct udevice *dev)
+{
+	struct sandbox_state *state = state_get_current();
+
+	state->wdt.running = false;
+
+	return 0;
+}
+
+static int sandbox_wdt_reset(struct udevice *dev)
+{
+	struct sandbox_state *state = state_get_current();
+
+	state->wdt.reset_count++;
+
+	return 0;
+}
+
+static int sandbox_wdt_expire_now(struct udevice *dev, ulong flags)
+{
+	sandbox_wdt_start(dev, 1, flags);
+
+	return 0;
+}
+
+static int sandbox_wdt_probe(struct udevice *dev)
+{
+	struct sandbox_state *state = state_get_current();
+
+	memset(&state->wdt, 0, sizeof(state->wdt));
+
+	return 0;
+}
+
+static const struct wdt_ops sandbox_wdt_ops = {
+	.start = sandbox_wdt_start,
+	.reset = sandbox_wdt_reset,
+	.stop = sandbox_wdt_stop,
+	.expire_now = sandbox_wdt_expire_now,
+};
+
+static const struct udevice_id sandbox_wdt_ids[] = {
+	{ .compatible = "sandbox,wdt" },
+	{}
+};
+
+U_BOOT_DRIVER(wdt_sandbox) = {
+	.name = "wdt_sandbox",
+	.id = UCLASS_WDT,
+	.of_match = sandbox_wdt_ids,
+	.ops = &sandbox_wdt_ops,
+	.probe = sandbox_wdt_probe,
+};
diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
new file mode 100644
index 0000000000..ab8a64c354
--- /dev/null
+++ b/drivers/watchdog/wdt-uclass.c
@@ -0,0 +1,72 @@
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
+#include <dm/device-internal.h>
+#include <dm/lists.h>
+
+DECLARE_GLOBAL_DATA_PTR;
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
+int wdt_reset(struct udevice *dev)
+{
+	const struct wdt_ops *ops = device_get_ops(dev);
+
+	if (!ops->reset)
+		return -ENOSYS;
+
+	return ops->reset(dev);
+}
+
+int wdt_expire_now(struct udevice *dev, ulong flags)
+{
+	int ret = 0;
+	const struct wdt_ops *ops;
+
+	debug("WDT Resettting: %lu\n", flags);
+	ops = device_get_ops(dev);
+	if (ops->expire_now) {
+		return ops->expire_now(dev, flags);
+	} else {
+		if (!ops->start)
+			return -ENOSYS;
+
+		ret = ops->start(dev, 1, flags);
+		if (ret < 0)
+			return ret;
+
+		hang();
+	}
+
+	return ret;
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
index 0000000000..0b5f05851a
--- /dev/null
+++ b/include/wdt.h
@@ -0,0 +1,107 @@
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
+ * Implement a simple watchdog uclass. Watchdog is basically a timer that
+ * is used to detect or recover from malfunction. During normal operation
+ * the watchdog would be regularly reset to prevent it from timing out.
+ * If, due to a hardware fault or program error, the computer fails to reset
+ * the watchdog, the timer will elapse and generate a timeout signal.
+ * The timeout signal is used to initiate corrective action or actions,
+ * which typically include placing the system in a safe, known state.
+ */
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
+ * Stop the timer, thus disabling the Watchdog. Use wdt_start to start it again.
+ *
+ * @dev: WDT Device
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_stop(struct udevice *dev);
+
+/*
+ * Reset the timer, typically restoring the counter to
+ * the value configured by start()
+ *
+ * @dev: WDT Device
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_reset(struct udevice *dev);
+
+/*
+ * Expire the timer, thus executing its action immediately.
+ * This is typically used to reset the board or peripherals.
+ *
+ * @dev: WDT Device
+ * @flags: Driver specific flags
+ * @return 0 if OK -ve on error. If wdt action is system reset,
+ * this function may never return.
+ */
+int wdt_expire_now(struct udevice *dev, ulong flags);
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
+	 * Reset the timer, typically restoring the counter to
+	 * the value configured by start()
+	 *
+	 * @dev: WDT Device
+	 * @return: 0 if OK, -ve on error
+	 */
+	int (*reset)(struct udevice *dev);
+	/*
+	 * Expire the timer, thus executing the action immediately (optional)
+	 *
+	 * If this function is not provided, a default implementation
+	 * will be used, which sets the counter to 1
+	 * and waits forever. This is good enough for system level
+	 * reset, where the function is not expected to return, but might not be
+	 * good enough for other use cases.
+	 *
+	 * @dev: WDT Device
+	 * @flags: Driver specific flags
+	 * @return 0 if OK -ve on error. May not return.
+	 */
+	int (*expire_now)(struct udevice *dev, ulong flags);
+};
+
+#endif  /* _WDT_H_ */
diff --git a/test/dm/Makefile b/test/dm/Makefile
index 1885e17c38..78d14c27e6 100644
--- a/test/dm/Makefile
+++ b/test/dm/Makefile
@@ -41,4 +41,5 @@ obj-$(CONFIG_TIMER) += timer.o
 obj-$(CONFIG_DM_VIDEO) += video.o
 obj-$(CONFIG_ADC) += adc.o
 obj-$(CONFIG_SPMI) += spmi.o
+obj-$(CONFIG_WDT) += wdt.o
 endif
diff --git a/test/dm/wdt.c b/test/dm/wdt.c
new file mode 100644
index 0000000000..2ecfceaaff
--- /dev/null
+++ b/test/dm/wdt.c
@@ -0,0 +1,40 @@
+/*
+ * Copyright 2017 Google, Inc
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <wdt.h>
+#include <asm/state.h>
+#include <asm/test.h>
+#include <dm/test.h>
+#include <test/ut.h>
+
+/* Test that watchdog driver functions are called */
+static int dm_test_wdt_base(struct unit_test_state *uts)
+{
+	struct sandbox_state *state = state_get_current();
+	struct udevice *dev;
+	const u64 timeout = 42;
+
+	ut_assertok(uclass_get_device(UCLASS_WDT, 0, &dev));
+	ut_asserteq(0, state->wdt.counter);
+	ut_asserteq(false, state->wdt.running);
+
+	ut_assertok(wdt_start(dev, timeout, 0));
+	ut_asserteq(timeout, state->wdt.counter);
+	ut_asserteq(true, state->wdt.running);
+
+	uint reset_count = state->wdt.reset_count;
+	ut_assertok(wdt_reset(dev));
+	ut_asserteq(reset_count + 1, state->wdt.reset_count);
+	ut_asserteq(true, state->wdt.running);
+
+	ut_assertok(wdt_stop(dev));
+	ut_asserteq(false, state->wdt.running);
+
+	return 0;
+}
+DM_TEST(dm_test_wdt_base, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
-- 
2.12.2.762.g0e3151a226-goog
