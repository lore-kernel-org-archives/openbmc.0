Return-Path: <openbmc+bounces-2714-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD71CA5FCE
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 22:49:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyd4D1Chnz30Sx;
	Mon, 05 Oct 2026 09:49:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791146811;
	cv=none; b=X8bn4zOOlRxA4wx1Wg8gtG6sG6P1CHhjZ1g6TIf7FY68MO9aD1h0N8DGG1w/DjPlDnX3YKXgSD7Br36FDGpdHMktQvTySnRG4WCVcToulqP/iPotfbFSECBkHagZXns+C6ua7xBTS3plcALj+X38VzlhuuesbvjFuPJ76liQjQ80g7a5Cm9f4hdVJHeuMEnIxMhAoTYv6bS+9NyrILt03Ws+q/KTRihXsDG3N/lWSzSofTrKP8QlTxHq4G0wPQrUhr6Z0z/ANyALNBSernLoDwdhfIu82gZubxnYjPGOn1zYbQINXG6XOHPvYm5SuBKLcL+ZcjVPqz1ClRzyo5ZcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791146811; c=relaxed/relaxed;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecR4/TbDOPLOqpVpghtabIK1svdhIdcdir+Go5K2S5rbUxvfiplXw78ucrdJfrm63/kICIYKqdUZ7GPvVEocE3hlfl/cf5D0J/3HEZHrrtmVmhl1cFD+zN106/a32c518ZAnwD5WdVWqGsovqi2JE7cR12kPTDzwJO26nii9oOZ3uzoUAgAAZUdq1Jp2MnyKB6PPL4EgXHjajaErRCeVQtS4loJOsjJJay906z/d8azgfLt6bP1BWF9x4AH7tV5EKIqFKNpLJbYp8ZspV2xVk4br618tIR1xtax8Wm4/IeIxIteOrgwbBs8ZpvPZ0L0yR2hzzl/xkc3Q1YTZxaxg8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B8g8hXOD; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B8g8hXOD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyZLy26Tzz2xlw
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 07:46:50 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80B2A1A1138;
	Sun,  4 Oct 2026 20:46:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 523C2604FE;
	Sun,  4 Oct 2026 20:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAFA410328384;
	Sun,  4 Oct 2026 22:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	b=B8g8hXODUslb8dZcCbNk/4HFLAqzCpRG2AbkMuuvsHj9p8ERklG6Dzk5e479yHYAULx5Nv
	0ALgLMGUc2ugVjJbuc+wtxP6+kjk2A1grcOVZlH3MPSfhPo/K1067oxt/GhaPpGq7zSI/S
	eogJWfmbHotcIpPiOxZrUq/yjHUMp0EvLzY2ezJWkst07lUTGfCQsbcUvFx+oUqRauRcgL
	fQIyIddWF750bshCUOl0pdoazQ/UFy7OaKNTDO8mM88rqaPDZ5Ba5a/6cYwmcXqL/fUJCV
	/2bZ6+gcbBFnyiiTIb99lyiM+FsyEMkkZznZGfi8TusQBqxXiAkhpAkVSkhXNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:30 +0200
Subject: [PATCH v8 6/7] arm64: dts: nuvoton: ma35d1: Drop HXT clock output
 name
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-6-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The clock-output-names property is not useful since there is only one
output clock, and the naming of that clock would already be clock-hxt
after the node name if we were not providing that property (so very
similar). Just drop it.

I want to clean this name before introducing another very similar fixed
clock in the DT: LXT

Another solution could have been to rename it "hxt", which would have
been more aligned with the other clock names. Sashiko complained that
this could break DT compatibility with an -EEXIST error because of
the colliding names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 1 -
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..d7670afb0a63 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..8f3cb18d39b6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 

-- 
2.55.0


