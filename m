Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xV3kf1d2HzDr5F
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 00:13:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHKti2a5"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id i19so6071012qte.1
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=p4kwysos5uGeLTxMPkCBFN63floFfxLj21EDmnPnOSQ=;
 b=iHKti2a5ygK/I6kLbW6JFnoRLAxTPkyt6cBcNsOB3LGC7dR9RoDJYAkjrq/XTc36MU
 VUi+BP7xx7njrJnt1cAgso6RCMVp9EFFLnzDOtrKjFe4vDIZ6xi6sgzIXoJaJVT0dbfE
 EobE+l56R+H7PSTaOSBmNoaEatoqjnPkpHAoe/meQJUCDs0H2hXfD31sy0opgaK8q1vt
 TMI7rcbR3x1uqahxKusXtgx4n2F/CYjJN/2peZGcaFZW+ukZmGSp7NIeJ3gVaKOEGzxG
 C6eGwP6RcH9HKCc2/Tl2F/tQnJK3Q9pIf206uSxeNyJayKYOwwEObZNoMJZqIuf2LfyL
 MWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p4kwysos5uGeLTxMPkCBFN63floFfxLj21EDmnPnOSQ=;
 b=I0xtAzk/alyz30p/QqQfCI1vBVTPBFTQF1I3gpKusyTXKeSp3uyT22eSoOkkasGYu1
 gKvym1Kt76zZlK3dHm7lWp1UrYq6Dv8Tu2JBELh6UP0/reaPOSDoxePmH47ywGYHBS5r
 /8v6fXW5b5IYCq0gKXkbRNhUTBO/focYWrUzZUnlDPWhKeEeveRO1Hg1Y8pjdiI4V5D5
 RL9RxoK7DOxNZi9/oIzs7/iQlj+gnJfdSpjfy/mI6QFmt9RM1X1i8HY0a6uZug3f3I1s
 yxpT2IQwCOHakN0r7U6lszh3yp/ZCeq9Ii+tlMYdAIO4Vn4TAQZmDcAdBOaiwImdv/M1
 5SrA==
X-Gm-Message-State: AHYfb5iC0Cl1HCdkE3Z/HG0iYK1XE10px/Bi3ahi3mTXkEMjFPGHDdH4
 MYEsVlXw2jQ7x1GoZHro5WyG/v/T3Q==
X-Received: by 10.200.38.155 with SMTP id 27mr26976264qto.228.1502547205468;
 Sat, 12 Aug 2017 07:13:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Sat, 12 Aug 2017 07:13:24 -0700 (PDT)
In-Reply-To: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Sat, 12 Aug 2017 09:13:24 -0500
Message-ID: <CAK_vbW02752Bz4bCe2FKk_6A+=B6Pp6qBBMfDrQei2xph5U0eg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v5 0/4] hwmon: (pmbus): Add IBM Common Form
 Factor (CFF) power supply driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sat, 12 Aug 2017 14:13:30 -0000

On Fri, Aug 11, 2017 at 12:56 PM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This series adds a hwmon pmbus driver for a POWER System power supply. The
> core monitoring functionality is provided by pmbus.
>
> These devices should be auto-probed on the I2C bus, so I added them to the
> witherspoon device tree.
>
> Changes since v4:
>  * Rename the driver again...
>  * Change compatible property; we can't have any '-' in the compatible
>    property because pmbus will use that string for hwmon registration name,
>    which disallows that character.
>  * Remove debugfs bool from pmbus_driver_info
>  * Add comment about returning rc when reading STATUS_MFR_SPECIFIC fails.
>
> Edward A. James (4):
>   dt-bindings: i2c: Document the IBM CCF power supply version 1
>   hwmon: (pmbus): Add IBM Common Form Factor (CFF) power supply driver
>   Documentation: hwmon: Document the IBM CFF power supply
>   ARM: dts: aspeed: Witherspoon: Add power supplies to i2c bus
>
>  .../devicetree/bindings/i2c/ibm,cffps1.txt         |  21 +++
>  Documentation/hwmon/ibm-cffps                      |  54 ++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  10 ++
>  drivers/hwmon/pmbus/Kconfig                        |  10 ++
>  drivers/hwmon/pmbus/Makefile                       |   1 +
>  drivers/hwmon/pmbus/ibm-cffps.c                    | 151 +++++++++++++++++++++
>  6 files changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
>  create mode 100644 Documentation/hwmon/ibm-cffps
>  create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c
>
> --
> 1.8.3.1
>

Tested-by: Brandon Wyman <bjwyman@gmail.com>
