Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BC8MsoEL"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVV3Y4lg2zDr5M
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 00:00:09 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id g16so4396555pgn.7
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=T5rSs+fsv4Ecyo+vcR5yaSNy7JJHSEgNQcD76IZKaBU=;
 b=BC8MsoELsYxkkAeTycPNfWlEw3IdqIG2GO1YsvbROujvRDbZfcxP06uF9rqDWofx/7
 /jEID3KVrFruIAJZoDUtv798fs2M+0tnOMGP8ytAWWG3vH6LIdiZ1n0CYSmc4NscZLya
 lVZKwWPSeg9UVm/bTQtEZnSjovSx7SM7pTb+4sDIGWz4a1pYvREDze8ZdqFcx2lIRiMk
 3s51AJ/8XE1/jRPq0/hcUV739oN3EBEnmyzLexDT5kWLHgR1/SswKlCHoLaxSogsFPIe
 89EV9WXuI3qWhNCVk7Ql5NDzJb3cJPwQuqLN+kU7eJ5ez59gosO6aEQnZUF4MrZDIR3i
 I0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=T5rSs+fsv4Ecyo+vcR5yaSNy7JJHSEgNQcD76IZKaBU=;
 b=Q0kNIY/ca3VG3ivV4V63ATK5hjSAKC9/NVCtjmvuug09LGtU1HW3OmENjBP0xFsK/4
 XvXavoAzJgcTMqt7aLZ05LQp2Us8Bx0vWSbgic8BtpMqvB9srvmt3bz/oUFuXuK7hDi1
 v6ez7IriodKz8Ed0vkX0eIWluuk5n3RK2NlbIDhrpo5mKa0ZnZyjZqgSad++BOkv82x9
 b4kdUnq9FKixvH/OdZ+MAjRQdnALN7uf7EwB3/rFaWPBUJ9kihYOJ4uDMb1qxnwQPNE1
 rW+gJAhl47UesxmpYwNk/HW5tGItNmMgJZqUxVQfQnFJNmeH52PEOEuAMgJmRsNcXnJU
 nfYA==
X-Gm-Message-State: AKwxytd96VtfETujmADgxW1cQIXjVBX9jRLIi/hLBvjA2YnRgPDHNwke
 L21WCIS/s5tmINxilGAYalEgP0c+
X-Google-Smtp-Source: AH8x224SUZOuK66cQdPtlxI0L4Xf64F+oums5M7nHvBFf3oiRenbAV/xXmSnulv1iOcOYUwcmd9MUA==
X-Received: by 10.99.95.4 with SMTP id t4mr20652318pgb.291.1517230807059;
 Mon, 29 Jan 2018 05:00:07 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id t8sm15087834pgn.93.2018.01.29.05.00.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jan 2018 05:00:06 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 29 Jan 2018 23:30:00 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.13 0/2] Add missing bt nodes
Date: Mon, 29 Jan 2018 23:29:57 +1030
Message-Id: <20180129125959.10499-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 29 Jan 2018 13:00:10 -0000

Joel Stanley (2):
  ARM: dts: aspeed: Add IPMI BT node
  ARM: dts: aspeed: Enable IPMI BT node on OpenPower machines

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
 arch/arm/boot/dts/aspeed-g4.dtsi                 | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi                 | 7 +++++++
 6 files changed, 30 insertions(+)

-- 
2.15.1
