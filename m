Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRxkD2HjHzDr5J
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 05:36:03 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 0367216D3AF
 for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2017 14:35:59 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC v2.0
Message-Id: <DA5AF64A-3656-4AA8-8CD6-E9B9FB3DE00A@fuzziesquirrel.com>
Date: Wed, 1 Nov 2017 14:35:58 -0400
To: OpenBMC <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Nov 2017 18:36:05 -0000

It has been awhile since we tagged.  You=E2=80=99ll note the bump to
v2.0 - there is nothing significant about this tag compared
to any of the previous tags; this is just an attempt to reset
on reasonable version strings moving forward.

I intend to get back on track with monthly tags, the next
being 2.1, then 2.2, etc.

Enjoy!

-brad

---

Adriana Kobylak (15):
      u-boot: Reorder and update patches and bootenv fixes
      bios-updatesymlinks: Add Install section for WantedBy option
      witherspoon: Update image location for software manager
      BMC: Make volume names consistent
      obmc-flash-bmc: Add support for specifying alternate mtd devices
      u-boot: Rebase openbmc patches
      obmc-flash-bmc: Add u-boot update
      obmc-flash-bmc-setenv: Use unescaped instance name
      obmc-flash-bmc: Set boot env variables with info of new image
      obmc-flash-bmc: Remove existing image before updating
      obmc-flash-bmc: Add ExecStartPre and Post to update environment =
variables
      obmc-flash-bmc: Create a duplicate kernel volume in alt
      obmc-flash-bmc: Fixes to the logic to delete volumes
      openpower-software-manager: Add service dependencies
      clear-once.service: Call fw_setenv twice for openbmconce

Andrew Geissler (105):
      Default PowerRestorePolicy to always off
      Service to scan hub chip on second processor
      Disable voltage override causing CFAM error
      Don't apply restore policy if system is on
      occ-active:Exit gracefully if occ status object not available
      Set default restart policy for phosphor services
      openpower-occ-control.inc: bump version
      phosphor-software-manager.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-software-manager.bb: bump version
      Increase over-current settings for Vdd
      Ensure occ active is asserted after fsi scan
      phosphor-ipmi-host.inc: bump version
      phosphor-software-manager.bb: bump version
      op-proc-control.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      mrw-rev.bbclass: bump version
      phosphor-hwmon.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-inventory-manager.inc: bump version
      phosphor-settings-manager.inc: bump version
      phosphor-state-manager.bb: bump version
      phosphor-fan.inc: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      Host watchdog needs to conflict with quiesce target
      phosphor-dbus-interfaces.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      mboxd.bb: bump version
      openpower-debug-collector.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-logging.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-logging.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      phosphor-logging.bb: bump version
      openpower-software-manager.bb: bump version
      openpower-dbus-interfaces.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-time-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-rest.inc: bump version
      openpower-debug-collector.inc: bump version
      phosphor-software-manager.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      op-proc-control.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      openpower-ipmi-oem.bb: bump version
      ffdc.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      witherspoon-pfault-analysis.inc: bump version
      openpower-ipmi-oem.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      openpower-software-manager.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-ipmi-host.inc: bump version
      Update pypi.python.org packages to use https
      Write journal to persistent storage
      phosphor-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-debug-collector.inc: bump version
      sdbusplus.bb: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-state-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-led-manager.inc: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-inventory-manager.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-gpio-monitor.bb: bump version
      phosphor-time-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      skeleton-rev.bbclass: bump version
      ffdc.bb: bump version
      phosphor-watchdog.bb: bump version
      openpower-debug-collector.inc: bump version

Andrew Jeffery (10):
      kernel: ftgmac100, i2c, occ hwmon fixes
      u-boot: Integrate upstream UBI and MTD patches
      kernel: Fixes for LEDs (PCA9552) and VUART
      kernel: Fixes for Firestone devicetree and IPL, OCC errnos
      kernel: SBEFIFO and OCC fixes, add snoop device to Q71L devicetree
      op-apps: Add pdbg to the op-apps package group
      kernel: NCSI, FSI, OCC, PMBus, MAX31785 fixes
      u-boot: Clean up vbar work-arounds and invalid use of memory
      kernel: SBEFIFO, FSI I2C fixes, DTS updates, silence PMBus core
      kernel: Fix OCC errno on client release

Brad Bishop (7):
      sensors: Add max31785 MSL checking package
      wspoon: Run max31785 firmware revision checker
      Add mslverify package
      wspoon: Run MSL verify service
      interfaces: Remove systemd-networkd PartOf dep
      openpower: Remove duplicate PROVIDES
      timemgr: Use correct timemanager deps

Brandon Wyman (5):
      Power supply monitor recipe, service, and conf
      Fix capitalization issue with SyslogIdentifier
      MRW: Bump Witherspoon MRW revision
      AutoReboot: Add support for AutoReboot sensor type
      Update error YAML path

Charles Paul Hofer (1):
      Revert "systemd: Configure shutdown watchdog to 20min"

Deepak Kodihalli (6):
      settings yaml: enable multiple interfaces
      boot settings: create single object
      boot settings: add new 'one_time' object
      ipmi services: react to changes in pathnames
      openpower vpd yaml: invert property,keyword map
      op vpd: MAC address can come from OPFR or VINI

Dhruvaraj Subhashchandran (7):
      Add updated sensor config.yaml for non mrw systems
      Add PS derating and redundancy to sensor config
      Revert "Add PS derating and redundancy to sensor config"
      config yaml changes to skip non-present cores
      ipmi: sensor config yaml updates
      Install gevent-websocket to the image
      Add missing boot progress sensor value

Dinesh Chinari (1):
      U-boot inventory update, updated PROPERTY

Eddie James (2):
      Fix mtd partitions udev rule
      Add /home bind mount

Edward A. James (7):
      kernel: Patch in bmc flash partition changes
      filesystem: mount rw and overlay
      u-boot fw-utils: Add alternate fw_env config
      Do not allow power on if PNOR doesn't have required image
      kernel: ir35221 fix
      kernel: ir35221 fix
      Prepare-overlay service: check for mountpoint before removing =
workdir

Gunnar Mills (14):
      Create error logs when a fan is unplugged or fails
      Create error log when cores are too hot
      Add Witherspoon Power Supply policy
      Add "After" mapper to BMC updater
      Add "After" mapper to Host updater
      Create SystemShutdown error log on core overtemp
      Add GPU to inventory
      phosphor-settings-read-settings-mrw recipe
      Add power cap boundary validation
      Create Shutdown Error on fan count shutdown
      Spelling fixes
      Spelling fixes
      Spelling fixes in meta-barreleye
      Spelling fixes in meta-quanta

Jayanth Othayoth (7):
      Change Dump file storage location
      systemd: enable systemd-coredump package
      phosphor-debug-collector: Create /var/lib/systemd/coredump mount =
point
      Revert "phosphor-debug-collector: Create /var/lib/systemd/coredump =
mount point"
      Revert "systemd: enable systemd-coredump package"
      Revert "Revert "systemd: enable systemd-coredump package""
      Customize inotify event initialization in UBI FS

Joel Stanley (6):
      kernel: MSN flash layout, iio and tach dts, ncsi bugfix
      kernel: ucd9000 debugfs additions, Zaius EVT3 support
      kernel: OCC hwmon, palmetto spi-nor muxing, SCU ranges
      kernel: Watchdog fixes
      kernel: lca955x, FSI and Garrison fan fixes
      kernel: FSI SBEFIFO and OCC rework

Kun Yi (1):
      Fix YAML overriding.

Lei YU (7):
      meta-romulus: Add occ power sensors config
      meta-romulus: Fix ipmi inventory fru ids
      meta-firestone: Add openpower-occ-control
      meta-firestone: Add phosphor-hwmon config
      meta-firestone: Mirror host console to physical UART
      phosphor-time-manager.bb: Use new service name
      meta-p8-systems: Correct OCC path for P8 systems

Leonel Gonzalez (1):
      filesystem: mount rw /media with fstab

Marri Devender Rao (5):
      Add BMC accessible FRUs to generate FRU map
      Inventory: Add type-only inventory interfaces to config files
      phosphor-logging: Add native SDK classes to install parser scripts
      openpower-debug-collector: Rework to use native sdk for errorlog
      Enable support for usecase specific bash script invocation

Matt Spinler (24):
      Add power supply hwmon config files
      Witherspoon MRW XML bump
      Add service and recipe for PGOOD fail errors
      Add service to monitor the UCD90160 at runtime
      Witherspoon MRW XML revision bump
      witherspoon: Change fan floor speed to 10500 RPM
      Revert "Add service to monitor the UCD90160 at runtime"
      Pass driver names to gpio-presence service
      Revert "Revert "Add service to monitor the UCD90160 at runtime""
      op-proc-control: install error yaml files
      Revert "op-proc-control: install error yaml files"
      Remove the fsi-hub-scan service
      op-proc-control: Add build dependencies
      Use openpower-proc-control for fsi-scan
      Don't use template parameters in fan watchdog service
      Add phosphor-hwmon config file for the PCIE temp
      Add tach trust groups to witherspoon monitor YAML
      Update hwmon labels for 2 OCC properties
      Add BMP280 default temperature threshold values
      Add DPS310 default temperature threshold values
      Add TMP275 default temperature threshold values
      Add IR35221 default temperature threshold values
      Add power supply default threshold values
      Add OCC default threshold values

Matthew Barth (15):
      witherspoon: Update floors and ceilings for fan control
      witherspoon: Add fan speed inc/dec control based on core temps
      witherspoon: Add fan speed inc/dec control based on reg temps
      witherspoon: Add fan speed inc/dec control based on dimm temps
      Add phosphor-fan-monitor init service
      witherspoon: Remove core temps from water cooled
      witherspoon - Add GPU core & memory sensors
      witherspoon - Update events.yaml format
      witherspoon - Update speed change parameters
      witherspoon - Speed changes on GPU core temps
      witherspoon - Speed changes on GPU memory temps
      witherspoon - Request speed based on tach feedback
      wspoon: Add PCIE temperature sensor
      wspoon: Raised floor active fan control
      wspoon: Update fan/thermal shutdown target

Michael Tritz (7):
      Enable BMC patching from the /usr/local path
      DEVPATH fix for phosphor-gpio-monitor@checkstop.service
      Enable environment variable deletion from =
obmc-flash-bmc-setenv@.service
      Suppress undefined rwreset error in obmc-flash-bmc
      Service files for factory reset change - clear instead of delete
      Service files to remove orphaned UBI volumes
      fstab: require service file to mount /var - fixes BMC factory =
reset

Milton Miller (1):
      obmc-initfs shutdown: ping watchdog watchdog during flash update

Mykola Kostenok (2):
      meta-mellanox: meta-msn: update defconfig
      meta-mellanox/meta-msn add ipmi daemon recipe

Nagaraju Goruganti (1):
      sdbusplus: fix build dependency

Patrick Venture (9):
      Add rdepends: pyphosphor-utils to phosphor-mapper
      quanta-powerctrl: bugfix in service key
      meta-q71l: phosphor: sensors: Add iio-hwmon config
      meta-q71l: phosphor: sensors: add GAINs to iio-hwmon config
      meta-q71l: phosphor: sensors: fix GAIN for p5v_aux
      devtools: iotools: update src_uri and srcrev
      devtools: iotools: add service to create symlinks
      quanta-q71l: phosphor-hwmon: Update fan numbering to be 1-based
      quanta-q71l: phosphor-hwmon: Update temp paths

Patrick Williams (143):
      phosphor-software-manager.bb: bump version
      phosphor-rest.inc: bump version
      op-proc-control.bb: bump version
      phosphor-fan.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-software-manager.bb: bump version
      skeleton-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-state-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      mrw-rev.bbclass: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-fru.inc: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-occ-control.inc: bump version
      phosphor-inventory-manager.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-dbus-monitor.bb: bump version
      mboxd.bb: bump version
      phosphor-software-manager.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      openpower-occ-control.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-inventory-manager-assettag-native: Missing ${D} install =
path
      phosphor-ipmi-host.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      openpower-occ-control.inc: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-watchdog.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-state-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      mboxd.bb: bump version
      phosphor-ipmi-net.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-gpio-monitor.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-logging.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-ipmi-net.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-mapper.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      phosphor-led-manager.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-fru.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      witherspoon: enable obmc-ubi-fs feature
      phosphor-ipmi-host.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-inventory-manager.inc: bump version
      ffdc.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-state-manager.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-settings-manager.inc: bump version
      phosphor-fan.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-fan.inc: bump version
      phosphor-state-manager.bb: bump version
      phosphor-rest.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-led-manager.inc: bump version
      phosphor-state-manager.bb: bump version
      openpower-software-manager.bb: bump version
      mrw-rev.bbclass: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-settings-manager.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-debug-collector.inc: bump version
      openpower-occ-control.inc: bump version
      ffdc.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-inventory-manager.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-led-manager.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      openpower-dbus-interfaces.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-software-manager.bb: bump version

Ratan Gupta (2):
      Network: Remove the installation of network manager conf file
      Inventory: Make changes for sync inventory for witherspoon

Saqib Khan (14):
      Delete kernel as part of ubi volume delete
      Ignore ubipatch service if device not formatted as UBI
      Create dir /usr/local for ubi patch service
      Add dir "srv" to the root file system
      Get the mtd# that corresponds to bmc and alt-bmc.
      Fix the function that is responsible for deleting bmc ubi volumes
      PNOR: Add logic to handle the case where ubi volume creation =
failure
      Handle the case where obmc-flash-bmc-ubimount@.service fails
      Clear PNOR patch location while updating symlinks
      Check if the BMC version already exists in /media before mounting.
      BMC: Update u-boot environment variables.
      BMC: Block BMC reboot during code update
      Dynamically set size of pnor read-only partition
      Don't update U-Boot env variables using code update service

Tom Joseph (4):
      tpm: Add tpm_required_sensor in sensor config.yaml
      Change the NetFn for Partial Add eSEL command.
      Move SRC_URI and SRC_REV to the .inc file
      Copy the error yaml's for logging manager parsing

Vishwanatha Subbanna (3):
      Enable OCC Active on BMC reset reload
      Add recipe for phosphor-user-manager
      Remove network-update-dns.service

Xo Wang (1):
      meta-zaius: Use udev dev and fix DEVPATH/PATH

causten (1):
      Add helpful tips to local.conf.sample

spashabk-in (1):
      Add openpower-debug-collector-watchdog-timeout unit file
