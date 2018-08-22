Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::230; helo=mail-qk0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WbRaMlvS"; 
 dkim-atps=neutral
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41w8rV4QtvzDqnw
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 11:21:14 +1000 (AEST)
Received: by mail-qk0-x230.google.com with SMTP id b19-v6so215064qkc.6
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 18:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=G57M/sfGEz6V/OIhhXHKP2hdorzqNIriECnjLq5O8GY=;
 b=WbRaMlvSdk8kEuucdJF3abaZBII7bvRHhQ9S0z5bzTZLID8U4VOwwROil6lPHBAvZU
 HH9p7kQiN1SC2USrh11cAY2N/9x9t/sd4oEDnoCAoCHNMLkqgEbjFcA5Lp/WposUQPcs
 fNpKZ+j66LLGg8HULSGh9Pgch1vA2uNDCtYbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=G57M/sfGEz6V/OIhhXHKP2hdorzqNIriECnjLq5O8GY=;
 b=A83T7JC3tf+5hDlCXH4h7+3R52gVxZcQc9n2xuDHWx9LU0Ysg+p8tSxjjvW4igvdym
 TQg13BNcsyPea0fDJmB6t7r6dpPGBjtVA1RYESNBCIzaOXIAlc+mo3WgRDaEPcqMJxRO
 RaeYk2NcvaHYxHjZbp6FlBdrHTYAPxMSe//lilpK1B/J5u2twUtoYbs1CPaHlvWECKWi
 /TD25MuOVX5ZSh62TzC3Us/ppgDjQI23z+hMnmSZr4xRFJ5qvMeRh07FbIG27SVZCBGt
 U64UX790QJ9FAkzI917s5kK59bOcFj5MHMWmpn2Z36u2YHM3bjEFm7VKd+ClRzXTI+Vp
 YI9g==
X-Gm-Message-State: AOUpUlGYbf4aZ0bSnaN0+STgB8ZRjBZmkI52K/AGQziB4rkGopobN5Bg
 uIeTeeLXcyaey3M4g/8lBZKshVcSTuRLx4AehYaty/vk
X-Google-Smtp-Source: AA+uWPxk8P8nhHwB3cLYJqt5XlLvlRK/AGwe3VnNW+jK+uJqcYb8Jbup6o+3UgL8AqX8Q+Fwy++FsorEjh2vb7HrV68=
X-Received: by 2002:a37:ae86:: with SMTP id
 x128-v6mr47273422qke.25.1534900871665; 
 Tue, 21 Aug 2018 18:21:11 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Aug 2018 10:51:00 +0930
Message-ID: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
Subject: Linux kernel: Moving to 4.18
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Eddie James <eajames.ibm@gmail.com>, Tomer Maimon <tomer.maimon@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 01:21:15 -0000

Hello,

With the expected release of 4.19-rc1 this coming weekend a lot of our
recent kernel work will have hit the mainline tree. I will use this as
the trigger to create a 4.18 based tree (creatively named "dev-4.18").
This will contain the upstream patches from 4.19-rc1 merged in place
of the pre-upstreamed versions that we are carrying in dev-4.17.

Assuming everything that was in linux-next gets merged for 4.19, this
will leave us with about 36 out of tree patches. I've appended the
list of commits below. If you are the author it would be great to hear
your plans as a reply to this email.

Note that this focuses mostly on the Aspeed side of things. There's
been a lot of upstream activity on the Nuvoton side too, and we can
merge those commits into dev-4.18 if that is desired.

Cheers,

Joel

--

Andrew Jeffery (9):
      ARM: dts: aspeed: witherspoon: Update max31785 node
      dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
      pmbus (max31785): Add support for devicetree configuration
      pmbus (core): One-shot retries for failure to set page
      pmbus (core): Use driver callbacks in pmbus_get_fan_rate()
      pmbus (max31785): Wrap all I2C accessors in one-shot failure handlers
      soc: aspeed: Miscellaneous control interfaces
      dts: aspeed-g5: Expose VGA scratch registers
      dts: aspeed-g5: Expose SuperIO scratch registers

Benjamin Herrenschmidt (1):
      ARM: dts: aspeed: Romulus system can use coprocessor for FSI

Christopher Bostic (1):
      iio: dps310: Temperature measurement errata

Cyril Bur (1):
      misc: Add ASPEED mbox driver

C=C3=A9dric Le Goater (6):
      mtd: spi-nor: aspeed: use command mode for reads
      mtd: spi-nor: aspeed: add support for SPI dual IO read mode
      mtd: spi-nor: aspeed: link controller with the ahb clock
      mtd: spi-nor: aspeed: optimize read mode
      mtd: spi-nor: aspeed: limit the maximum SPI frequency
      ARM: dts: aspeed: Add "spi-max-frequency" property

Edward A. James (2):
      drivers/fsi: Add On-Chip Controller (OCC) driver
      hwmon: Add On-Chip Controller (OCC) hwmon driver

Joel Stanley (14):
      ARM: dts: aspeed-ast2500: Update flash layout
      ARM: dts: aspeed: Add LPC mailbox node
      ARM: dts: aspeed: Enable mbox
      ARM: dts: palmetto: Enable mbox and occ-hwmon nodes
      iio: Add driver for Infineon DPS310
      ARM: dts: aspeed-g5: Add DAC MUX userspace control
      ARM: dts: aspeed-g5: Clean up sio registers
      ARM: dts: aspeed-g5: Add resets and clocks to GFX node
      ARM: dts: aspeed: Enable the GFX IP
      ARM: dts: aspeed: Enable VHUB on Romulus
      ARM: config: aspeed: Add out of tree drivers
      drm: Add ASPEED GFX driver
      drm: aspeed: Debugfs interface for GFX registers
      dt-bindings: gpu: Add ASPEED GFX bindings document

Tomer Maimon (2):
      dt-binding: pinctrl: document NPCM7xx pin controller DT bindings
      pinctrl: npcm: add NPCM7xx pin control driver
