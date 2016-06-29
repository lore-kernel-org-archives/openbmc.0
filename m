Return-Path: <raltherr@google.com>
Received: from mail-pf0-x234.google.com (mail-pf0-x234.google.com
 [IPv6:2607:f8b0:400e:c00::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfr7j0HgCzDqw0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=S9ynJEEl; 
 dkim-atps=neutral
Received: by mail-pf0-x234.google.com with SMTP id h14so20362424pfe.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=cZOiQOTiBBzCRF7P7RLUz3f0cSr3TmFqJdlKhlPg33Q=;
 b=S9ynJEElvU3eaRqLjXSPlYdDJ25nzfcS2KcSvOReDw40IrAc2EZvjNHQZTwuIqL0RH
 AlgueUVlEA7LcAW2GJIJ61D81Itex5IgS+SJEiBBv7OSCb2fBSHeQYFlPKxz6JvSifCU
 lMQRaB0+Fsaa0zckyWAuxbIMBvJ4m6azpNSJZWErdLZD/yvzSbJbDFD7H9KUK+XVIa8f
 5FhJe7dB8+3I83AhOMn0numapuuzGyC7wyo3eFBy1y37+/nRyn8k8W186eKcdRlYvYU2
 0Ox9Q5kXtJaE9U4bQ1Oi1O3kfP3DZKMU+rfSQNR6rfQrG+JegS7bIEf2l2YTxvtdgh7z
 5weA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=cZOiQOTiBBzCRF7P7RLUz3f0cSr3TmFqJdlKhlPg33Q=;
 b=U3plpuzuqJ/7gNi3tX2o0wewNxtH+L+rcAze0MCe3mf5UHHd0b4vW2Ne9XbajHVHpI
 f0u/v9Fj9AZClDLE8p4mMdwvaYN3pAZ6XQbSqTRrMUaQQnEtT5HvvvaDvafhb8AxPF/D
 lhpzZZYyX66sUd/tEmlXoIXdajXJ5GPoEZw+KFy4/j3Jfrrk4uH+3bFGtdAtNkXrvaaO
 +FWEtWNZmUQYX5zFfUVXs9B5PRcyE1AOVf4Zqv52qYugwWHB0KTRZhKMuF5J3lTMluu0
 frKXj76K56FnPwZiDg4sX547ToGhVm2OT8Brieh2gY9TBYtOsd+DVRMWnobRXa25tUL3
 QdUg==
X-Gm-Message-State: ALyK8tIEhjSrP3l9UYRw5tl376kd6Ahxs16EyyqfA8MP8AYXEns77x7shMBplNlLy4JRe2DK
X-Received: by 10.98.9.68 with SMTP id e65mr13969552pfd.121.1467223246370;
 Wed, 29 Jun 2016 11:00:46 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id ln4sm7513693pab.38.2016.06.29.11.00.45
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Jun 2016 11:00:45 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/3] ARM: dts: Add FMC to AST2500 EVB device tree
Date: Wed, 29 Jun 2016 11:00:41 -0700
Message-Id: <1467223243-9156-2-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1467223243-9156-1-git-send-email-raltherr@google.com>
References: <1467223243-9156-1-git-send-email-raltherr@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 18:00:50 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 87cfa4f..a80a6b9 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -18,6 +18,20 @@
 	memory {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+			};
+		};
+	};
 };
 
 &uart5 {
-- 
2.8.0.rc3.226.g39d4020
