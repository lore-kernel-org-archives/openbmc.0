Return-Path: <xow@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZhPq2lr5zDq5x
 for <openbmc@lists.ozlabs.org>; Sat,  4 Mar 2017 07:59:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Rm8FGZHZ"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 77so3321268pgc.1
 for <openbmc@lists.ozlabs.org>; Fri, 03 Mar 2017 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJ19E9oRVla9i2dPPhR7yez6OMkCtyH7UX/tL0AMqEI=;
 b=Rm8FGZHZ+24scDq5ocT1zcGE6QRpYsfE6Mcmv3DWIkowG3lc+/1m3CcPSw09AixHPY
 cTPVxh8AWRjJ8IaaGTrjA4ZK2SMAMfZa5Z+JCkyMs8McYwiJth0N2Awqln/i+xn8jQyx
 2QG3BBwcktvC3HkfBd0p0EfGGi1nXtFR9CLzL//OzGAQOra/a/FMOAqfKZw0257fiscB
 uDetGFnpCyI8NpVB3kfcbXTg7ysmz1xC8Vp+N7bHrTfEwlULT3XC6OvsX+jhvwGyezgM
 CgzX0aci1EDS7OSc01r6U/yZp9odC/HySZkjCiECMxj6SLkR0FfzPjWt4MxJl2HqoZhA
 k6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJ19E9oRVla9i2dPPhR7yez6OMkCtyH7UX/tL0AMqEI=;
 b=Ag4Pf73sIOySEcCPzPA0B5W8320JufjFAgxxYeERKAE+b09d0KFAu9Y3ra//xsbsNL
 R8QN42bNDTwmmYNHlMrE+KIai7zCjr0jMSmXJ6VGHmdzVg3IiwYC8UOYj790G6iRHwfd
 zrik9f5CXv5EzcgRZZRGCpBlCfYjhp3F6MbxVLzEdsOlRKcOnEStUUQsXawlBs141C7Z
 4LFby+bpxnriRA8vT33T046+R0BtyP8PuKvbf7TLMNFQ12M4D7RbwrvXPIDAs+H17SOF
 olTl2qwPn4cMX+c84jBu2rQ1+2EQj/DSmMH7NTYRIatBHgbvFLOSmzQtW4LVUxibcfXf
 A7dQ==
X-Gm-Message-State: AMke39kso+/fWc0kE76Nkg7aWg0ScqSSLinqy5Bp1Wxq1gnEsgoIAKQ/eWfqfLXqziETtOJ2
X-Received: by 10.99.129.200 with SMTP id t191mr5814690pgd.41.1488574763992;
 Fri, 03 Mar 2017 12:59:23 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id x65sm25075426pfx.115.2017.03.03.12.59.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 03 Mar 2017 12:59:23 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: zaius: Enable NC-SI mux
Date: Fri,  3 Mar 2017 12:59:20 -0800
Message-Id: <20170303205920.146751-1-xow@google.com>
X-Mailer: git-send-email 2.12.0.rc1.440.g5b76565f74-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 03 Mar 2017 20:59:28 -0000

The Zaius motherboard has muxes for the RMII lines from the BMC to:
  - BCM5719 LAN on motherboard (LOM)
  - OCP mezzanine connector
  - HDMI form factor connector

Assert the active-low enable line for the muxes. Due to the AST2500
default internal pull-down resistors, the muxes selection lines will
be low. This implicitly selects the LOM for NC-SI.

The NC-SI interface will show up as network interface eth0.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index dc0546869886..3bd70ed810af 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -325,6 +325,13 @@
 		line-name = "iso_u164_en";
 	};
 
+	ncsi_mux_en_n {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "ncsi_mux_en_n";
+	};
+
 	line_bmc_i2c2_sw_rst_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
-- 
2.12.0.rc1.440.g5b76565f74-goog
