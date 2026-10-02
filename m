Return-Path: <openbmc+bounces-2703-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F4CA5FE3
	for <openbmc@archiver.kernel.org>; Sat,  3 Oct 2026 00:16:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hxR610VFJz30Tm;
	Sat, 03 Oct 2026 10:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:36::d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790922587;
	cv=none; b=nj8YC0TjsXdoZHE1umM6nQulR3LRff4TR+qvq6LgA9e6GeAqN5qEhydowt8ZoF9Az8o1ZPIPOVMo1CxrrMRjxF0Mipviu/Ta6paOaG1/kS5kdVCDoq7s366Cb5Pn7DYMVReXfw9oAZLjb8MpJHkwghbL913OU3e2zkZMmY1IrDy84yhFNnv9niKLtaztoGF8BtiyEB27kLvLjYamYEY4DlRWmPweLFxGeqxGDl8lhIFoRXgn8MBDX2IhgBoxBqQ0WyWMo4DdOthLSiFCp4Qis35xIH4HDvoonT3GcRYvZuP6OOWNiPfJsGaS8bocFnGc3JKMw5J/LmLfoBJBmQdwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790922587; c=relaxed/relaxed;
	bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iaPeOi+ETPX2DFrwTrlsYYgc4dnVXl9oqS9LCc7LGQ7p27+q9U1WvUUjifjZqJfquCytltmPs7f+Q89siZ3ygZJV+xsoodW+9KMc5naPDKPCOsZnJt4CDZczlfG3xfVav1R0Ebcg1Ky0nztlHJbrb526qjmbih5OuIhMdaGvH64o7XTORAlafUWtQcQMI5U00FKCV4jCYrIbIXkF+qZkj/8D8OAgW25K6H0I2jilcRd+LiXcbIxrCLegnlqdWWPmwS3nsi/hESHWaqu9buJm5oqTmODHOw5z/Ni7eZpPYzhztDaEBezqu9jyFJr/GOl5Ahz39kigRvBVePzEVVwwzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1yHLgEF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:36::d; helo=mail-dy2-x0d.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1yHLgEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:36::d; helo=mail-dy2-x0d.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy2-x0d.google.com (mail-dy2-x0d.google.com [IPv6:2607:f8b0:4864:36::d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hwzQx4LyKz2xsW
	for <openbmc@lists.ozlabs.org>; Fri, 02 Oct 2026 16:29:44 +1000 (AEST)
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34ea0b83f8fso766715eec.0
        for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2026 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922582; x=1791527382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=O1yHLgEFJTMlSDZeUhATesKLWuIj8618ZrecO5D75qXxsH3RNIxZF7Ih6XLN7Sw22/
         QW3CbB/jlE4Q8JW1F6k/181x4W7LtSUAHwbldNYP3Mn7HIGSRm2DT+zdsJwr09+3YvBO
         HHh0NGSnyhdlIfqbFf4kE/kXkBTzsDKdUgKr3/ttBfwkZoMjGDAcECtArJzQ5lZJqyWK
         9fgTw758UOsvUGUGRiaMKMghlOpxkIgBl59Sjt8FjeDu0WMsRGM+lGxnmjZb3FHzzqt1
         dWVsv6INfNtAsDXGQOJsvLHpKoFdbPvr2+r2vZLZJzKI+SoR6ya4zUqAr6fBeI3aO+v3
         sb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922582; x=1791527382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=OM4/a8j91/M9x6grplnXwwkw0avxlc1de2PTukoxuGemR2SvloFUNKLIJDYYSJeLLF
         VGMCeeJOaLC/kRRBIF1VaiYL55WqUAoqNq7NOZLo5W8j9ftIObeM6HucmB1NGY7DbF/X
         hD72HNV456kERUoaNMVNxGkicc6RZE6ccw6KsnjsvJflc38+VBUIrnqXoPtDnzj35m7C
         OGSWvv/yqMABVHWL4vOcGCBkU2JGlfds/NwpptvAvcAkQO/X8bhTZbVQ+ZXkYOyE+fCy
         OvCxUpUIl5gwDejMU/fuRwpShutyZP8ry80Qvg3as5uqmhJzHobur11orZBL/ZBulyxM
         TETg==
X-Forwarded-Encrypted: i=1; AKwUvBx1Xz+WSm+RSbSj/ZFV+TeEBifEAmQlpDrKhxF2V0rUJkNxtU+ATYkUo6/wbzIiKTCazLbj/dEO@lists.ozlabs.org
X-Gm-Message-State: AFuF++n5bjD7HrXVbG25pF3Z+kmZKsYA6b4mDbT/g8RhqYYIQOAWlPhQ
	dba7qs2tqHcXm4p3mpcYZDqfSAPdfOT2DjWrqeCB1tTohmI2RHIa1VbF
X-Gm-Gg: AYBFou1/1IfE6ZkttLYQez15liTFOzn6NP2Mt5rr7QQhC8t7LuxEiU0GJ0ZpGnccPp7
	cJY44xvTKkWr9oB7hVF1b3v+nBDb4YO0jBIgbaskCijBmGvtWRK3YDaEdjwinXVgGzeDwX2eZtJ
	ne0TD6nLVSfWcvuiykJa2FnyNqgU4MXAusbE7gYIPT4aJPyk/0tQPtIhEG4jTbOTbL9nxK9+5T1
	fS7Ak26LzN1JNjU9LX9qoq3fYLoI+1WkkzPK8o4ihEhr4k9CsWWcDO60Yo8aqLDKx57aGAeR7ER
	V79Nu2sr2k2m6fKCHRjWQrCMrPclsytrtKyny7ZKmsPgkY9Fml2bpg3bptocwPG+qNuoEHXggdh
	TZ+EjsDvMfCVVWQ4W7fETZgc9QHUcVPSqdoNGUcVmoe2qAvfDNDnHiRCIQB+KL9kjskhPKZycoU
	TNUgmSAxL71jQWL/pz4ZoauHarEChC5iECNwnvYwRr5qJRoz8RwDMSpcyJpkmRdFHVMiQ+bOJU4
	DiJxBo6KHvv6kcs
X-Received: by 2002:a05:7022:f902:20b0:14b:588b:c80f with SMTP id a92af1059eb24-14f5b026980mr1769046c88.10.1790922581583;
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v8 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Fri,  2 Oct 2026 11:59:31 +0530
Message-ID: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Changes in v8:
- Correct the reported validation configuration.
- Validate the DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y, and CONFIG_MACH_ASPEED_G6=y.
- Preserve the reviewed DTS content and review trailers.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


