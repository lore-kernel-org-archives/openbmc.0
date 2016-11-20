Return-Path: <jaghu@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tM3Gn4r2NzDvmh
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jJ8CLnp5"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 3so118986874pgd.0
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 23:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=6cr8o40M5MVf25Lo72Xgd8gn65iXpJdIuD+IVJsnodc=;
 b=jJ8CLnp5Knahw3I0qox8+aW73ZNzvl/1kb4Wm7gcD+jYuWSTP0Qm33AMsoJk/gTFdT
 vQt8D9slQrlRcY1lrxCaQQKJb+mDS3kXT8XyF34E5D2GX3U0ZWr7ITF96IWKw/SYdY4e
 0v3IxA2zLRS6b5cmuaJfIx0RAqpLuL+4GnqsxgUZSxuAiG//eVJiswrsxQxIQ8+dMjSW
 HrJL6yW32QxL0v5VpPx2/ulce8KU0lguzTyVtsJ8Eh/XdzNt4Jo8srtemuMlAEXjrj2z
 CQQpvT19u1ztffeDa4LZnQKDxUxu9PQ/IwVHPEXfM2cnlTnSdwNV5rUoa88HPocZEPEL
 NYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6cr8o40M5MVf25Lo72Xgd8gn65iXpJdIuD+IVJsnodc=;
 b=NwMu10D/unp3TcxiQ5GcyJExBOfqcUY/msYcp0fFPotJNyzwK4FTXrplrZbVpT/RuG
 9v9FXBI/jRN0bq4GGH6IWRCmpFXMX43CPWexQwKs6qIlRmN/Kiv2GiOf+IcgFhI4+E3D
 VYvvivuCHoSKqA0IoaYYtwDpYLztdycJxxNgnLIKKbt/NHibTNiP2fbgYe0K48VM/jRd
 bdEtXLoI9Qic995GiE4rYWYy1XS2qPKnwRCSYAJzHy7E2FF5aD+nr8vk7OXpeR+iiOYU
 rfLAnKDxYOhqA5WfBNwSOvymLt3wTJFGRoXh5HaJRWVCFu/pQrfPoPMlhcwtMn/n7AcS
 Qz6w==
X-Gm-Message-State: AKaTC00Os1EoYpXLSwHi7TZKiutnPsCxMwFU9+Imp3RbsP3Ad50F9r2d+2GrilP4LNuanewa
X-Received: by 10.99.137.66 with SMTP id v63mr18126760pgd.117.1479626862726;
 Sat, 19 Nov 2016 23:27:42 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id r2sm28825975pfi.67.2016.11.19.23.27.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 19 Nov 2016 23:27:41 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 0/4] Seven segment display support
Date: Sat, 19 Nov 2016 23:27:32 -0800
Message-Id: <1479626856-18511-1-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Sun, 20 Nov 2016 07:27:47 -0000

This patchset includes:

Documentation for the binding which provides an interface for adding clock,
data and clear signal GPIO lines to control seven segment display.

The platform device driver provides an API for displaying on two 7-segment
displays, and implements the required bit-banging. The hardware assumed is
74HC164 wired to two 7-segment displays.

The character device driver implements the user-space API for letting a user
write to two 7-segment displays including any conversion methods necessary
to map the user input to two 7-segment displays.

Adding clock, data and clear signal GPIO lines in the devicetree to control
seven segment display on zaius platform.

The platform driver matches on the device tree node; the platform driver also
initializes the character device.

Tested that the seven segment display works properly by writing to the
character device file on EVB AST2500 board and on Zaius board.

A changelog between versions is included in the individual patches. Please
provide feedback.

Jaghathiswari Rankappagounder Natarajan (4):
  Documentation: dt-bindings: Document bindings for seven segment
    display support
  drivers: misc: Character device driver for seven segment display
  drivers: misc: Platform driver for seven segment display support
  arm: dts: Add dt-binding to support seven segment display on zaius

 .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
 drivers/misc/Kconfig                               |  16 ++
 drivers/misc/Makefile                              |   2 +
 drivers/misc/seven_seg_disp.c                      | 197 ++++++++++++++++++++
 drivers/misc/seven_seg_disp.h                      |  34 ++++
 drivers/misc/seven_seg_gpio.c                      | 206 +++++++++++++++++++++
 7 files changed, 490 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
 create mode 100644 drivers/misc/seven_seg_disp.c
 create mode 100644 drivers/misc/seven_seg_disp.h
 create mode 100644 drivers/misc/seven_seg_gpio.c

--
2.8.0.rc3.226.g39d4020
