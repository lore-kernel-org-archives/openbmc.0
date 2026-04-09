Return-Path: <openbmc+bounces-1801-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE7F45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:56:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsywn6p3Sz2yng;
	Sat, 11 Apr 2026 12:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775719296;
	cv=none; b=Oab3oa8SbfIITVUi08IXdwFzfT1jN0Ix+uv2Bn/UwG5LTAL8Hz8RV4lbUv5zdPnWGkbMOF5d9Ks0Qhs1QDSK5jpH7wPMjd0Inb7o+dOkLLHUtp3mRJI2Fq9nGB0j5W4Iz0cqKcUIlByI/MSVc4/wPXVT3drE767beZTOObmkPuQ07NInzY3dZRNAJiUe08zVGwWf0u7F+IZhvAm1iohEe+i9+yh/sZ9aNplN1krShvGaFtMypCiNuTynJ0xeZ29osvTx3jk54366mu5clmgA8AbZoThgy/7lcCPoT9ynCjMSKCj7cGmL35vuFKQWFz2Pxa5Qj/HSqZdm9WsPLXuDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775719296; c=relaxed/relaxed;
	bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DIF4hP1ywVoI7IvBeqnwFy0bPI8faOPzbTalE4quLx9MEU036k96ZeqFGXa1zwKb102oezlI+vxFQ5yTQlwCREwfItRlXCPLWa7Bu717WamcHimTgYw9CkdC+F/xbsaS/MsnzVoY60xnzZ0iW4axWxWTOmRwqGJsh9o7VkvS5YKlx0vCqDRAXspfWMaKCLxXse4NEWhucrjL+GDjLdSHt93GdfSU6XtjXjbHHfTxSrbkrorP2Ob0yRsgw5VpSFpq3y+9tkOmT8TgsedAsWUr4n1Wq7uVBqT92kbdTs0/8P20SBhuiup0/qCQw1ZRcotqKKEzvAEB570E5iP0MPTyhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZQf5Z59w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZQf5Z59w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=tomato1220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frrvz3RDnz2ySj
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 17:21:35 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82cebbdab08so501311b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 00:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719293; x=1776324093; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=ZQf5Z59wq0PvJ4/SgaIK0L/dG9eGUxX98oWalUlL1o8/ffSNMvDAK84iL9mlJwNxCu
         ybV/eejVVvdPNrmg0EJzGoiW3lBjQwLFIxjgEq3cWMdAgODvDJ+vPMhwSYqJupaJBtfX
         gz+a4Gmscr2M6osgxgVSFQAscZbqv8wtsGkr8RkX9EXlwYSywGjtTtTcIGJvAxxES6Kn
         UQlwA68SNnoYcYY4ZnmIW7tMnxQMbCRr2eeSOZ4CjoLAcEkWZkRyrQSZDM3IrfCwZUbh
         77d7hlOaxqyd7Z8BfU1b+61yIfERmttjoGt60s89Oe8uWxmzaWKA2JlCyHAmafhYrc3a
         yeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719293; x=1776324093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBHKgRmgyl4pFWCLd5tEcphfp6PU9DSB+nGQXu0hDGw=;
        b=M2JC0ADHkhdUInx7GYhejUmoXRsK0KypmoEKChWZIKaIIb/l+HwA4OV0JluVkZA/BI
         oL5hyyJovUY8/39gFFoMkwvmbZr/D7XVyW0CBUIpHblxLaOPCOQPo2syi+tzTUScpdRT
         9VLBCwwoKc6X6Px0J8gCI9rgx23t8Rf3gBBY+GajiF1YxPXg+EgWW/f34Bxv1iy9DaBt
         Ab30xOyhBjqksvLTolbyYoB+lUMbMEbjL/UzzlBsh/m2EUczdyTthSRHrILuyeo8I75b
         RLxgVQHbVt9RUUrY+gMpqKNU9wzbNZrbMGT81kXHrfF5KjYOXQaZEXzY9fBFp+u8Lf3x
         sl4A==
X-Forwarded-Encrypted: i=1; AJvYcCVvU2w/69KPGyaTAwiuz6n1TDC4S5o4iscOxDVs1qut4a7FuIV/EvC4gYuCyaGya/nveGzRWwns@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhP8wRf98/x6UIrTmEi13G5Ftqx2pMh2s1XdYbFwMM1XuYjv3w
	6p2T+avq24s73eh/HdV0uXA2ErwYJN0lgs4SNDIvejS/DEtUEFn7toXz
X-Gm-Gg: AeBDiesc5uP3FMt0wF3FZfMAqURHAZ12RgCrmtuf1tXiSZ8hLvVMq2H2fuTHwRV/9WB
	N6QNZL4vJnGQzsvgJp6ZpY9uSI8pHf50c9RIzJa5ko6dqdC2tD7VwPpJgNRJ8gZn80GBHNo+g+z
	cFNXeRyJyU26rRV7MVFr50pUwjsUsUZ8M+Ux9OY0Vks56PMFbDJyuxc1AmIDfhemNl1zaNZH9Ua
	6ZBydqpWbvtCyY1EYIDJAopinuSpP/VrHUpeqT33JG2KaGKOQqv2lnPfzTrkqWEUSQE3cqAKUUF
	WTaufznrZvBmxgb/dJEw+X6rh8TeeTzmVYaX8tOYONT5yToGsOXo+0PjmKEJ8Lcawpf0Ox3nJtz
	c+0kAD5wvWKX7aPpDMZhgXFKeNDNDRcNYXir7rN4Pto7qsSIORNi6+4XPuhiE/7mkkoQ2F/Iijx
	xvz+XykHv3StNZlLgxJ1iIrzDBMOZO41EBGLDzwyxeXsMqWk8489C6UrRRZuKQHvhpUDKHjQ==
X-Received: by 2002:a05:6a00:3902:b0:7f1:4:66b with SMTP id d2e1a72fcca58-82dd8b0da28mr2490958b3a.44.1775719293311;
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:33 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 2/2] rtc: nct3018y: add optional control register initialization
Date: Thu,  9 Apr 2026 15:21:05 +0800
Message-Id: <65d40ded5afd87d0dbdcf98652a97e4ad244505c.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1775717959.git.tomato1220@gmail.com>
References: <cover.1775717959.git.tomato1220@gmail.com>
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

Support the "nuvoton,ctrl-reg-val" Device Tree property to initialize
the RTC control register (0x0A) during the probe phase.

This provides flexibility for different platforms to override default
hardware settings.

Signed-off-by: David Wang <tomato1220@gmail.com>
---
 drivers/rtc/rtc-nct3018y.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cd4b1db902e9..4bc47b4ac935 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -534,6 +534,15 @@ static int nct3018y_probe(struct i2c_client *client)
 		}
 	}
 
+	if (!of_property_read_u32(client->dev.of_node, "nuvoton,ctrl-reg-val", &flags)) {
+
+		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, (u8)flags);
+		if (err < 0) {
+			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n");
+			return err;
+		}
+	}
+
 	flags = 0;
 	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
 	if (err < 0) {
-- 
2.34.1


