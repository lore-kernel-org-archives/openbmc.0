Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3b5NGkzDsYX
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=UDGKc2WJ; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A9A5D641144
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zJNh0qsG1mny for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5257A641145
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 5257A641145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971780; bh=O1wDR52Fca+YfhKmKAIzownBJpD/Xv/V5anjpaiyQhk=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=UDGKc2WJnGYbzty5q3hmdseU2g/IQxl9odNGDiAApViDtZoxZTFMXxljhsLUpq6Fp
 feynrw6qH66CrSGJedBFUeQX75cQaZpRwhCe1ufUFEADkDNnHiQXM51qaiL7dmrw6k
 HX5bEwjbjWQwjg9qq7BzzNhijIM8djZFc+XDpKVk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1uehM7yb8pSv for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 2B021641144
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:36:20 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1155688283.194631.1473971780121.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 09/16] Add missing console UART to Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Add missing console UART to Firestone DT
Thread-Index: PNnefcUSW4YBUJ9IDEVcjke3j6EMLg==
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


---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 4f04e76..82df794 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -73,6 +73,10 @@
 	no-hw-checksum;
 };
 
+&uart5 {
+	status = "okay";
+};
+
 &i2c0 {
 	// grounded
 	status = "disabled";
-- 
1.7.9.5
