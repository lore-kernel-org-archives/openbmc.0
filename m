Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rOH61+NC"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44V57v3jzDzDqPM;
 Thu, 28 Mar 2019 11:18:51 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so4094404pll.13;
 Wed, 27 Mar 2019 17:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RBeBHDevjsW/dSEhDQj0wmpDGhvdK/4GCHPApgRyiOs=;
 b=rOH61+NCKMMlpWFyUJNVem/sfb1Zyrva+6xN2tYmyW2KWrDz/QIA8wy6kJ2CJwp6mK
 uiIInYvJcKRwgMA/pXa3tpBVnornvsBqyR2z82B47PmcI0CQXEAQe14PRzXVOmNwuysz
 MC7Oc7s3vwKteAFc/MXkkl/V0nNS1LxrEVhC7GUoeCqEfs+7dDJu59OIdpxlmby3QPC7
 QzQM9N3XTqlsjGz/na4bUh6opg7GU79BaCWPYLMHC3zkfk/3Jg2lVFzKQntuqqIYS9+7
 ehsDLm3zelWouVbBSrjd4Xbd8eHQlC4rTzqTskK5Uw6Wgp1tjD/UftRkR2MCjSA9Pu70
 p87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RBeBHDevjsW/dSEhDQj0wmpDGhvdK/4GCHPApgRyiOs=;
 b=AtrVn13vpN8UmTIvvNBhH887jiHDfWU6IYqgo34r8qF5GZpw/t+oNe2gD/KQ7+rG6N
 4BuW7HTPEmqAcOvhCeO7DCuvz4mYM3aYs5A5EkMlEd3lY3ExGnCZkLIqPS1mXxzHONfj
 6LuHOaBSn2jq2RTJeAaOICkVTsWy3ugZcuO/y2xRKo00cUHgRjvbB87/T2p3UFVrwhpA
 FiVz3gXWDLubbuXBG1WXYDY2OsvObBR4CqeZjeUjiTM1K9rbkgfzEsz3+y1jyEZ+kGvo
 ssP321SVSWnFCcbp/vRsSgsxeRa0uIpzJH3dzBadjszEQIZerloAPybICM5C+luO0xgO
 RQOg==
X-Gm-Message-State: APjAAAXeDpR8KuGUrjjWIILdptY+YlKMkshKH6Iy5eQo+F6/ysCFqgVd
 8mgjMbw0SFooxnNYiuLIWC89hLoP
X-Google-Smtp-Source: APXvYqzWFFUYOy/FcG1gsd6r81J8X+f/NYaZEyS8LoWTL/oKIjQXdN2a3ASrh2990U6CsRTl+Z4UZQ==
X-Received: by 2002:a17:902:e113:: with SMTP id
 cc19mr41076910plb.179.1553732328633; 
 Wed, 27 Mar 2019 17:18:48 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m20sm56560375pfj.142.2019.03.27.17.18.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Mar 2019 17:18:48 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Thu, 28 Mar 2019 10:48:42 +1030
From: Joel Stanley <joel@jms.id.au>
To: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Subject: [RFC linux 1/2] rtc: aspeed: Add locking when touching registers
Date: Thu, 28 Mar 2019 10:48:31 +1030
Message-Id: <20190328001832.11076-2-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190328001832.11076-1-joel@jms.id.au>
References: <20190328001832.11076-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 28 Mar 2019 00:18:52 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/rtc/rtc-aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index af3eb676d7c3..a423ce6483f8 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -10,6 +10,7 @@
 struct aspeed_rtc {
 	struct rtc_device *rtc_dev;
 	void __iomem *base;
+	spinlock_t lock;
 };
 
 #define RTC_TIME	0x00
@@ -25,7 +26,10 @@ static int aspeed_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned int cent, year;
 	u32 reg1, reg2;
 
+	spin_lock_irqsave(&rtc->lock, flags);
+
 	if (!(readl(rtc->base + RTC_CTRL) & RTC_ENABLE)) {
+		spin_unlock_irqrestore(&rtc->lock, flags);
 		dev_dbg(dev, "%s failing as rtc disabled\n", __func__);
 		return -EINVAL;
 	}
@@ -47,6 +51,8 @@ static int aspeed_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	dev_dbg(dev, "%s %ptR", __func__, tm);
 
+	spin_unlock_irqrestore(&rtc->lock, flags);
+
 	return 0;
 }
 
@@ -65,6 +71,8 @@ static int aspeed_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	reg2 = ((cent & 0x1f) << 16) | ((year & 0x7f) << 8) |
 		((tm->tm_mon + 1) & 0xf);
 
+	spin_lock_irqsave(&rtc->lock, flags);
+
 	ctrl = readl(rtc->base + RTC_CTRL);
 	writel(ctrl | RTC_UNLOCK, rtc->base + RTC_CTRL);
 
@@ -74,6 +82,8 @@ static int aspeed_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	/* Re-lock and ensure enable is set now that a time is programmed */
 	writel(ctrl | RTC_ENABLE, rtc->base + RTC_CTRL);
 
+	spin_unlock_irqrestore(&rtc->lock, flags);
+
 	return 0;
 }
 
@@ -111,6 +121,8 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	spin_lock_init(&rtc->lock);
+
 	return 0;
 }
 
-- 
2.20.1
