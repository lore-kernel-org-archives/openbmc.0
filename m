Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3f4lX1zDsYY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=RUX1f70O; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3BBA46403CE
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xTLStPaCSaps for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:37:29 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B5FE764114E
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:29 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com B5FE764114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971849; bh=oUogwWKsZgOHbydbYHTJSe/Bqrq3huiKvZo7v4XcOTo=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=RUX1f70OH9nJPHTBVr/6oLN6lCILckfvxdvZ7QhAwcICl7wvNt5qH6kNqFwBkhZZe
 a5ZVo7jge+4wmlBJACSVjA3ohRwAvtVOCu1IFzXEXP549F/i5VnXxKkzXQeRHSH/Cn
 eDRiJX3WMcvKsHLjbxsL3BEvsGVEMnt1S9b4uFEU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zafoScrHrWW4 for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:37:29 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 917F86403CE
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:29 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:37:29 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <898572551.194635.1473971849548.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 12/16] Enable I2C hub and connected devices in Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Enable I2C hub and connected devices in Firestone DT
Thread-Index: bFfkv2FgjnO17maCI3Xq3oS4M7v1Bw==
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


---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 9a56510..053fafe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -102,7 +102,17 @@
 };
 
 &i2c3 {
+	status = "okay";
+
 	// i2c hub PCA9516A
+	// spruce / madrone PDB
+	// APSS
+	// FIR (fan / SATA backplane)
+	fanctl@52 {
+		compatible = "max,max31785";
+		reg = <0x52>;
+	};
+
 };
 
 &i2c4 {
-- 
1.7.9.5
