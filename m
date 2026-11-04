Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185AF606A326
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=ONUjGbGG
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKhBt0Xg6z2xb9;
	Thu, 05 Nov 2026 10:16:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::6"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793834165;
	cv=none; b=PexJi9MQPNqyLOW+V/d3Ik4A0eCUJvnYlL3gC55gaTOuJm/3rl8Yq4+/xVmNWSPVFQj/TmIbedd9XqTXbvX/6xwXVRDl9AHfJxBPnmrMX3FkfaqiImEPflxZUvgTZC37VmvXUKpBi8cadmNy7aIml3FUzjKGUZWnsStpyqrp2iF5HVdyAmnxv5rcEyqWasWLLWcuTm6i4jAaEIUlA8Gf7UJtY9m4M3C2ZyfZUzzf64Iob8bopfxMiPhc1LACfwTlEPwuLlU9gXwvdhkxJfls82w/gWNes/iGc9Oc3T3c4/UDSa3r88dnx6wkh2KkmBzxHdg/iNpxzZ94L0fOLpLH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793834165; c=relaxed/relaxed;
	bh=xCRVxdkClc/QDJvlBIpnpDZ3OxQXAXYy5CwjvIICVTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F3ZXnjYSsR3b5CMXUcGK8uwegKr9FNdaVzKX8fDKmoagVI5tmSfQltOjsm/jutEgOHKkEyqV8htQVSDtn15ZAiXD8HXojnvVGLoUNSWvaxX6Xz6UBnAkCo5gjlz2tGCiYUvSuVJEDztjxo7LAU0TyI42nm9Y9lB1jMffnnCsO8f/ywTjKKm56+g70IEVk2CqIJH6FVadKiJcnRqFxEzsEi+ttMtZJRns1WuS4J6wl6EZBqaNLXxrlLQ0qYXCPHuVTCzQIROQWh/vC2p5di15DFsW4aLouJCOedDfOces1bjL0tJhWoXQKS+JvweKjmJSmVcLCYme918+KLtZkbA/jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=ONUjGbGG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::6; helo=mail-wm2-x06.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=ONUjGbGG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:31::6; helo=mail-wm2-x06.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x06.google.com (mail-wm2-x06.google.com [IPv6:2a00:1450:4864:31::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKhBq5LGhz2xSF
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 10:16:03 +1100 (AEDT)
Received: by mail-wm2-x06.google.com with SMTP id 5b1f17b1804b1-4a77811be24so5262945e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1793834160; x=1794438960; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xCRVxdkClc/QDJvlBIpnpDZ3OxQXAXYy5CwjvIICVTw=;
        b=ONUjGbGGnQWmnUm7/k05iuDW6PUA9kBWGeQkNDYYdNR6tGuJxdG9i0Q4Hg1zjpLdD2
         hVSYzYYN6uqQY8ySlX7atn9aje9AB4sEYaSroaknzLehqf1U31CnsWLDqtbn5+sqHRb9
         DPdrVNH6qeHGlMgQ9UISxEUqNXhbrdEJsC1uBQLdKWUKb/ZEAkB0A8R6NQ8jtZKv31A+
         vbDzzwv5ngp2QMWJKtIuUwVAh0hm9EGP9obWpHvHyhrWGBYT8a99lEbnhkJkB+9WU2c7
         I6CGqSFjnlkHU+9l8LtI6rlhxyS/bZHtfCWMANW7Fn1mJR3Bhbt9Jmxyc+0id30DW9e3
         VypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834160; x=1794438960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xCRVxdkClc/QDJvlBIpnpDZ3OxQXAXYy5CwjvIICVTw=;
        b=n2ZsVO2rFLJscsYalTSR/DWuC+v0OfOOc0gkznEtVhK8qZnboMhf2B6P0iuCotpXEf
         hbUsvSbm3k0N5X0SDvOQXTILvyGa+8ovDDCsY+Cy2r2H9RwFltk3kuASrrAKH5/tZvot
         ouRru4ND8huHB+LcdZYOa+IrplpqVq8iQcBjesJqKdJwR3k3kP3pKuBr9PrUMscfB27C
         F+xiBiCfOFXljkwvccjo/XKmpy9eWMWmww0VKZDzcDnJRLyNrrfoukZGiKhh9AbHhgsu
         41Mgvv/ABJNp9Sa2+lNhvT40IgsmBfBBYQ+XAh8vaqIegjzs+hfq3VKQxgRd6Gf/EL7E
         gPfA==
X-Gm-Message-State: APuU4Z+W1AJiqb4a63OpuE6vU0Ce0k3gynooRknI7v2zc4bCtZnYw7Dq
	U+2ddA6P6+1Fcx9kU90fMZoCfWGCxqIK8Ti/jUxX+VGxMiYy9kdzDxOZlJUPP1eINgL48BwA1hi
	NvrcsIkesvLjK
X-Gm-Gg: AYBFou1Hs5x0polrX6AJENG1d66WNLmKFrGbTK00lEBHL+e31UeZSO8qlc6U5ia3YxJ
	GBmwh35lfgN2Vfo/jdg677R7r3quabtk1Et4WGEPkGWbiNRb5b0Mv+kszNY3RyoBV6l6KF4LYxy
	81U/2Jd3FCA9Tj6DvdnCwWgbE015gJcr3OnA4OYOLEWwQtO64khpoOBe2ZGr/OjaZjeqc5al+tP
	wk47lctooes2EvsKXbDUdBkoq5dHPP+KdbgNEXDI7Tq2vsESDA4HBS15yxqEKlSJVx8LiLrJ5xF
	c3BS4CYIt0LylNjeD7mddzKUhWaKg+kxqQolluMJ29s0dcD2RzE82/MQ6J8i5W8/vO3BjMGTBzd
	jL9j9WIcsUbG5T3sB5NRYX4CZI3S8XaRxpGndxJXNb6TpcXKZ1SWs23bvtrQlKUR/UZfXtBBNlf
	zgJ3mAFYIMmWHpNZAm+y29S/LgVnhSW54Xc2HK/AmYAkS2WTsThH5F+Dl4mJZ44GhP2uJkcbBWQ
	tAlcAYJH1KZl19PcwnrshZP5LQlCY/gfTW92gZeroMBvu1kCq2Ptsq8AlekXdHXhGapcPDDZzJS
	TXApnDxhw0skmChMoOalG/NKoZ+uC2a/HbNm5TUqXocv4Cv5qFuSLM8lZCMT4rRAd6c5EXr5UdO
	tl0aSXqJKSTCoEf4ST4vQ6UOPDDMcTL4z
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ac12475a61mr395720195e9.0.1793834159865;
        Wed, 04 Nov 2026 15:15:59 -0800 (PST)
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8648sm6676447f8f.9.2026.11.04.15.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:15:59 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Thu, 05 Nov 2026 00:15:47 +0100
Subject: [PATCH linux dev-6.18] spi: aspeed: Use devm_iounmap() to unmap
 devm_ioremap() memory
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-spi-fix-backports-v1-1-c488eab93736@9elements.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBBFr9LM2jEthlq9inFR2kFHTWk6QEgId
 7fo8uX/91YQKkwCV7VCoZmFh1TBHBSEp08PQo6VodGNNUa3KJmx5wU7H955KKOgM7r3Z2cpXk5
 QvVyoHn7NG3w4TYuKNKM9Ggf3/y5T96Iw7mHYti+FVR9dhQAAAA==
X-Change-ID: 20261105-spi-fix-backports-810fa786ed93
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au
Cc: joel@jms.id.au
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793834150; l=1440;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=dcTfbyyVE0J7iQgSL+SeRIsa7NNEUj2BL+ozOpgbL+4=;
 b=mHIUs/KEBH8eKN9CgzVEKB7uCKImMKkpJrSkX/EBMEfPI4u3wXOxQvPPwpeCSU7H8dbpfT3aT
 FpdzVufrrF5ATKGcn/kV7oy8/DZnv4sE7Ep/Yq9VsrEjPnwCN4B3q5F
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

The AHB IO memory for each chip select is mapped using
devm_ioremap(), so it should be unmapped using devm_iounmap()
to ensure proper device-managed resource cleanup.

(cherry picked from commit 2f538ef9f6f7c3d700c68536f21447dfc598f8c8)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://patch.msgid.link/20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 drivers/spi/spi-aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 6720a78063a7..ac19fde2e06c 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -401,7 +401,7 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		if (aspi->chips[cs].ahb_base) {
-			iounmap(aspi->chips[cs].ahb_base);
+			devm_iounmap(dev, aspi->chips[cs].ahb_base);
 			aspi->chips[cs].ahb_base = NULL;
 		}
 	}

---
base-commit: 114dcb001b7e0e46dd57b7826f86ad4a97de6708
change-id: 20261105-spi-fix-backports-810fa786ed93

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>


