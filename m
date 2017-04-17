Return-Path: <maxims@google.com>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6HfT1bD6zDq8t
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 05:01:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aIs0W0L7"; 
 dkim-atps=neutral
Received: by mail-pg0-x22c.google.com with SMTP id g2so75757943pge.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 12:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4G1o9qyWDHb6siY+uyuUyDDplVzlFC+Sy3637dBrKrw=;
 b=aIs0W0L77fHcE6l1Kw4HiWY8kb30WLZCk90zgJ+sTFfo8vzSrC7uKQpenkGiDIse04
 4slbYCuH4RoHJ4kMHP9PZVrJreC4uL4Yt9QEM8CtQvk2Yr8LHEasTX+NMiJITezEimbE
 bgdi528QY4/XuJLzA6pQlpEC/h9z4KJncqxbaa3DP7OmVV/R20z7B2zRKVxbOkppYADn
 MfzHAU6gLaDT3Aq67msorpgAxu2+lsZ94sskWz4MNvu7z6G9Hcrcrf9GEM3u+a50MZ6a
 ycZGYIkD9HkBXiOt1FVH/Rn2hye4ttKH9IbR+f6838m3AAlMjiy0OWlq6e8youXyg80y
 bPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4G1o9qyWDHb6siY+uyuUyDDplVzlFC+Sy3637dBrKrw=;
 b=kzbj7adzdB5XZCe934LfPd1107Jg/cA2RAeWbyO8j4VJzkx1GWShdppdo3Y9jqtDXz
 ATYmMhzFCrubaW3HQUCAuCWHks1f6UpS/ScWbYR0JWHUAFKnbGAfg5uC0ubL98krLmXd
 DiGaNxBo1ezLG4cH+gUebDcdEfSsbC4YqBnhxw99whN+lEFupbiUAlkcFN0FZSv0pDBH
 hH5qXeWZPwVDLiHcSnw4HrnmY0ZhbApPN6Y9OMeL1UU6VO68QJS/c61HYSaADQW7Me50
 xDUFGGW3jvcniKZ9Q7NSzsHbYMge0EfFHQHIrMoFJDAfL6eq4nJ9wgILZvUu54Wl1aoV
 g+cg==
X-Gm-Message-State: AN3rC/5+rScYAkzCarRdR9mEWf8i/X86m868BImp3WWse4+ojV+WJ2no
 Ia2Sh9pdj51bnpWf
X-Received: by 10.98.3.135 with SMTP id 129mr13278528pfd.174.1492455663211;
 Mon, 17 Apr 2017 12:01:03 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id p80sm19526121pfk.50.2017.04.17.12.01.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 12:01:02 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: u-boot@lists.denx.de,
	Simon Glass <sjg@chromium.org>
Cc: openbmc@lists.ozlabs.org, Maxim Sloyko <maxims@google.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [PATCH v1 10/15] aspeed: Add P-Bus clock in ast2500 clock driver
Date: Mon, 17 Apr 2017 12:00:29 -0700
Message-Id: <20170417190034.71945-11-maxims@google.com>
X-Mailer: git-send-email 2.12.2.762.g0e3151a226-goog
In-Reply-To: <20170417190034.71945-1-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
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
X-List-Received-Date: Mon, 17 Apr 2017 19:01:05 -0000

Add P-Bus Clock support to ast2500 clock driver.
This is the clock used by I2C devices.

Signed-off-by: Maxim Sloyko <maxims@google.com>
---

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
2.12.2.762.g0e3151a226-goog
