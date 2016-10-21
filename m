Return-Path: <mine260309@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZsK2TlJzDt0d
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Lq307Ouq; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id r16so7632311pfg.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=ZpBEHdT7mMP/XyucgzCj8q6MMGPK6q2pbvr2PSygbKE=;
 b=Lq307OuqVpTVFKsn1DP90z/7sNRN0k/3b6ynDx/8W4Q9F1waGNb4uiVnJI2wGELU0z
 YMWuLqBLoi2TOJrXR1jIFPwRkzmZfncvM+W7+HlPNi6ENfv0Yp0TI70jhZ9QkYJ56taP
 L9gI/Cz6TRszj1TjwTTMNMySDusRyXmf+1Jx0kuuOL/GJFiEpq3r/ooLNKQL/8XSDMnu
 2gk6GsVB7eHyY6irqFEB4AcEW/LVO996498Q/F3vmCBL9oyxVebiEkQM9uBsRiQhM0HT
 CJbWVLc5rIC7cS6HDEY/EErvIS8sll0WSy7OKy8Eyvmgz6FROQpkROLEzYCKWXgcCIyj
 0iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZpBEHdT7mMP/XyucgzCj8q6MMGPK6q2pbvr2PSygbKE=;
 b=T6hZ2QlLhb9+mh16I5U1FStJBo3VekU77sKq3Kx+mLFEkgx0QCdMeTx92mTwxOik2g
 WZPUf8ixCfAIFeoUMb4yIF15qQwZaKhh769XzOTvF1vji/OoeBGSuvI3JkMPkCS0vlfj
 ryuzQQbIhY3IJhLVFalzRrF5n7/AwkfuHNv7Usn3dufycjdAkZ4v+8kXQEX13n1hKiz+
 Z9Ukwx4S1FLheo5RHq3/l0RvECTp4b0aN6ujydbWyCdE7j49Y1N8X56WWXlKvp/UBjiI
 ZXQGwzmbq+c3WFVKX/mg8pf1ZVc8SK114cwWGuCDMu7Q1PP0aCxywJbn8Lp0pjhomZlh
 zPhQ==
X-Gm-Message-State: AA6/9RncxPzQF2bxMsKaqfVbE8ZAHK9a/v3YuPM2lwiCrGmOPvuO4ANntwZwsLmlzLFbnQ==
X-Received: by 10.99.171.3 with SMTP id p3mr5448617pgf.119.1477029907545;
 Thu, 20 Oct 2016 23:05:07 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id 21sm1562593pfs.88.2016.10.20.23.05.06
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 20 Oct 2016 23:05:06 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [linux] ARM: dts: aspeed: witherspoon: Add ucd90160 sensor
Date: Fri, 21 Oct 2016 14:03:16 +0800
Message-Id: <1477029796-22983-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Fri, 21 Oct 2016 06:05:10 -0000

Add UCD90160 sensor to enable pmbus hwmon.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index fcc880a..14376f4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -149,6 +149,10 @@
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>;
+	};
 };
 
 &i2c12 {
-- 
1.9.1
