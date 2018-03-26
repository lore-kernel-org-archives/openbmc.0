Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gu7Mlxw/"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 408j766dwDzF1w5
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 16:16:50 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id f15so1371313pfn.0
 for <openbmc@lists.ozlabs.org>; Sun, 25 Mar 2018 22:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=lLgG4oy/PEonMiKUVMrZm7tuxUZ4Y4L1cvIMSMEAPhM=;
 b=Gu7Mlxw/X79CQ+GiFO/GoNxUoc97vSS1OSTdXiMKO+a1l4UFfadDNzlNJZlFz46KLC
 k0btAZWR3hLDy/9gX83wUAhci7+r0mMe2lrQEVety74xcnbrEM9spQ+apfwg0/zF/Ay0
 RRLFm3ootT46MHNLBzQUTj3wcdNz6pEJEWC74FYdcKKCPoPtulX0se/FV5kiE3nv4iK5
 hHVjLyehD8hC0CUdbDNpa55Iu5yGT+oMekFnSxMvFot/wJufldBGbQ3ed8AVtDQ+ro5z
 KTwVfv+yzzsLOtCOmhks/O+3Ih0lztwhNYigh+TVxSa80rt6jKgrjsnBvhVIEZAoq7Yz
 73cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=lLgG4oy/PEonMiKUVMrZm7tuxUZ4Y4L1cvIMSMEAPhM=;
 b=ZlMWaU+x+bEcTu2A/J87ZOVuq8EnzYsUBniA5MmRxvejrIRRA6tt4Hyh/sYbHVZ2TM
 aFJGuUzCWwLPVax53yg0zyuCkLzFc34GmmB/OgTd252wtZOCp3YYiX5YhbP30ehu45hA
 qyjDLgbDjrCmWYnrdplRQ5hCJ+4SLNqs9v3M/U5Sobk2IVBUr4LfJzg2jHoA8OXFPoCd
 N/sAjWfSw71IgOqfjvKCLumzQQFS5gPRJdawZV0RlPd4HMTHw3efs83gCJFlqnW2wr7W
 Bh1jAmkzCfeW4KA63IDXzshE9veOBvqYv0V8u0oo/l5UOzTiTzyZPcT9xpE2Am38bH4b
 kY/g==
X-Gm-Message-State: AElRT7FBjft5akzVj9J+vclzcB+wUcx5/xAp4uAi8DXhvQiNBgWIlVl1
 0hODk1Hd99qCTe88U9QrbVkgM9dhgv0=
X-Google-Smtp-Source: AG47ELvy8ll+R8QU2KkLwIpWeHRXvatuazLguduXU1u50NAJJT2UqxIH4JhJSbB4K/P5pfHtAHohaQ==
X-Received: by 10.101.99.149 with SMTP id h21mr25183051pgv.345.1522041408523; 
 Sun, 25 Mar 2018 22:16:48 -0700 (PDT)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id z13sm32009627pfk.129.2018.03.25.22.16.45
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 25 Mar 2018 22:16:47 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 26 Mar 2018 15:46:41 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] clk: aspeed: Mark bclk (PCIe) as critical
Date: Mon, 26 Mar 2018 15:46:39 +1030
Message-Id: <20180326051639.16555-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 05:16:51 -0000

This is used by the host to talk to the BMC's PCIe slave device. The BMC
is not involved, but the clock needs to be enabled so the host can use
the device.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 5af80b4e673e..5be88f0a0678 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -97,7 +97,7 @@ static const struct aspeed_gate_data aspeed_gates[] = {
 	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
 	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
 	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */
-	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	0 }, /* PCIe/PCI */
+	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	CLK_IS_CRITICAL }, /* PCIe/PCI */
 	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	0 }, /* DAC */
 	[ASPEED_CLK_GATE_REFCLK] =	{  6, -1, "refclk-gate",	"clkin", CLK_IS_CRITICAL },
 	[ASPEED_CLK_GATE_USBPORT2CLK] =	{  7,  3, "usb-port2-gate",	NULL,	0 }, /* USB2.0 Host port 2 */
-- 
2.15.1
