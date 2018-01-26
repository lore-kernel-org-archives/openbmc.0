Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSKYP4pp2zF0QK
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 11:30:01 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 53089E55B9
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 19:29:56 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC v2.1
Message-Id: <85D445A6-8BEF-40A0-BD8A-5102D74129C9@fuzziesquirrel.com>
Date: Thu, 25 Jan 2018 19:29:56 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Fri, 26 Jan 2018 00:30:02 -0000

We have several big things on the horizon such as Yocto and Linux =
updates
so it seemed like a good time to tag v2.1.

There have been rumblings of switching the project over to a stable =
branch
strategy more closely aligned with Yocto upstream.  As such, this may =
wind
up being the last OpenBMC tag.  Watch the list for updates on this =
front.

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
      Squashed 'import-layers/yocto-poky/' changes from =
dc8508f6099..67491b0c104
      Squashed 'import-layers/meta-openembedded/' changes from =
df3537259..b40116cf4
      Squashed 'import-layers/meta-raspberrypi/' changes from =
cce6292e414..2a192261a91
      Squashed 'import-layers/meta-virtualization/' changes from =
898481a9d02..eb6b5129561
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
      obmc-flash-bmc: write variables twice to ensure both banks are =
correct

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
