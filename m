Return-Path: <jaghu@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tM3H233Q5zDvrm
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TtUGjRDl"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id x23so116126925pgx.1
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 23:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r680+rJXibBvUqfZlnBoy3DZDcJCGZBJH13vJdwITsA=;
 b=TtUGjRDlhfjtC5u3iqpLtJHXdSRrSVG0nqhYuvXwAVkzy1Nev+9Saj9w9bz6+j8h9/
 obzn4fXbjsGzKKN14e4mCP0DoTVDM29KcqwXhLNOqNYEHb6n1Z5FGSw8mGvUGsZ6SqR8
 iloSonR7jFMeNxlpgWHY8y64f30gnG4Oe0fz7VOzFnVNKjE5L5ytA/wrA+RpNT8rcNiV
 RZsHtI3lLHthD3vrr1SF+ThA4kqzHnrJrX+Hq1QTnUSMpVxAuB6wiUcD1vCtPc8X10Qy
 zaF/q26b88+XlQBAAJ/ZZmlZXzwMZI6I4/2BFd3dj5uzcICBxQFogQMxWe2Kk0n70C6Q
 mggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r680+rJXibBvUqfZlnBoy3DZDcJCGZBJH13vJdwITsA=;
 b=i+a05bYWBd2Gksp29lqD1vMml3L3Mhcb6C5onKEuWtq45Mz1CDxgD+IIncUPp0ZOzX
 lOY0blQ6Rz/brc3BsEgeso6bvKw6fA3WveSb02y4MxQpLBSPM91WlSX3bogudZAOenAI
 bXeeDITTs+1S8waW3zyE94NKWJfA+Q0+oHphRRJDmAEyv8XkiIXf+DaZD49jrkgAy7H/
 O64zqyW2NOz26mN1YWypmZkaPJ9wXePDNR+KD3iy8AwCMxyIvt5XxGcFcc48TEjxrLo9
 3pl2k4U5S4Z3xLtcELCT9p18zT34weM+2ag99vUEF6ati7T67v7neK8U7Ge7G9IUkXGo
 KOVA==
X-Gm-Message-State: AKaTC00OXMbjcM1sJ4qZ+HHkIe3Wtnx90nBRlFYrBmNgBJ2p9ns8CNs4I0lasV9p44AtItQQ
X-Received: by 10.99.145.74 with SMTP id l71mr18045435pge.128.1479626876757;
 Sat, 19 Nov 2016 23:27:56 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id r2sm28825975pfi.67.2016.11.19.23.27.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 19 Nov 2016 23:27:55 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Sat, 19 Nov 2016 23:27:36 -0800
Message-Id: <1479626856-18511-5-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479626856-18511-1-git-send-email-jaghu@google.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Sun, 20 Nov 2016 07:27:59 -0000

Add clock, data and clear signal GPIO lines to control seven segment display on
zaius platform.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- Moved the doc file to the same commit as the driver that it describes
-  as suggested by Xo
- Removed abbreviation of names as suggested by Xo
- Corrected mismatch of property names between doc and actual usage
-  as suggested by Xo
- Corrected the gpio designator in the second gpios property as suggested by
-  Xo

v3:
- No changes made

v4:
- Included changelog entry as suggested by Joel

v5:
- No changes made

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
