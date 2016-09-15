Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZr3b4xcrzDsYW
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 06:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=KnTdUNYk; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A7CA1640EE3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rRn851qQNedn for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:37:49 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2D746641150
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:49 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 2D746641150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1473971869; bh=v3abiQjOfEbDpoHI0XR/06FgDPKAcWhrw/3RqzlE5Ig=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=KnTdUNYkhSnACHWEq7bUlFVuEz7JlDpG4SSwX+xO/+bxq/c1tTEhmugsWre2UcdJj
 HySAe/fgQdPYWuPFG3YmHBwwDfRVmgzo0q/wmCurcd9bW4UkrvdkI8yESZvGAXtVzA
 sayb9NnrHBibD0IF6ayc+krCyItWOQ9/xPHr+fPQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gJZwMmhJJtzk for <openbmc@lists.ozlabs.org>;
 Thu, 15 Sep 2016 15:37:48 -0500 (CDT)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id EA346640EE3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 15:37:48 -0500 (CDT)
Date: Thu, 15 Sep 2016 15:37:48 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Message-ID: <644340813.194637.1473971868909.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 13/16] Enable RGMII pin functions in Firestone DT
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - FF3.6 (Linux)/8.5.0_GA_3042)
Thread-Topic: Enable RGMII pin functions in Firestone DT
Thread-Index: +5zOs1w1bLX+ZXJ9p+0zU+ZlPtWqQw==
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
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 053fafe..a2a2ef2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -72,6 +72,9 @@
 &mac0 {
 	status = "okay";
 
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+
 	no-hw-checksum;
 };
 
-- 
1.7.9.5
