Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="YeqJn8Uj"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrw9m3nfdzDsF9
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 08:39:07 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id f190so4666293ita.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2017 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=eGwCwf9wKNi8ZrN6eawMTeGUdn7usBlUxet+ISuClkg=;
 b=YeqJn8UjneT/tTr9zOu9T1644nCdFIMtgSjaGDfic/6It0ZnurHQAltd006j/8S9bR
 9HpnfC+kJHRvwCrZl/7R0a9xfOXt3vQC2azaTpWDbKnwHO7OUEMTB6w95ctYnP3UuMPY
 hf0NnMHFkSIAlcY0celFycMXN16T2pu+OK1EHkOCAtJBioGIYj9lR0YORENEpPGnhiBX
 Egb3TlKqmS5MS8pY0orb8AfF7Pb0OGow6KjuatxCj30Rz6gXsNSUQul00fPAbNuGLF2v
 h5nWmuR1zc4PYUD68TGVxrQeE0JnchvHXzNQObWwANA2h6EODuv6qNR/OQmAj/zHzVHA
 UUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=eGwCwf9wKNi8ZrN6eawMTeGUdn7usBlUxet+ISuClkg=;
 b=CTJsiR+eVcxpCdW94tXRkqR0Me9ZGxXGqes5C4GAova4Uy66HuB6DuL9sEeCgVGFrP
 bNA2f3P/IdH8wb8DISpB5QaXl861cpDuMsSHbq8SPS5Hs1HGaSLmHsUNSLCtG7XqwxaS
 4ieYUpwb0zOZoLDl7gzaDwH/0B4Is5WBiO23GA89AENc7uOGnf+MNX5FRrmJksVCGyjS
 2Yw1M3HxuEXfhUchkDIqARRyCwstoBASj5/V15vFPs5eKZgruE5e1EWHxybyKbryKxPe
 /+oAzbLW96kcLxcnYFg82C29BjPaAfSRdHv8AiwqJZgLNkx95IugXovbZ2+fXzr27VE+
 Tt8Q==
X-Gm-Message-State: AKGB3mJepdNG0b4Iu+n6iRBoVc9fixdHZnXEhb6pSE40m9MQZaZnjwtF
 ZEJO4amhiSVWR+j8HsPW9GqqKA==
X-Google-Smtp-Source: AGs4zMa2PYPcYfKaQoiHYnJxUzduxFJi3EvalHq5AEMuvzXFal/qeNIMWOR0TjmStwT4Kl1CctWVMg==
X-Received: by 10.36.58.11 with SMTP id m11mr19074751itm.109.1512509944993;
 Tue, 05 Dec 2017 13:39:04 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id k66sm617500ita.6.2017.12.05.13.39.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 05 Dec 2017 13:39:04 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta-q71l: move coin
 battery sensor
Date: Tue,  5 Dec 2017 13:39:00 -0800
Message-Id: <20171205213900.165038-1-venture@google.com>
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
X-List-Received-Date: Tue, 05 Dec 2017 21:39:09 -0000

Moved the coin battery sensor into a separate iio-hwmon
instance to facilitate reading it as a separate hwmon instance.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 21fc01f2414e..252932983de8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -117,7 +117,12 @@
 		compatible = "iio-hwmon";
 		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
 			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
-			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>;
+			<&adc 8>, <&adc 9>, <&adc 10>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 11>;
 	};
 };
 
-- 
2.15.0.531.g2ccb3012c9-goog
