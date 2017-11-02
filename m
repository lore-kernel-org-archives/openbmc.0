Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QQvkRzGk"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS88X1Ny9zDr5Q
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 13:26:03 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id b192so3753710pga.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 19:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jNvDjjai7PAxrIrvn++8SD4uhOcC1ZS3f4Fc1Ez6tIo=;
 b=QQvkRzGkDf6EifVbz84TNd7VDwHbCVoWKLBLyT78L0THs3MUcgjYM4RoKZ3eRPrG0d
 nz/e8T79QoN/wE7803i6G1Oy9veVWPypuvEfSBVq7UJOJOFBFO/XIlSv2sW8ZQ4E8HMZ
 joBBxqTO0VIApDLbQ1/LTYyLFd0obOJm0rQXlE7wWM41PMRhC3/hGjqSB6wdC/mYVBC1
 159mhbCrmYjnIt9vJnVRF2kS5IYZY+nHW8mIuawiKUiYXeY9Vs15SSRzoMjWzVQnOIEo
 E0DV10muZ+NMnA+tmUW6VzoNBQX1Z1sgS0ba3jSdyS2hIxdXNtal1bPj8WwcU7pYOiNA
 31YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jNvDjjai7PAxrIrvn++8SD4uhOcC1ZS3f4Fc1Ez6tIo=;
 b=qspaAdyRfw4VE0d2wpMHQrI1ZODN9LksRNXWCvImg0o0FN7tm8Kh4VTu5ohI8nhaU+
 T9nxP0U3beVh+AX91FTVPUlCFltMFPinpJmzdEXHPNlnHdIYnFXizXLfY+TXsNcdiYNs
 ELx5SXO0EhgQJtzyg6LW9DpKFA4wVkyK072vrCUQecaOHAqic/4uzIAkH2njypIl8PbV
 zuSkfbhImrE0JEdd8ZQZCcfVGIykp6DmUu77ZsHrE5CgDYRPs8ara8aLJddKyAtBvWor
 Rh5ReCKguA1NvY/rYYGpP/3/obfJJ5Q3FeMuSEpbixFxPkEybqURHqHTwAGWopnwlPu3
 GGUw==
X-Gm-Message-State: AMCzsaU0O9AmmWd/rerpm44Vhcs8H3Ih6CQr8fxKPW4zN9qeF0reQAFA
 l5Q94pvCc1CnHQHx79OrV/4fTTqA
X-Google-Smtp-Source: ABhQp+QGYFsM8uJ0AimkcFp+BKn2kZ6n1nmRpMKZMjQDD7OU0y/TbrMysRAyrV6zE0n/RntUK5CnwQ==
X-Received: by 10.98.31.14 with SMTP id f14mr1952307pff.235.1509589561943;
 Wed, 01 Nov 2017 19:26:01 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id 84sm3042888pfy.179.2017.11.01.19.26.00
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 01 Nov 2017 19:26:01 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/3] ARM: aspeed: romulus: Add w83773g temp
 sensor
Date: Thu,  2 Nov 2017 10:25:19 +0800
Message-Id: <1509589519-26697-2-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1509589519-26697-1-git-send-email-mine260309@gmail.com>
References: <1509589519-26697-1-git-send-email-mine260309@gmail.com>
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
X-List-Received-Date: Thu, 02 Nov 2017 02:26:04 -0000

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 86f7927..eb0994e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -255,8 +255,11 @@
 	/* CPLD */
 	/* Power Supply */
 	/* Temp Sensor */
-	/* Temp Sensor */
 
+	w83773g@4c {
+		compatible = "nuvoton,w83773g";
+		reg = <0x4c>;
+	};
 };
 
 &i2c13 {
-- 
1.9.1
