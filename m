Return-Path: <roblip@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyDPG6S5wzDqFh
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 12:06:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B5WaJ4qH"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id y143so4906389pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 17:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=09FmUPGes3Ju6pMzfVhpdghq1hFIDdIuTc6VGR2u7LU=;
 b=B5WaJ4qHNI19TCuUWWs4r0O5lGJtCJQ33lfu1eJddaQHbaOK29p0Iaxl685Ahe3SKv
 Hu6XHPCfO0HO5QQFWhGmyOCMHopea8+45dh7yXx3YFLVc3nIH67MMOk9Wg6ui6krHWqd
 GpLmioJ/VffQVqY6zcWTv312g7i/XHSif0qSIWQdpAJSMSU3VX6QTvPW07UgzgOEJpXI
 UpwARWn/G3JGiy2yYdsayviA8Ye1H4dV32SwBGcv/1dQt86kzvxmvbx0t/ORO+Lqzibb
 sB86HESj2c/iqSwZ7fHySVFGLQXdVDB569cslgaqSoGpH3lqtNP5w21p/a8536AXZVdQ
 YOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=09FmUPGes3Ju6pMzfVhpdghq1hFIDdIuTc6VGR2u7LU=;
 b=QNbQClHAnAwkzdCOQID4AIvjMOxoyxFpEx3UVKjqHp98TV++8Hualt50KhHcwvdLPg
 glGSCEdbVdMGbj4WRitdbOlWhloZ1fvtELaP2ns8XFhe+cwqe5xhaMD/epLMPcS7+bEO
 nqsH3T9bo/ym2JMj6QBsUUum0Xpj8MsCltRo41GjHqDsiQBd5VG4mXgylTcgU0hk0A2S
 hVBr59wO4Ga4eeXkRTystu9uE5T6xhgyfwCLHLDi20+TfCamfYen54dbUIbA7WKFcXbN
 UPMKVI5+FBgma2B1vp2+ZuvQjDGApdx4x3zYOsmuAq5zXLtEG9PDLZVKUFWTFDGvAzsu
 V6DQ==
X-Gm-Message-State: AIkVDXIErLny1SyahhU6V2vv+Yhl9tb+LIKEFlVjosFw+5XZom+Tmlp905kVDoR0lfTCWw==
X-Received: by 10.84.211.3 with SMTP id b3mr832946pli.119.1484010385190;
 Mon, 09 Jan 2017 17:06:25 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id q14sm277678pfa.40.2017.01.09.17.06.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 17:06:23 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux  0/3] ASPEED SPI driver support for dual IO mode
Date: Mon,  9 Jan 2017 17:05:20 -0800
Message-Id: <20170110010524.116687-1-rlippert@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
X-Mailman-Approved-At: Tue, 10 Jan 2017 12:21:32 +1100
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
X-List-Received-Date: Tue, 10 Jan 2017 01:06:27 -0000


Adds support for dual IO SPI mode.  This speeds up SPI accesses, dropping
time to dump an entire 64MB Macronix chip from ~12s to ~6s using:
	dd if=/dev/mtdblock0 bs=64MB count=1 of=/dev/null

The dual IO bit mode should not depend on any board-specific properties
as it uses the same IO lines as single bit mode.  Only issue could be
if a board used a one-way level tranlator or mux on the MOSI line
but that seems unlikely to me.

Tested on Zaius board with AST2500 chip, not tested on AST2400 but I
expect it to work since registers are identical.

Note dropped TODO about quad mode since ASPEED SPI controller does
not support quad mode.


Robert Lippert (3):
  mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode
  mtd: spi-nor: aspeed: fix DMA access on AST2500

 drivers/mtd/spi-nor/aspeed-smc.c | 30 +++++++++++++++++++++++-------
 drivers/mtd/spi-nor/spi-nor.c    |  2 +-
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.11.0.390.gc69c2f50cf-goog
