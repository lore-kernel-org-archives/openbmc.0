Return-Path: <emilyshaffer@google.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com
 [IPv6:2607:f8b0:400e:c00::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXsdr1fbhzDqJw
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 08:48:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cvKzB8qb"; 
 dkim-atps=neutral
Received: by mail-pf0-x22a.google.com with SMTP id p185so5763337pfb.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 13:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eySIYzi2x3Z6vYLNrXCH1r8AJL6ed2FIjldJdkc+7jI=;
 b=cvKzB8qbCsMcwHQQpaN6teDdTJ7urp5y4mUTdLuTVc86mTB27HlNXXJy6kQHBSrwb1
 KUwQKj5s0kCKU/EattFnQwxcsOWiiICJh1UDMH+vlqOxqYiJhSNgNg9s8Uu51K5ty/HE
 KMdHyX1YnQnG75E/oIGaA7OSJ8EdxUQV1Gd4kvHwg1CAjVCWyP4WhkBrLqtQ+yssaMyv
 XnYdKrIojbqiyGNU3wF6SzJoPGKoWBO7t3GeX3Lz7VToHihdiQo0zNZ3m3+IAA0ZF4CF
 UL9fgKH3GB4vS8EOI/LCtuqnmjVS32q8zNdGjdPt4R2pEYzB20IymRVKJ2dMilA3d+3l
 yI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eySIYzi2x3Z6vYLNrXCH1r8AJL6ed2FIjldJdkc+7jI=;
 b=IoYnaVxJ9Zxu+QJ8IXQ5JdLau1Yy+2nmWCntSXa7boW9lfkWt4jO7JGnbiXkE0lD9w
 f0MvNJH+RNN45qD59TGlurX+Ucyo6IXUJwxaMnCnn7k9D1DHyBm1ZOrdFvVVDF0tbiM4
 hdwmIqujpbdPynJRZ4R51SqA+MCWBh+m928nMYJsc2HyO0UfltHcVZXGQCKpG8AtFqgf
 elDdezO8+iA+7ODfegMM7hhkpFgs+DCafamWWkvIKGX2PmtXwZivzhu46uIYRdYZG1nk
 +NwiDxF+H+dD8+51b3XYxVpd+g/z8VyJXUW6Mqs1kaG1i/LiI2aUlNr+V/qjK1PUHQNu
 1zjA==
X-Gm-Message-State: AMke39ka8YwSrwio+DAnI3tsrdEkvviita7xectcfHuj4ELPMTjMuvHbgeyLPsVPn/O5d1OY
X-Received: by 10.99.44.138 with SMTP id s132mr4988157pgs.88.1488318508353;
 Tue, 28 Feb 2017 13:48:28 -0800 (PST)
Received: from podkayne.svl.corp.google.com ([100.123.242.22])
 by smtp.gmail.com with ESMTPSA id 74sm6074499pge.30.2017.02.28.13.48.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 Feb 2017 13:48:27 -0800 (PST)
From: Emily Shaffer <emilyshaffer@google.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org,
	Emily Shaffer <emilyshaffer@google.com>
Subject: [PATCH] ARM: dts: aspeed: add reg field to pca9541a i2c mux
Date: Tue, 28 Feb 2017 13:48:23 -0800
Message-Id: <20170228214823.3696-1-emilyshaffer@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
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
X-List-Received-Date: Tue, 28 Feb 2017 21:48:33 -0000

I2C mux pca9541a@70 was incorrectly configured, preventing hotswap@10
LM5066I hotswap controller from being configured at startup.  Adding
the missing field results in the hotswap controller being present
immediately at boot.

Signed-off-by: Emily Shaffer <emilyshaffer@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e2195a641414..751c79d6dfcf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -246,6 +246,7 @@
 		i2c-arb {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			reg = <0x0>;
 
 			hotswap@10 {
 				compatible = "ti,lm5066";
-- 
2.11.0.483.g087da7b7c-goog
