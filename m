Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Wrd654RzDvXg
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FkdHRrJn; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id v84so2661675oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OPpzZ/HfctnoSw5Faa8cet4fg7TCPezBFyxJ59tjAjc=;
 b=FkdHRrJnw2BFwqiOIrhRbTveZaw5idDYF6W3t67JPSIGxtruQMq06vfYrOATxLaAUC
 msPpmCqbXxMu8tHvQ80idBEvsNPFUNwxPt/3HfBU1dd1su3h7TeVV/v+uTzJsVTpEQnP
 VYbUfa775AEMsQP0MxdMERysZ3KjEAO3BzUmcAP64RB5z47Mz47JBEBFWTMBPLVIn2fl
 J2CuXYiKnVfLc4lVu50rP9tlZbRsAzqjDssZQrHC3KNiXzXgbXV6/7tVmA43IdTz1KWV
 s02Dbi8CT+EHGTfNQqH35rOdIWSxISso3j4oHhrCzLIoj9bXPMX7MxXrXffKjH4UJVan
 JK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OPpzZ/HfctnoSw5Faa8cet4fg7TCPezBFyxJ59tjAjc=;
 b=LDo/dnMvcYkSAGsEBxrNxcs/1MUe5UQfIOm9aYWnh4CFDUEQ8unOPo6nKObqj+I40r
 3rS0tqi3ViPQPoii46TxtyqcF7lmXzWNffaak4G3SvjxXsKhfN1jvxa1+i3c1Wc7zZh6
 G+aN5LpcAIy1YPURYC9xf/KChkOuijz/8J9XBuM+Gv86FsB+b6MNvQmYdq3lY3UP+QM/
 s9XICn1M+hLsv3rmYpWMT15AWSgw979TIYurXycleFTkFXJLJAdDew9tc3rMHhaFrRpE
 vpqpKo6r5CYBsw4i790pORzSu9oqgILe8clTRrW5QPxjLBT21+YeuM8VbblkJe4YEhiH
 EcPQ==
X-Gm-Message-State: ABUngvcl9xVh2Jip+ywmQGTO69eCGglWYhx/Rb5xR0GC9qg491xuVuXdvMR2Za6S0ltqbw==
X-Received: by 10.157.31.18 with SMTP id x18mr17498723otd.29.1477865408062;
 Sun, 30 Oct 2016 15:10:08 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.07
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:07 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 00/18] FSI device driver introduction
Date: Sun, 30 Oct 2016 17:09:21 -0500
Message-Id: <1477865379-11566-20-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:10 -0000

From: Chris Bostic <cbostic@us.ibm.com>


Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

This set provides the basic framework to add FSI extensions to the
Linux bus and device models. Master specific implementations are
defined to utilize the core FSI function.

In Linux, we have a core FSI "bus type", along with drivers for FSI
masters and engines.

The FSI master drivers expose a read/write interface to the bus address
space. The master drivers are under drivers/fsi/fsi-master-*.c.

The core handles probing and discovery of slaves and slave
engines, using those read/write interfaces. It is responsible for
creating the endpoint Linux devices corresponding to the discovered
engines on each slave.

Slave engines are identified by an 'engine' type, and an optional
version. Engine, a.k.a. client, drivers are matched and bound to these
engines during discovery.

This patch set does not include extended FSI function such as:
    *  Hub master support
    *  Cascaded master support
    *  Application layer hot plug notification
    *  Application layer FSI bus status interface

Common FSI terminology:

* Master
    Controller of the FSI bus.  Only the master is allowed to control the
    clock line and is the initiator of all transactions on a bus.

* Slave
    The receiver or target of a master initiated transaction.  The slave
    cannot initiate communications on a bus and must respond to any
    master requests for data.

* CFAM
    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
    ASIC residing in any device requiring FSI communications. CFAMs
    consist of an array of hardware 'engines' used for various purposes.
    I2C masters, UARTs, General Purpose IO hardware are common types of
    these engines.

* Configuration Space / Table
    A table contained at the beginning of each CFAM address space.
    This table lists information such as the CFAM's ID, which engine types
    and versions it has available, as well as its addressing range.

* FSI Engine driver
    A device driver that registers with the FSI core so that it can access
    devices it owns on an FSI bus.

Patch Descripotions:

Patches 01-12 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in. This includes the basic framework
to add FSI extensions to the Linux bus and device models.

Patch 13 Contains minor updates on top of Jeremy's base to allow
client/engine drivers to register with the core.

Patch 14 adds function to set up read/write access to a given CFAM.

Patch 15 sets up slave smode during scanning operations to allow
CFAM config space access.

Patch 16 Implementation of the FSI GPIO master. Contains base code
from Jeremy Kerr and finished by me.

Patch 17 core additions for client driver registration.

Patch 18 SCOM client device driver creation



Chris Bostic (6):
  drivers/fsi: Minor updates to FSI core
  drivers/fsi: Set up links for slave communication
  drivers/fsi: Set slave SMODE to init communications
  drivers/fsi: Add GPIO FSI master
  drivers/fsi: Add engine driver register utilities
  drivers/fsi: Add SCOM FSI engine device driver

Jeremy Kerr (12):
  fsi: Add empty fsi bus definitions
  fsi: Add device & driver definitions
  fsi: add driver to device matches
  fsi: Add fsi master definition
  fsi: Add fake master driver
  fsi: enable debug
  fsi: Add slave definition
  fsi: Add empty master scan
  fsi: Add crc4 helpers
  fsi: Implement slave initialisation
  fsi: scan slaves & register devices
  fsi: Add device read/write/peek functions

 .../devicetree/bindings/fsi-master-gpio.txt        |  21 +
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  36 ++
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  34 ++
 drivers/fsi/Makefile                               |   5 +
 drivers/fsi/fsi-core.c                             | 496 ++++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  95 ++++
 drivers/fsi/fsi-master-gpio.c                      | 522 +++++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  60 +++
 drivers/fsi/fsi-scom.c                             | 238 ++++++++++
 include/linux/fsi.h                                |  72 +++
 13 files changed, 1603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi-master-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 drivers/fsi/fsi-scom.c
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2
