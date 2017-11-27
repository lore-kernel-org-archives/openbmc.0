Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="u2TvZ/E/"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylyX114VjzDqn6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 07:07:44 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id x13so22613383iti.4
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0+g2yt3wAyDgTwjfmVYjOemADd2KQu5wZthPLw8GLvo=;
 b=u2TvZ/E//REJblfymKQKoCsWOnBq/HNC/PXFl9tNAalRYgBeGW4xb9L4Fdp76yIi89
 lJvToT9G5Mj7UNeaW1MtAbQp7c0f4RzsX9YH4CpDOBs/Fgm2WWFCkSl2Z+Ni5pxhYxHx
 90ta/LmM2MV9NRjaYIABq6viKTC6uC7DviqHk4NAJGfrxFKhDnyG2Pw936221lG2shlf
 nEA1JhJZh0rLmRcZ3c2AxXiidnDepg6dmGf7944gzs+KYqoyVwQ8h3/kCQuGBPJJaRxB
 Ll1JbiS3QXWWo7FCFTyiw6Gxee2NzTXZfybeE8vKaMH54J7inpk+uUK282PEIpZmQLI/
 P1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0+g2yt3wAyDgTwjfmVYjOemADd2KQu5wZthPLw8GLvo=;
 b=OfzDFB94SrVZNgMxKejPXMK3EF2EpL71hSFS96ArxmAC8EpiF5rK2PGbm92+U3YW9D
 qTbhe2It2eNBIXFsyoPdLnVdBkRs6J8xdMKXUP312g5gaVR9BxzBad1uUl51LkNNQvXW
 6ys1LCgab38ZyQNDJct1Hz+tdyBbtfW2fV4e+p8h93W2v42IN8J/0nm5vAkmzoBmrauD
 nDYhH9eyG7CQfpV4byV7nCx6AWBGok72Z3oiOQn8B7pJZN9etzFUy7JgV0g9XD+Q9Wtc
 zbjOGRo3UrVGbPAUWH6Hy8IXYZcywOANg/WbqcmVf6irUJ8U/tJN9cxOpdtdwsxB/Ib2
 aoPA==
X-Gm-Message-State: AJaThX7VIfdaJk9AHrLg/iqdgLd8fZRmuHQ99+XGWF2pJqJASopI8zQB
 UaxZAiHdRncuJL2kKYa+jn5uiR3zHcw=
X-Google-Smtp-Source: AGs4zMbv3usb5SImraN0FwF+3wbHtjwMT1/kR3IvVuiewbORDd9zp/AJpuDLZpw3MPMSgWve0FTl7w==
X-Received: by 10.36.115.79 with SMTP id y76mr31057542itb.144.1511813262710;
 Mon, 27 Nov 2017 12:07:42 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id l200sm7763314itl.36.2017.11.27.12.07.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Nov 2017 12:07:42 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed-g4: add serial gpio driver entry
Date: Mon, 27 Nov 2017 12:07:38 -0800
Message-Id: <20171127200738.188390-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.417.g466bffb3ac-goog
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
X-List-Received-Date: Mon, 27 Nov 2017 20:07:45 -0000

Adds the serial gpio driver entry for the aspeed
ast2400.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 424d843ec1da..b82ebefcb025 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -238,6 +238,15 @@
 				clocks = <&clk_hpll>;
 			};
 
+			sgpio: gpio@0x1e780200 {
+				#gpio-cells = <2>;
+				gpio-controller;
+				compatible = "aspeed,ast2400-sgpio";
+				reg = <0x1e780200 0x100>;
+				interrupts = <40>;
+				interrupt-controller;
+			};
+
 			timer: timer@1e782000 {
 				compatible = "aspeed,ast2400-timer";
 				reg = <0x1e782000 0x90>;
-- 
2.15.0.417.g466bffb3ac-goog
