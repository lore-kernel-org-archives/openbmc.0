Return-Path: <tpearson@raptorengineering.com>
X-Greylist: delayed 304 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Sep 2016 06:38:13 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=o7KIw0di; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZqxK2rTszDsYT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:38:13 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DBA9E641151
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3xc19d2x1WSH for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 54A01641152
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 54A01641152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971890; bh=OhnTlqYR5o5VdaRadCIJs/IVT4tqOK9jG+H1CcpfYXM=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=o7KIw0diuTkHgLQvhelkr+LkoGPjUi9hjCPBVFd903RgO592F37zceApj9GVyazmW
 fFkMhjVA8mkoT12Lr5ZCSlz8Hk48NH463jOP06m1RyuwburYKW+DQE2LgLFgmLklCT
 WrK9gtHk9w55O0Nnkr9lIUHEEJEJZysYLxbPx3t0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id itBsXE__9KrH for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:10 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 28BA7641151
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:10 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:38:09 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <17389698.194638.1473971889890.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 14/16] Enable vuart in Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Enable vuart in Firestone DT
Thread-Index: T3N6F17BkderP0ZNTVlijRec35cdcQ==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:38:14 -0000


This allows the "startup-hacks" service to load.
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index a2a2ef2..90931fd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -9,6 +9,7 @@
 	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
 
 	aliases {
+		serial0 = &vuart;
 		serial1 = &uart1;
 		serial2 = &uart2;
 		serial4 = &uart5;
@@ -209,3 +210,7 @@
 &i2c13 {
 	// i2c hub PCA9516A
 };
+
+&vuart {
+	status = "okay";
+};
-- 
1.7.9.5
