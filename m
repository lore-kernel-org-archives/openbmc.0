Return-Path: <xow@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vClVc0qPmzDqLX
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:12:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="V/e4rZyt"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id 3so45524701pgj.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 17:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxRgp6NkFxSOo3lKXIbHceVNd325VaktjLzDqgp2X+w=;
 b=V/e4rZytTRwSambioCm+9v8L3nTW9blnlz2ziQkwM93csFfMqGomOl0qfFb3pY8nW/
 +LgGq06lnzfC59BtPPipXlytcbwQfAFAAdg2gTF+gc+hYyhaWNt7ZaCG/fleqbtheBWK
 B/6puV3kO7LGh3LECvXUrWydoNVtInHXN2VoBGaT02CU/t4PzQjx2ZpgMSJQ73dX3KPY
 fA+vYji7AzLb4OX2CYyz0XJiapqTf2Gmn768Rc8AJPWAMVosxWTn1jdK9G6EGu081aHj
 fkwXMkxqhZRpoaxJ20/IZ4Nxfhrkvr+j1hzsxOraMD9bvhFrJAMBcnAnxIzUGZwFmHLu
 z0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxRgp6NkFxSOo3lKXIbHceVNd325VaktjLzDqgp2X+w=;
 b=RME3t50I8N+e9yNKsGrmCNj5Njg4azGXxl8OdJp8PCeV5TEjFBGlAb2STGQxxgtnLl
 zPiGLkr+UzvBPyZclaJwgGneo9DotArpbNnGXXB5w9tFaPqEjt86YrK9LHyeAMflTj8h
 0I+WPP97ytLlKbgHiZkPlGXWmFL7UVm1+CZSsEHfn9W3ZoKEChLk8DA91CsQ/1INEIUK
 BCdMiromp43TANYLd2LhfTeZH969MrXiQUV1RLKeAvsrHtrbUF7wH1d+Hq4QyTXh4hOG
 jCryfIhQ+RIbyN7180jvLGds3p5xRH3s0rdCjoQRDdLZsgRmXJQXYswPBOjcLBXWSIRp
 2Huw==
X-Gm-Message-State: AIkVDXKcNWNYyLnHtT5fgnq5Rgk1PJDhds4XNFjXQ1nLWRgg/f20+XcMCToFlfgTcBRdbDyd
X-Received: by 10.98.144.218 with SMTP id q87mr299094pfk.51.1485911574042;
 Tue, 31 Jan 2017 17:12:54 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id p14sm44053983pfl.75.2017.01.31.17.12.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Jan 2017 17:12:53 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Cc: Rick Altherr <raltherr@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Xo Wang <xow@google.com>
Subject: [PATCH linux v3] arm: aspeed: zaius: Disable LPC reset for UART1
Date: Tue, 31 Jan 2017 17:12:30 -0800
Message-Id: <20170201011230.141303-1-xow@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Wed, 01 Feb 2017 01:12:57 -0000

Currently, UART1 on Zaius BMC is unusable until brought out of reset by
powering the host on. In that default reset state, ttyS0 can still be
opened and UART1 silently drops bytes, which is not obviously expected
behavior.

Clear the LPC block control bit that enables LPCRST# as a reset source
for UART1, making UART1 immediately useful in that it won't discard
bytes.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 4bd3680d742d..b7022eaa7b5d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -185,6 +185,14 @@ static void __init do_zaius_setup(void)
 
 	/* Set SPI1 CE0 decoding window to 0x30000000 */
 	writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
+
+	/* Disable default behavior of UART1 being held in reset by LPCRST#.
+	 * By releasing UART1 from being controlled by LPC reset, it becomes
+	 * immediately available regardless of the host being up.
+	 * */
+	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+	/* Clear "Enable UART1 reset source from LPC" */
+	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
 static void __init do_witherspoon_setup(void)
-- 
2.11.0.483.g087da7b7c-goog
