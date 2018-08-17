Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjZnxtNx"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sCP1057yzDqm6
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 16:05:39 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id g23-v6so259552plq.9
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 23:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MHL/UK/rRuToROVWRbnRWAdTrPOxc/IUE2aRKtJqA3w=;
 b=FjZnxtNxKc6i040iazAUhiatV9+dXyomMtG042F0kBocHF2JsYV6KQxrWfZYun6pCr
 vJ5GSWj4t1SFvirraBxhCGdXbhBN4Iu+lcP7mGwIhe5WRhEPknlKO9Hn4/CYPAR4uhvJ
 sItTwoslTWcwfKAIi39KOSvWS0qHWpOzEsTna9sIki2w9Myd+QmhDuNMhTOQJxd/DAnr
 Tw9K8lXtYnoXysq7vxoOraJBA+io5B+1xucdYoqZuA8wiGtXFWkzwz5Vz1eKKm3rGiok
 0QGVF1SDmNxjONtigjdxnelrXeSKT7BFrqg6qt7ph/FZBztO/+PFhwwJ8sXtWjUZi6Ei
 LT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MHL/UK/rRuToROVWRbnRWAdTrPOxc/IUE2aRKtJqA3w=;
 b=mZC/1/aKB8yk1zpd1jVluRj2rNx3THnsbJOAYRIuZtBSMLwpTl9gRcMEnXTQIPB0TY
 PDtAFxmMO4JoDgzykneDURrZ1GCk6d3ys9GBmadz38xa9wd2cUUou5oeiZAMuGpf8kxF
 IUF5thdQkKQbfIjP1EoChDs84C++ZbWzv4cvWEuE1XLm0EjJDhBS4gDAhE7JAzZhb8xl
 vVn2Tr5pA7VBspeIPbwcYD6OD21gTsPfvKtzjiCBUOpSAX8l4vrR9VXz76akNgOGty4g
 t7v7gVyzb92caS5ZufgtMh3GE3EXqp2b2P2IrmvjTLyJdPmraKLNldVXVzsalRn+DqQG
 C1xA==
X-Gm-Message-State: AOUpUlGc0DHEYvii7ZMEU9yWVZ6+7ZqEvOZaK2nA9KtvbZqB6HHO37DH
 Ymfv3VW4Bn2oxElHfPq4SFJ+cGJS
X-Google-Smtp-Source: AA+uWPxtmohiLzJaIuYdwmml50kBK8JEd2ZOvKYDTpsrdC1fVC8ts8VfYn0TI+kTjKraRqHw6wKABA==
X-Received: by 2002:a17:902:7088:: with SMTP id
 z8-v6mr31729642plk.303.1534485937496; 
 Thu, 16 Aug 2018 23:05:37 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id j1-v6sm1459470pfk.125.2018.08.16.23.05.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Aug 2018 23:05:36 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.17 v2] ARM: dts: aspeed: romulus: Enable
 iio-hwmon-battery
Date: Fri, 17 Aug 2018 14:05:25 +0800
Message-Id: <1534485925-63307-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 06:05:42 -0000

Add iio-hwmon-battery using adc channel 12;
Enable adc to make adc running.

Note it requires GPIOR3 to be pulled high to read the voltage, and this
is left for user space to toggle the GPIO to save the battery usage.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 852b552..a910bc8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -83,6 +83,11 @@
 			linux,code = <ASPEED_GPIO(Q, 7)>;
 		};
 	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
 };
 
 #include "ibm-power9-cfam.dtsi"
@@ -304,3 +309,6 @@
 	status = "okay";
 };
 
+&adc {
+	status = "okay";
+};
-- 
2.7.4
