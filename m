Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3c5ymBzDsYT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=oVSBxKf5; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A1036641139
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KbNnLMUHOBxe for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:34:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 279C264113B
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:36 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 279C264113B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971676; bh=3SYr07yOd4TQmJX3GlJfrx/xYfoglqD0WjFa8+T+y2Q=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=oVSBxKf5vP0zTQSDUpXI2QcygmT1qBKIv4r/ie7s4uOZMl7dr85AKoUYBSPlstUxH
 Cv/ULNHC+5FUNEGOx8zxrzMYCEhJiISA1jzzNGI+6343n8ty5dFWFRLDwZ+nqA9pnO
 GTYY+FMB1RCIIKtNFe3K8OVeD1QCvJV+R+MZVBNw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Pz_zgiCYUw4P for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:34:36 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id EC551641139
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:34:35 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:34:35 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <712861897.194624.1473971675913.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 05/16] arm/dts: Remove mac hardware checksum from Firestone
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: arm/dts: Remove mac hardware checksum from Firestone
Thread-Index: DsnX9aZ3Exqxd1QkJxJYFv4OYy64AA==
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
X-List-Received-Date: Thu, 15 Sep 2016 20:43:41 -0000

 BMC Board

Hardware checksumming doesn't work.

Without this patch pings work but more complex network interactions like SSH
fail.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 2ec9e44..ae1a633 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -51,6 +51,8 @@
 
 &mac0 {
 	status = "okay";
+
+	no-hw-checksum;
 };
 
 &i2c0 {
-- 
1.7.9.5
