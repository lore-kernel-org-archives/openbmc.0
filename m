Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3b4tgdzDsYT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=nmsHYm/X; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 67053641148
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RM9jgDduWuBQ for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:41 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D75E764114A
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:41 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com D75E764114A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971801; bh=fJeSh6aSezNZfHbfjVvzxOYkAVfiNshm7UWfnPu1ioQ=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=nmsHYm/XD5SDpq20J5lNHLROuGosHg0+OQEJTPl1aFy5/Hp3HCqrZKfHOSvwVeo/z
 dWui6BUH6seOsn8PZYf62kdH9SYXRWX9GPqfKVZ9ry2laTdvkRZjXiTvcZPjJidk8j
 Z0Pm6pQD7LjfGG8xhTy7/hIQ0yhLuwmT6C9QvfKU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 44rkfQiDVjba for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:41 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id A75ED641148
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:41 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:36:41 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <822637739.194632.1473971801609.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 10/16] Add missing UARTs to Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add missing UARTs to Firestone DT
Thread-Index: yIrxFZsoU2sAwtbR/j0bY/H2z2kPHQ==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:43:40 -0000
X-List-Received-Date: Thu, 15 Sep 2016 20:43:40 -0000


---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 82df794..c6e81f4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -9,6 +9,8 @@
 	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
 
 	aliases {
+		serial1 = &uart1;
+		serial2 = &uart2;
 		serial4 = &uart5;
 	};
 
@@ -73,6 +75,14 @@
 	no-hw-checksum;
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
1.7.9.5
