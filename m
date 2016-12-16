Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMZ61zFMzDqgj
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:37:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HIDgO2D6"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id 75so3885180ite.1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oURlh7iJ0Z15xhe6cXfDcsFUqKqTeTfaaajGyF48+YE=;
 b=HIDgO2D6nmqHCkzop3VOtxOmnwIWkIuRuHQzLIfgXBAl9n/QASIPI8AufdZxgH6zp5
 ubE0WQ+/tsBTuz/8qTqPZ9pz0vUnPOu/xVyEa6yGCmpLXos3Oj4bZdlxCQvn59hk+NHk
 eom2qpCusAC1ROlgfCz2xsLsI5kquwgLu8oPBPNhVY3Moh/4Kld2xAMTPr7znURLxuEI
 Udz/iKOgXrD0CXWEi3wat5R8Eb4u/CrY9d5bOyiXM3y0sqpD2n/fPQy+i6R0fi/rpjdL
 6550DNimb/oY+vW/i6sZG8hBxUYfAqAZ/dtIbdBLzLq0xkFdPZlm/9OkvvyflWaWdHt6
 ObOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oURlh7iJ0Z15xhe6cXfDcsFUqKqTeTfaaajGyF48+YE=;
 b=A/vc70NsNUYkUqYL9XWf9x/OPMICgi6T45sIjN0KVnwoNIMV6engDnL0EZJNmcgv+H
 wMnMsRLu63mOktjG8NhSXUNiVrFwculSOU6KkEQex4sNRhUdqM2+vYRVtLwq1+uYTlN9
 /RLtr9GiVjDSr7iXUFyGVgOSuaZVp536QP7vj1J7/OAppA4iQxuPS2Aj3sIKeJ9X0S1Y
 Prfb5bYlLpSEOzrRO+G4w/JTXjakPwPWE0rtQq4gC/Jj/ZuqTIhrpRCzMNcCGhkqcJDk
 N81hQ/WJ8hCzbTug/lTQKTt8xKmaZJrOMrS4+NoL3AWaoMw2IDzl0Lg0GwGSeMbGh8XX
 cv2Q==
X-Gm-Message-State: AKaTC02aDMcUrji3J2KYWiuyvuLa+ec9kSTKd3KSLbEpzimJeISqsLK1aaIif+NJQ5VF4w==
X-Received: by 10.36.64.75 with SMTP id n72mr4913199ita.105.1481920652255;
 Fri, 16 Dec 2016 12:37:32 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id w189sm1912274ith.19.2016.12.16.12.37.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:37:31 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 0/7] drivers: hwmon: Add On-Chip Controller driver
Date: Fri, 16 Dec 2016 14:37:23 -0600
Message-Id: <1481920643-7383-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Fri, 16 Dec 2016 20:37:34 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
Controller). The OCC is an embedded processor that provides real time
power and thermal monitoring.

The driver provides an interface on a BMC to poll OCC sensor data, set
user power caps, and perform some basic OCC error handling. It interfaces
with userspace through hwmon.

The driver is currently functional only for the OCC on POWER8 chips.
Communicating with the POWER9 OCC requries FSI support.

Edward A. James (7):
  hwmon: Add core On-Chip Controller support for POWER CPUs
  hwmon: occ: Add sysfs interface
  hwmon: occ: Add I2C transport implementation for SCOM operations
  hwmon: occ: Add callbacks for parsing P8 OCC datastructures
  hwmon: occ: Add hwmon implementation for the P8 OCC
  arm: aspeed: dts: Add I2C POWER8 OCC compatible string
  hwmon: occ: Add callbacks for parsing P9 OCC datastructures

 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |  13 +
 Documentation/hwmon/occ                            | 100 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   9 +
 drivers/hwmon/Kconfig                              |   2 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/occ/Kconfig                          |  29 ++
 drivers/hwmon/occ/Makefile                         |   2 +
 drivers/hwmon/occ/occ.c                            | 519 +++++++++++++++++++++
 drivers/hwmon/occ/occ.h                            |  86 ++++
 drivers/hwmon/occ/occ_p8.c                         | 217 +++++++++
 drivers/hwmon/occ/occ_p8.h                         |  30 ++
 drivers/hwmon/occ/occ_p8_i2c.c                     | 141 ++++++
 drivers/hwmon/occ/occ_p9.c                         | 243 ++++++++++
 drivers/hwmon/occ/occ_p9.h                         |  30 ++
 drivers/hwmon/occ/occ_scom_i2c.c                   |  67 +++
 drivers/hwmon/occ/occ_scom_i2c.h                   |  26 ++
 drivers/hwmon/occ/occ_sysfs.c                      | 492 +++++++++++++++++++
 drivers/hwmon/occ/occ_sysfs.h                      |  52 +++
 drivers/hwmon/occ/scom.h                           |  48 ++
 19 files changed, 2107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h
 create mode 100644 drivers/hwmon/occ/scom.h

-- 
1.9.1
