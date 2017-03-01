Return-Path: <emilyshaffer@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYVpl6RLDzDqLT
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 09:43:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CW/9rpTf"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id x66so15192291pfb.3
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ACOX/Pb0kB0b2sfcJKAG2jwdHb2vtB2W/kWyZLl3KGM=;
 b=CW/9rpTf9GsKQvHe4YoSLaMiiWYc+A9HBUNqRYU2sWqGTWEr+Dcv7PdPIqBnHkzU+x
 sYoQ4YZiK/pYXfHU2/MlJVnHXOmhkQo0yKeOqbGwo65exutbf2U/rINvUs5H9xt/1Txb
 rZ3DndFqaY34LESZtZ72xOTwF5VxG+y03D28LLRIOfpb9R5dOql1COrfZXcCD1NyGZ+3
 VjkLolBIEBAY6m4QylSsZsQxaBkHCqh7KLktqX1UgIqB4eVeANNnGDIjdug40UKSiN2T
 pnOrm6BDBpulil16OZmq1ZrgBOSFF36fWH3viPHIqT1e1dRaMbRDu9vE3mSpHT/d+Fv5
 LQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ACOX/Pb0kB0b2sfcJKAG2jwdHb2vtB2W/kWyZLl3KGM=;
 b=nio7Oil4ZbGXe1LF5xCd6A6nuwY4b4htEzaoQoK24ChtLeQMCFmhZmCBwS1WXZL0zh
 B1VtI3v25ZQzVPuhyKKvW5jrhc8x88UlzHtDtEhNBwp68UIDD30OA8ctJWj8F0hzqTHR
 wHIoRUFz7WiHYRC4DznCMA7cvLIv+PpQhH5GfwqWOOMXZFQvMLURoV8fvPIweviignP9
 dS9OGAYOGBam85inlSLiYYsk5zuafsOQONZXSAnhpbsKIXuEtK6uFdIVcJhckNT9zmMG
 Ob/aGZCJaGq1hE9Cg52CSzqxjoq3hZEFKPSJD4KsapFiG3ldHXKSPlgGueB3JnLQmyPN
 +DQA==
X-Gm-Message-State: AMke39kbCVIezbeJzJQLthu/Pmy8CJwrWs6n+Z5rcM3Z7oq/T3bhfn68zYj+cYM1D3kvFwUA
X-Received: by 10.99.66.3 with SMTP id p3mr11591621pga.214.1488408204751;
 Wed, 01 Mar 2017 14:43:24 -0800 (PST)
Received: from podkayne.svl.corp.google.com ([100.123.242.22])
 by smtp.gmail.com with ESMTPSA id m29sm12532263pfi.54.2017.03.01.14.43.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 01 Mar 2017 14:43:20 -0800 (PST)
From: Emily Shaffer <emilyshaffer@google.com>
To: patrick@stwcx.xyz,
	xow@google.com
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org,
 Emily Shaffer <emilyshaffer@google.com>
Subject: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c mux
Date: Wed,  1 Mar 2017 14:43:12 -0800
Message-Id: <20170301224312.21540-1-emilyshaffer@google.com>
X-Mailer: git-send-email 2.12.0.rc1.440.g5b76565f74-goog
In-Reply-To: <20170301200526.GB837@heinlein.lan>
References: <20170301200526.GB837@heinlein.lan>
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
X-List-Received-Date: Wed, 01 Mar 2017 22:43:28 -0000

I2C mux pca9541a@70 for Zaius was incorrectly configured, preventing
hotswap@10 LM5066I hotswap controller from being configured at startup.
Adding the missing field results in the hotswap controller being present
immediately at boot.

Signed-off-by: Emily Shaffer <emilyshaffer@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 548ef1e939fe..7015863751e0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -258,6 +258,7 @@
 		i2c-arb {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0x0>;
 
 			hotswap@10 {
 				compatible = "ti,lm5066";
-- 
2.12.0.rc1.440.g5b76565f74-goog
