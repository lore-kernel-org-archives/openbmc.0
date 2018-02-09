Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::243; helo=mail-ot0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sHopNkTy"; 
 dkim-atps=neutral
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd38n0MzWzF1D5
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:12:25 +1100 (AEDT)
Received: by mail-ot0-x243.google.com with SMTP id l10so6566232oth.1
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9WOG873e4Oox5WjdBP1hjG2Ukr0rhf/HiFKQBxM5YYA=;
 b=sHopNkTyxj4K3fmBzZ2+z7U1CV0z7I88PIG6jbUFGVF/xyj8MWer8cLpVc3sc/2vD7
 9ec/58Vs9iD/Vft67T0cKWd90IDWJc3a7hiTmuRvZddp0ZEfiZN/RsG8itS8wIAmgLZM
 HK0EontNuO3VBzvFgxqcdqfNdPfg5jRS18RKy+4mLexXEgbE5Z9MB+peG9I7llQjYBc/
 w2++O2qNQq6w+HAtTtNZnKgrxahlRhvpaoj2YWKNqVEwu8G24KsIxP9Z0JhvuA2uZ4oF
 +DL9exdq5xPNpnSfINK9XswcfApHA+XcBvvSWq5WT6BRYNrHgVOc6NnW8GcDdGbmm2V/
 1w2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=9WOG873e4Oox5WjdBP1hjG2Ukr0rhf/HiFKQBxM5YYA=;
 b=BP1Up+9rbfEZGy/RmJybL+2DDp4LxgvwJaIFWpbm5HwKJilLv8jLZ1tLOzqkQPXmDF
 tkZjRXWea0z4TVT6L5saxX/I1P/Rqtv7/AcIdWER/cwgbkYvU18It8ntWNs+NxEj9MUE
 frdi83kfp1JJyTbq2kFgO6O37fhecFFWMHrYq8vyLqyHxlpzhb1X2ZmLgIwl3q8w1L/m
 kKliGiW6kygeNJIJgTtYTy761ZGrwRBuf0IX18NRTeHKFFqMkrvqPLkHH/pbaT0EoDtO
 mP8pKkH66fRtaWyilNuGOAOXbOK0fTacAke4oB7/N5wHTAu/krj1HrIr1CASo1ut+q+c
 awbw==
X-Gm-Message-State: APf1xPBuw/Ht9qyDIFIz5TQyPtgiBwd9/tHVVAldpCuxecx5tG1RPiIS
 uWys7mB5fuwSzTD92fXVfnkrumso
X-Google-Smtp-Source: AH8x227xl3E4s/7jpTb/kBt7LM1QLQNV5O3rVX6ymcN7FG7yUdeZg/rRhAlIL5bxKW4scLSl4nbG8Q==
X-Received: by 10.157.29.228 with SMTP id w33mr1160829otw.97.1518153142662;
 Thu, 08 Feb 2018 21:12:22 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id e2sm731080oii.46.2018.02.08.21.12.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 21:12:22 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 15:42:17 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 v2 3/4] dt-bindings: aspeed-lpc: Document LPC
 Host Interface Controller
Date: Fri,  9 Feb 2018 15:41:57 +1030
Message-Id: <20180209051158.32354-4-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180209051158.32354-1-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:12:25 -0000

The LPC Host Interface Controller is part of a BMC SoC that is used for
communication with the host.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
index 514d82ced95b..c40b707df907 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -109,6 +109,45 @@ lpc: lpc@1e789000 {
 	};
 };
 
+BMC Node Children
+==================
+
+LPC Host Interface Controller
+-------------------
+
+The LPC Host Interface Controller manages functions exposed to the host such as
+LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
+management and bus snoop configuration.
+
+Required properties:
+
+- compatible:	One of:
+		"aspeed,ast2400-lpc-ctrl";
+		"aspeed,ast2500-lpc-ctrl";
+
+- reg:		contains offset/length values of the LHC memory regions
+
+- clocks:	contains a phandle to the syscon node describing the clocks.
+		There should then be one cell representing the clock to use
+
+- memory-region: A phandle to a reserved_memory region to be used for the LPC
+		to AHB mapping
+
+- flash:	A phandle to the SPI flash controller containing the flash to
+		be exposed over the LPC to AHB mapping
+
+Example:
+
+lpc-host@80 {
+	lpc_ctrl: lpc-ctrl@0 {
+		compatible = "aspeed,ast2500-lpc-ctrl";
+		reg = <0x0 0x80>;
+		clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
+		memory-region = <&flash_memory>;
+		flash = <&spi>;
+	};
+};
+
 Host Node Children
 ==================
 
-- 
2.15.1
