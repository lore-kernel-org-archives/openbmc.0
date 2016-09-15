Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3f5hfRzDsYr
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=iq52CiVS; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 01BCF64114B
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id u9pjYNv4g6SB for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9860E64114C
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:59 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 9860E64114C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971819; bh=kTDl9GWn8vGM7piiJ+Nn0vRUjbG2rpNNNVyRiwg64GQ=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=iq52CiVSNsYxrNlOLJjS2NZpObBXkOdyXXGXrszQ3euOU8VJgKK3OAJ7pt2Zfdjlk
 pvu+wGtrBIPXoyzcqUcXaM8RPZm3/vl12Tv2GRtVqZS3zhfXyQvNiwG5DatDt2YoWi
 HfT2rNA6sFdw2ynfztuJNxrsq1DVTJERO619NCPw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DZeDonb63Zhi for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:36:59 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id 6CF1664114B
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:36:59 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:36:59 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <570298874.194633.1473971819209.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 11/16] Fix Turismo I2C OCC mapping on Firestone
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Fix Turismo I2C OCC mapping on Firestone
Thread-Index: bdOWapIDjCAPXjUqBQgDcR9jRwF9og==
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
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index c6e81f4..9a56510 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -106,12 +106,29 @@
 };
 
 &i2c4 {
+	status = "okay";
+
 	// turismo
+	occ@50 {
+		compatible = "ibm,occ-i2c";
+		reg = <0x50>;
+	};
+
+	tmp423@98 {
+		compatible = "ti,tmp423";
+		reg = <0x80000098>;
+	};
 };
 
 &i2c5 {
 	status = "okay";
 
+	// turismo
+	occ@50 {
+		compatible = "ibm,occ-i2c";
+		reg = <0x50>;
+	};
+
 	tmp423@98 {
 		compatible = "ti,tmp423";
 		reg = <0x80000098>;
@@ -129,7 +146,7 @@
 };
 
 &i2c8 {
-	// FSI
+	// FSI (bit-banged interface via GPIO)
 	status = "disabled";
 };
 
-- 
1.7.9.5
