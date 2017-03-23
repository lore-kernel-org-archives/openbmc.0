Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpcV403K9zDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rrthwhyt"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id 81so26204240pgh.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6T7KXK4zu1cyzXjRdNEGW3o66xe60XWQ0h/cgw+p1Y0=;
 b=RrthwhytYvD3K+1tlTJYwZTfSQMSS7SbMifOhv1m3IoPvgsJMvZT5RuA+xcZqjGUxA
 qQIpmiR5IwdX1sTWszTEpEI8s17Ha/AbB5NX20NoO2JqMlDjHd2n27h7AC59pzPPQKY4
 +YZg9md1bdmpLNXynIEJsmDMtuvZm9YKrVnhCP0KjAtI/AxG7SiXUp14k3281ggXrXQX
 zDhExDxhJkn8RvdLMX0n4t6SHnpsE3Fpn8a7H028Yj7E1HLdnfpFAfI1jh8YxMXHkp5M
 0s8Ij0TZnXX1ibU4MnMPnm91C6SVMSEyPHkiDO/ku8zInGq5wpGYkx5Hqx8NjWduNcw/
 a+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6T7KXK4zu1cyzXjRdNEGW3o66xe60XWQ0h/cgw+p1Y0=;
 b=eZXqm/JtJvWntMdu8xx6di6d/HTOl0J+lMYlgh8wS3h3lt71qwCIhzZ+iW1FoISGX2
 F8H8HAVmmbVTKNI/LQ5tP8Mg0Vw32oQOiGhTMVmwuApoFEgy7Wk0bwSYuIaEvFn+EAoK
 78HHXvfWtEWbQltZ4zn/FezYUtGAm/G6nulyouoeL+rq9DQXafbpxb6w8dv3XvXh6TTr
 Ci4rXvE7oppn14zEbEY+/tGWrC6jaENxkV4752Cehha2hbhNuuCfhGKUif4LqMI03LvA
 OcoG8xFkejbBWuwz+3UifVR+Y3B3yFjEM+fzzvBueuygCkNNjh6u/C4/mn896eXB2nqi
 bKcA==
X-Gm-Message-State: AFeK/H1l+raCNthTv5RMgCdY2D1d0hNY6Se7Gc6yEWNnBCZw5iHasOJs+UjYw6+qSzZavw==
X-Received: by 10.84.130.66 with SMTP id 60mr1386951plc.115.1490251466345;
 Wed, 22 Mar 2017 23:44:26 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id e67sm7645166pfa.87.2017.03.22.23.44.25
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 22 Mar 2017 23:44:25 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/2] arm: aspeed: romulus: Disable LPC reset for
 UART1
Date: Thu, 23 Mar 2017 14:44:02 +0800
Message-Id: <1490251442-6538-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Thu, 23 Mar 2017 06:44:28 -0000

This follows Zaius's fix, that clear the LPC block control bit that
enables LPCRST# as a reset source for UART1, making UART1
immediately useful in that it won't discard bytes.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 7ac006a..a7b03a0 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -220,6 +220,7 @@ static void __init do_witherspoon_setup(void)
 
 static void __init do_romulus_setup(void)
 {
+	unsigned long reg;
 	do_common_setup();
 
 	/* Set SPI1 CE1 decoding window to 0x34000000 */
@@ -227,6 +228,14 @@ static void __init do_romulus_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+    /* Disable default behavior of UART1 being held in reset by LPCRST#.
+     * By releasing UART1 from being controlled by LPC reset, it becomes
+     * immediately available regardless of the host being up.
+     */
+    reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+    /* Clear "Enable UART1 reset source from LPC" */
+    writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 #define SCU_PASSWORD	0x1688A8A8
-- 
1.9.1
