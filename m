Return-Path: <jaghu@google.com>
Received: from mail-pg0-x22f.google.com (mail-pg0-x22f.google.com
 [IPv6:2607:f8b0:400e:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdpmC2vhKzDqMx
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 18:55:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kbyGGqL4"; 
 dkim-atps=neutral
Received: by mail-pg0-x22f.google.com with SMTP id 3so5582734pgd.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 23:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=Vx566HTDOqLk1pD6G6r2k1XdvJ9kkvtdZaBmcgXi+pU=;
 b=kbyGGqL4NEdshgg4W+HrJ3hc7lySd7dlzYuvfHlvLaizFDuaCn6xno1JWKdsOUEBC/
 GzsS3DZR+GG1SODZC9IyOa0zxACZca9p8Rh6hFmzaCu5G27udVopE7al65DA+ibCXOZj
 fwGoMKd6zs+k6znqHl2erjyGRgIbr70AWl6hozyG4W0l9KuXyHKBafKNNfOsKwMPBd4i
 GU0sZzwuuT0e4MShH/c/JwXo7tT5krt/L552cWMXjMmB6U5Y8TorBUh/rMmZHC3oomG/
 GqwYQz6DawhdV2aXM/NldpK1JUbjpeOhcy4k6kxD563VWrdj7hnRgnE5OKAnnXrMUMI3
 aPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Vx566HTDOqLk1pD6G6r2k1XdvJ9kkvtdZaBmcgXi+pU=;
 b=mYZfoPVu6eve4X5JvGuOOd90Bus/efVTRPolH/PeO11PoIXoWqrlmUjt3jIevnOsnh
 uxUXTbdmNihTUL028z2wUUHE1do8qZe9TRuQEUUP7/uVOEkA1ikXewoElldMtbSAHKbX
 4uX6SyRV5EUCBuGXNE1D9S+OG4wGrdiNTTXrxu/J+Mqg4wMf4SkuBBr5j8Y0x8DNA/C8
 7yK6jjvMV2DmfyTzSof2uFFZLu+/yc971YU8T6pr4u/Qw8Sc5vFENERVn90kvzrOe+Lp
 L7hS3cvPrXYGDcyrXIxrjB7/mZW6Cy1Fk7oaboc1Y4KCAhJ26LQVTYYMLDBYuei7wU1l
 srvQ==
X-Gm-Message-State: AKaTC00DipOoavMixNkqrtY1kTXeuvmdmGkpRZJcoz/yOUjPB02ilZ6dhxt7/3tyHCqBuka5
X-Received: by 10.84.179.165 with SMTP id b34mr205368062plc.162.1481702152891; 
 Tue, 13 Dec 2016 23:55:52 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y134sm84845071pfg.81.2016.12.13.23.55.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Dec 2016 23:55:51 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: [PATCH linux v1 0/4] Seven segment display support
Date: Tue, 13 Dec 2016 23:55:00 -0800
Message-Id: <1481702104-8617-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 14 Dec 2016 07:55:56 -0000

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
character device file on a EVB AST2500 board which also has 74HC164 wired
to two 7-segment displays.

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
