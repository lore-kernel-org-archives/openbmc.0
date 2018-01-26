Return-Path: <Prashanth.Giri@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=prashanth.giri@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="CKSuV2nq"; 
 dkim-atps=neutral
X-Greylist: delayed 617 seconds by postgrey-1.36 at bilbo;
 Sat, 27 Jan 2018 03:21:07 AEDT
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSkfq1gxMzDr21
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2018 03:21:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1516983667; x=1548519667;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MmOrb1/CKHz+NitoI5A0q4Muada8rCVscslHsdSzD8M=;
 b=CKSuV2nq1+yWDpyS+qgPtFj0GThIPsMuPDQlsnzozhLHSQKTr2MrkEoF
 skCdwvK0nGC0nl9kcD7BGkbYOkzAkY+/GUXcszbliH3KoRM61pG9e4Ydt
 uKEBckwTXwWYLra/8S90IniwGYiI22RWisIOGs8UI7d4bibCNrdZv+f77 o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EPAQBGUmtahz+a6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYMRgQcQdCcHnGQxgVGXWYICChgDgRNTgzoCgh5YFAEBAQEBAQE?=
 =?us-ascii?q?BAgECEAEBAQgNCQgoL4I4IoE0LA0iOwEBAQQBOUsEAgEIEQQBAR8JBygeCQgCB?=
 =?us-ascii?q?AESCIotskCKVwEKAQEBAQEihFKCFYM/gy6DLwSBSQoFA4YQBYpch2CBdYVhigG?=
 =?us-ascii?q?IF4czhhOCJGeRJod8gwOIYwGDfIE8NoFzcFKCKgmCTBAMgWd4AQGLYIEzgRcBA?=
 =?us-ascii?q?QE?=
X-IPAS-Result: =?us-ascii?q?A2EPAQBGUmtahz+a6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYM?=
 =?us-ascii?q?RgQcQdCcHnGQxgVGXWYICChgDgRNTgzoCgh5YFAEBAQEBAQEBAgECEAEBAQgNC?=
 =?us-ascii?q?QgoL4I4IoE0LA0iOwEBAQQBOUsEAgEIEQQBAR8JBygeCQgCBAESCIotskCKVwE?=
 =?us-ascii?q?KAQEBAQEihFKCFYM/gy6DLwSBSQoFA4YQBYpch2CBdYVhigGIF4czhhOCJGeRJ?=
 =?us-ascii?q?od8gwOIYwGDfIE8NoFzcFKCKgmCTBAMgWd4AQGLYIEzgRcBAQE?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jan 2018 10:10:45 -0600
From: <Prashanth.Giri@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jan 2018 22:10:27 +0600
X-LoopCount0: from 10.166.132.133
X-IronPort-AV: E=Sophos;i="5.46,417,1511848800"; d="scan'208";a="608296458"
X-DLP: DLP_GlobalPCIDSS
To: <bradleyb@fuzziesquirrel.com>, <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC v2.1
Thread-Topic: OpenBMC v2.1
Thread-Index: AQHTljzhm6mWoWdfI0KtlZKBYJE+p6OGUyYA
Date: Fri, 26 Jan 2018 16:10:43 +0000
Message-ID: <d8f209c0e9e749fdbc241afb81cb6228@AUSX13MPC101.AMER.DELL.COM>
References: <85D445A6-8BEF-40A0-BD8A-5102D74129C9@fuzziesquirrel.com>
In-Reply-To: <85D445A6-8BEF-40A0-BD8A-5102D74129C9@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 16:21:08 -0000

Concur with the idea of moving to more yocto aligned branch strategy. Would=
 like to be part of the discussions around how/when etc. aspects of the mov=
e. Did we start any already ?

-prashanth

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+prashanth.giri=3Ddell.com@lists.ozlab=
s.org] On Behalf Of Brad Bishop
Sent: Thursday, January 25, 2018 6:30 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v2.1

We have several big things on the horizon such as Yocto and Linux updates s=
o it seemed like a good time to tag v2.1.

There have been rumblings of switching the project over to a stable branch =
strategy more closely aligned with Yocto upstream.  As such, this may wind =
up being the last OpenBMC tag.  Watch the list for updates on this front.

Enjoy!

-brad

---

Adriana Kobylak (6):
      updatesymlinks: Only run on host power on
      Move obmc-pydevtools to tools package
      Barreleye: Update packagegroup-obmc-apps-extrasdev name
      updatesymlinks: Add instantiated mbox service
      Witherspoon MRW XML revision bump
      Software.BMC.Updater: Add dependency to op-vpd-parser

Alexander Soldatov (1):
      Fix host reset on double poweron command

Andre Rosa (1):
      bitbake: Replace deprecated git branch parameter "--set-upstream"

Andrew Geissler (114):
      openpower-dbus-interfaces.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-occ-control.inc: bump version
      phosphor-ipmi-net.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-mapper.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-dbus-interfaces.bb: bump version
      openpower-occ-control.inc: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      pyphosphor.bb: bump version
      phosphor-rest.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-fan.inc: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-occ-control.inc: bump version
      phosphor-dbus-monitor.bb: bump version
      Reduce journal storage size from 3MB to 2.5MB
      phosphor-networkd-rev.bbclass: bump version
      phosphor-hwmon.bb: bump version
      sdbusplus.bb: bump version
      phosphor-rest.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      mboxd.bb: bump version
      phosphor-ipmi-net.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-logging.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-rest.inc: bump version
      mboxd.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      phosphor-mapper.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      pyphosphor.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-time-manager.bb: bump version
      skeleton-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-led-manager.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-ipmi-host.inc: bump version
      skeleton-rev.bbclass: bump version
      openpower-occ-control.inc: bump version
      phosphor-hwmon.bb: bump version
      mboxd.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-logging.bb: bump version
      pyphosphor.bb: bump version
      openpower-occ-control.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-occ-control.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-mapper.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      pyphosphor.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-mapper.bb: bump version
      skeleton-rev.bbclass: bump version
      openpower-occ-control.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-logging.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      Fix compile issue for X86 SDK
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-mapper.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-logging.bb: bump version
      Reduce service restart limit from 3 to 2 on fails
      phosphor-dbus-interfaces.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-occ-control.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-fan.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-rest.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-fan.inc: bump version

Brad Bishop (5):
      Squashed 'import-layers/yocto-poky/' changes from dc8508f6099..67491b=
0c104
      Squashed 'import-layers/meta-openembedded/' changes from df3537259..b=
40116cf4
      Squashed 'import-layers/meta-raspberrypi/' changes from cce6292e414..=
2a192261a91
      Squashed 'import-layers/meta-virtualization/' changes from 898481a9d0=
2..eb6b5129561
      Revert "phosphor-mapper.bb: bump version"

Brandon Wyman (2):
      Change inventory string for power supplies
      Fix power supply presence information

David Cobbley (4):
      Add Nlohmann JSON library
      Updating Nlohmann branch issue and updating to 3.0.1
      Get Device ID - JSON
      Get Device ID - JSON for Witherspoon

Deepak Kodihalli (2):
      Add missing 'Offsets' key to the occ sensors yaml
      Fix broken SDK build

Edward A. James (3):
      init: Add init script to setup /etc mount before starting systemd
      Add occ-disable dependency to host-crash and host-timeout
      Extend sleep time for debug collector checkstop service

Gerson Fernando Budke (1):
      image.bbclass: Sorted ctypes to avoid basehash error

Gunnar Mills (15):
      Create Witherspoon fan errors
      Spelling fixes
      pflash: bump version to v5.9.4
      Revert "pflash: bump version to v5.9.4"
      Add Witherspoon Layer README
      Add AST2500 Layer README
      Add OpenBMC BSP Layer README
      Spelling fix in obmc-targets.bb
      Exclude /tmp/images from cleanup
      Add OpenBMC EVB Layer README
      Add OpenPOWER Layer README
      Add OpenBMC Layer README
      Add AST2500 BSP Layer README
      Add AST2400 BSP Layer README
      OpenBMC README.md fixes

James Feist (2):
      Add S2600wf Platform
      Add support for c++ futures for armv5te

Joel Stanley (11):
      kernel: NCSI debugging and Romulus LED dts fix
      pflash: bump version to v5.9
      kernel: NCSI logging and error handling improvements
      obmc-phosphor-image: Add lrzsz
      meta-openpower: pdbg bump
      pdbg: bump version
      kernel: Add Intel S2600WF, gpio and pinctrl fixes, machine updates
      kernel: gpio tolerance, cffps, ir35221, romulus cpld fix
      yocto: perf: Sync with upstream
      Enable perf in obmc-phosphor-debugtools
      kernel: w83773g driver, Zaius pcie-e2b-present

Ken Chen (2):
      Create meta-arm layer
      Add meta-qualcomm and meta-centriq2400-rep

Lei YU (7):
      meta-romulus: Add power LED rules
      meta-p8 systems: Fix phosphor-gpio-monitor crash
      meta-romulus: phosphor-hwmon workaround for fan speed
      meta-romulus: Add fan tacho hwmon sensor config
      meta-romulus: Remove vcs workaround
      meta-zaius: Add PCIE E2B present sensor
      meta-romulus: Do not run vrm control when chassis on

Marri Devender Rao (1):
      Package installed error yaml files

Matt Spinler (11):
      Resolve fan errors when they become functional
      Resolve power supply errors when they're replaced
      wspoon: add more OCC hwmon temps of mode 'label'
      witherspoon power script updates
      Remove wspoon P9 VCS Workaround from boot path
      Delete unused Witherspoon VCS workaround files
      Change wspoon power sequencer units to ms
      Change wspoon GPU overtemp polling to 500ms
      Witherspoon MRW XML revision bump
      Change wspoon PGOOD polling interval to 500ms
      Witherspoon: Destroy invalid inventory on startup

Matthew Barth (12):
      wspoon: Apply offset to ambient temp sensor
      wspoon: Enable full water cooled fan control
      wspoon: Orderly shutdown on fans missing/failed
      wspoon: Correct removal of air cooled events
      Update fan init services
      wspoon: Add pcie hwmon conf
      wspoon: Update fan watchdog triggers
      wspoon: Allow fans 30sec before nonfunctional
      wspoon: Hard poweroff on fan fails/missing
      wspoon: Remove max tach feedback for base speed
      wspoon: Enable air cooled fan control
      wspoon: Update fan control to latest level

Michael Tritz (2):
      Block attempts to create a pnor-patch volume in field mode
      obmc-flash-bmc: write variables twice to ensure both banks are correc=
t

Mykola Kostenok (1):
      meta-mellanox: meta-msn: add scripts to initramfs.

Patrick Venture (4):
      quanta-q71l: update ipmi sensor map
      meta-quanta: powerctrl: use dts for gpiochip
      Reorder dependencies alphabetically
      Add python-shell to RDEPENDS for network.bb

Ratan Gupta (1):
      phosphor-discovery: Fixes some conditional check

Robert Lippert (1):
      obmc-phosphor-systemd: fix string trim of instance name

Saqib Khan (4):
      Add LICENSE to uboot bitbake file
      Calculate the version ID of BMC UBI volumes during build time.
      Add missing dependency on sdbus++.
      Add required package "pkgconfig"

Xo Wang (7):
      meta-zaius: Build openpower-occ-control iff MACHINE=3Dzaius
      meta-zaius: Synchronize time from host
      Organize OpenPOWER BMC support as features
      meta-openpower: Predicate packages on MACHINE_FEATURES
      meta-aspeed: Set SOC_FAMILY in SoC include files
      meta-ast2500: Add tune file for ARM1176JZ-S
      meta-ast2500: Tune for ARM1176JZ-S

Yong Li (1):
      Add tools-profile feature support
