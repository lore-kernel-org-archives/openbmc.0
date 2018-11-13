Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VC3qphu7"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vCGZ4CMWzF3LF
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 14:07:18 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id u3-v6so2607825pfm.4
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKESfjXr9CWZm+7CfGT8Vl4VgLMPUJp3mbNjyX2WZ6A=;
 b=VC3qphu7egW57W5Etrby0Zi5nCY0ObB6O8ZCUFxnSrNlq5C030uCatwhIH2n0Wbr44
 ARQ7JTRYsn0CpJFSL1bkgyQxXKD2SQ++xq5yP8QeSKF7iMAO+IA1sdVAAtRpTU2/iI8Z
 /Z3FXDksNx7lnXO9EHWqrq9fR1f5ksNjT3RyxFqBVOwaLbRlVihwXUl5P3JmsWuR2H0a
 aGIIG+dI2c8j4vmRaHSQ5AAava10aS6M318wiBMvNbz9zWTIj1LtSXg14uRnNsHb/KUs
 OMOZaLEI/W5y7c3J5rFVqTThgKaBfZOsBplGYTxtMjFpo2xWly5MCLMO3aZIi204tPEX
 Ri7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OKESfjXr9CWZm+7CfGT8Vl4VgLMPUJp3mbNjyX2WZ6A=;
 b=rXxk/4aZfaE6IvZlj6KeRLphgfZphYM3FCzqRdSb/DXbJs7U44cgB5QWrLuu97qnYJ
 d/Og0boryWyRfZQE/cvJSkf6wel8Zm0TZxbzIbfvS9lfBesFJtn3vSxhPMUoNocYzMfF
 GRv5uEwj3oHMDuMIOoRZ+DZrPHwGCvqy48ovwymyKzEEqFSnMufwN/SWRBuroCQ9DHP4
 6lajO/xQZHVsHCSAffYv0imSN2HRnXVYZvEx5R9xSz8AE6s0BookculUEhrOfwsjb6nQ
 rpNvJVDDvH4MTtuKZhbR63h2aVotAnmFFwKfkfXd1zVK4GppEuUdRtMzw64bF22g1hng
 id5g==
X-Gm-Message-State: AGRZ1gL1UVCZd/yZd1WOjBk8582oiiWyqS4wmDGqQCO7rwYujKlzAIMt
 z+qE3nzyqSbayP0eRAeDUmgXHW8n
X-Google-Smtp-Source: AJdET5f7yuTOk6KZpjE8NGX5OZhkekWl23wFQO15zswkQDrwZQRFUA2dFMh7BsuF8bmx1nMWn38OSA==
X-Received: by 2002:a62:15c7:: with SMTP id
 190-v6mr3365661pfv.213.1542078436164; 
 Mon, 12 Nov 2018 19:07:16 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id v185-v6sm19439030pfv.48.2018.11.12.19.07.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Nov 2018 19:07:15 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 13 Nov 2018 13:37:10 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH qemu aspeed-3.1 1/2] aspeed: Add syscon-poweroff to system
Date: Tue, 13 Nov 2018 13:34:20 +1030
Message-Id: <20181113030421.6264-2-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113030421.6264-1-joel@jms.id.au>
References: <20181113030421.6264-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 13 Nov 2018 03:07:19 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e7b87e355f12..66d6e9ed4551 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,8 +21,10 @@
 #include "hw/i2c/smbus.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/device_tree.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
+#include <libfdt.h>
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -126,6 +128,38 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
     g_free(storage);
 }
 
+static void fdt_add_shutdown_node(void *fdt)
+{
+    /* TODO: Support 2400 */
+    const char *scu = "aspeed,ast2500-scu";
+    const char *nodename = "/syscon-poweroff";
+    uint32_t phandle;
+    int offset;
+
+    /* Find the scu phandle */
+    offset = fdt_node_offset_by_compatible(fdt, -1, scu);
+    if (offset < 0) {
+        error_report("%s couldn't find %s, guest shutdown unavailable: %s",
+                     __func__, scu, fdt_strerror(offset));
+        return;
+    }
+    phandle = fdt_get_phandle(fdt, offset);
+
+    /* Add syscon-poweroff node and use 0x1A0, an un-used SCU register */
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cells(fdt, nodename, "regmap", phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "offset", 0x1A0);
+    qemu_fdt_setprop_cells(fdt, nodename, "value", 1);
+}
+
+static void aspeed_board_modify_dtb(const struct arm_boot_info *binfo,
+                                    void *fdt)
+{
+    fdt_add_shutdown_node(fdt);
+}
+
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       Error **errp)
 {
@@ -235,6 +269,7 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.kernel_cmdline = machine->kernel_cmdline;
     aspeed_board_binfo.ram_size = ram_size;
     aspeed_board_binfo.loader_start = sc->info->sdram_base;
+    aspeed_board_binfo.modify_dtb = aspeed_board_modify_dtb;
 
     if (cfg->i2c_init) {
         cfg->i2c_init(bmc);
-- 
2.19.1
