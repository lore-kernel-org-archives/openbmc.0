Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4q3YLdzDsrV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xuyMQxIo; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id i127so2271958oia.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=DL0J7z/KDaiUzWJjboIQEpRC61iNfxumo+F/OuZQxqs=;
 b=xuyMQxIoA9oN5L3TP0O68a5Wu1rDXVMcGZsaec7zTmsNT08HQxztJF1ga2lGYuQai+
 mFNpeAaNsrzNTTy0Aj7HFzTJMd6+vIV77m1DIIUVQIMXFup56gukYYf6uWScH66VzUrI
 Iu6943w2Ih+4KnEfHy/RohbPRecHKQrqKjVM0ixJMmYzfd85Cxqx5I6CdOR3eCkuQkqB
 lVR0G0Ewx3+kfiTdD3nRE8+SJwudlwvY2Vdrja5dInG6Rlpjj+Jw2L1GKZx3i9JBql/l
 N3lkPtl2bVb5YYq4yN8NTIsbj58dnUgK1e6X5h68yOvm01i3KyJvsCgVw+391y5EdUub
 aoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DL0J7z/KDaiUzWJjboIQEpRC61iNfxumo+F/OuZQxqs=;
 b=DyFQMSD3JOEa64Ma7E8Hbu/K1Z1AVa8NPNy10zbTat5zY36oYLw7ztitY+pXl06lZT
 pNfhJF1y9QDlvcqrsjQjR+ZDKywwlfqsSQ+Z6LITqqzGsOkFtaFtoRgMtdpJabwGd9yC
 INmafxyQSyoYiRuhDkb26Us5Ip9fLTwexCQGZJVDks5oLlmi5XWDs6JSFzMrsCY5yXah
 qhkYK+07o3S+e4UvcE5qrq/zQ4hp8NOGW8IEKVbhDnijwkfCCkNt8RdtYqPbWDwUjafr
 SZp1FFqfzZhYbR7qW4VjwKf397+PZ7oHCOjX8824yiEnOq7sPiJOumJGdxtvvA2kDj49
 zjVA==
X-Gm-Message-State: AA6/9RmtLUk3oioE9nMDgNFqyww9NpKTfRwHR2y5yHHxBrYeMWBDFqCwP/qcizIqgSpqkg==
X-Received: by 10.157.24.36 with SMTP id b33mr3025239ote.50.1476222008994;
 Tue, 11 Oct 2016 14:40:08 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.08
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:08 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 00/18] FSI device driver introduction
Date: Tue, 11 Oct 2016 16:39:45 -0500
Message-Id: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:12 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Patch Descriptions:

Patches 01-13 have been provided by Jeremy Kerr as an example of
how FSI function should be phased in. This includes the basic framework
to add FSI extensions to the Linux bus and device models.  Patch 13
is a beginning definition of a GPIO controlled master controlled in
firmware.

Patch 14 contains minimal text formatting changes to deal with
checkpatch and git am warnings.

Patch 15 covers minor recommended changes to Jeremy's patches 01-13.

Patch 16 adds function to set up read/write access to a given CFAM.

Patch 17 covers implementation of the FSI GPIO master.

Patch 18 defines the SCOM FSI device driver client.


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


Chris Bostic (5):
  drivers/fsi: Fix some text formatting
  drivers/fsi: Revisions to existing patch set
  drivers/fsi: Set up CFAMs for communication
  drivers/fsi: Add GPIO master functionality
  drivers/fsi: Add SCOM FSI client device driver

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

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |   8 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  36 ++
 drivers/fsi/Makefile                               |   5 +
 drivers/fsi/fsi-cfam.h                             |  63 +++
 drivers/fsi/fsi-core.c                             | 432 +++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  97 +++++
 drivers/fsi/fsi-master-gpio.c                      | 457 +++++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  39 ++
 drivers/fsi/fsi-scom.c                             |  62 +++
 drivers/fsi/fsi-slave.h                            |  62 +++
 include/linux/fsi.h                                |  63 +++
 13 files changed, 1327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-cfam.h
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 drivers/fsi/fsi-scom.c
 create mode 100644 drivers/fsi/fsi-slave.h
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2
