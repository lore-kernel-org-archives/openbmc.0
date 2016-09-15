Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3f5ZPyzDsYl
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=mdAFKoxE; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0DFC964113E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id u32P4AZ-OV0S for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:35:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9EACD641140
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 9EACD641140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971702; bh=Asnfc5mTzz6LZ5Da76hXmk5PUPvif9YsDFMy13Fx2Jc=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=mdAFKoxE2MG/fjEn91ze09bvu63jLoo4OL048RCfiVQGVSWpUzstP7CYnkpoiEgdT
 GnGbvN51HvtRf6hPSWXzoTKeW+ZVSLBeOZ5/aLfX+94Xl6YlFqTpwD07rYJZCdJqoO
 dex/EsU/tyapVq/uzl2ioRbUY8iexoqOXaPL+RXY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OAhqFbtEKUYG for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:35:02 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 7925164113E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:35:02 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:35:02 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <183575887.194626.1473971702437.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 06/16] mach-aspeed: Add missing Firestone setup method and
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: mach-aspeed: Add missing Firestone setup method and
Thread-Index: dLwxftB7XWjIyyy+G9TgEMZw031i5A==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 20:43:43 -0000

 call

---
 arch/arm/mach-aspeed/aspeed.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 1b0ee11..ecb613d 100644
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
+	/* SCU setup */
+	writel(0xD7000000, AST_IO(AST_BASE_SCU | 0x88));
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
