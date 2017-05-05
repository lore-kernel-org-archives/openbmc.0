Return-Path: <maxims@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpV3XNDzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KD/DhlEl"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id q20so8267171pfg.0
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fbg4IokXIwjsA5SFDamLBHBsn1WCgKRQum06EVmnkLI=;
 b=KD/DhlEl+PDmqWJuXWfAck0sSMSsCVZH3y30eRhTK4o/8DsLeFNGXrHZ/1yxRoHjOD
 wSaypzgGqiWsCOReFUzJ3eOOdeDqgYPQTT1+hoVMKoXwjTBmrC97hJBbyneNDL8IKVBa
 7+W23xVcSjKWjo2fkTB8oFutl4Nsbe1eC/txHXPzQ7n3KxHd4czp+ZNRkh4wn+tgoGAC
 C7/VRGPQn51qKcBqXsxmYmYdudad1w1pLhKiX7TAIgpiDymdnvTZaLOPpe2+4+GzDhAS
 h6So09q/Km2U2Fc+x2pFyJVTv63jv51dLrrDitCAO+1APSfXM/I3XX2pJ5KmzJ3D36EO
 OK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fbg4IokXIwjsA5SFDamLBHBsn1WCgKRQum06EVmnkLI=;
 b=Y3xCnxK9DwTwTfCJb6tvmWJdw1G5PPNQWAqfh6LU2Xe1SOvrOfuK/Kz0jzL2DFRfih
 BX2SnEi9qo8rz5sThDM76sn3rkMJPALxV9siuNZpqfiDsEfigziskZaHOPKwkGPBCFuJ
 cXMBfENOtTfaRsFae3S04bg4lLMab/9Zl3DI2pGPmTdinvoq/cw49AyNj3MRxVp8wRBX
 cHA4hv0w602h1wwZQQcX9QkqWmTGg5zJVmH2jcJDHHLsZWfK6H8aYmBtOgUfP561Ukr/
 vkTSf5HmqT9x8Vs5Kd1202no1ef3rD+I/jaqQ1pTvwJ41XkeaexrG13MmWyRC+FM5f6o
 IvQg==
X-Gm-Message-State: AN3rC/5IqREUez11b3GAkCMhlBvhpZ8mU62+gswFtajOZtIsbjQVaCYQ
 HVAWhpFMsrM4tynf
X-Received: by 10.99.121.67 with SMTP id u64mr5982734pgc.230.1494021696533;
 Fri, 05 May 2017 15:01:36 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:35 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v2 02/15] dm: Simple Watchdog uclass
Date: Fri,  5 May 2017 15:01:02 -0700
Message-Id: <20170505220115.143025-3-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:39 -0000

This is a simple uclass for Watchdog Timers. It has four operations:
start, restart, reset, stop. Drivers must implement start, restart and
stop operations, while implementing reset is optional: It's default
implementation expires watchdog timer in one clock tick.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v2:
- Remove "probe" function from sandbox wdt driver
- Fix include order

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
 drivers/watchdog/sandbox_wdt.c   |  66 ++++++++++++++++++++++++
 drivers/watchdog/wdt-uclass.c    |  72 ++++++++++++++++++++++++++
 include/dm/uclass-id.h           |   1 +
 include/wdt.h                    | 107 +++++++++++++++++++++++++++++++++++++++
 test/dm/Makefile                 |   1 +
 test/dm/wdt.c                    |  40 +++++++++++++++
 11 files changed, 325 insertions(+)
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
index 0000000000..02b57f3986
--- /dev/null
+++ b/drivers/watchdog/sandbox_wdt.c
@@ -0,0 +1,66 @@
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
2.13.0.rc1.294.g07d810a77f-goog
