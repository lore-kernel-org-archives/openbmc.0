Return-Path: <ghung.quanta@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=ghung.quanta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SRyDZBKf"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JrSb6h4MzDqWy
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 00:16:31 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g21so9751005plq.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3XLypKZbOE7b5olH8wFcYwlI02ktNrldwBXglURa3w=;
 b=SRyDZBKfR6VLuQOeonUrKfw8C7A4yF0d3XMQJwjtp0LfMXI4HiCjx0WQ8U62jWYFsZ
 DVqV5Sc2DTx+3Zj9dFFodnSBWUmQP3kobhSvtrvVU105g/az29yBBuIEUz3T9B/8WRA+
 qLJyDidJIDRzrFEqrVi1UDMg+KRFLUbUnzGhXSnKQAOdIyuk7h7qVSmBBLitwr2vJI6x
 KioMQaxD5g6qwJkzEALSAZrmbyf/bpxBIRfKJDpa9Ax1xNbjtNNYhM08XxoIi+syxAjP
 NxHFkvcKZUSEF3ojvBkbCy/aOd3CiusdDnKW3y+IKuTQeEnmPpomVHvCvRTcSFJF1PML
 b97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3XLypKZbOE7b5olH8wFcYwlI02ktNrldwBXglURa3w=;
 b=bEC2KK7joPkVVtTA3sZ2inK2NoUUb6vZgPjw0lo0Q6odW61Zni0QfjedptWvx+y3My
 MrEWkmXUC7YkVbcTWoECrHWN3epyLpDZtUxFrXftE9mfQ7VDh8p76E/hP0QsHHdXyMA6
 sWx4Eq4qA8yDKbFKPZPTxOMwUi44huCq3YK5A6z6n7FR/vtD+NT4irJ/7LTJjAK2itUi
 l6ZMEdRYqLyE41IroJQG4lpJhVjuGsbpIh3yDPuNl4O1ucj9x3HnI0E4ACsPRqDUW0Lv
 btmaFfVit7eBeENYnkD6YOSXCsGkEAHhwaaiFWLND3xzJQ0F1hJfBxxkIN6PAEAuIN2Y
 uKtQ==
X-Gm-Message-State: APjAAAX0hd7M/daE0MzHC4jfZ9+68ZjtEG+wHory7eKnrWaSyJLGyhYD
 S8jtFmEzWRGAupm7GYX4wZA=
X-Google-Smtp-Source: APXvYqz3yeokdSf0SMdH/IVvBAh8QltwCxeaCvedVcmCsDQdM6ywLVcbm5pG9vifCmcBDxYN2Ihpcg==
X-Received: by 2002:a17:902:b18c:: with SMTP id
 s12mr42363782plr.181.1559744189242; 
 Wed, 05 Jun 2019 07:16:29 -0700 (PDT)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id 24sm22376443pgn.32.2019.06.05.07.16.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:16:28 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
To: linux-edac <linux-edac@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: benjaminfair@google.com, wak@google.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 James Morse <james.morse@arm.com>, davem@davemloft.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Wed,  5 Jun 2019 22:12:53 +0800
Message-Id: <20190605141253.38554-2-ghung.quanta@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605141253.38554-1-ghung.quanta@gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2019 14:16:32 -0000

Add device tree documentation for Nuvoton BMC ECC

Signed-off-by: George Hung <ghung.quanta@gmail.com>
---
 .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
new file mode 100644
index 000000000000..dd4dac59a5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
@@ -0,0 +1,17 @@
+Nuvoton NPCM7xx SoC EDAC device driver
+
+The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
+uses the EDAC framework to implement the ECC detection and corrtection.
+
+Required properties:
+- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
+- reg:		Memory controller register set should be <0xf0824000 0x1000>
+- interrupts:	should be MC interrupt #25
+
+Example:
+
+	mc: memory-controller@f0824000 {
+		compatible = "nuvoton,npcm7xx-sdram-edac";
+		reg = <0xf0824000 0x1000>;
+		interrupts = <0 25 4>;
+	};
-- 
2.21.0
