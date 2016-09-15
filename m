Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZbQ62gRnzDsX6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 21:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YzorERgh; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id p2so2013007pap.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C+KkIy3j7I7SkXLncsrd8wnHTgeuSbLWRvhemv2dYJI=;
 b=YzorERghW+JkxQqpS8pYc5JNpsYxa13XtaXHak7lIzbNyXys0ggU1sINoHghP6+C3i
 cnolOPB5Khf3yxbiuPFspMKjEQRpJ9zh907f0ZRTSbWAw8tww2JsdaN11LVj523K/E1E
 cMglpxzXLZlvHg/0RrNRm4kpwJGian/UlIhOtMpv8gtFUnpWgFy5JnnllCc/3CwlA/MN
 6K4ewr+EIj367a3yNecG6YnCQybBDRTKiuSY/qHzasr0NyEpCtad8FcZ8Ds3uPPasyCi
 d4IdRCcohGDwhO1bH4ggPgSD9X63cRxUFo43egp7v85hPY5VbKX7QWP40xJaHfv/OxJO
 Znyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=C+KkIy3j7I7SkXLncsrd8wnHTgeuSbLWRvhemv2dYJI=;
 b=gGDrbVby+6TV9yfhW5sxwn/P5ccMthB2Dg3PI1Q/92guJnp6/AZ2Hn6rE7jQzYK7+O
 V/4GKWJ+SvWyufrFZYlNtsTDjptd6MjkPBbqbbxPmyLMTa8sMb7zjAslgSsllwIugz7U
 IvmzQ+FgsTkCuK+to7O7i5M2xqjw72FbJsRoDHH3KN5sIbIE0mhKC5DfeL5i+F2iMm9O
 bfL48JnLvU5JoEzsX4lrON8hlB2VJOPI8cuBweEcmPN7XHYEMZHxnwmqqzcJm7cdFr75
 SYe+JLOSLft4D9prC3Sbhey/s6m2aosKcw1zlxtCOljHgAxEcYxyuT4oUEh9d2e2RUu3
 UKTA==
X-Gm-Message-State: AE9vXwNUfzMNv84iFL9Cme4IxYatAbDe9pCLW8kaZqfX1s0xZnSVkQASFYaFcyfF3GlRBw==
X-Received: by 10.66.81.201 with SMTP id c9mr13555068pay.14.1473938028759;
 Thu, 15 Sep 2016 04:13:48 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:7414:b01f:d849:6117])
 by smtp.gmail.com with ESMTPSA id xp7sm4460343pac.27.2016.09.15.04.13.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 15 Sep 2016 04:13:48 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 15 Sep 2016 20:43:40 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 3/3] arm: dts: aspeed: Add SPI1 master pinmux hog to
 g5 machines
Date: Thu, 15 Sep 2016 20:43:08 +0930
Message-Id: <20160915111308.31481-3-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160915111308.31481-1-joel@jms.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 15 Sep 2016 11:13:50 -0000

This is for reuqired for using the PNOR on ast2500 based systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 5 +++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index d34e6f15a0cb..a517b4a595b8 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -35,6 +35,11 @@
 	};
 };
 
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_master_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index fcc880a80ee0..d7db9700172f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -36,6 +36,11 @@
 	};
 };
 
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_master_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.9.3
