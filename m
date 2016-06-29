Return-Path: <raltherr@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfr7j0XQTzDqw1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=hhOLfVqj; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id i123so20381078pfg.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:subject:date:message-id;
 bh=vhvQXJg029rBhy41Oqyz+xkzuJraqzMmqRKBsImz9/I=;
 b=hhOLfVqjOhcp4rpQbGlLYGFdnfOW7pNX4M31sEAj6nq/fRXJBUNVZ3dFt+X9Yyy6R/
 l4JWNgM08IKBBw8oOSenPnLxSrCgslFrL+T/1V3uxeNWTHcNwCaEtwaPnkh4EM14OtMT
 /YIJY23gp7Yu8TDcFUPKLhgujGqDyQ2fvvwwuB29xK53zSuBtBgPOS/jhOk+wS/VNQRP
 uSmNN/nECzrWwnKNq+pDLcQ06XZ1SpF3te8U7nF1GE7fw6C065GZVVrvbuKkJzqMCdGP
 womlqIYE/TeeV8ju4Jz8B1OQQtB4TLDYMvVxOp2CcOMzxeocdv9Dr3OHxEeg0OTr3atv
 FWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=vhvQXJg029rBhy41Oqyz+xkzuJraqzMmqRKBsImz9/I=;
 b=DfMX99LTqpo9aQOnpF/10c+PRqOitYONBUpA1fxPYO+5x8WN3rtJQPjU+GQI0jZ3yJ
 rSa3eJxSCFQVyURRLK2oPxf6oPvefX7juuN17PCK4vE8MrQM7UT24oAKuGfoLZ6/EWuV
 2tgcFmLHrjgYCklIjWZhM89yN4j9UsYmal3wsMklame4SamfJ2aGcsIUOF6KsbcthbiU
 kNCetLdPHz4MuXaAyp/EY4H+WCSQg84ecUyAd93EqP7r3vgFrrKT121DeMre2RHtmWgt
 NpH2xlP0/lfvFIiKsjrmq8IZwDKVy+qcWRasg6izrbmbThoPUfJSciVXOnvfRW0MtO8p
 bPyA==
X-Gm-Message-State: ALyK8tKAPmvq3ezrfFJdZZaJu31exVWS+feYyMQWDFFIdV6J3DcKhJX1XqPwiY4I0teWWSYg
X-Received: by 10.98.106.133 with SMTP id f127mr13732413pfc.139.1467223245276; 
 Wed, 29 Jun 2016 11:00:45 -0700 (PDT)
Received: from raltherr-linux.mtv.corp.google.com ([172.18.64.20])
 by smtp.gmail.com with ESMTPSA id ln4sm7513693pab.38.2016.06.29.11.00.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Jun 2016 11:00:44 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] OpenBMC variant of aspeed-ast2500-evb.dts
Date: Wed, 29 Jun 2016 11:00:40 -0700
Message-Id: <1467223243-9156-1-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Wed, 29 Jun 2016 18:00:50 -0000

Add an OpenBMC-specific varient of aspeed-ast2500-evb.dts that
specifies the OpenBMC flash layout needed to boot a phosphor image.

Rick Altherr (3):
  ARM: dts: Add FMC to AST2500 EVB device tree
  ARM: dts: Refactor aspeed-ast2500-evb.dts into a dtsi
  ARM: dts: OpenBMC variant of AST2500 EVB

 arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  89 +-------------------
 arch/arm/boot/dts/aspeed-ast2500-evb.dtsi        | 102 +++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts |   9 ++
 3 files changed, 112 insertions(+), 88 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2500-evb.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-ast2500-evb.dts

-- 
2.8.0.rc3.226.g39d4020
