Return-Path: <3uslQXAcKB3ksbkqrobdlldib.ZljlmbkYjZifpqp.lwiXYp.lod@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3uslqxackb3ksbkqrobdlldib.zljlmbkyjzifpqp.lwixyp.lod@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n26TyCgg"; 
 dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q0Sc5m0FzDqRG
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 08:46:36 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id k201so1232769ybf.17
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 13:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Yan0GBJm0UZMnZUfAAbuyGSB4huKiWfFgCrKtH/L/Dg=;
 b=n26TyCggORYHgREmiqNQ1dEpBODiLiqLzw1uldpxq/04eqvm8Xb0yhwXUWPL5ulr8l
 U44wl9plyYtm/f3o1zDWk9Ifw4MryiNkxDXFuDpzJFngDKMzKxpls4LHHIL/8dIxa61W
 x+Hff+PuVVaPeYRQB2QQGVP9M4K9k5MzxqO8ULnd7CPSikIbUzUE0zcRhXZTmsAXimP7
 ABsyhUASH+GMpWXlavMRsYPuguXZ/v5nyUrSsUoIE2vaJtz/uPJ9cB/SXfgJFcnJSKJb
 M3MhJtlFFeplCilAgEBp3MfmyhPqe8qoQ86GqG2izAcCB6R9rmMNwAIpaHAUnmxijxQM
 wzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Yan0GBJm0UZMnZUfAAbuyGSB4huKiWfFgCrKtH/L/Dg=;
 b=CtsAScKw+VhpOrB/VFjWrqu21Os/Vxl6laEQG7z86ieuoGmg3uzbRlkJxfA6JS02XO
 SBFgIc58fyeMrK6RLZzI8Nlx94DyLv+yqKx0pFNeKxmcXnn0ynMTd5+3DZ/Ggbv2brsf
 r4BgH1mubxQc4oFSLm0hRf9LN8fYdQSHnPgWepgjzh18Cmxsy1ybRVqbmnA9c/oSlI0G
 /xHo3K7qxLM8GRgrHLntUxY7Pq0d0sM+pRfW0UCQKKTTzXGlCM9npARiH0T+3Y8KViEw
 m6MNOohhyiCa3o34aZNsii2LZB4xyQ+S3WlGdaK0rf08ojg/Qq+pSiG8x2z4TB0D1nR+
 E+NA==
X-Gm-Message-State: AHQUAuYKMhPrLA8OmzJFL/EtW3NZSgZooUJ5jtqpyTeZSqbT1dcCflXp
 PNu6yOVViqyZqSKZrxW5tW+l1Fo6R5dg
X-Google-Smtp-Source: AHgI3IZbdq6fBW1pWPrzw1L46HxK8UdQPLnb4qSEUus2+JNrzp73K4kYs0rPwilX5XFiDGUQbOOfyYcaAT+/
X-Received: by 2002:a25:bac8:: with SMTP id a8mr1740035ybk.52.1548798394488;
 Tue, 29 Jan 2019 13:46:34 -0800 (PST)
Date: Tue, 29 Jan 2019 13:46:24 -0800
Message-Id: <20190129214624.119330-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1.495.gaa96b0ce6b-goog
Subject: [PATCH] ARM: dts: aspeed: quanta-q71l: enable lpc_ctrl node
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, robh+dt@kernel.org, andrew@aj.id.au, 
 mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 21:46:42 -0000

Enable the lpc_ctrl node in the quanta-q71l dts such that the LPC_CLK is
enabled.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 385c0f4b69ee..999679b5ef55 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -116,6 +116,10 @@
 	status = "okay";
 };
 
+&lpc_ctrl {
+	status = "okay";
+};
+
 &lpc_snoop {
 	status = "okay";
 	snoop-ports = <0x80>;
-- 
2.20.1.495.gaa96b0ce6b-goog
