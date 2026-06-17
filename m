Return-Path: <openbmc+bounces-2109-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3BFCD98E1
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 04:13:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gg9S11hl0z3bqh;
	Wed, 17 Jun 2026 14:12:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781669552;
	cv=none; b=IbcycredyfLkC96tKnh8vizKKosOm4Onp9Oe1CCjt3QyPpXDBIdkPwzoWlDZRAFZ7nRyGgAmvU6OFt8uKdF+KwZGBY6IQRA+n49YkKKHmBkeHBXY0nIQYntdcIeqchieXxvXXnvgIYgLeV8WPWJtMi8u48ByCBY7Pvd9/ydHxDCXLFZGDLa1Ch5KNdFuRvCLh/zqNQQbnBj1szOstoAD5N5R+UNOAlmHIKXfJUszPLepQa7niowK43DUHg6pf8IyS4oGf8UDaSeYo9MbCZb5BHbMZ2MvmiZsgW3OPUikSwCHcgjGm+AB4LaayoTRLQXTqGIC6/88PLjHmtSWOek71g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781669552; c=relaxed/relaxed;
	bh=jl73o+dAI1hDtWZPZ9x5abWIcxiJGUURgrNSgQe2u0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuSD7RCSTE10BlI9l9iaRnclEJX7AUSTFw2urL84SZUNQopNbj+ksw/lklo+bxTx1Xmb+qMmeqGb0Ssz9nBQ1/A4hFiaVG4+ZATEHojoJ8s2xLh4MICDvR+EGgjqijdQslElRRa16ZSW4Qu3fuVtf/Mrm6PkOLh/6nGkColEuSzK/0Jp75/+XWI+9MwdZP3Jy/cZ4osIBlUhSLFq8TZvomdmgvpKU9RdEQNtNYV3pCBmEKX2sdtFGFNPDAS9pcTOAg1nKX6U1td6QRbDb+TRbDFFl/W1tEiuqWst3dr6WqPBat77WiKn5cnHZ5Y6xKAXFFXEs39y5MzirSQIKBk4hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VLdE+hZS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VLdE+hZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gg9Rz6QrDz3c6b
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 14:12:31 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c40397e3caso51471445ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 21:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781669550; x=1782274350; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl73o+dAI1hDtWZPZ9x5abWIcxiJGUURgrNSgQe2u0w=;
        b=VLdE+hZSffivOuzxQY3ibKzvgXp5w2uJ+/fUHrtIA6iXPHTJ2IDU+YTdFKNSYhTwzY
         8TdWysan0IYjbslN6EhzIn0TlVzOtkLJ/dphkmUTDymQbbHdbAil0x0AD16sOy0lhH+5
         WorUBn0ulEwJlfqKNhD/AtWaoFvG6O3wJa5i57HN9/fn15ZNedEWVkWGHUVAtQl9fcTj
         uxasiE3aFur89xe0DllPT8HrQwDf3DEPA+vDji8Ziwu2TmWMa3HfqdJtEowTMx9LHxcz
         wLVmyan607ZVHNeIQ/nRsKZZIlPKYczInxV+WuFFaBkkXuO9n8WV3uvd2poL6L79x9eb
         kytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781669550; x=1782274350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jl73o+dAI1hDtWZPZ9x5abWIcxiJGUURgrNSgQe2u0w=;
        b=HDOh217CLWqnVvM5nPg0nveN214Q8fszy2ZxpqUnmSWnk72bcYpP6nQbPoppKBvJXi
         yS+LGL3JkgPV8YRE3Odl80WIL8vVCMIec/Sb3MXxfmqvoNAfmTduqV1TYpJuPD6JbmOw
         8GzZVvkZ7tSHjmPLXhAUwjoBeomuqffv+ogbuY3JWYW93yHrPrWqDEcLyHTDcI756o+v
         e6XE7Ku8VlTrcRBHP4/UupXKz0cwJNSyjBxgtJOgR0XeqzrlNwLdxfayUaKkeAvV5Y8G
         K8RrYcQyHquyk6DsyBtGWTvCTlDqnyE/k6e36Vr4/EKSJi2x5m34rttQne+DzaEZhxaA
         cmEQ==
X-Gm-Message-State: AOJu0Yy+MTl73wL+F1jRQxj0g2+P7jCgjWeAUoorCYlLoiBH1CHZM97O
	mE8NLIhtxbmT6FSiHBRfOOtbtQvtPnC+OtIaP2HNlRXLOCUuBQRgZy/JqrTfyQ==
X-Gm-Gg: Acq92OEhgjUFt4ewMQpLy+J9tHOcmkpCcAcec+btpGa8l1BZY/oQOqyPfjvOW/b1Xg3
	RswQqLpowsVbviizAK0+3NtHF3kmX/rF6XSuVZ2lHJsDm2HfY9el3Ro7qqYlVbgoOMCvombSZbt
	77wJeGrMBtIVFJhlzw3fmkD2NPZP6eu/hITCaJHONTduSM1fLLB86k3JL7USoAfDjGJC/rYxzr7
	4wGI/IPi+iRgmJjmb8q+VXhrfYZhw3tqHVAnke0hn94afzJlbHNtUOQP6WpkqQZ3NmE1Q6cyBMR
	A1Yx+UsIYwFyO0UwRs9Y28y6kxNNYtGMqPztQ5trYAy+4+CQjCvHab6Mxnrbdu7MmOfb92c1Dmb
	6IFN6ze5A2DAF41fT8EGU3Sjtp9Bgyev7sfwOxrUbDOzMdig0tF0VRjOpKk9gFjkVI1g2LABRb1
	fkzSsCuPWiejpuMOY6yN6Uzvx3psjAwGUYzfqgOGHr3P+tGPTWg17k1tCPoXPOCswWVRSYHEbNI
	+TTmkgWgILXlidl0XdySJQ=
X-Received: by 2002:a05:6a20:5499:b0:3a2:f402:50fb with SMTP id adf61e73a8af0-3b8bf2e1de9mr2012722637.34.1781669549631;
        Tue, 16 Jun 2026 21:12:29 -0700 (PDT)
Received: from java-bs-ipv4.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm12804302a12.26.2026.06.16.21.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:12:29 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH linux 6.18 2/2] hwmon: (pmbus/lm25066) add current limit configuration support
Date: Wed, 17 Jun 2026 12:10:10 +0800
Message-ID: <20260617041015.3684032-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260617041015.3684032-1-potin.lai.pt@gmail.com>
References: <20260617041015.3684032-1-potin.lai.pt@gmail.com>
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

Add support for the 'ti,current-range' devicetree property to configure
the current limit via the DEVICE_SETUP (0xD9) register, overriding the
physical CL pin setting.

This configuration is supported on all chips in this driver (LM25066,
LM5064, LM5066, LM5066i) except LM25056.

The property values "low" and "high" map to:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

The Bit 4 mapping to High/Low current limit is handled dynamically on
probe because it is swapped for LM25066 compared to the other supported
chips.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/pmbus/lm25066.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..53d274033d66 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_PIN		0xdf
 
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
+#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
 
 #define LM25066_SAMPLES_FOR_AVG_MAX	4096
 
@@ -484,6 +485,42 @@ static int lm25066_probe(struct i2c_client *client)
 
 	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
 
+	if (data->id != lm25056) {
+		int config_new = config;
+		const char *cl_setting;
+		int ret;
+
+		if (!of_property_read_string(client->dev.of_node,
+					     "ti,current-range", &cl_setting)) {
+			config_new |= LM25066_DEV_SETUP_CL_CFG;
+			if (strcmp(cl_setting, "high") == 0) {
+				if (data->id == lm25066)
+					config_new |= LM25066_DEV_SETUP_CL;
+				else
+					config_new &= ~LM25066_DEV_SETUP_CL;
+			} else if (strcmp(cl_setting, "low") == 0) {
+				if (data->id == lm25066)
+					config_new &= ~LM25066_DEV_SETUP_CL;
+				else
+					config_new |= LM25066_DEV_SETUP_CL;
+			} else {
+				dev_err(&client->dev,
+					"invalid current-range setting: %s\n",
+					cl_setting);
+				return -EINVAL;
+			}
+		}
+
+		if (config_new != config) {
+			ret = i2c_smbus_write_byte_data(client,
+							LM25066_DEVICE_SETUP,
+							config_new);
+			if (ret < 0)
+				return ret;
+			config = config_new;
+		}
+	}
+
 	info = &data->info;
 
 	info->pages = 1;
-- 
2.52.0


