Return-Path: <openbmc+bounces-2277-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC796C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8p1hwXz30F0;
	Wed, 15 Jul 2026 22:29:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118585;
	cv=none; b=m6Zh1LOPxVCUm7xhdmXdEYcJj2Hy1vU3qu6UCIp1Pu6op9T/uWrElu5owtLHCU2Vq7Hr78EzO6T3DzYz10bo+ZjnzlIb24XTQAzaQzx4yeV+pBwUE/NJ6KBVVybw8pwcvyx0fpxVPzEYYpkKgGcW/BXlvwQ3AwlsONeRpywWa/MtBPUVzc9j69FUi9BVgWEdB4HLg5ohApixCLV6PfLQaUK4GDFalz9Wq9KGKBzTeLukFJGh0Jgxjnmv36McqUnXO0N0jn4KifCUrsKM1OwVX6MX8Gfe3xct5UP2nyDpy7aPtdJC4jf63oKPqoFWRd5cMBXe3bvymaaSXEIfiDoJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118585; c=relaxed/relaxed;
	bh=h4K/cnuGCD4SqoFpFIygfSYw1RzHhIhX97jhSaVlU8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YAxxFjpM4/U2PalJ+pHpKTuvQk2iYkWNyZM/40OsLuOVAVBinJ/TB3GplktHgyqbbMLAkErXXKs3+bzcZuefYEShco7YXsGf9Y+DHrmqJsre4g1yJcZsfudLhM4gvFO/mm9rJj8GmO3V3Asi2FfzjdTSm0IvCJcSkCQ32zNSHxQpEnuiXZHDu8kbnV0b+jlPkaw92tWr9MdWdej+wsQKBCrl8CF4+5FzhyELf32xjev1kzDzjgogrGg8Src0wvxSgQbStvg+C1gyBaHlfJvH9I80CgE/SJ0ur+YTeRVKp6kI2N2omegz5yPEl9epISfYunsvEeD1h+ePkHHcSRwM0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4b7bQ+l; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4b7bQ+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8n17JGz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:45 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so38522715e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118582; x=1784723382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4K/cnuGCD4SqoFpFIygfSYw1RzHhIhX97jhSaVlU8w=;
        b=A4b7bQ+l7fBgL5JN3Iz1zq67kQ0o50drrooq78fSCKS7SxzHVgOc5A+sMd1EOh/7Ma
         glLcTTFg4lsiChSQxQOc7/H3Pg83mB1b27rPAob7qPY/xEkkUi0MBgoqCSqLEFrUoHmN
         YDjVkpKZ51J3BNvXYZny+cSwc0mexWN0WjilmZypa9gAAOnVnNAWYwqr+Eq2+hdCGSsk
         75xG2ez7WuuM3IDun0FJ62pSbN01hs9jLhMmvywagcA+gsqY2BccBjcAechuwpLJMYzb
         hEfhe7zNTAtybYsoi1rdITYu6uOeNKTCAWTnXqzyym+IWXouUgr8ulIItFK+9P/sygIW
         VwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118582; x=1784723382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4K/cnuGCD4SqoFpFIygfSYw1RzHhIhX97jhSaVlU8w=;
        b=fZRTLX5kcwuixIyCJFx7BY7WffppUqRFTsyaGFpmWt8hlouABKIKcrcFqeyXSB90sC
         egEmsFjsjs2RON7uwJjEO5JqeJb1Pbsmw7cHRlFik4OmedCYn79EYoPpfVAAvlbjeF+4
         zz1Tfa3cpvPlsP1aD9OHmkU9OcdG+kzZqRAqKiWJL1p7vjHpE67A4Hq1uwAh2KD8oqC5
         00S0+/nKaY+WJmUx749KjxEqzMJOOcBz0N9X21kLP0s5Uk0C5j18AJ3Lq0zRqYEPzdF3
         tduNSRZIYh/XoAqWxLAfnWozEZ+m3w8UMx+p/EZpjB8l34iWoSwZycxYqA8vGRWWUEB2
         U2CQ==
X-Gm-Message-State: AOJu0YyOgjemqpu3u/XUPZmbyE95u+0DUemQ2oNz1hgXaZT41NRHimR5
	JKecWXjxsccVF6EKGPbT2bvNi2tTHLHOVEMz/w6uPvZgSy9iAo5DsOZn
X-Gm-Gg: AfdE7cni5/RBz2IVTJJpNhjdf/Nl5TPE7lY+UxQUbQ9zXugENIgS49B3VwteyDGSGJe
	9FTF7QtAAXenB9x62wdonszXKROA2tkrzA/F9ui5ErZTrFrx8K1Ag99HGBnhhYiwNcvpxXpNvMG
	AKEWEDVUIb0MN5v97HNZ/hfT6OQq1DK6wVPJ7tJYY2X0pYV3s2hNa5beCODl9OhnkJpurDCBW/7
	mhL5unbrSRh6xPRgW8Yu4oN7qPbiUBt01M7fup+sEAVeGhpRbIdXufkDI/MXsBwpooOzVm5NE42
	xpvs3AzGrTAl5/5AwSAr6rmg3YMzxRuu3amHmaZxoxYg7Fy+YLGIMksXsx8M6vjbi0R6i5hDqtz
	y5igdkaPpMfg1XxCFWTKHYuIxe/fyQCiZEGGROg2yIUfoSQj/MFlVqDw9QoAgURmsO7pwQwmEjl
	3fiCdeCVHSVN/J1CwwbOvV6HY=
X-Received: by 2002:a05:600c:a20a:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-4953c1451d5mr20729785e9.8.1784118582082;
        Wed, 15 Jul 2026 05:29:42 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:40 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 5/8] pinctrl: npcm8xx: rename GPIO7 IOX2 signal to DO
Date: Wed, 15 Jul 2026 15:29:20 +0300
Message-Id: <20260715122923.1938327-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
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

The pin description for GPIO7 spells the IOX2 output signal as D0.
The datasheet names that signal IOX2_DO, matching the rest of the IOX
naming scheme.

Rename the pin description accordingly.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 5dcb01923..1c95d7cbd 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1567,7 +1567,7 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(4,	"GPIO4/IOX2_DI/SMB1D_SDA"),
 	PINCTRL_PIN(5,	"GPIO5/IOX2_LD/SMB1D_SCL"),
 	PINCTRL_PIN(6,	"GPIO6/IOX2_CK/SMB2D_SDA"),
-	PINCTRL_PIN(7,	"GPIO7/IOX2_D0/SMB2D_SCL"),
+	PINCTRL_PIN(7,	"GPIO7/IOX2_DO/SMB2D_SCL"),
 	PINCTRL_PIN(8,	"GPIO8/LKGPO1/TP_GPIO0"),
 	PINCTRL_PIN(9,	"GPIO9/LKGPO2/TP_GPIO1"),
 	PINCTRL_PIN(10, "GPIO10/IOXH_LD/SMB6D_SCL/SMB16_SCL"),
-- 
2.34.1


