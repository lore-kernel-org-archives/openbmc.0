Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjR16YCzDt3S
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:14:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=W8+1tpTC; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id fn2so5631962pad.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=U6A2rILGo0gFBK8A8JZluZcuIc0IkQKhIbXB9kJ7M28=;
 b=W8+1tpTCBzhi/Se1KWVJ2p2KlgTPI+4lzK/6SBH1D2addXU6qCf8Cu8KQwBg+Fkjp0
 ELZ5v4nKzVU2Vh8Bqa1KvsA/encoDTj+F2icih3VdoYmdndpJ7pcuOUPG0iErQBzBey6
 A+O1BIVf131BTtdps3rxQa63aWDOabuRhgUXaxY2y/DqZBTmFwA3rc17LvcM1HeAZpE5
 C+/CHmFclAZwxXc6hcBbCLVxGsr2Aqkzbj9SMh2tv43Bvc1YomRmUuBwjpislZXjOoZr
 4pxqdkaa3xwlUEZ/JHM1XHzt8cw2RRLiCg6HZm4fVU4zPvNkw+c9Dm0JJuzONqWgmGJX
 zHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U6A2rILGo0gFBK8A8JZluZcuIc0IkQKhIbXB9kJ7M28=;
 b=O0dhzz92RhicIYygmv5OjD98IvImsG+uiNp9bn7NWQFHrncwp5Edv1/Szua5LVsg3H
 HPQ/7pezfLKj8CGLF6C/6ZzIBeR/0reu4YUiFCDtjTsUOBIAwfCOFNHsyS7MELHSrwig
 dqIMVmuo1PJCL0l6xIGFgHYdqnIVTL83YUynTrioo8m92XHS8Wunmew+tsY+9BdoPYdB
 0q+8PPLo9l/mYtqi4tmsijiwYiStRW4yMlJi7016nFhl5VpDgSkl/OqP18oY37adVAiP
 Y97pYvnqhgZEuDxd03oAu7h73BL7i6IdrTdhzBmfpsczuUFuvA2BXruGh6l0nYRdvwHb
 CKiQ==
X-Gm-Message-State: AA6/9RlTZk2JMA4daBpwPqsaNybCwu+AgHDoR8KDEtsN+AN+WsPSWTyNqTFNBOpEcVfhWA==
X-Received: by 10.66.150.8 with SMTP id ue8mr18431649pab.104.1476483289402;
 Fri, 14 Oct 2016 15:14:49 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.14.47
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:14:48 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 00/20] FSI device driver introduction
Date: Fri, 14 Oct 2016 17:14:22 -0500
Message-Id: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
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
X-List-Received-Date: Fri, 14 Oct 2016 22:14:51 -0000
X-List-Received-Date: Fri, 14 Oct 2016 22:14:51 -0000
X-List-Received-Date: Fri, 14 Oct 2016 22:14:51 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Patch Descriptions:

Patches 01-14 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in. This includes the basic framework
to add FSI extensions to the Linux bus and device models.

Patch 14 was written by Jeremy Kerr contrary to what the commit
message indicates. Contains edits to the existing crc4 utilities
to handle arbitrary length input data.

Patch 15 contains minimal text formatting changes to deal with
checkpatch and git am warnings.

Patch 16 adds function to set up read/write access to a given CFAM.

Patch 17 sets up slave smode during scanning operations to allow
config space access.

Patch 18 covers implementation of the FSI GPIO master.

Patch 19 core additions for client driver registration.

Patch 20 SCOM client device driver creation


General Information:

Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

This set provides the basic framework to add FSI extensions to the
Linux bus and device models. Master specific implementations are
defined to utilize the core FSI function.

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

* FSI Client driver
    A device driver that registers with the FSI core so that it can access
    devices it owns on an FSI bus.

Chris Bostic (7):
  drivers/fsi: CRC Utility Updates
  drivers/fsi: Fix some text formatting
  drivers/fsi: Set up links for slave communication
  drivers/fsi: Set slave SMODE to init communications
  drivers/fsi: Add GPIO FSI master functionality
  drivers/fsi: Add client driver register utilities
  drivers/fsi: Add SCOM client driver

Jeremy Kerr (13):
  fsi: Add empty fsi bus definitions
  fsi: Add device & driver definitions
  fsi: add driver to device matches
  fsi: Add fsi master definition
  fsi: Add fake master driver
  fsi: enable debug
  fsi: Add slave defintion
  fsi: Add empty master scan
  fsi: Add crc4 helpers
  fsi: Implement slave initialisation
  fsi: scan slaves & register devices
  fsi: Add device read/write/peek functions
  fsi: Add GPIO master driver

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  30 ++
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  35 ++
 drivers/fsi/Makefile                               |   5 +
 drivers/fsi/fsi-core.c                             | 496 +++++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  95 ++++
 drivers/fsi/fsi-master-gpio.c                      | 465 +++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  60 +++
 drivers/fsi/fsi-scom.c                             | 158 +++++++
 include/linux/fsi.h                                |  63 +++
 12 files changed, 1431 insertions(+)
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
