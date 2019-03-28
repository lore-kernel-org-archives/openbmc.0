Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nIegocEs"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44V5804BQszDqPS;
 Thu, 28 Mar 2019 11:18:56 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r124so10726887pgr.3;
 Wed, 27 Mar 2019 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y1fzMnLa1GxR2JRuVJiPOQSrOQROldB/1+DyP/VCjKY=;
 b=nIegocEso0AS84K406OkjUneM7fAeYyfUb8QX5dI4M+8C/I6xwseqrRlIISASPUbod
 govdq9cK0jc7gwnrklQO7a0XadeGtDMc3El57/VS3Za2TU+DFe6O2VvKCzEDQFejOu0e
 +H6/FLedXeejN45kzBrta95BtgZiFN+Bbvmini1EIXcs/CWtf8l7U8V0R2CDyX/AQJUE
 zPI2tKQjVHMS3PV7vixFntttUVVvm6CF1BenbBf1pvGHjXEeEwHr/tyZPW9GsrVSMl01
 tGo1asgwN7TSg7XRmQTh+F7DmXCeZEFhjTqvUjJlFdr8MMe+lqkQyYCO9V5N/aF5SB+z
 avbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y1fzMnLa1GxR2JRuVJiPOQSrOQROldB/1+DyP/VCjKY=;
 b=DNzgCQN1Djv1TtWFdVPa5/ZekiZRHC1tRtbDsg6EHfCtG04sHHstMdkNDB5Ah2E2Oh
 dl5XFjg6bYfhgLNJa6z97oe+lfycKhjuuP7j2WIz4ZzHRKev7dVl5h97nPVw5eD4tW+E
 u8i+IIWruqU1YuA7MEkHCffwgNbrWymlBcCdU0O/TtFtkaOT9c5tz8sHldjQmvIJIdg1
 1e1MTGzx/dfZfJGiPS4o5XkSrdR02LXwWCQ6rXcnjrVDLJ5KyVCKhtEikqo3MxjWvEzo
 37fjKaL6adkFa5spwe7d7TJUiAaPtKtnudo1fmnCfVTm4mCKyfmFQothQgZ6QXIZsDxj
 lCZA==
X-Gm-Message-State: APjAAAVrwoJiEk/v2C+hbAOTv4C7jteghQ0dtTSiVeP78Ximzu3M4HRj
 XzI2Pnuw31ZejP5SwvM9d9yTMG1w
X-Google-Smtp-Source: APXvYqyZLfq01oDLocqNTqn+6It0rIynOFOpNhXjbp3ZDHMtA924ubzRFszmL4crWcYsM4BfGSuj1g==
X-Received: by 2002:a63:c149:: with SMTP id p9mr36114906pgi.362.1553732334621; 
 Wed, 27 Mar 2019 17:18:54 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id z8sm8355074pgz.3.2019.03.27.17.18.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Mar 2019 17:18:54 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Thu, 28 Mar 2019 10:48:49 +1030
From: Joel Stanley <joel@jms.id.au>
To: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Subject: [RFC linux 2/2] rtc: aspeed: Add alarm support
Date: Thu, 28 Mar 2019 10:48:32 +1030
Message-Id: <20190328001832.11076-3-joel@jms.id.au>
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
X-List-Received-Date: Thu, 28 Mar 2019 00:18:57 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/rtc/rtc-aspeed.c | 97 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index a423ce6483f8..8b6163567d10 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -11,12 +11,23 @@ struct aspeed_rtc {
 	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	spinlock_t lock;
+	int irq;
 };
 
 #define RTC_TIME	0x00
 #define RTC_YEAR	0x04
+#define RTC_ALARM	0x08
 #define RTC_CTRL	0x10
-
+#define RTC_ALARM_STS	0x14
+
+/* Control register */
+#define ALARM_WAKEUP	BIT(8)
+#define ALARM_IRQ_SEC	BIT(7)
+#define ALARM_DAY	BIT(6)
+#define ALARM_HOUR	BIT(5)
+#define ALARM_MIN	BIT(4)
+#define ALARM_SEC	BIT(3)
+#define ALARM_COMBINED	BIT(2)
 #define RTC_UNLOCK	BIT(1)
 #define RTC_ENABLE	BIT(0)
 
@@ -87,9 +98,81 @@ static int aspeed_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static int aspeed_rtc_alarm_irq_enable(struct device *dev, unsigned int en)
+{
+	struct aspeed_rtc *rtc = dev_get_drvdata(dev);
+	u32 reg = readl(rtc->base + RTC_CTRL);
+
+	if (en)
+		reg |= ALARM_DAY | ALARM_HOUR | ALARM_MIN | ALARM_SEC |
+			ALARM_COMBINED;
+
+	writel(reg, rtc->base + RTC_CTRL);
+
+	return 0;
+}
+
+static int aspeed_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct aspeed_rtc *rtc = dev_get_drvdata(dev);
+	u32 reg;
+
+	reg = readl(rtc->base + RTC_ALARM);
+
+	alarm->time.tm_mday = (reg >> 24) & 0x1f;
+	alarm->time.tm_hour = (reg >> 16) & 0x1f;
+	alarm->time.tm_min = (reg >> 8) & 0x3f;
+	alarm->time.tm_sec = reg & 0x3f;
+
+	return 0;
+}
+
+
+static int aspeed_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct aspeed_rtc *rtc = dev_get_drvdata(dev);
+	u8 day, hour, min, sec;
+	u32 reg;
+
+	aspeed_rtc_alarm_irq_enable(dev, 0);
+
+	day = alarm->time.tm_mday & 0x1f;
+	hour = alarm->time.tm_hour & 0x1f;
+	min = alarm->time.tm_min & 0x3f;
+	sec = alarm->time.tm_sec & 0x3f;
+
+	reg = (day << 24) | (hour << 16) | (min << 8) | sec;
+
+	writel(reg, rtc->base + RTC_ALARM);
+
+	aspeed_rtc_alarm_irq_enable(dev, alarm->enabled);
+
+	return 0;
+}
+
+static irqreturn_t aspeed_rtc_irq_handler(int irq, void *id)
+{
+	struct device *dev = id;
+	struct aspeed_rtc *rtc = dev_get_drvdata(dev);
+	u32 reg;
+
+	reg = readl(rtc->base + RTC_ALARM_STS);
+	if (reg & BIT(0))
+		return IRQ_NONE;
+
+	writel(reg, rtc->base + RTC_ALARM_STS);
+	rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
+	return IRQ_HANDLED;
+}
+
+
+
 static const struct rtc_class_ops aspeed_rtc_ops = {
 	.read_time = aspeed_rtc_read_time,
 	.set_time = aspeed_rtc_set_time,
+	.read_alarm = aspeed_rtc_read_alarm,
+	.set_alarm = aspeed_rtc_set_alarm,
+	.alarm_irq_enable = aspeed_rtc_alarm_irq_enable,
 };
 
 static int aspeed_rtc_probe(struct platform_device *pdev)
@@ -107,6 +190,10 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return -EINVAL;
+
 	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);
@@ -117,6 +204,14 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
 
+	ret = devm_request_irq(&pdev->dev, rtc->irq,
+			       aspeed_rtc_irq_handler, 0,
+			       dev_name(&pdev->dev), &pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request irq\n");
+		return ret;
+	}
+
 	ret = rtc_register_device(rtc->rtc_dev);
 	if (ret)
 		return ret;
-- 
2.20.1
