Return-Path: <openbmc+bounces-1995-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE015CD5BC9
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 02:03:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPbdT5jvfz2yS0;
	Tue, 26 May 2026 12:03:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779761020;
	cv=none; b=WJAibG5hiLXGiNqCOV2PNbjs2qMTW7gZPRTJD1nGvVXupAw9bq6wpLkEkkGs1rZqr0j3G8BhkU85fMrxha69F1kVINcpAHdRfUIDVE8mFNDHHqwMtyO8U4lgvuOSQVoO6TI2h5oWqgdpLK2dgy5w/tEEa5EI6QvE/Re4+SE9QLb8OsBrnt1QGdW0NgOwujzHE90uW6On44bytEFtcS29rpyQDG+3D4GihTUQjdn+9DcGnJJnHsHbfhWntrX3nQ39ov6nGjSw2Knpuimiqng9kwSu3TyP/gJXAFT9H8jr+FYrxywoP+4KCK2tn281LU7MJUHZKKX7BTy/md5fU+zGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779761020; c=relaxed/relaxed;
	bh=pJL/ogjxn8vi2j8vXzqpR7dF5vfmIckftNAP8ZF8edM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5cDmuGVQuHMpdXs952zJ4tgBPp0eSVwcmRQ6C0GabgTFc5joh4yafedn+jDR2TMFjQIpmf74UWMmF4N6elt9Ff/gyckFpdNrIlsJq0dAU4Jb7PJHBvshEeQBQnB2jb3rmV+oy3UCfsZ1nQ5eXOPyu2Utd+igVzROTEVOyrYPYQoXMcuM44JFkupY6M1Mhtdv5V7NGBhOz8GkhEG5ghT6GODkRbOlXNdHbNGYRrOXI+JANQak82A4PEtbwwJLlHqywtDwLIDntUD6wiO9qHRbDJWOgJ0B/KMtLPjzLKqU2OVTW3ywh5yL9rX0QZ+BfYdldstPenHRHAQmO7Op63uDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwrvxGkL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b129; helo=mail-yx1-xb129.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwrvxGkL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b129; helo=mail-yx1-xb129.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb129.google.com (mail-yx1-xb129.google.com [IPv6:2607:f8b0:4864:20::b129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gPbdR4xR9z2xSb
	for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 12:03:39 +1000 (AEST)
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-651b4d09141so9857228d50.1
        for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 19:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779761017; x=1780365817; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJL/ogjxn8vi2j8vXzqpR7dF5vfmIckftNAP8ZF8edM=;
        b=bwrvxGkLdEDfgRq7j5XW9JKN4XfkUXPoRCHaU60qSn6z2kBXRBxlJnuGhB3xc4Nv81
         VroQumUhz70QxDDZsUu+KrCOeQWygKGP27618axJUJ4Iod/EMhr9d+Q8fGIGJ4IVa8sR
         dNG/EoZJLnBNGKvOkJvA9PtXYiTX/XkWJ8FtiW9A5CnEi0f52dzverwBH0f1jwq7D7t7
         vpBHD53pHqgQY7wPqSLIog3nye+lL/GeM3f2TlDXol9rks+N7cd7L66QMsrtRXjamjgK
         vPFFaU3Gkz5RVPtGBvoz3HxuT4pujBHXAjvNT8kkRMI9jJgYUzNeEYHHqEh2V4V7UXrI
         95CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779761017; x=1780365817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJL/ogjxn8vi2j8vXzqpR7dF5vfmIckftNAP8ZF8edM=;
        b=V2CgvWjKjWjsN7+6nyeuRLHsrhATvP1tM71m6Dng9Rwhr0c+jUjvx7nZvY+ym7ITZO
         qwpRgilbfqw5kNI/Gp8TxywzYub46fGzha85uDVYx8WdA0qr27k2s1mYgoTLChY8riWx
         4UD/AP3UjsFmloapFyp038YSnbrLbnO6aHYZCT5DlZtNpyl16yE+CKIcgA9WEAU3jcet
         mNu06yJ/0Dxnt9nqICEXkijuSsudR4NitCxaY3B8s9Gi6kR2dUYpNsyr+71NIKrJjGVt
         7mkm0AxJ4bE/6a0MRmPUF1vrU8VTY4+LG8exabnszpQB5zJmW2SFzquAXTCI9yG9OnTb
         OUxQ==
X-Gm-Message-State: AOJu0Yzuis2+hNbL309lA5IXT36NJE1Ulz7dB5a4dKRUhq0lHKmYwO2b
	AXGgInkyEmNKn4Cr6aF7dboPbHHGRfx9xuyMyPAyZSb6a6Gxo/MP6qqb
X-Gm-Gg: Acq92OHEPzR15Yfq3pZyGTnnIvxsLOzyOBg7jvUylICXY1B7jrzWMbe9taKJocd+MyD
	sx5puEbPmdZJlsc3cPzKVgA+Olfp2mW6aqtOzQwS9RFtEhYiqlIQy9QzxNgAt5ry+AScbjZ7Wse
	912xbiVRiBQGUizuuJPIEmHru987lWGaoRkF5KsJXezCO+idaa/TMcWthfzWKgYLcFd3TNcCvhH
	bE021WXf5jvYZJKDs13JZZLsVKFNXWJuUsL0EhanKTFpyA01biLDdH4yhSVZ9bJr2pB5A52+jjb
	Lhrsa7/mPaLyx4Fix0zion07GcEwYPGoIEgOJ1igNiRe4NGMVfahVh70GbpuQGVb9gYEsRcESBr
	e2GMXLsORDOBuBPbXwnAvKV3HuqYU2fKEd743IAL2UPU0YggSfAJrg0zd8ttH6YX5Hv4OV/Ov6M
	JFpS4UPkGvqiHx7jAxQwCMcXTXAkRACPsbXTLM
X-Received: by 2002:a05:690e:dc8:b0:650:327f:4ff0 with SMTP id 956f58d0204a3-65eacd3d6acmr16454238d50.12.1779761017058;
        Mon, 25 May 2026 19:03:37 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0:cdff:ce3f:ce69:17a1])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-65ecfb62626sm5376016d50.5.2026.05.25.19.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:03:36 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 25 May 2026 21:03:23 -0500
Subject: [PATCH u-boot v3 1/2] clk: ast2600: set default clk-delay for all
 ethernet macs to 0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-asus-kommando-v3-1-e6a0ca1b4a3e@gmail.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
In-Reply-To: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Ender Hsieh <andhsieh@nvidia.com>, 
 Marc Olberding <molberding@nvidia.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

u-boot currently setups non zero values for the ethernet mac clk delays.
This is not always needed (depending on the board design), and prevents
us from using rgmii-id as the phy mode in u-boot and linux. u-boot
already has the funationality to read and use values for the clk delays
from the DT, so based on the discussion here [1], update the default
values for these clk delays to be zero instead.

Also update the DTs for 3 existing boards to add scu nodes with the
existing default value for the clk delay. ast2600-fpga and msx4-bmc use
mac0 for networking, so that particular clk-delay value was added.
ast2600-slt uses all 4 macs, so all 4 clk-delay values were added.

Newly added boards that require no clk delays can use rgmii-id mode
directly, and boards that actually require a clk delay can set it via
the scu DT node.

[1] https://lore.kernel.org/openbmc/a7d364d72bbfa4ed3d41e9f7282f8e87a783cf48.camel@codeconstruct.com.au/

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
The fpga and slt DTs don't seem to have the DT nodes sorted in any
order, so I added the scu nodes at the end of those files.

Setting a non-zero clk delay for the msx4 BMC device with
rgmii-id as the phy mode feels wrong. But that's the current state of
the tree (DT + default value of clk delay), so I've kept it as is.

Ender, Marc, would it be possible for someone from nvidia to test this
on the mx4 platform?

Should we test this on the aspeed fpga and slt platforms too? Would
someone from aspeed be able to do this?
---
 arch/arm/dts/ast2600-fpga.dts            |  6 +++++
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts |  6 +++++
 arch/arm/dts/ast2600-slt.dts             | 15 +++++++++++
 drivers/clk/aspeed/clk_ast2600.c         | 45 +++++++++++++-------------------
 4 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
index 68ff64169ccd3f4c595aa043844db91a2bb3b18e..4c34bef32dca184a203e3e5c209da0a4b31af499 100644
--- a/arch/arm/dts/ast2600-fpga.dts
+++ b/arch/arm/dts/ast2600-fpga.dts
@@ -110,3 +110,9 @@
         status = "okay";
 
 };
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+};
diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
index 9df5e74c98f4b6ccc74f93dd96fd4d6bb1b787ad..addd13fb05b1b7656f3e933a19a5dde0bb11eb0f 100644
--- a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
@@ -82,6 +82,12 @@
 	};
 };
 
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+};
+
 &sdrammc {
 	clock-frequency = <400000000>;
 	aspeed,ecc-enabled;
diff --git a/arch/arm/dts/ast2600-slt.dts b/arch/arm/dts/ast2600-slt.dts
index 332620dc1aece1f5ab7d4c130bc8fe31e324d56e..9e86dc271eaa42a86f4c6c4ee805bd975c9e2a11 100644
--- a/arch/arm/dts/ast2600-slt.dts
+++ b/arch/arm/dts/ast2600-slt.dts
@@ -280,3 +280,18 @@
 &ehci1 {
 	status = "okay";
 };
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+	mac1-clk-delay = <0x10 0x0a
+			0x10 0x10
+			0x10 0x10>;
+	mac2-clk-delay = <0x08 0x04
+			0x08 0x04
+			0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			0x08 0x04
+			0x08 0x04>;
+};
diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
index d4fda1b231303041fe649df16eafae638fc77c8b..42295a2c6b4c1ea559906688b318755d3cb6e16a 100644
--- a/drivers/clk/aspeed/clk_ast2600.c
+++ b/drivers/clk/aspeed/clk_ast2600.c
@@ -58,30 +58,21 @@
 #define RGMII12_CLK_OUTPUT_DELAY_PS		1000
 #define RGMII34_CLK_OUTPUT_DELAY_PS		1600
 
-#define MAC_DEF_DELAY_1G			FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_1, 16) |        \
-						FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_1, 10) |         \
-						FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_2, 16) |        \
-						FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_2, 10)
-#define MAC_DEF_DELAY_100M			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 16) |  \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 16) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 16) |  \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 16)
-#define MAC_DEF_DELAY_10M			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 16) |  \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 16) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 16) |  \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 16)
-#define MAC34_DEF_DELAY_1G			FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_1, 8) |         \
-						FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_1, 4) |          \
-						FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_2, 8) |         \
-						FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_2, 4)
-#define MAC34_DEF_DELAY_100M			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 8) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 4) |    \
-						FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 8) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 4)
-#define MAC34_DEF_DELAY_10M			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 8) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 4) |    \
-						FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 8) |   \
-						FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 4)
+#define MAC_DEF_DELAY_1G                                \
+	FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_1, 0) |            \
+			FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_1, 0) |         \
+			FIELD_PREP(MAC_CLK_1G_OUTPUT_DELAY_2, 0) |        \
+			FIELD_PREP(MAC_CLK_1G_INPUT_DELAY_2, 0)
+#define MAC_DEF_DELAY_100M                              \
+	FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 0) |      \
+			FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 0) |   \
+			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 0) |  \
+			FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 0)
+#define MAC_DEF_DELAY_10M                               \
+	FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_1, 0) |      \
+			FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_1, 0) |   \
+			FIELD_PREP(MAC_CLK_100M_10M_OUTPUT_DELAY_2, 0) |  \
+			FIELD_PREP(MAC_CLK_100M_10M_INPUT_DELAY_2, 0)
 
 /*
  * SCU 320 & 330 Frequency counters
@@ -977,9 +968,9 @@ static u32 ast2600_configure_mac34_clk(struct ast2600_clk_priv *priv, struct ude
 	u32 reg[3];
 	int ret;
 
-	reg[0] = MAC34_DEF_DELAY_1G;
-	reg[1] = MAC34_DEF_DELAY_100M;
-	reg[2] = MAC34_DEF_DELAY_10M;
+	reg[0] = MAC_DEF_DELAY_1G;
+	reg[1] = MAC_DEF_DELAY_100M;
+	reg[2] = MAC_DEF_DELAY_10M;
 
 	ret = ast2600_find_dly32_tap(RGMII34_CLK_OUTPUT_DELAY_PS, priv->dly32_lookup[1]);
 	if (ret > 0) {

-- 
2.52.0


