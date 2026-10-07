Return-Path: <openbmc+bounces-2734-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94CECA6002
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:27:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sj1Lqlz30Tf;
	Wed, 07 Oct 2026 18:27:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358020;
	cv=none; b=WS8+iGmp8dZl2umvV2wgUkPcrVu2z03ft9KOOwsC8dDz9uemJRaYrKeDZ9FjY8JAjtSrQOPzkXtPS//Q4B7EO3wb3MkV2ZDYMeY8ptAHPGDAoUPziRqSqCAOcMIetQid1H7zbRILAc0DNKTLqcuW4oC9Su6GgTxQcqXGgy60YxKKz9jNWvv7uOl9IBOpmhLcG0RllYmwOe8j8R/T9moi0QUT8ySNoaD8nS1knG3HrTtkqucvNgX6QkffBNFd+GRCK3JpxKsZZt0yfxQnCdwap72eGFMmCzNVapwSkmUt0gmSP20eoRN4CFVnWsuhg98M27F1aOg4w4jga4/c16oF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358020; c=relaxed/relaxed;
	bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VRnDes9Mpiz75/oL/fLhhTc2gK17noNhOSK9/0deEAbUhtye0jSVvHk0Nx43JOUUkCJ8CcT1lQjKeQ6AdJiQHEd+W8uv0FdbuI71mGiKjB30A8pqTeJSE5wY/EQR4JEKNPHFPbeDGy/NytdwIve6Y1Rx0FT7v6qRpTcK/5C3vX75WFzgysoBEwSVdi6QxwvUtgiyNsfzHLViztJuhyzskJm/Kr0++XzL0+PhSS9r8WQaIQlLLOUvNTktyKh/mCkxFTWhCMs+CMH7ileS9VJJFVSHxAt0z/dKb963CzvRiTnXDwpTkac83afIyjuSchqQi4iLlXWoxVeGcOzAKV+n3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTZyJWqs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTZyJWqs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sf3Mhlz30CZ
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:26:56 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4956869750eso9071075e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358012; x=1791962812; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=DTZyJWqsVnF0DNeZT4AHlPTt72JDuP0j08NsBo66wcWGHA5hxy7+xgJFCNGv9y14Gp
         zbkcKX5mV8XGm4tMjTuIYIBJmHx3ECu5KiuNMGdZ85NMR3bjeVjCsTkbJZoeEL58/Xgn
         fUv++NJXPZpvEAnfQn5DhlFiMx69wl5Gqenrt9MVmkAbRnrllrMuNMvLbVGbKilOrgh+
         k9g/KIpCkESvPVKFNb0KEgY9jAzfCKUGLu7sIE/o3Ecbn2fJjqXPgGOKOlDdKyuAx42D
         +fIXX8+fsE8zPN2T93cSW7+Rfrt5PPNzZPCSOUEyiMzkozvV9wHrKywAnLVyLu8MwGOF
         L8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358012; x=1791962812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc/cMb4XXA+asGhPB5InH/DIUsg9LCc2YMy7yfxc9os=;
        b=eKsah1qyd8VnkZICI47u7xT0zy7dmwmHjUyfYNg3sxQ3oB/6IMemBTq6KI38AGQioy
         3yPXXcByA1VFbAyryuy4wGkqkZVWfgTOB2LtKvAaH61xErQ3MImdunPlQrPKyqGR7f/o
         3cz60r8WUmFo16/fy4td+wmNNdNCMlGNw6lGhaRcZImPT9/wcjGEmHbiJ8q1UjCtbAsV
         y9LyyJnDhlOjvm7HhBgz8EZ/mPRkyelfKdTqIMR0BAlY5wvvlrrCiu0mllP2+xO6+oGg
         6Hzmp2xoObg2L+uAGCWt00H8EtwIzFya7WBs1lyTEGjBXy6F5JE8padAoLoFS4AUHwzn
         vWxQ==
X-Gm-Message-State: AFuF++mxgZJTPEeebnSndY2VwJds/fJl+o+O36L6UAiZP0Rx6YEj41Ps
	sV0/7hj4cqFx+kA9LexJfke6uRubMu5vlplJ+vFcBxNu1/MbAPHnfmYQ
X-Gm-Gg: AYBFou0xappu+w8HgNcBFN62Fj+qwwehH8O5ow41uTg+2UVz5v8jdku9ndQh5KN36GV
	FMbxCZdu8tYxneu8jm1AomrcpG4DrKGO/HC/yv98fCyi3publlHBG6drgwxCn22nApJ+p40Navr
	ko9TI9Y/ZmfFBBJt//+uenfAaydCuRmqloXKoN6GOGHk8RTXAHuKyVPFS/auBRAV3IG/OI+0ouk
	1bxiQPZJET7DzQGfsQ8RvAGqsYFcQKeoN6KviWoeUBXsyatdqAt5xxEp/tbTXXDgl21g5py1BPU
	5Jxr1Nd7+p+WJJCOkBMV3hrJutB71q/PtmPh3lpDIXLv4qaPDwSUrmmktO6mpKCxVICibDhNrWq
	B7gOSM30ovMQ0h4eRlawirMhnI2cIxojjlPbbSeGy/L0PIJ1Z18CuhgpDPwDcjU8hS284nn279f
	go4566e0vcDM2Ya90i3nXH6laNBieiqbRkWiwo1Rxw4LSSKzDQ+daKRwbh1XW8FtHeP+Jphc+Im
	WkttUHXEzl0ZbCLHOQ=
X-Received: by 2002:a05:600c:524f:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a1800d1ca4mr18145295e9.3.1791358012318;
        Wed, 07 Oct 2026 00:26:52 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:51 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH RESEND v10 0/6] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  7 Oct 2026 10:26:39 +0300
Message-Id: <20261007072645.1618147-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes the remaining timer binding issue and adds device tree
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation
Board (EVB).

The first patch drops the undocumented timer0 clock-names property.
The second patch splits the two APB address windows into separate bus
nodes before any peripheral nodes are added.
The third patch reorders timer0 and PECI so the APB child nodes stay in
ascending unit-address order.
The fourth patch introduces peripheral nodes for Ethernet, MMC, SPI,
USB, RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC
device tree.
The fifth patch cleans up the pre-existing NPCM845 EVB DTS property
ordering to match strict dt-check-style expectations.
The sixth patch enables the NPCM845-EVB peripherals, adding MDIO nodes,
reserved memory, aliases, and board-specific configurations such as PHY
modes and SPI flash partitions.

The NPCM8XX device tree was tested on the NPCM845 evaluation board.

Changes since version 9:
        - Split the F0000000 and FFF00000 APB address windows in a
          separate patch before adding any peripheral nodes.
        - Add peripheral nodes directly under their final APB bus.
        - Renumber the timer/PECI ordering and peripheral patches.
        - Renumber the EVB coding-style and peripheral patches.

Changes since version 8:
        - Split the EVB changes into a DTS coding-style cleanup patch
          for the pre-existing board file and a separate peripheral
          enablement patch.
        - Fix strict dt-check-style issues in the EVB DTS by reordering
          properties and nodes, normalizing blank lines and continuation
          alignment, and lowercasing hex literals.
        - Drop the unused tip_reserved label.
        - Keep patches 1-3 unchanged.
        - The remaining refclk unused-label report is a false positive
          because the label is referenced from the included common DTSI.

Changes since version 7:
        - Move timer0 to keep APB child nodes in unit-address order.
        - Add PSPI to the commit message.

Changes since version 6:
        - Remove IPMI I2C device.
        - Add FIX enable property.
        - Keep patches 1-3 unchanged.

Changes since version 5:
        - Add no-map to the tip_reserved firmware memory region.
        - Drop the unsupported snps,eee-force-disable property from
          gmac1.
        - Rework the FIU0 boot flash layout into nested fixed-partitions
          under the bmc container.
        - Keep patches 1-3 unchanged.

Changes since version 4:
        - Split the timer0 clock-names cleanup into a separate first
          patch.
        - Remove nuvoton,sysgcr from udc8 and udc9.
        - Rename apb: bus@f0000000 back to apb.
        - Rename spix-mode to nuvoton,spix-mode.
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch
          as /bits/ 8.

Changes since version 3:
        - Remove tmp100.

Changes since version 2:
        - Fix DTS warning.
        - Arrange node order by ascending unit address.

Changes since version 1:
        - Fix commit message.
        - Fix dtbs_check warnings.

Tomer Maimon (6):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Split APB address ranges
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 731 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 441 ++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   6 +
 3 files changed, 1155 insertions(+), 23 deletions(-)

-- 
2.34.1


