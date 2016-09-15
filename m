Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZqy436QVzDsYY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:38:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=V0nbasWq; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 23A54640D1E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zVI2KMF3Ie6N for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A92AE641076
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:49 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com A92AE641076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971929; bh=QvqXsL/dZO9f9AgRelytXpqC3m+T0wjeZml1jCvwSs8=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=V0nbasWq/DhFUdGbd5qEYEUo61QrJhHfbDOEjsNqHO8Jd2HY38Qwo3iTCqOwx9twM
 OQx6WgK1zCzjYlh3Wr5A807yFd+mI8Z2PXFerR/EqKmNQZ9pfcXhsffHrBo0hviGXA
 QlOdwWCa88RHdW59d/vO/u/XB9MkO6lQ8a0pblHA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GC8kw4rYVDOD for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:38:49 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 81713640D1E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:38:49 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:38:49 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1486230206.194642.1473971929473.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 16/16] Enable FSI buffer on Firestone
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Enable FSI buffer on Firestone
Thread-Index: rHuWMFgpRW6q/ByPhdfsL416owdsbw==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:38:52 -0000


---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 3b13cfd..ca039ad 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -257,6 +257,15 @@
 	// i2c hub PCA9516A
 };
 
+&gpio {
+	pin_func_mode0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "func_mode0";
+	};
+};
+
 &vuart {
 	status = "okay";
 };
-- 
1.7.9.5
