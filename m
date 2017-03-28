Return-Path: <raltherr@google.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vt4QB1pm0zDqY4
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 08:53:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z6LkNAnB"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id y18so131093749itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KmjgUBW0adinkGnz3syxkbQsxnVRT359mecdXG/0a3Y=;
 b=Z6LkNAnBg6BIZL7ge7h53ORsvSbUlwHg9oB+WDPPlAGFH2Bk4DTZFUokfNTblC0Z8N
 W4FpAljRHoBoRoV6Ol8KjNhoRS22UDiKkpEQDu2y4mlTOVAW/iBPBX7aSikIGE+CYeKB
 77r2A7P8LEJnyFG8WZMPjQx7BtrK2U8Xtk6vZfXEli6q/hubIXpMy/+Pd6gmTbwSK8x/
 KVLs4chHvSixslSRxJ2ZyrdEVBaqDgQL0EIaqA/uytcuTP6kDS+zpb9cecJFiAeCphDi
 F4/yZ286y1sPguNxcIw/1bQI2rbKsZAX7DvGhwaCycqYqUj0M5sHFv4F1NWjQHE8E8qw
 nQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KmjgUBW0adinkGnz3syxkbQsxnVRT359mecdXG/0a3Y=;
 b=nRuq0GhvAlMEaypssB67aVqkSqmbTd6txTKsVLHK9FtUEajEZGvx1Jwd6mLqHwqgBW
 WPSqx1hCc9UqAqPDnN/bGbOqSCkEH8LQBwry4NrGKxtEbGGbUjGP8+rBqd+2ZEQFaoca
 6dvgpi/BrWLtTXaXq7D8Jw6KSLtwBBQrz8ijvzZ0l4m8e45gPaRPgittUMQiMatiWTAm
 p9NBJT8xtpj4T1JHdto7UXnQJ6M1/kELP95qwCtamxnIAL1TC44KLxCT6zgFE4EEVgDv
 tvkA9NcJn+EBknSstYkchLWmJGR8jLCDSe9J1Ua2Ao6Vh8ze9RU7y7aMGMVkCLRfs+EG
 94dg==
X-Gm-Message-State: AFeK/H2ykeJLdSIvG6MY1Agqq7G8dG8C2I5ZPP7TgqqBX5zjv0hv/tmqTSaVgSFyifzzg2DD
X-Received: by 10.107.164.204 with SMTP id d73mr29418634ioj.182.1490737982494; 
 Tue, 28 Mar 2017 14:53:02 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id z20sm2599183ioz.23.2017.03.28.14.53.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 28 Mar 2017 14:53:01 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: [PATCH v5 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed ADC
Date: Tue, 28 Mar 2017 14:52:58 -0700
Message-Id: <20170328215259.31622-1-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.564.g063fe858b8-goog
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
X-List-Received-Date: Tue, 28 Mar 2017 21:53:06 -0000

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Consistently write hex contstants with lowercase letters
- Drop model numbers from description as same IP is used in every generation

Changes in v2:
- Rewritten as an IIO ADC device

 .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
new file mode 100644
index 000000000000..674e133b7cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
@@ -0,0 +1,20 @@
+Aspeed ADC
+
+This device is a 10-bit converter for 16 voltage channels.  All inputs are
+single ended.
+
+Required properties:
+- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
+- reg: memory window mapping address and length
+- clocks: Input clock used to derive the sample clock. Expected to be the
+          SoC's APB clock.
+- #io-channel-cells: Must be set to <1> to indicate channels are selected
+                     by index.
+
+Example:
+	adc@1e6e9000 {
+		compatible = "aspeed,ast2400-adc";
+		reg = <0x1e6e9000 0xb0>;
+		clocks = <&clk_apb>;
+		#io-channel-cells = <1>;
+	};
-- 
2.12.2.564.g063fe858b8-goog
