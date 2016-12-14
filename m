Return-Path: <jaghu@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdpmb5s3rzDw5V
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 18:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="im+PaGuW"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id 189so2801593pfz.3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 23:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eoXM+BH8iusaG1gOJr4Gz3y7V+UqQwqlxlCD7IJuk7o=;
 b=im+PaGuWp4FN/LPtoG65YKetH3qpatm7npLekkvpMFZCu6n7u5EWcW7P717ajsV0pj
 cITAsDZM/OJkgTXcC9NOk2dcuJURmJh59QYm6mx02lg3I/vWVahs3CzMPzeq82kysYZX
 6IoTfDLRO+C4BpbAHZJwlljjiZR84s7NEroPk19/6ql5a8rE2w2e1vmpvz+EUYdJlc5l
 7lL9dojrthG/P1u5zig/MvQv2dvUmHcA6HFzRSK/LrfosBVkgMjFpaBbykNpfoGBonAD
 rppX9vhdSK/Nyjt8NAwolgEJqGrDY6t6uzj2HYKSWyZ6fazlKmmLgyBRKPtN8KgXb8dA
 cKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eoXM+BH8iusaG1gOJr4Gz3y7V+UqQwqlxlCD7IJuk7o=;
 b=IHuoUtvenVyQm3eCR/5wZkLK4qx1vWhxtE7/o/h1JyFqYRGUY+VbZBaNnflb/TqFQH
 GUd8IGKdCI3JhlfrFxcSIXjEs+6Vx5AwPb8k60nbi6C9Fc7AHhv1ebYhsiBsVU/9b03K
 99LPU36ce9Zt3VcoXuAhYAtnptz++9fiRMNnClUEVhnUJCDSnAafJNjPTZHACHDqBuId
 Pet9DqwSWtYnLFauP56WAai0+1WlhB9QVQIVGd5+nig1qG0U8YSTkloV5sEayNpD31so
 4+5JNNAJnLDGB5uIw/qLKBBrlMH7uxAocDsLvlHffrDZhxOAWBa/I3P0jRSh+vjPDBxe
 uD2w==
X-Gm-Message-State: AKaTC03gjSo82dNaDhhZzJxC2gm5cIx9up+nGU3rf/V4V0q9OaTVF/gnSY2flCzBLy5ft+n2
X-Received: by 10.84.218.207 with SMTP id g15mr201995048plm.78.1481702173893; 
 Tue, 13 Dec 2016 23:56:13 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y134sm84845071pfg.81.2016.12.13.23.56.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Dec 2016 23:56:12 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Tue, 13 Dec 2016 23:55:04 -0800
Message-Id: <1481702104-8617-5-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 14 Dec 2016 07:56:16 -0000

Add clock, data and clear signal GPIO lines to control seven segment display on
zaius platform.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 8ef4ece..ccb8147 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -43,6 +43,14 @@
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = "1000";
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &fmc {
--
2.8.0.rc3.226.g39d4020
