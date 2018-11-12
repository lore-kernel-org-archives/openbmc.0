Return-Path: <3sY3pWwcKB1g1BK42C36EE6B4.2ECEF4D1C2B8IJI.EPB01I.EH6@flex--bluecmd.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--bluecmd.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=3sy3pwwckb1g1bk42c36ee6b4.2ecef4d1c2b8iji.epb01i.eh6@flex--bluecmd.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iH5NPSTW"; 
 dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42ttPQ2q3LzF3BS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 01:27:00 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id l7-v6so24149598qkd.5
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=NJH+z9nkqe0zjKc5V6bD1KluB00/BmdhAgfU1jgcPOs=;
 b=iH5NPSTWsjYEW9o/tDgh5INNXKJLqm6fP7od1TpDAJpwnJz1o2wm0GgSzLOfpPWOOz
 fj6FKbJmjEgMpJw5aodWmeUO9dMT9H7Ak2TcKUxBMW0TyoCQj0+nHHbybUB//K/wKMXv
 5C11yWM+hFLjPfRLK0nfEJSBLZEuWuM1waICT6ZHBuxalZhin9SSJu9etp+4r0NeisYT
 i9Qi7wtE/1i1CIlwsGx/V9TdGI1TbBnYWDRQPrbvlhN5k0sRj+pwvDUsDSNLc5SHfb3u
 ADk9b0VthyQRBxOTyYOrF8uWZVDPuXtPBPtyH6QMZx99sho3fshNSCebQnSmHfjuQWui
 nPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=NJH+z9nkqe0zjKc5V6bD1KluB00/BmdhAgfU1jgcPOs=;
 b=YRvuBgDaqviNrhDCdK+FTMktZenOF+TWiDCX/tgC6Ge+cbvr1aMekJArQSbOr9Nuru
 1+ymaM4OpgfHYAxSQvU05+pqENKCX13Wqjf9JreJVGMBoZuYxH6q0Yf0HbtY4kpPRIYJ
 ozSx8tePowaaYxMsO813jNQiQ46Eo67NxG40Qzt238Dzv49mNxaj10m+t9Q8gVbO16H5
 GuiBrQMYFWNFHXmJPk0bv5JQr7OegNSvgleLByF+iMq1vwVKbIR4HJ4emoIaMg2V4etw
 wvlehDLKNqd6p/imu53uTC/PB9FfmU6ZJXRQq2+gRkaQowGAqdvSLyn6bc4rPYrvXJ2O
 g8WQ==
X-Gm-Message-State: AGRZ1gLfuUggxhDdAWa8dY9tfrfajLPT6iM8b9eG6x7lOWNroRZRHDYA
 rzFrxqD5CZj06HvzOS2u+2oJ9kedoFgUsija4/W93zfTge1nlen/S5t64gRNTs7sWS4MKBIfKkl
 E4dbO8cKvA6EPSUq+Vhk5CpRtHOqTOaiK6gQOLvdcWpOIsgztI8hziuOI0ewhcws9TFw=
X-Google-Smtp-Source: AJdET5fbmmYdeVD7JhBp2tqx763eJxcMk6iBrxzhpCQAlBPoSlbDEBrO2LsFhP93OZKrn4wv3amil5xpYWCm
X-Received: by 2002:ac8:2aa5:: with SMTP id b34mr781068qta.36.1542032817809;
 Mon, 12 Nov 2018 06:26:57 -0800 (PST)
Date: Mon, 12 Nov 2018 15:25:42 +0100
Message-Id: <20181112142541.166609-1-bluecmd@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
Subject: [PATCH] linux: arch: define aspeed SOC IO mapping
From: Christian Svensson <bluecmd@google.com>
To: openbmc@lists.ozlabs.org
Cc: blue@cmd.nu, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org, 
 Christian Svensson <bluecmd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2018 14:27:07 -0000

Without this IO mapping early printk will simply not work after the
paging and MMU has been setup.

This patch maps all the whole 0x1e600000 IO space to 0xfe600000.

Signed-off-by: Christian Svensson <bluecmd@google.com>
---
 arch/arm/Makefile                 |  1 +
 arch/arm/mach-aspeed/Makefile     |  1 +
 arch/arm/mach-aspeed/aspeed_soc.c | 47 +++++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/iomap.h      | 17 +++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/aspeed_soc.c
 create mode 100644 arch/arm/mach-aspeed/iomap.h

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index fc26c3d7b9b6..f0e3ca392f8c 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -159,6 +159,7 @@ textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
 machine-$(CONFIG_ARCH_ACTIONS)		+= actions
 machine-$(CONFIG_ARCH_ALPINE)		+= alpine
 machine-$(CONFIG_ARCH_ARTPEC)		+= artpec
+machine-$(CONFIG_ARCH_ASPEED)		+= aspeed
 machine-$(CONFIG_ARCH_AT91)		+= at91
 machine-$(CONFIG_ARCH_AXXIA)		+= axxia
 machine-$(CONFIG_ARCH_BCM)		+= bcm
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
new file mode 100644
index 000000000000..426952d47cc3
--- /dev/null
+++ b/arch/arm/mach-aspeed/Makefile
@@ -0,0 +1 @@
+obj-y := aspeed_soc.o
diff --git a/arch/arm/mach-aspeed/aspeed_soc.c b/arch/arm/mach-aspeed/aspeed_soc.c
new file mode 100644
index 000000000000..187276c2813d
--- /dev/null
+++ b/arch/arm/mach-aspeed/aspeed_soc.c
@@ -0,0 +1,47 @@
+/*
+ * Copyright (C) 2018 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/init.h>
+#include <linux/of_platform.h>
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include "iomap.h"
+
+// This is needed for e.g. earlyprintk
+static struct map_desc io_desc[] __initdata = {
+	{
+		.virtual = AST_IO_VIRT,
+		.pfn = __phys_to_pfn(AST_IO_PHYS),
+		.length = AST_IO_SIZE,
+		.type = MT_DEVICE
+	}
+};
+
+static void __init aspeed_map_io(void)
+{
+	iotable_init(io_desc, ARRAY_SIZE(io_desc));
+}
+
+static const char * const aspeed_compat[] = {
+	"aspeed,ast2400",
+	"aspeed,ast2500",
+	NULL
+};
+
+DT_MACHINE_START(ASPEED_DT, "Aspeed SoC")
+	.map_io = aspeed_map_io,
+	.dt_compat = aspeed_compat,
+MACHINE_END
diff --git a/arch/arm/mach-aspeed/iomap.h b/arch/arm/mach-aspeed/iomap.h
new file mode 100644
index 000000000000..7ea5276f3892
--- /dev/null
+++ b/arch/arm/mach-aspeed/iomap.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright (C) 2018 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#define AST_IO_PHYS 0x1e600000
+#define AST_IO_VIRT 0xfe600000
+#define AST_IO_SIZE 0x00200000
-- 
2.19.1.930.g4563a0d9d0-goog
