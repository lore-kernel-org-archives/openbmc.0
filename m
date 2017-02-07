Return-Path: <jaghu@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHW1R2WsJzDqCD
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 15:04:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="O5sB8sk5"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id 194so34559329pgd.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 20:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=75Hs8z/hU+1WgcBQBjyWj2dpfnZhcOtKDcU20w6v7S0=;
 b=O5sB8sk5GEJoqFCaKwHpCinXFbA8bbcvrnUMNZtKxQEpXEew3lYy2oagv2vwpFr+Qh
 Eheu+/F+DykeBwtIqTu8wXcD1AYcSsi0Wc2bSe1qgFoU6isblRSLPhINjbpcIuWTmlK5
 GVMeywiRjdTBWrUsfBMYeEF59zkRBFVwk5fXUauYEXwhl7opEMmQjIqjoqrkb246GlFR
 u9iIeoOZfnxSfmpoMDPaosMKHc49oHz7XLzJSFtS7edBtUTSRIMVtDF4wy/FBK6nKlIQ
 PK8VUsBkrsovxhbo3rOfPDWDmKewLc/VXlLo9q/7/SggUwQHq6d3sIO0eqe08Te5VmRQ
 3fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=75Hs8z/hU+1WgcBQBjyWj2dpfnZhcOtKDcU20w6v7S0=;
 b=bPoEMp4O/N/GjDgDGOWNd3UfDEUYy8oN+MTgEqCZXWTopG1oMv+zKdlfLTGksvSJnR
 SdsWHUqUSQZz/Qb8fuB5RF+zNq0GgFXjn0gRyVYE8YIfrlAaCfBP4jb3HUcxZQFULGyR
 MJ0KCCAzjYFbWtg5ZHWH4TalC2KrFof5qXxn0u4H5QxAOfOdfNDVT9DQF1F5r05Oe0qz
 dzpLn0hr1dRk2059QLZUij6+QxRA2DSdJt/uPQMLxpx57EtwbCbrjLJIy84kUTa3Jeln
 GxIR3phsR/Mxyefgy2oxqdU7hvZUchxR+/DC5/kqAhLkdEkJrboIymQI0g/7LL90gQPE
 zHIA==
X-Gm-Message-State: AIkVDXJHT/W9P5s4+ePjAROVjb8WTclxs31lgDgOMLPHs2Nrp9jE1dEzBdtTz5j5xKW825ap
X-Received: by 10.98.66.82 with SMTP id p79mr17364806pfa.10.1486440249219;
 Mon, 06 Feb 2017 20:04:09 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p25sm6289384pfd.0.2017.02.06.20.04.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 Feb 2017 20:04:08 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Mon,  6 Feb 2017 20:03:56 -0800
Message-Id: <20170207040356.9891-5-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
In-Reply-To: <20170207040356.9891-1-jaghu@google.com>
References: <20170207040356.9891-1-jaghu@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2017 04:04:11 -0000

Add clock, data and clear signal GPIO lines to control seven segment display on
zaius platform.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e2195a641414..2c3297bec9b7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -74,6 +74,14 @@
 			gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = "400";
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &fmc {
--
2.11.0.483.g087da7b7c-goog
