Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fJ2yNnfl"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ys1z44nsMzDrvV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 13:00:15 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id 81so929574iof.3
 for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2017 18:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zew1DMcGQmmdh/JD18lX7rO7aN9cGuu+v48fi37EH2M=;
 b=fJ2yNnflmpYGy9Kcy8Scbe7zuoc6vJd8+VY+vM2TFCuHSLgf2C+mKFZNPqn5oZV+Ju
 unyO2vmaPjHeNZp9QoKpLX+liUDibdKB71JKy6HfQqWzFe0MasdrCb/jehVvxOSaW3Hn
 JvmHi8N+rR6m92tFfCbHlaZP95d8XrGK4a8yAiCTUijp3LZSZY5c5XW0VX9HWqMBGNc9
 gfM0Jxz94V24hcO5ISv2rlGNMAniDsFcoEbo3Ri9ERu/Tp+GoeqEG/y2YHPQmGK40UHy
 f9zZCDesXeZd0RR0P5sx8EMTJ4c+of2WXBxmbRg9zC3H5YYqisBvzrvi/XUFG+Rup3Cx
 NKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zew1DMcGQmmdh/JD18lX7rO7aN9cGuu+v48fi37EH2M=;
 b=CcokauGcAQ/CTYvY7Gqk0cIJi5iFKhlN4eZwDFWgxgYt2XpIOSH+LlA6y42XX0PnKx
 Z/1omg/v5dG916uTZJmir4eqjcQ13a9bSzSWrIICktJfmN1QA9MQglwX/+j3ZaL7N+Ve
 S6BAfBkpfGUVyr49fbnslpAAmIDnbNK8fr1r4GqYqg2AASe1wUqZgb8GUDZPr0QT9M2A
 JYU6QJSAoEvoD6VaC7ADZbQPdp4W3cxK4D7C5qhqY4KTRlJFlN8NUwc0wC51LStmxAqE
 WtvjqORsgaAWke4MXRfECsmvNBAaAquO1DuUBZ5Eq1uPUmG4PQ4yMWoAusDmC8syc7AY
 tYcw==
X-Gm-Message-State: AKGB3mLJUgw+CZRPy2lPjwBI5bqHpLWFtkx2SKUJWdgT+lr3Ib9hlpwu
 YMANIb7tqpDl4px/EA0yG92usA==
X-Google-Smtp-Source: AGs4zMaxRmqrwwCtTKF22mX5nayulyRH8lBWOqnMgAjrTqfiJX/0LzIzv2wMUPDfQktOW3AEKLAf2g==
X-Received: by 10.107.79.4 with SMTP id d4mr5573344iob.12.1512525612412;
 Tue, 05 Dec 2017 18:00:12 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id j204sm856120itj.16.2017.12.05.18.00.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 05 Dec 2017 18:00:11 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	xow@google.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: move coin battery
 sensor
Date: Tue,  5 Dec 2017 18:00:08 -0800
Message-Id: <20171206020008.2562-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.531.g2ccb3012c9-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 02:00:17 -0000

Moved the coin battery sensor into a separate iio-hwmon
instance to facilitate reading it as a separate hwmon instance.

Naming of ADC inputs in follow-on patchset.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 5f6a11ad93d4..17f2000d5cd5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -102,7 +102,12 @@
 		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
 			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
 			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
-			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+			<&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
 	};
 };
 
-- 
2.15.0.531.g2ccb3012c9-goog
