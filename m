Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRr06NrBzDsdn
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=U+28EsVC; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 72C67641144
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id e8B4ILUD7fMn; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A4A34641145;
 Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com A4A34641145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058135; bh=x2HJPYoVsQfBnCDHboDrwi3c8BSIPyrnUXbOMMYDcaE=;
 h=From:To:Subject:Date:Message-Id;
 b=U+28EsVCFWkIx2RR+tyoMFWuYN3FR3OYnqp0aqaN/TgNyjuQwxeOdw3aH3tjJMEcU
 zXvqo4MpCYyvozqtOSKyejfOneOsoiOIzAJFG9oXOAdjTlu8/ig1iYALMSeTl7gWoc
 yLaqDKOxTHhRcXgc/tI+yz02c0xpbJMvLfdwBYqY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nZ6vDQlJOABB; Fri, 16 Sep 2016 15:35:35 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id DDEA264113B;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 06/17] mach-aspeed: Add missing Firestone setup method and call
Date: Fri, 16 Sep 2016 15:35:22 -0500
Message-Id: <1474058133-27363-7-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:45 -0000

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/arm/mach-aspeed/aspeed.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 1b0ee11..12a63db 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -119,6 +119,18 @@ static void __init do_palmetto_setup(void)
 	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
 }
 
+static void __init do_firestone_setup(void)
+{
+	do_common_setup();
+
+	/* Setup PNOR address mapping for 64M flash */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* Override serial destination to use the dedicated serial port */
+	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
+}
+
 static void __init do_garrison_setup(void)
 {
 	do_common_setup();
@@ -196,6 +208,8 @@ static void __init aspeed_init_early(void)
 		do_barreleye_setup();
 	if (of_machine_is_compatible("tyan,palmetto-bmc"))
 		do_palmetto_setup();
+	if (of_machine_is_compatible("ibm,firestone-bmc"))
+		do_firestone_setup();
 	if (of_machine_is_compatible("ibm,garrison-bmc"))
 		do_garrison_setup();
 	if (of_machine_is_compatible("aspeed,ast2500-evb"))
-- 
1.7.9.5
