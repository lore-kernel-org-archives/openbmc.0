Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3F606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYAHHgzr
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG0RB1Fs1z30Sv;
	Fri, 30 Oct 2026 10:13:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793315637;
	cv=none; b=dJtDFECtOI0untuDuSRDFxAW9xseeeO+vSfv3XX9z9Ba0fONnNU0YZZGbe8mxAPDw+qGmAEvupUhk7wWCeqbQqnukols1rhvhDeh0PxoCRw+fylDY1W49/37v+d7LVN3wcKBBUtWDaLMWMHTMwtdmdr9Nq4FZQYsbEFSlrhiFylUumAHZynQnFv5JG//VAqQYPjCn2rmwAnUkwzndSNxaMZnniLPPgO436Wh+Q0DgMCrdHZxXRFUVMD+9PyV2WZmXMk7pWJg3Cdptubx/5paqaffcunhcNN0KGiQxHClXkb5CuUVqLy88hoAEmBHrG8Rk7DnUXqFx6ISth02Hgii5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793315637; c=relaxed/relaxed;
	bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQWOSGd8Qzdq05gyl0ncj9XPQMiAA7Pvr+EYWbODit0a9mGexWKKx+CUDncIpsmbduVRrd11kT+IUSyigOPy0KOKOcBGsx7WaR7xmpNmZZqDnDZ/q+hSir4LNxYrHBrJFhsBQy8lAVzk/3kp32GrscJ8ggy3uFkvaPOXis0F5N7ZqA/aNyupa8/gUUB7OxtyYBpNkOyE0Ukd7MMlO8TeUZdaemQRs+Aqf3+sJidOTpQ/DK/Mv7CG0ne4PH+ThBd9zOO44HejIfk+IGfFL2Z9FaznzGJ3JLLeUqy8Q4HY49aQxL3SrhjCC5JBOZlF38g+B7uS38gqwiQZNUyVvHjShQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYAHHgzr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYAHHgzr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com [IPv6:2607:f8b0:4864:20::1333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG0R742hwz2yql
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:13:55 +1100 (AEDT)
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so275273eec.0
        for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315632; x=1793920432; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=IYAHHgzrURa0agHQAUib8vB0OBiLA4kFRy3N+KdVyDXkfrRBjmjxFmBOlNYnqhte9P
         0N4Y10ARNWXySaYWF3E26iDjxK7bUsXOt2WeRsmM5rYHeeDRosF7TguEbp7NcgukUZbp
         lgdtipUOGrJUZAUa7rZUs3EtjAgCicUnb2+fYBy3YSPt+GWYRx24vFWvCMAnhobEKwJ1
         qXsB8NXWsAxXcbB+ua0tH6VrRu83EspkmwXiKhxRVI/SOGmzuu5QDmWY2iRQ/eQDK5iP
         UMdg4nXv00ImIkJB6kl3IdmUiYawTSQghXZwofTGJodEgmwOKefpkYu2Prml/KOls0nY
         NaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315632; x=1793920432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=LB5g0qe8f48svGjhscDqSMwAfQivY+r56Qd1NJWnwYMQnRrkYzaIUyOX2tjLGq2Cc4
         gXe7N7UReAVds8WNWgknKMjc+PkXuO8hRhl9daoOhHP3n43V9t3s8unFLXAGBCqG9nqk
         gqfGW/nJ9+szqNrRS82ZP/5DkD3FT5tVFoiIlonrrKjybRMqE5eoPb5wZ8myCFmGkrFH
         ZQmmT+43mAKUv+VJPmo78s7JKaCaoJbrQ67q5LiDeiTa6J47cqIRfvmY1yGFMteDHcT8
         8o215creK2PMUaVR6TO8Na/y7pR/jO4AaHlPrbSG4c7jogzMeBonk5Cl8+h89Wo5iclT
         9HLA==
X-Forwarded-Encrypted: i=1; AKwUvBx3melsB5jPN2Zg11JrSePQcfiGBYgnY/td7kw9vpgH9+I9V9BAFEsudcQESsFkCYc3fkO43F8W@lists.ozlabs.org
X-Gm-Message-State: AFq9FYIQkGCRMQHyOdrMoHMQ4J81nFZVl/f0vuqJtf2R5PkldKPCVK++
	Z9V7PYQby7tytdN2dCr0lQl07qsy1N7323QBtAmCO7IxUT7sh9xRN0H7
X-Gm-Gg: AYBFou0/ZbRiKdDWZGuVuZ08wEGJXD1M8NryhEnCkQFKJIZu1IZHcvg7KkNW38MVUcJ
	XHPK8l/zOILcP55FIjX+XS8toZSMCwpM/2AyTd8/pqKsDtZtLEnr2s2I6vWXIccaf5GzzG9iCnN
	QKC0zdmAf0JmQ6N2GeO0oE+mG0/SkvOzwBsRej8ydYJUswjh/BETkmasmXCcK7MEVI7UHnh23u0
	Kjv9UCj4LQvbXhbYURpf88sdOUu1S9OkYIjmFGkJwXqa2DTkkneP5C2LK4z2iEN/WEPeCxIV+zl
	BaOvGW5UEz4BDx/MLy3zHzJjyNOKRPsa4jDnRwp2sKhit/bUyXStk9Fl5jnACeA+lv32N/6DkZz
	R01JcdZuqitAMFWmM/3R+b0e/btJvgHl9mvM09+Y4Wvd0PrKoz/3U9eqkN7FBJ9pD8VIWamoKT9
	UklzYi/41V9Cple4q056IbmpFHwx94aod/jXPqXU4ETQCeoO6nkLOc/xJANv49oCPSnplw2zjYO
	tfzL3KZbAEbjDrtDQzk6QGVbVbhjDUE1qXGUd7Xp5rr5NADqJQzDgIV5OQcqJ4R5XMb4FVZUlfD
	ykClWgNEoNTp5VA14RT2nqwxCVOlVhvR41taanZpOBQQ
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr1174873eec.38.1793315631951;
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:37 +0530
Message-ID: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the board compatible and device tree for the ASRock Rack B650D4U
AST2600 BMC. The DTS describes memory, SPI NOR, UART5, GFX memory,
GPIO names, the I2C7 EEPROM/NVMEM MAC provider, MAC0/MDIO, and both
ADC engines with an ordered IIO-to-hwmon bridge.

This revision corrects regressions in v9's compatible ordering and
binding acknowledgement, restores the revision history, and addresses
the UART alias and DTS-style feedback. No new hardware is added.

Changes in v10:
- Restore the binding Acked-by from Krzysztof's earlier review [R1].
- Place asrock,b650d4u-bmc after the aspeed entries, as in v7/v8.
- Drop the serial0 override and use the inherited serial4/UART5 alias
  for stdout. Bootloader console arguments and getty must use ttyS4.
- Consolidate the root node and order peripheral references and ADC
  properties according to the strict DTS-style check.
- Restore the earlier history and discussion links below.

Changes in v9 [9]:
- Enable ADC0 and ADC1 with 2.5-V internal references and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.
- Rebase onto the Aspeed ARM DT maintainer branch and normalize GPIO
  comma spacing. This revision inadvertently lost the binding Acked-by
  and regressed compatible ordering; both are corrected in v10.

Changes in v8 [8]:
- Correct the validation report to multi_v7_defconfig with ARCH_ASPEED
  and MACH_ASPEED_G6 enabled; retain the DTS and scoped review trailer.

Changes in v7 [7]:
- Correct GPIOP reset/power/NMI button/control names and remove the
  obsolete F5 reset name; leave the binding unchanged.
- Subsequent review requested the validation correction and carrying
  Andrew's review tag forward [R4].

v6:
- Prepared locally only; no public submission. The sent version number
  moved from v5 to v7.

Changes in v5 [5]:
- Add I2C7 EEPROM/NVMEM for MAC0 and select rgmii-id.
- Use the standard OpenBMC 64-MiB flash layout.
- Add initial GPIO names and the reusable 16-MiB graphics pool.
- Drop the previous RX-delay-only justification.
- Follow-up review requested GPIO mapping/style and threading fixes
  [R2, R3]. Andrew's Reviewed-by applies only to MAC0/MDIO.

Changes in v4 [4]:
- Correct memory size to 512 MiB and add explicit flash partitions.
- Report RGMII traffic tests and select rgmii-rxid; that delay rationale
  was challenged and superseded by the rgmii-id selection in v5.
- Order peripheral nodes alphabetically by label.

Earlier public submissions:
- v3 [3]: board-compatible/DTS series. Krzysztof supplied the binding
  Acked-by and requested preservation of review tags [R1].
- v2 [2]: early board DTS, including UART5 via serial4. Its complete
  per-version changelog was not recovered; the archived patch is linked
  rather than inferring an unsupported change list.
- Initial submission [1]: board binding/DTS, with QEMU console and
  board-identification testing reported in the cover.

Review tags:
The binding carries Krzysztof's original Acked-by address. Andrew's
Reviewed-by remains explicitly restricted to MAC0 and MDIO nodes;
no complete-board review is claimed.

Validation:
- Compiled and schema-checked the v10 board DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y and CONFIG_MACH_ASPEED_G6=y, using
  arm-linux-gnueabi-gcc and dtschema 2026.9.
- dt_binding_check for arm/aspeed/aspeed.yaml completed without
  diagnostics in the reported output.
- CHECK_DTBS=y reported no board-specific errors. Two unmatched-schema
  diagnostics remain for inherited aspeed,ast2600-lhc and
  aspeed,ast2600-i3c-global nodes.
- Strict dt-check-style and whitespace checks passed. Checkpatch reports
  no errors and one MAINTAINERS reminder for the new board file, covered
  by the existing Aspeed directory entry.

These are DTB/binding checks, not a complete kernel build or boot test.

Both ADC engines, twelve configured voltage rails and recovery after BMC
restart were tested in a custom Linux 6.18.24 OpenBMC image with the same
ADC settings. That image has separate power-control changes, a different
flash layout and ttyS0 console configuration. The complete upstream DTS,
including v10's ttyS4 console selection, has not been boot-tested.
Voltage scaling is userspace configuration outside this series.

Base: 8db593481c8669eddb8b4e21ea44f3fa11d9f030, aspeed/arm/dt
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Previous submissions and review discussions:
[1] https://lore.kernel.org/all/20260512175019.47548-1-prasanth.padarthi10@gmail.com/
[2] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1129461.html
[3] https://lore.kernel.org/all/20260518033440.17569-1-prasanth.padarthi10@gmail.com/
[4] https://lore.kernel.org/all/20260830182036.284736-1-prasanth.padarthi10@gmail.com/
[5] https://lore.kernel.org/all/20260915013110.4780-1-prasanth.padarthi10@gmail.com/
[7] https://lore.kernel.org/all/cover.1790079398.git.prasanth.padarthi10@gmail.com/
[8] https://lore.kernel.org/all/20261002062933.26497-1-prasanth.padarthi10@gmail.com/
[9] https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/
[R1] https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/
[R2] https://lkml.iu.edu/2609.2/00630.html
[R3] https://lkml.iu.edu/2609.2/00642.html
[R4] https://lists.openwall.net/linux-kernel/2026/09/22/1982

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3


