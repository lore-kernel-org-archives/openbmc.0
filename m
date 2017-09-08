Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::232; helo=mail-pg0-x232.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xe+ymG8z"; 
 dkim-atps=neutral
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprlp134NzDrbr
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:42 +1000 (AEST)
Received: by mail-pg0-x232.google.com with SMTP id v66so6787675pgb.5
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G6p2YwYpAdoso8K06jZa/67DlI8T5GSMaui7J8Ob4IA=;
 b=Xe+ymG8zHMEIVYggE1RjoXFe4Be0Q9ypCrs/Nr1h7Ms5VZp+VnxwrNvNoUqyxtuaua
 U8vCU6IugJSkVGGuQIMH/vQoSVa3yzjKChwdDh9R4nH8zUCRuliMMr5LATkZ1DTjZKJE
 Nm5v635X55qP8jlnN91vhjBtsgg/JLd8TQfkpfo71AEyuTvZkWk62GoWtCyd6r9nhN2o
 gVI7MTX94eM5iPRIRQwNtTZ2kEHvu1Qo81V7Lmt2E+E+YRJEGYndnNFNqQZIp8W+l+Rn
 GpQWmLmNb6JAm6tyWmS8P2XKSWc6q5VElDoB8r6mZV6vZ97U9y+SejUEUs2UO+E3SA3c
 XUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G6p2YwYpAdoso8K06jZa/67DlI8T5GSMaui7J8Ob4IA=;
 b=fOjS1XuIIxN/Wpyn6Cih4e3/eKdsmx1QH+o10eYEbq18fesd+CBM6Ps4crr9Vnw29q
 8T+myKxT2loqEOdEOrSujvJDtmj/AAIKTD3tbY5A9QJpyvyUXhszj19eTaU7rF2tzizO
 mT8JKIvEfEGIaSqMclr4narktqZwGzrROz4ptcLrHWXtMBDidTiYiB5zYhF85n4u10D+
 uVMsNYuoPAaazw+TA5FO40Y8i90nBA9t44VG6pGzGGaZBqUGJLYDnL+E/C9ADkgU2ciG
 012BqqhByfC6anAnCk1tudqfKwAqi8rAx2QvcYKiQLd0ai3epba4xSjFjFb4h7A9Grpg
 aqJA==
X-Gm-Message-State: AHPjjUgQfv5gSUhofAdyS22NF4ZII19MXqS98E2wW1Cv8QMVMf92jCxv
 LAcnguLxZYGQ86rFMhuy7w==
X-Google-Smtp-Source: ADKCNb5Tzs9k2beJIij31cF3qU4Mi7HLi9aa7VWjZbywVzT88itWfeJfnFdj5XuN54Nk3rElT6L+BQ==
X-Received: by 10.99.53.205 with SMTP id c196mr4471817pga.430.1504907859988;
 Fri, 08 Sep 2017 14:57:39 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:39 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/5] ARM: dts: aspeed: add LPC snoop device bindings for
 ASPEED G5
Date: Fri,  8 Sep 2017 14:57:26 -0700
Message-Id: <20170908215728.115818-4-xow@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170908215728.115818-1-xow@google.com>
References: <20170908215728.115818-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:42 -0000

From: Robert Lippert <rlippert@google.com>

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index bb7652a61bec..9a988f69e610 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -154,6 +154,13 @@
 					status = "disabled";
 				};
 
+				lpc_snoop: lpc-snoop@0 {
+					compatible = "aspeed,ast2500-lpc-snoop";
+					reg = <0x0 0x80>;
+					interrupts = <8>;
+					status = "disabled";
+				};
+
 				lhc: lhc@20 {
 					compatible = "aspeed,ast2500-lhc";
 					reg = <0x20 0x24 0x48 0x8>;
-- 
2.14.1.581.gf28d330327-goog
