Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wH9v61hp0zDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:12:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4faqr6n"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id v1so19377594pgv.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=EPXN0l18KrtrSjgl59uXp9l6pcmNqh2xFcXdyMm9II4=;
 b=Q4faqr6nTSoA7nWzj71akVrJPgh/bAKYr1vhagnf5e5GdR3xEUoBAyYCwMUTsqiFRY
 +m0Y5Z5rVBZyYzBID9jcgNpwloKDYI2nY1EYVaqBc0L+4Gc+6u+WwurCoQgL+rM7AlsM
 1LTxtMEGrHQVVGE5gcoZVDZbw9Eux8CAYIB9iCFNnIutsrgSSy7TvIBB3GN6P0ktD/UM
 XyFiLaZtLxamwzUu9/0HZPjgLdssZK5IQC0HLNcUJF1vVTyS18dX5RO9rCCpaqO9Duvr
 DoKijKX5gTJJrGbDbtSQzAsTiCYJjX68UX/v5ZoPqwkuKDEo1WQf8h/ss5fjkdEIkqjR
 jziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=EPXN0l18KrtrSjgl59uXp9l6pcmNqh2xFcXdyMm9II4=;
 b=bOgrN5oEavbG7zzwHh+7An2CFdSKQPNP8Y/dII09j+V3wA2EC6iCknwaghic2rmRHE
 iIxH1HDh79mfQN1aB7NU5VLJ/G7dHjxtzKCtp+pMxWyXsdZXIjjn7xOu6CUzigJCzIpS
 DvuEzCCXSCt2blgU7luEqI91PdwDOJBPL1ddi1XOXuHJcC7lvF7BkBag3QaH5cW7/bad
 AZjNUUqHpV7em7xgK+GXMbUF2xjNMeFdbiEsvKM/wiyA9i3r0DiZDMfTleQpxdxz0a0A
 z9DSA1MmljUxKFyzZwJ3OFrWEpluVsEcbyzdP5+dsaYte0ecYi+zqJCWhFn3cSvZsWyg
 OI8w==
X-Gm-Message-State: AN3rC/41Lb7Kny4T/rrV4AcSdtFELO5Z2UGEP83CziwUMZzEHx8CAhE9
 ceN7ptn0DSm81g==
X-Received: by 10.98.102.13 with SMTP id a13mr30996751pfc.33.1493705567564;
 Mon, 01 May 2017 23:12:47 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id f131sm26639215pfc.54.2017.05.01.23.12.44
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 23:12:46 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 15:42:41 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH linux dev-4.10 0/3] Enable Infineon IR35221
Date: Tue,  2 May 2017 15:42:36 +0930
Message-Id: <20170502061239.7677-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Tue, 02 May 2017 06:12:50 -0000

This driver has been accepted upstream and backported to the 4.10 tree.
These changes turn it on in the defconfig and add it to the device tree for
Witherspoon and Romulus.

I have tested on both of these platforms and the driver correctly probes for
the i2c addresses.

Joel Stanley (3):
  ARM: dts: aspeed: romulus: Add Infineon ir35221
  ARM: dts: aspeed: witherspoon: Add Infineon ir35221
  ARM: configs: aspeed_g5: Add Infineon IR35221

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 10 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++++
 arch/arm/configs/aspeed_g5_defconfig             |  1 +
 3 files changed, 21 insertions(+)

-- 
2.11.0
