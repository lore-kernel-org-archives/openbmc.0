Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lp7taNvK"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWSC235FRzDqjK
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 13:39:58 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id k68so8866611pga.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=T5rSs+fsv4Ecyo+vcR5yaSNy7JJHSEgNQcD76IZKaBU=;
 b=lp7taNvKPvBcmofIf02XEswyNruM4MY0raqIqT7waUBAjfDdjBGOdUAsG3H53NbIiX
 XlJs6N1sUHrho0+2xy9bLJVOeXz4zYzq7TyhzyjFlSjuUy1ARJYUHkWkTHZ0kMIc+CvC
 umqx14I6nxDDvF8thQQBwsTwr0WjlmSKHPvY/cnIn0nktqFwvr4Z/7hOYMv5C4THirMz
 SYmB61Xz1mW0I9zA50jFvjUX7vgocfUCKAmxu/3l0RrFPKwCBwC8p2B7RyqJHAMLg3fK
 vaN+hqG1T5c6ROd08umkgdP19jA2efyMOXWpnuHnakA8Dq0ocDTbwWJQDWmQB7XPlLYL
 Th2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=T5rSs+fsv4Ecyo+vcR5yaSNy7JJHSEgNQcD76IZKaBU=;
 b=KCPoxrAiIZNuqxL9A52VW5P4E+kn/YnnVHFzEAQXXDaHiHkOdMnIdxrTWWHkx91cme
 6ZlEy/ebQMJwRdq7rm4XqqafTtZXL9ojB5gFVRAQLyYZtUq+HY2hgw0OYFrOcEFUYf9e
 hRJpQm/0LTq5x5MzMm4dWzjIG3KAvlyAMGYfXwgsO/I0jSrK7Orbp/2jpu3mVMvqjgMe
 S4883gqr/fhYsqBI97TAIZSv0g1WDQIPK5C/vSF80u8GzUlXx5Lou3/+8UmN4fYm3+qo
 5AtPwtm251gXwpmLhwO86C5fsmIPUqargADR/8gnM1gRlXvQimbi95GsxII7ZyIWMUID
 VcSQ==
X-Gm-Message-State: AKwxytcTGs4zlodx4nOcX2+JhDeYLS3yGKjo2hhbZPUK4GMUetaXHfBx
 vMxZ1vNDizFdveGDXEaIHMkcfafp
X-Google-Smtp-Source: AH8x227B+f9boMOzlufbhpwWwdj3YWAXKrzQOMPunpqtOi1ilUAjyT6ANj/BwyvcH9L+DjW4VAH37w==
X-Received: by 2002:a17:902:7b81:: with SMTP id
 w1-v6mr4093130pll.295.1517366395955; 
 Tue, 30 Jan 2018 18:39:55 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r194sm33641387pfr.138.2018.01.30.18.39.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Jan 2018 18:39:55 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 31 Jan 2018 13:09:49 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.di.au
Subject: [PATCH v2 0/2] Add missing bt nodes
Date: Wed, 31 Jan 2018 13:09:45 +1030
Message-Id: <20180131023947.24832-1-joel@jms.id.au>
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
X-List-Received-Date: Wed, 31 Jan 2018 02:39:59 -0000

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
