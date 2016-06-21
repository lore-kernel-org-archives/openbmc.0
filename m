Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYfWZ1VDFzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 17:30:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=I9AvhoMB; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id ts6so757594pac.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=p3A4oOgafy5c53ZiteE1x7j8+eSfYvU2obs9G7/F7iQ=;
 b=I9AvhoMBcGbII50JTW6ousnMYoaGNjKinq9YIC7gM2ujEfZoBlcH2yFjNGniOF+PW/
 OVdubrUVbL4fc9H9/4BCfBGFoO6iomGkPWEa7FirLeJ+vU778MfhyN7mOZE8mu16i1rW
 jP3+2PY7eCNx6vJXTwRzRSfY+7RzzbR2XdNkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p3A4oOgafy5c53ZiteE1x7j8+eSfYvU2obs9G7/F7iQ=;
 b=Sk7NBrsQXcUZchFbl/mJi1u85T91Jf2tdmPQpeXl5Sen1N44iJJwYDYj/YW4IbHjZ2
 IcLdVKZSzXpT08JBwS10bGVYYAB0WZisMbRwgd0uHnBgICayzS7wb5s2iyLYBh3bTjwD
 ZolR4uLXuvmZXoJhz/OT25NOk9uJTSUhTG54HRO3Ddqykqw3hnwn4YmH+ljoDkRXx5w+
 DcxNZ6AWaCC0X0tSw5rDXpQNtpqGO1Tk5RUieb5gclI/YLH56Dblkvj4yww93jsDJoJ3
 FLK9seYjgo0eq0VF44GClXJO5H7loZOt6ndWE0iRywVWv6PR8B9zv8glQiS59nC/GaUH
 ojdA==
X-Gm-Message-State: ALyK8tIO8n/Is/1kuRinr+/BGsXDixT21mijVixKX5eyx5Ku9YQsiQB2NbhmMH3kX0PKfg==
X-Received: by 10.66.73.71 with SMTP id j7mr26725208pav.109.1466494200171;
 Tue, 21 Jun 2016 00:30:00 -0700 (PDT)
Received: from aurora.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id zv2sm13096910pac.43.2016.06.21.00.29.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jun 2016 00:29:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: clg@kaod.org,
	teddy.reed@gmail.com,
	andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [u-boot 0/3] Add minimal ast2400 support
Date: Tue, 21 Jun 2016 16:59:42 +0930
Message-Id: <1466494185-24459-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 07:30:03 -0000

Hello OpenBMC u-boot hackers!

This series adds minimal ast2400 support to the v2016.05 tag of u-boot. It
applies on top of the v2016.05-ast2500 tree that Cedric created for the
ast2500-evb.

It is a copy of the code from the Aspeed SDK with minimal changes to get it to
compile in a modern u-boot tree.

Pending review, I will add this to a branch called v2016.05-aspeed-openbmc in
the openbmc u-boot repository and point all of our 2400 and 2500 systems at
this branch.

Cheers,

Joel

Joel Stanley (3):
  ast-g5: Simplify config and board file
  ARM: AST2400: add support
  arm: aspeed: Remove cpu directory

 arch/arm/Kconfig                                   |    4 +
 .../arm/include/asm/arch-aspeed/ast2400_platform.h |   84 +
 board/aspeed/ast-g4/Kconfig                        |   21 +
 board/aspeed/ast-g4/Makefile                       |    1 +
 board/aspeed/ast-g4/ast-g4.c                       |  113 +
 board/aspeed/ast-g4/platform.S                     | 3092 ++++++++++++++++++++
 board/aspeed/ast-g5/ast-g5.c                       |    1 -
 configs/ast_g4_defconfig                           |    9 +
 include/configs/ast-g4.h                           |  187 ++
 include/configs/ast-g5.h                           |   85 +-
 10 files changed, 3522 insertions(+), 75 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/ast2400_platform.h
 create mode 100644 board/aspeed/ast-g4/Kconfig
 create mode 100644 board/aspeed/ast-g4/Makefile
 create mode 100644 board/aspeed/ast-g4/ast-g4.c
 create mode 100644 board/aspeed/ast-g4/platform.S
 create mode 100644 configs/ast_g4_defconfig
 create mode 100644 include/configs/ast-g4.h

-- 
2.8.1
