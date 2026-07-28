Return-Path: <openbmc+bounces-2324-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA536C54F51
	for <openbmc@archiver.kernel.org>; Wed, 29 Jul 2026 00:01:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h8stn5c54z2yjw;
	Wed, 29 Jul 2026 10:01:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785225654;
	cv=none; b=bQGu5ALUt0U1TDD+6ED8zJMgbw0Rce+9hkVCJ64FGDoW//NnGd+4nhbDBCoETtQfRA37I4w53fzN0tgNlG2k2I6qJXYQGveSFvPyjuqTKpl8cg9aULcEQN7PC+siIA3YOAd3AaCw0g8tXjBIVqsHIvVW4Mki2LzwbgvXt5aBDU7TvzUiB0IowDJfYa79CT0ReAcmPwf3tXKWTG7ldjf8k3QKw/shEYLRTaF4dpuhxiCAPBcHijnpG3v8WlC8URf/UQgOBe5DzkaDt1PPkKvucPnVv1EdQP2WG65vSsjeQCnaMM2iFAbo1eQI9DsBN0CCvBIKbGy4yxz24dC3/kGmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785225654; c=relaxed/relaxed;
	bh=FbP7deSyGw94JeB8LJES1uFqlV1FifhDthAcN0fzQDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEx0sZBvyWsosXajzzQvnnZ2W2+yMLBqDmfrMJqLtL6yheCp/MUye0bk0QoddnM2EiPDCd4lVX3ip5XC1C45qBdtK2hAFBZcc+0nTJZhAQcMR/42hdRVtk6WryJFcatSHfCRNy8gyuQ4t1ov/DnehspoFWt/+D+ptK4HE3ILpto60+/p3EFw+CPahG4Oe0FQOaxHeuOBBHCLiu802/CsIXJqrxI05pgGsl1SS1JgSnbNBxCLLW3SY+MeXLF1hUX3JngvfUGgUZc/ecqUYr9NOGKaGLfFN3p1fcD8eTjgPrjwmJMSEkBcs7td7RdVvGymSJngs4ro4RpD/+Brm1BRwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=AlYGC2tl; dkim-atps=neutral; spf=pass (client-ip=45.254.49.197; helo=mail-m49197.qiye.163.com; envelope-from=getshell@seu.edu.cn; receiver=lists.ozlabs.org) smtp.mailfrom=seu.edu.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=AlYGC2tl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seu.edu.cn (client-ip=45.254.49.197; helo=mail-m49197.qiye.163.com; envelope-from=getshell@seu.edu.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 305 seconds by postgrey-1.37 at boromir; Tue, 28 Jul 2026 18:00:51 AEST
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h8SZW4LX4z2xlQ
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2026 18:00:50 +1000 (AEST)
Received: from LAPTOP-99KJFSET (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47d71b719;
	Tue, 28 Jul 2026 15:55:34 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: linux@roeck-us.net
Cc: jianhao.xu@seu.edu.cn,
	andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyan Xu <getshell@seu.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (npcm750-pwm-fan): stop fan timer on device detach
Date: Tue, 28 Jul 2026 15:55:35 +0800
Message-ID: <20260728075535.251-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
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
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fa7b8ceed03a1kunmfbb65e04e62e0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDShoZVk0YHk4ZGk8ZQh0dGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=AlYGC2tlucu/O+RmbyaNzfVx7smNgXh3Fa1uKHlg0pkdjbks1+sIygU9+qaNZFExLqZild3X9MgcCKju1h46inNFUgtsqOzuPqYtmfR7Vdt3X/5w1URTXI3aSs4un/e0QX+yB/nsVhmyhWzjmk6kdUxuWl5lG1+ifIsYysK+tlk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=FbP7deSyGw94JeB8LJES1uFqlV1FifhDthAcN0fzQDs=;
	h=date:mime-version:subject:message-id:from;

When a fan tach channel is present, npcm7xx_pwm_fan_probe() starts
fan_timer. The timer callback polls tach state and rearms the timer, but
the driver has no remove callback or devm cleanup action to stop it. On
device detach, the devm-managed driver data and I/O mappings can be
released while the timer is still pending or running.

Register a devm cleanup action before starting the timer and shut the
timer down synchronously from that action.

This issue was found by a static analysis tool.

Fixes: f1fd4a4db777 ("hwmon: Add NPCM7xx PWM and Fan driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/hwmon/npcm750-pwm-fan.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index aea0b8659f5..6503d28ed7b 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -358,6 +358,13 @@ static void npcm7xx_fan_polling(struct timer_list *t)
 	add_timer(&data->fan_timer);
 }
 
+static void npcm7xx_fan_cleanup(void *data)
+{
+	struct npcm7xx_pwm_fan_data *fan_data = data;
+
+	timer_shutdown_sync(&fan_data->fan_timer);
+}
+
 static inline void npcm7xx_fan_compute(struct npcm7xx_pwm_fan_data *data,
 				       u8 fan, u8 cmp, u8 fan_id, u8 flag_int,
 				       u8 flag_mode, u8 flag_clear)
@@ -1016,10 +1023,16 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	for (i = 0; i < NPCM7XX_FAN_MAX_CHN_NUM; i++) {
 		if (data->fan_present[i]) {
 			/* fan timer initialization */
-			data->fan_timer.expires = jiffies +
-				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
 			timer_setup(&data->fan_timer,
 				    npcm7xx_fan_polling, 0);
+			ret = devm_add_action_or_reset(dev,
+						       npcm7xx_fan_cleanup,
+						       data);
+			if (ret)
+				return ret;
+
+			data->fan_timer.expires = jiffies +
+				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
 			add_timer(&data->fan_timer);
 			break;
 		}
-- 
2.50.1.windows.1

