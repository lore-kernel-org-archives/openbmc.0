Return-Path: <openbmc+bounces-1622-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372C71088E50
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:43:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkNx2j9Yz2yv3;
	Thu, 19 Mar 2026 09:42:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773801694;
	cv=none; b=ozP47dTqfWPCfCnquJbi4z9HLk07e4Y1zH4CUkxp2nZAnfaQbSM9P9nPWQb4BtplzyQx2VAc9hmxQ1sknfKV0wbinraygTKa84MfrK3vH0ieATCFhxv07gWhu4eaD9rFrqQg+y4JnJkUNjH5jbNp5zir2vtIS/nbBK/I+X0TXHA15ulVdwvHxvon2cNMoIzKjcKVIariBacL2+UNT5KRWF2ixcS6H1qCLL1zyK3nTjPxEjkZDLKPmTrfMzlCDZFByQ3wJJj+h3e9RE799fnkZjuoapF0AcYj+baGJMVGQp8KFPHQqaG5m++FF7W6qavnG8dOPr02KahRzuxHN745Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773801694; c=relaxed/relaxed;
	bh=oDAopBJyG0FciCcbjFKu3srgbpPKNr/TwECwnqBK4/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dWEx+hMIRW/qGvWIIW68fldsGzl4Dv4z0s1o8q/z4lYDe90QVAxlx+eTXsiIMZrUdRzytDWrSzck/PF/1nVC3jP607BjqID3kDlsOZkv7CHxXs7wxM1ZegwLS+652YwWJkQaOin8Lqh54FIw3/O70CxKyIBYiUhSvggCOiNJuofYpWehiuW311RxWTGbb4vTa9+B0VWKFBBAzGN/J/bS9o79qkOQnODmD+OlpiWl2a/I8JB29GP0URnWru/l1kvm618qZ0JFrgRULxcnJXIrtvfSH1JcP2+qwkYNv48f6Yqt6aSIcgNiNzmqhCDo0UIUQQGkIG0QHfu/WacmKS1vTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbCkv2VXtz2yjm
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 13:41:26 +1100 (AEDT)
X-UUID: c9068e8c227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9505b584-054f-4534-bd52-2ea0379afc6b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:1b22b3f1c276df14806c3325f3681ae2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c9068e8c227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 659452620; Wed, 18 Mar 2026 10:40:11 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 00/17] cleanup in spi by use devm_clk_get_enabled
Date: Wed, 18 Mar 2026 10:39:50 +0800
Message-Id: <cover.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Content-Transfer-Encoding: 8bit

I know that many old SPI drivers should not be modified for hardware
stability and to reduce maintenance effort. But I can't help cleaning them
up. To minimize the introduction of issues, I tried not to modify the
timing of those hardware clock enables.

---
changes in v4: modify all commit info
changes in v3: remove disable clk in remove function
changes in v2: fix error message but having a line break
Missing error code argument to dev_err_probe()
---

Pei Xiao (17):
  spi: axiado: Simplify clock management with devm_clk_get_enabled()
  spi: bcm63xx-hsspi: Simplify clock handling with
    devm_clk_get_enabled()
  spi: bcmbca-hsspi: Simplify clock handling with devm_clk_get_enabled()
  spi: img-spfi: Simplify clock handling with devm_clk_get_enabled()
  spi: imx: Simplify clock handling with devm_clk_get_enabled()
  spi: npcm-pspi: Simplify clock handling with devm_clk_get_enabled()
  spi: orion: Simplify clock handling with devm_clk_get_enabled()
  spi: rockchip-sfc: Simplify clock handling with devm_clk_get_enabled()
  spi: sifive: Simplify clock handling with devm_clk_get_enabled()
  spi: slave-mt27xx: Simplify clock handling with devm_clk_get_enabled()
  spi: st: Simplify clock handling with devm_clk_get_enabled()
  spi: stm32-qspi: Simplify clock handling with devm_clk_get_enabled()
  spi: stm32: Simplify clock handling with devm_clk_get_enabled()
  spi: sunplus-sp7021: Simplify clock handling with
    devm_clk_get_enabled()
  spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
  spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
  spi: zynqmp-gqspi: Simplify clock handling with devm_clk_get_enabled()

 drivers/spi/spi-axiado.c         | 31 +++++-----------
 drivers/spi/spi-bcm63xx-hsspi.c  | 46 +++++++-----------------
 drivers/spi/spi-bcmbca-hsspi.c   | 49 +++++++++----------------
 drivers/spi/spi-img-spfi.c       | 18 ++--------
 drivers/spi/spi-imx.c            | 15 ++------
 drivers/spi/spi-npcm-pspi.c      | 20 ++++-------
 drivers/spi/spi-orion.c          | 11 ++----
 drivers/spi/spi-rockchip-sfc.c   | 22 ++----------
 drivers/spi/spi-sifive.c         | 21 ++++-------
 drivers/spi/spi-slave-mt27xx.c   |  8 +----
 drivers/spi/spi-st-ssc4.c        | 16 +++------
 drivers/spi/spi-stm32-qspi.c     | 18 +++-------
 drivers/spi/spi-stm32.c          | 61 ++++++++++----------------------
 drivers/spi/spi-sunplus-sp7021.c | 15 +-------
 drivers/spi/spi-uniphier.c       | 17 +++------
 drivers/spi/spi-zynq-qspi.c      | 31 ++++------------
 drivers/spi/spi-zynqmp-gqspi.c   | 19 ++--------
 17 files changed, 98 insertions(+), 320 deletions(-)

-- 
2.25.1


