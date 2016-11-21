Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsR0rSVzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zIMRn99K"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id f201so16439390oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=js3f5jIpAI9C1+I22KJL7a5CqN4Ju4IuM3BqPApq85c=;
 b=zIMRn99KCS2wxKhZp7pit2WBcmfZZTs8zKW2L0yyPJN4nNwt8QLzEcCwoFNpvI/3I/
 JAYreZlQx8rj/sRSUMhoJw3xFEhMkr4tc0q8eUszBPtA17VtEJeIDVXolOHW7IPr6WuH
 GR1zwzLxheAYdWKyRJJQs4D2LccwJMiEYqzMkH+/Pp74A58g5un3pejRNiwqn+QxHwxz
 cH6Itvw3y9on3y2Nt1VfqgIK3P/agTXJLkiUyaCpB31GDUa6ffTx2UwdQXZ8/pbxGWp6
 OBzEJpve7iLtMOU7WwWHMZEG0T4Zc9j45h/cfEDo0uwaKyJ9geMXukbWvRMtItXCzz65
 puyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=js3f5jIpAI9C1+I22KJL7a5CqN4Ju4IuM3BqPApq85c=;
 b=CA5QanvfWYP5AuANfHSPCk7ek2PBmxxSx883Bp+EDKHSZTJWleyGZMXqKyEIYwSTuu
 xtYDpeWOnJca8r1QfnX2IpVdfuLGWG58iadCB31Twj/u+eJK2ka7QNorDkVwMN33Fl77
 0uDmOeJtvkkoiLbgL/PZXx6V8Ta/wWexMuQYFvgOtgaoJ+d3qrsYyOKUb4AclHyLh6n6
 Fy1a6Xk+404bkn5YYT94hemfrTHEUnVPf62Ai76JDJ8EUVzaTTKnajbFkKDOCunK5GXp
 m7kOs/zTOT/c+24wEG+MQg8d+DnUyGmAViaSfA9Ss6PUdwzsTORUN7v4hF2p1040677X
 EJLw==
X-Gm-Message-State: AKaTC0177xAdfpnLByoP+gVPzLrkYMar+NiOmkx1DyyARm8P5VQQ2/mWWqZAnQJR+hiwaQ==
X-Received: by 10.157.54.245 with SMTP id s50mr6938011otd.181.1479696057171;
 Sun, 20 Nov 2016 18:40:57 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.40.55
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:40:56 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 00/19] FSI device driver introduction
Date: Sun, 20 Nov 2016 20:40:29 -0600
Message-Id: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:36 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:40:59 -0000

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


Chris Bostic (7):
  drivers/fsi: Set up links for slave communication
  drivers/fsi: Set slave SMODE to init communication
  drivers/fsi: Add master unscan
  drivers/fsi: Add GPIO based FSI master
  drivers/fsi: Add client driver register utilities
  drivers/fsi: Add SCOM FSI client device driver
  drivers/fsi: Add Mailbox FSI client device driver

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

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   9 +
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |   9 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  41 ++
 drivers/fsi/Makefile                               |   6 +
 drivers/fsi/fsi-core.c                             | 533 +++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  95 ++++
 drivers/fsi/fsi-master-gpio.c                      | 578 +++++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  62 +++
 drivers/fsi/fsi-mbx.c                              | 196 +++++++
 drivers/fsi/fsi-scom.c                             | 225 ++++++++
 include/linux/fsi.h                                |  73 +++
 14 files changed, 1851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 drivers/fsi/fsi-mbx.c
 create mode 100644 drivers/fsi/fsi-scom.c
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2
