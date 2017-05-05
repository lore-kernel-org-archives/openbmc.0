Return-Path: <maxims@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKQpg2RPFzDqFr
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 08:01:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Wakfo2W9"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id v14so8212470pfd.2
 for <openbmc@lists.ozlabs.org>; Fri, 05 May 2017 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2YzZFm5ZsGdGEQ4XAGGfhD6LTbCOyqmnyfG525Xnd10=;
 b=Wakfo2W9E9ZIO/1B7TA1Po6/cTMdxk2XByfy3UT1ug2SQ9Q6d4TmxcNdGMpKHQ8J+H
 zlko914wbRXzM/wwCJ6Z55279z/yCunr7vwFzHJnkJIf8PLe4nZsa6GOxjA0yTfhap9x
 duoyDEwnBrdTxSFCJCfpcnJU97GYbcGBHlSEs1Xq9ynUu831bY1iQHYwQsir/ODsAgja
 JQatdLw9uFrqbAD+Spq/84SKMK0Ug9trJGUPkKKRJaAIr0VcJg+WSattxhYa92ZRoQ8u
 5pnaGtcmvGWEC0A7J4EYErP58rWvW65BQ2RHq4IoE9hAg4nGWfkL88sp11iEP5iVpzmK
 PE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2YzZFm5ZsGdGEQ4XAGGfhD6LTbCOyqmnyfG525Xnd10=;
 b=e/1pu3795aX2WQmbRecgWaqWy1KdaUI0y2DozxsN87OLMAggeFVlIEJGlD2CsoKgbl
 /c6Ix7cHi4gBHzsndxDn5HkfAcGSMwpcn/cAlqcDcEf7lF6joJHixD8sLNOtClssC4V8
 cdOK1teRDH6SBK3tZXF7HyVIehbKCt/bacA8J6lqgQoomA7N4Tq/f71ffvdMexYmehK1
 nTyY1YwOKx5qhi0RSvfgGeOLMK+iEk9OtXPITvRXCAR+rvh3f3BErwJPGHlFLdopqBwk
 Q4/awIN2+guTC9KxTi2Q3zdLapGWC/JuQtrtEld83f2QBxvHT7m4Cr6MSoWMosNQjrnH
 oC6Q==
X-Gm-Message-State: AN3rC/5qGmO1J2m5XzciDykEJNIZD2oCpoLZRO9/6tKGAq7fkUKFSQtg
 9iJdgCohRtwwzVXl
X-Received: by 10.84.217.203 with SMTP id d11mr13620677plj.141.1494021704863; 
 Fri, 05 May 2017 15:01:44 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id r131sm7768501pgr.67.2017.05.05.15.01.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 05 May 2017 15:01:44 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v2 10/15] aspeed: Add P-Bus clock in ast2500 clock driver
Date: Fri,  5 May 2017 15:01:10 -0700
Message-Id: <20170505220115.143025-11-maxims@google.com>
X-Mailer: git-send-email 2.13.0.rc1.294.g07d810a77f-goog
In-Reply-To: <20170505220115.143025-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170505220115.143025-1-maxims@google.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:01:48 -0000

Add P-Bus Clock support to ast2500 clock driver.
This is the clock used by I2C devices.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2: None
Changes in v1: None

 arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  3 ++-
 drivers/clk/aspeed/clk_ast2500.c               | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 1cdd3b9198..319d75e05c 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -21,7 +21,8 @@
 #define SCU_MPLL_NUM_MASK		0xff
 #define SCU_MPLL_POST_SHIFT		13
 #define SCU_MPLL_POST_MASK		0x3f
-
+#define SCU_PCLK_DIV_SHIFT		23
+#define SCU_PCLK_DIV_MASK		7
 #define SCU_HPLL_DENUM_SHIFT		0
 #define SCU_HPLL_DENUM_MASK		0x1f
 #define SCU_HPLL_NUM_SHIFT		5
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index 504731271c..9e4c66ea85 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -110,6 +110,17 @@ static ulong ast2500_clk_get_rate(struct clk *clk)
 		rate = ast2500_get_mpll_rate(clkin,
 					     readl(&priv->scu->m_pll_param));
 		break;
+	case BCLK_PCLK:
+		{
+			ulong apb_div = 4 + 4 * ((readl(&priv->scu->clk_sel1)
+						  >> SCU_PCLK_DIV_SHIFT) &
+						 SCU_PCLK_DIV_MASK);
+			rate = ast2500_get_hpll_rate(clkin,
+						     readl(&priv->scu->
+							   h_pll_param));
+			rate = rate / apb_div;
+		}
+		break;
 	case PCLK_UART1:
 		rate = ast2500_get_uart_clk_rate(priv->scu, 1);
 		break;
-- 
2.13.0.rc1.294.g07d810a77f-goog
