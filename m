Return-Path: <maxims@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNj6v15YSzDvx7
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:56:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LZ3sviP9"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id f188so12528333pgc.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=hnbddTv+a4QarnMJOmLU4A2L8t+cwaDHUcjn69JeGA0=;
 b=LZ3sviP9mBPc/X8r1RdX6mKWQpYGNTTZunAwO9S2lyk4DBcgUcxnEiEyDX1BQClxGf
 JX0JVkPM9IBrEh111VF/nd9pZ692H/WRdQ7Wtdf30CsguPJJN8Jw++1Tq1ZQQesIz731
 f4RxO/rMrQKmx2u5TiMCclP4hkNlJS/T6fgbbx/XelqNPowXoLzTz/hHzhkFbHZ6VSy+
 SCDodlYwE4UH3TIHacUwglnvzfG/tj9K7q+UPLcPzJt8ZevpDeKN0M1jx1VF9g1ZnqHx
 R3wRMYnPIcuEdGksZwhP+EuBMXVksvw+YnLD76nTQ7MyaTGgiJrnqlOrR3HtEMn7JW6C
 M7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hnbddTv+a4QarnMJOmLU4A2L8t+cwaDHUcjn69JeGA0=;
 b=ery1TlMphUNyxRdeHGQ1+zbo+lD64BpgxsVVtewHiFhTWoQqH30J7MVK04BMd4GEMT
 F3KJBNrapvHhxthYfC7E7MGrpudowaLeyX9RZThNiHucN6ZBfPbTS6fOUOODLV47HvJ5
 OBxeNZ+Yf8IBuJHnazB7zDK00DXAUmVO4a4t50aGIaUKgk3oZ5YZEXAFwDT2qUzn4CKO
 WUCTD9I0j6cy0sM6xLphEncb3Wvl9+8btX7g9WEuEq+Y/YSA8MGJ8ScZZaYvybbB8QA4
 7FSc4DvWqQmKVqfUmYgupDtk1Afe3fOjSY/RAYv/26nDBmabkIxADBn8Ld903aDewpxq
 tIag==
X-Gm-Message-State: AKaTC00ZJlVk372SIg47bY8J1IKvC0VZJWoyGIoQGDe/hspbqqCPL0lSXpwNsB/pI2/9tIs7
X-Received: by 10.84.210.13 with SMTP id z13mr521901plh.167.1479858996088;
 Tue, 22 Nov 2016 15:56:36 -0800 (PST)
Received: from mxsl.svl.corp.google.com ([100.123.242.80])
 by smtp.gmail.com with ESMTPSA id s2sm47626060pfi.10.2016.11.22.15.56.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 22 Nov 2016 15:56:35 -0800 (PST)
From: maxims@google.com
To: sjg@google.com
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org,
 Maxim Sloyko <maxims@google.com>
Subject: [PATCH u-boot 0/5] Aspeed I2C driver, using Driver Model.
Date: Tue, 22 Nov 2016 15:56:11 -0800
Message-Id: <1479858976-139210-1-git-send-email-maxims@google.com>
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
X-List-Received-Date: Tue, 22 Nov 2016 23:56:40 -0000

From: Maxim Sloyko <maxims@google.com>

This series of patches is only meant for openbmc/u-boot tree.
It adds basic support for aspeed i2c. Only single master
mode is supported with synchronous transfer.

The style is inconsistent with U-Boot style guide in few places,
but follows local style in those files.

Maxim Sloyko (5):
  aspeed/g5: Device Tree for ast2500, copied from openbmc/linux (include
    file), plus minimal device tree configuration for ast2500 eval
    board.
  aspeed: Fixed incosistency in some SCU registers naming.
  aspeed: Added function to calculate APB Clock frequency.
  aspeed: Added function to configure pins for I2C devices.
  aspeed: I2C driver.

 arch/arm/dts/Makefile                       |    2 +
 arch/arm/dts/aspeed-g5-evb.dts              |   28 +
 arch/arm/dts/aspeed-g5.dtsi                 | 1278 +++++++++++++++++++++++++++
 arch/arm/include/asm/arch-aspeed/ast_scu.h  |    6 +
 arch/arm/include/asm/arch-aspeed/regs-scu.h |   73 +-
 arch/arm/mach-aspeed/ast-scu.c              |   41 +-
 drivers/i2c/Kconfig                         |    7 +
 drivers/i2c/Makefile                        |    1 +
 drivers/i2c/ast_i2c.c                       |  305 +++++++
 drivers/i2c/ast_i2c.h                       |  143 +++
 10 files changed, 1851 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
 create mode 100644 arch/arm/dts/aspeed-g5.dtsi
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h

--
2.8.0.rc3.226.g39d4020
