Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f4qQdzDz"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcRmh2SlyzF15T
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 16:37:55 +1100 (AEDT)
Received: by mail-pf0-x244.google.com with SMTP id b25so1347252pfd.9
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 21:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=qmPJ7fW9cc8HDieIARu/n5P3WJ9M6ICq8ZlCeJS9Y2s=;
 b=f4qQdzDzoGJBnw+rF6wzXGAb7grUFqEjax79CEj5jxhGyLnFC6dtOhTYKMMS0JXiai
 uYaz+ezYaZZu+n1yjrSQE4UayeepAd/VLp0PiCoxXE4XxQCHHNeePKQ6m+g+90kKGGSO
 LjBTlcIu4yRkDgmQ6s249nyaMFeitCicr6TKVDt3QsRagU55W4FqbelCgXS2N3PqDaPZ
 4JJfOxTQDgLva3MpW3v2I6lQ6dO+K5MqFRHT10uVcEpXcdVUqtEf0VvLmEHUUWiVCLav
 E6w+vLhtL/ETgeB7ohMT1YJwEjph5fp8hljR2i/EOcSCzcOeIXZY9j8iZiLgWp28/wZZ
 q10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=qmPJ7fW9cc8HDieIARu/n5P3WJ9M6ICq8ZlCeJS9Y2s=;
 b=StSmdGbme7fVFWfKifYzcCMcZF3dh3NWc13QKy3KrKk7QbbLuj+qboVeBmjl8rxWMw
 1NZ1CRFRRoylUGORXGhx56lJW5uy0PaMWE4UEisbdB0yQQrw0Yhc785m7uoUNeZ920J7
 yEjtP+ouExd1Q8XmEpc4HWPPY6nUCILU3gb3ABLVydy5OSLoIQ8lCyjMJ5gVB1mP4ufH
 Snb9o/oD0KF6S1vhigbgYVEiBPlwZm7St06YnIwl96pDSTdq7CKldSMQ51oJa/Kh0+EW
 kKZUPPkH8zcSRtR6xUn3K4vAQE+2PO0tf02nVryCfC3zaJA2B0Ra2MRtYlfPnaSx19FZ
 lt3w==
X-Gm-Message-State: APf1xPBXulafuN2mSWLt/ne86Nx6W7WtK5xWZYtys2WB6TapKuynWFx9
 MHuaxLBzPtVWJ7H53t2W6tbmDjv8
X-Google-Smtp-Source: AH8x226wbrTXtIlzbyvt3V+2Qqi+ZR00CsVqGl8YKtgTBpG5M9n1o1hWJRW2QLZ40OmNdduOpJ2VBg==
X-Received: by 10.99.115.24 with SMTP id o24mr6898291pgc.218.1518068273469;
 Wed, 07 Feb 2018 21:37:53 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id k7sm5965165pgt.20.2018.02.07.21.37.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 21:37:52 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 08 Feb 2018 16:07:46 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 0/3] LPC fixes
Date: Thu,  8 Feb 2018 16:07:42 +1030
Message-Id: <20180208053745.31254-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Thu, 08 Feb 2018 05:37:57 -0000

These patches were developed when bringing up dev-4.13 on Romulus. We
need to ensure the LPC clock is enabled, now that the clock driver turns
off any unused clocks. We also need to enable the LPC firmware cycles
bit as we no longer have the aspeed.c hack.

Joel Stanley (3):
  ARM: dts: aspeed: Add LPC clock phandles
  misc: aspeed-lpc: Enable clock
  soc: aspeed-lpc-ctrl: Enable FWH cycles

 arch/arm/boot/dts/aspeed-g4.dtsi |  1 +
 arch/arm/boot/dts/aspeed-g5.dtsi |  1 +
 drivers/misc/aspeed-lpc-ctrl.c   | 31 +++++++++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.15.1
