Return-Path: <roblip@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynSS6PRNzDqD0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHGz/U4r"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id c20so14288646itb.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jLLwyQzrBxKNctbJ06aOY2AA7eNxLIrZq51Dlfn9f/s=;
 b=IHGz/U4rKN8MTdt4Mo36S9qTFACR4XEIenfpW7U9l7oQQSeOhHwjUa3ziGykURwd4z
 6nHZ4Sd8GAOZhnCuA5GE/aeZzYs1Q1STRYRuZM6D45JNh8WJavJhlpQ0zqZDsPCmYXL+
 WQ1IJ+YFXNrcK3apYjVOMk+btCIqPXx8IhiOcrANjyjRraD6VPtlrQQascgezA7PTEAZ
 FMvlDrGwMmzYJP9uX9zl5KlVOsl2PFf4cRxQoXMC4kJVApOCpSeCTINk+Yv4NhsSl3Ug
 tTVz30wvBROEMb+S3KdbK2rXOuXKpzeAMxuwwiN/3KYgT403MIP+WcbxuH/8hRregReN
 75ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jLLwyQzrBxKNctbJ06aOY2AA7eNxLIrZq51Dlfn9f/s=;
 b=HXDngkEL3TfYs6stfigQhEQ9bgt2FG2i0DQm3x0fiLHoPbhCSj3wzpE6MUKiLTI/a8
 jKGaCnQSa6r9+lT7D2kXgnMgdMAcLWnsBvyOA10m9IhdRBHSTOLi30eqUJvfmiu6rDss
 w6/ABq3RWQrtaj+i6zLeY9ogY9U+kjEuXeGw3ZXR0UdpIRFRUNETOJBAqQDyqLoodqhM
 B2ez18D3v70fBuowkVk9Oy0FHXnfHXSPeUkFn0wCKxDxQS45JrW3h/L/kBIW349O7lDz
 B+VooCvNk12SYwnatstnp9oXb6rELX/XJZsS27NcVFMZ8xfdCuQx6+aWst1KKFTPUpuz
 oyzg==
X-Gm-Message-State: AIkVDXJkUi5ni6SJ3aTxvRZfSrVAtynsKUmLt4a0Zlp/zP2e+vvmH1PdmK096IGcy6fs9w==
X-Received: by 10.36.135.74 with SMTP id f71mr2425558ite.101.1484088966568;
 Tue, 10 Jan 2017 14:56:06 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id f4sm2035948ioe.40.2017.01.10.14.56.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jan 2017 14:56:05 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux  v2 0/3] ASPEED SPI driver support for dual IO mode
Date: Tue, 10 Jan 2017 14:55:52 -0800
Message-Id: <20170110225555.117814-1-rlippert@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
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
X-List-Received-Date: Tue, 10 Jan 2017 22:56:09 -0000


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

Changes in v2:
- Cleanups suggested by Cedric.

Robert Lippert (3):
  mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
  mtd: spi-nor: aspeed: add support for SPI dual IO read mode
  mtd: spi-nor: aspeed: fix DMA access on AST2500

 drivers/mtd/spi-nor/aspeed-smc.c | 32 ++++++++++++++++++++++++--------
 drivers/mtd/spi-nor/spi-nor.c    |  2 +-
 2 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.11.0.390.gc69c2f50cf-goog
