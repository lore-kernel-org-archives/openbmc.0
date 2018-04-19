Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RLq05bL1zF20v
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 11:23:39 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 278346E231
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:23:34 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_DBA9E0F0-D555-4AB2-9228-232B59193456"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC v2.2
Message-Id: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
Date: Wed, 18 Apr 2018 21:23:33 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 01:23:42 -0000


--Apple-Mail=_DBA9E0F0-D555-4AB2-9228-232B59193456
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

There has been lots of cool work in the last couple months and we=E2=80=99=
ve been
reasonably stable with Yocto 2.4 and Linux 4.13 for some time now so =
lets
have a tag!

Last time I mentioned v2.1 might be the last tag before switching to =
some
new branch strategy, but nothing has happened on that front.  So like =
before,
stay tuned to the list for updates.=20

Enjoy!

-brad

Adriana Kobylak (8):
      Add Volatile sensor to ipmi inventory
      ipmi volatile sensor: Add name pattern field
      obmc-flash-bmc: Don't overwrite u-boot env vars if already set
      obmc-flash-bmc: Remove checking for rwreset
      Increase default size of UBI read-write volume
      obmc-flash-bmc: Ignore fw_printenv return code
      obmc-flash-bmc: Ignore error if rwfs_size is not set
      witherspoon: Enable BMC signature verification

Alexander Amelkin (1):
      Add setup script for easy openbmc env setup

Amithash Prasad (1):
      Add Portwell Neptune machine

Andrew Geissler (229):
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-watchdog.bb: bump version
      sdbusplus.bb: bump version
      phosphor-user-manager.bb: bump version
      openpower-dbus-interfaces.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-time-manager.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-mapper.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      skeleton-rev.bbclass: bump version
      Don't run mbox reset until dbus object available
      mboxd.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      pyphosphor.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-watchdog.bb: bump version
      mboxd.bb: bump version
      sdbusplus.bb: bump version
      phosphor-settings-manager.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      mrw-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      Run legacy services with lowest priority
      phosphor-debug-collector.inc: bump version
      ffdc.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-ipmi-host.inc: bump version
      inventory-upload.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-watchdog.bb: bump version
      pyphosphor.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      skeleton-rev.bbclass: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-software-manager.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      sdbusplus.bb: bump version
      phosphor-ipmi-host.inc: bump version
      mboxd.bb: bump version
      phosphor-watchdog.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-inventory-manager.inc: bump version
      ffdc.bb: bump version
      phosphor-watchdog.bb: bump version
      Don't load non-UBI flash packages on UBI systems
      Use default priority for sensor service
      phosphor-watchdog.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-mapper.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-state-manager.bb: bump version
      Remove netman.py from the image
      slpd-lite.bb: bump version
      pyphosphor.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-dbus-monitor.bb: bump version
      mrw-rev.bbclass: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      Remove legacy settings service
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-state-manager.bb: bump version
      sdbusplus.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-watchdog.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      skeleton-rev.bbclass: bump version
      sdbusplus.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      Bump priority of download service back to default
      Remove legacy bmc control package
      phosphor-networkd-rev.bbclass: bump version
      phosphor-software-manager.bb: bump version
      mrw-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-rest.inc: bump version
      Make host-check a part of host state function
      phosphor-networkd-rev.bbclass: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-net.bb: bump version
      mrw-rev.bbclass: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      pyphosphor.bb: bump version
      bmcweb.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-mapper.bb: bump version
      phosphor-software-manager.bb: bump version
      openpower-software-manager.bb: bump version
      pyphosphor.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-inventory-manager.inc: bump version
      skeleton-rev.bbclass: bump version
      Remove legacy inventory service from startup
      phosphor-mapper.bb: bump version
      openpower-debug-collector.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-mapper.bb: bump version
      op-proc-control.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      pyphosphor.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-rest.inc: bump version
      mboxd.bb: bump version
      phosphor-software-manager.bb: bump version
      Introduce new host-startmin action target
      Reset host reboot attempts on fresh boot
      skeleton-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-gpio-monitor.bb: bump version
      phosphor-led-manager.inc: bump version
      phosphor-time-manager.bb: bump version
      phosphor-webui.bb: bump version
      pyphosphor.bb: bump version
      phosphor-watchdog.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-led-sysfs.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-logging.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      sdbusplus.bb: bump version
      openpower-fru-vpd.inc: bump version
      skeleton-rev.bbclass: bump version
      phosphor-networkd-rev.bbclass: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      sdbusplus.bb: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      skeleton-rev.bbclass: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-net.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-rest.inc: bump version
      phosphor-fan.inc: bump version
      ibm-dbus-interfaces.bb: bump version
      phosphor-webui.bb: bump version
      mrw-rev.bbclass: bump version
      phosphor-logging.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-fan.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-led-manager.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      Fix build-from-scratch issue with u-boot
      openpower-software-manager.bb: bump version

Andrew Jeffery (7):
      busybox: Enable expand(1) utility
      phosphor-debugtools: Add latencytop tool
      skiboot: Bump to 5.10-rc3
      obmc-pydevtools: Install obmcutil completion file
      kernel: Add MAX31785 devicetree support and communications =
workarounds
      kernel: Introduce external throttling for ASPEED UART
      u-boot: Ensure we rebuild on change of VERSION_ID

Brad Bishop (80):
      gevent-websocket: move to Phosphor layer
      logging: refactor virtualized recipe build deps
      systemd: limit bbclass hooks to class-target scope
      Add missing pkgconfig dependencies
      Add missing build dependencies
      setings: recipe renames
      u-boot-fw-utils: Fix mtd-paritions warning
      ipmi: Refactor whitelist generation
      yaml-tiny: rename with native suffix
      classes: ipmi: symlink: Add missing EOF newline
      classes: ipmi: symlink: Don't change directories
      u-boot: mkimage: Drop recipe
      u-boot: add u-boot-common.inc
      ipmi: Move ipmi sensor config recipe
      u-boot: fw-utils: reset on Poky 2.2 upstream
      u-boot: rename u-boot.inc to u-boot-ubi.inc
      aspeed: Add Aspeed global configuration file
      u-boot: ubi: Apply patches on Aspeed only
      u-boot: Move recipes to the Aspeed BSP layer
      image_version: Add missing os-release dependency
      debug: Avoid lighttpd build dependency
      preinit-mounts: Add a proper init alternative
      tftpy: drop recipe
      pexpect, ptyprocess: Drop recipes
      bottle: update to bottle 0.12.13
      pygobject2: bump to 2.28.7
      rocket: Drop recipe
      sdbusplus: Add sdbus++ package in the usual manner
      preinit-mounts: Fix dependencies
      Silence meta-virtualization warning message
      systemd: Add journald-dbus to PACKAGECONFIG
      phosphor-gevent: Fix copy/paste error
      flash: Add missing depenedency
      Address build break on RHEL
      Revert "Update pypi.python.org packages to use https"
      python-ipy: Drop unused recipe
      i2c-tools: Remove dead code
      i2c-tools: revert alternative download URI
      ipmi: Add missing build dependency
      openpower: Fix _appends with missing space
      distro: Move distro config content to include
      distro: Add MRW distro policy includes
      Remove obmc-mrw machine feature
      MRW: Use a distro override to enable providers
      Convert obmc-ubi-fs to a distro feature
      Convert openpower-ubi-fs to a distro feature
      Remove obmc-openpower-* machine features
      Yocto 2.3
      libgpg-error: Patch for ppc64le
      Yocto 2.4
      json-perl: Move to recipes-devel
      Revert "binutils: allow build on RHEL6"
      Revert "qemu: remove unsupported linker option for RHEL6"
      glibc: Drop glibc bbappend
      distro: Cleanup distro features
      Clean up stale obmc-phosphor-utils references
      python-*: use pypi class
      clear-once: whitespace fix
      clear-once: Remove redundant RPROVIDES
      Revert "Enable libyaml nativesdk bake"
      Revert "Add support for c++ futures for armv5te"
      aspeed: Remove duplicate kernel provider
      fsp2: Append -layer to bb file collection name
      Revert "meta-phosphor: disable 'uninative' for RHEL6 support"
      aspeed: Append -layer to bbfile collection name
      image_types_phosphor: split make_tar_of_images
      image_types_phosphor: drop overlay
      Use upstream autoconf-archive
      nlohmann: Update to 3.1.2
      iotools: bump version
      logging: virtual refactoring
      clear-once: Add missing dependency on u-boot
      Remove ipmi distro feature, virtual
      Rocko refresh
      Add recipe for OpenPOWER FFS repository
      Revert "Allow login on ttyS4"
      aspeed: Move vuart rules to udev
      minor yaml-tiny recipe enhancements
      perl/yaml-tiny: Update to 1.73
      Remove u-boot-fw-utils from IMAGE_INSTALL

Brandon Wyman (2):
      Add service file to synchronize INPUT_HISTORY data
      Create recipe to add service for power supply SYNC

Brendan Higgins (1):
      u-boot-fw-utils: Fix mtd-paritions failure

CamVan Nguyen (2):
      Create RSA host key in user specified path
      dropbear: Don't load default host keys

Deepak Kodihalli (5):
      dcmi: get temperature readings - json
      dcmi : get temperature readings: witherspoon json
      dcmi: rename get temp readings json
      dcmi: add record id to Witherspoon sensors JSON
      ipmi: fix broken asset tag function

Dhruvaraj Subhashchandran (3):
      JSON file with DCMI capabilities.
      Change the capability values to match bmc capabilities.
      Reset boot progress and OS status sensors after reboot

Ed Tanous (3):
      Add recipes for building webui on target
      Add bmcweb target to S2600Wf
      Bump bmcweb targets and disable submodule use

Eddie James (6):
      fix alternate boot after watchdog reset
      Add image signing framework and open keys
      busybox: patch "umount: ignore -c"
      systemd: enable watchdog and set watchdog device to wdt2
      Add mirror u-boot option to obmc-flash-bmc
      Revert "systemd: enable watchdog and set watchdog device to wdt2"

Edward A. James (1):
      systemd: patch in watchdog device configuration change

Gunnar Mills (9):
      Add PowerSupplyRedundancy to default settings
      Add "after" PowerSupplyRedundancy mapper object
      Rename phosphor-settings-read-settings-mrw-native dir
      Add support for building on ppc64le
      Add "set -eo pipefail" to obmc-flash-bmc
      Add Garrison README
      Remove Barreleye from README
      Add Firestone README
      Add POWER8 Barreleye README

Ivan Mikhaylov (1):
      add sunray2, fsp2 based soc

Jayanth Othayoth (9):
      Add in default for Turbo mode enable/disable
      TurboAllowed: Add support for TurboAllowed sensor type
      Added "mutability" flag to indicate if a sensor is READ/WRITE/RW
      firestone: added "mutability"
      garrison: added "mutability"
      palmetto: added "mutability"
      romulus added "mutability"
      zaius: added "mutability"
      openpower:added "mutability"

Jens Rehsack (2):
      recipes-devel: clean-up
      json-perl: Update to 2.97001

Joel Stanley (7):
      u-boot: FTGMAC100, GCC7, MX6651235F fixes
      meta-palmetto: Mirror host console to UART1
      u-boot: Drop bootcmd support for legacy images
      meta-phosphor: Disable systemd manpage generation
      palmetto: Enable mboxd
      kernel: Move to 4.13 kernel
      linux: Host PCIe VGA and random number fixes

Ken Chen (6):
      Add Sensor conf file for centriq2400
      Add IR38163 re-probe workaround
      Add LED config for Centriq2400
      Add obmc-console conf
      Create centruq2400-rep recipes-kernel
      Add SOC update script

Lei YU (13):
      meta-romulus: Add w83773g sensor config
      meta-romulus: Add fan presence yaml config
      meta-romulus: Add phosphor-cooling-type service
      meta-zaius: Fix pcie e2b inventory path
      meta-romulus: Pick latest phosphor-hwmon
      meta-romulus: Add pwm target for fan sensor
      meta-romulus: Add fan monitor config
      bmc flash service: Remove non-existing dependency
      meta-romulus: Add fan control yaml configs
      meta-romulus: Bump phosphor-hwmon version
      meta-romulus hwmon: Use negative-errno-on-fail config
      AST2500: Add loop device support in defconfig
      meta-romulus: fan-control: Handle service failures

Mark Asselstine (1):
      python-*: switch remaining pypi recipes to use the pypi class

Marri Devender Rao (5):
      op-occ: add native recipe to install error yaml to shared location
      DCMI: Get power reading - add config file
      DCMI: Get power reading - add witherspoon config
      Add witherspoon hardware sensors for SDR mapping to DBus objects
      Autogenerate output YAML for temperature sensors by parsing MRW

Matt Spinler (18):
      Use variables for MRW XML filename and path
      Add Stonewither OpenPOWER system layer
      Add args to Witherspoon power supply monitor
      Remove Stonewither fan and power supply support
      Add the web UI to the Witherspoon image
      Update power supply inventory path to match MRW
      Witherspoon XML revision bump
      Set Witherspoon hwmon target mode
      Witherspoon processor overtemp path changes
      Add entry for gpu_func sensor in MRW config YAML
      Use OpenPower variable for PS derating factor
      Factor PS derating into power cap limit validation
      Fix wspoon power fault error yaml install
      dreport: refactor install_dreport_user_scripts
      dreport: Collect IBM error objects on IBM systems
      Enable recipes in meta-ibm/recipes-*/
      Add ibm-dbus-interfaces recipe
      Tell the mapper about IBM D-Bus paths

Matthew Barth (9):
      wspoon: Increase fan fail shutdown delay
      wspoon: Increase watchdog timeout
      wspoon: Handle dependent application fails
      Keep fan services running until poweroff completes
      wspoon: Revert fan watchdog timeout
      wspoon: Create fan rotors group with hard poweroff
      wspoon: MAX31785revA fan controller workaround
      wspoon: Support more than one group per event
      wspoon: Remove OCC sensors on EAGAINs

Michael Tritz (2):
      Fix for MACHINE_FEATURES check in u-boot.inc
      BMC firmware update: Dynamically size UBI volume to fit image

Nagaraju Goruganti (1):
      Add power supply to BMC accessible FRUs to generate FRU map

Patrick Venture (7):
      phosphor-ipmi-host: Add channel config default
      minor reorganization of phosphor-defaults.inc
      initfs: files: whitelist: Alphabetized
      Add Quanta-Q71l README
      meta-q71: sensors: phosphor-hwmon enable errno val
      meta-quanta-q71l: phosphor: sensors: add missing inherit
      meta-quanta-q71l: new recipes for ipmi preferences

Ratan Gupta (6):
      FRU: Add Entity ID in the host FRU inventory yaml
      IPMI Sensor: Adding the replacable interface for GPU sensor
      phosphor-dbus-monitor: Add the witherspoon specific config file
      Network: Bring libnl into the openbmc image
      phosphor-ipmi: bump version
      network: Add the ncsi-netlink service

Tim Orling (1):
      pypi.bbclass: bring in from meta-python

Tom Joseph (3):
      sensor: Modify config for sensor to add additional fields
      Set the nice value of mapper process to -5
      Generate IPMI Aux firmware revision from VERSION_ID field

Xo Wang (1):
      obmc-phosphor-image: Don't build .cpio.lzma.u-boot

Yong Li (1):
      Systemd: backport a new api for uuid generation


--Apple-Mail=_DBA9E0F0-D555-4AB2-9228-232B59193456
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">There has been lots of cool work =
in the last couple months and we=E2=80=99ve been</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">reasonably stable with Yocto 2.4 =
and Linux 4.13 for some time now&nbsp;</span></font><span =
style=3D"font-size: 11px; font-family: Menlo-Regular;" class=3D"">so =
lets</span></div><div class=3D""><span style=3D"font-size: 11px; =
font-family: Menlo-Regular;" class=3D"">have a tag!</span></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Last time I mentioned v2.1 might be the last tag before =
switching to some</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">new branch&nbsp;strategy, but nothing has happened on that =
front. &nbsp;So like before,</span></font></div><div class=3D""><span =
style=3D"font-size: 11px; font-family: Menlo-Regular;" class=3D"">stay =
tuned to the&nbsp;list for updates.&nbsp;</span></div><br =
style=3D"font-family: Menlo-Regular; font-size: 11px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;" =
class=3D"">Enjoy!</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px;" class=3D""><br style=3D"font-family: Menlo-Regular; =
font-size: 11px;" class=3D""><span style=3D"font-family: Menlo-Regular; =
font-size: 11px;" class=3D"">-brad</span><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;" class=3D""><br =
class=3D""></span></div><div class=3D""><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Adriana Kobylak (8):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add Volatile sensor to ipmi =
inventory</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; ipmi volatile sensor: Add name pattern =
field</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; obmc-flash-bmc: Don't overwrite u-boot env vars if already =
set</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; obmc-flash-bmc: Remove checking for =
rwreset</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Increase default size of UBI read-write =
volume</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; obmc-flash-bmc: Ignore fw_printenv return =
code</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; obmc-flash-bmc: Ignore error if rwfs_size is not =
set</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; witherspoon: Enable BMC signature =
verification</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Alexander Amelkin (1):</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add setup script for easy openbmc env =
setup</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Amithash Prasad (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add Portwell Neptune =
machine</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Andrew Geissler (229):</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; ffdc.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-debug-collector.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-rest.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-user-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-dbus-interfaces.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-fan.inc: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; witherspoon-pfault-analysis.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-fan.inc: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-time-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-mapper.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-networkd-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-mapper.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Don't run =
mbox reset until dbus object available</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; mboxd.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-hwmon.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-hwmon.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; pyphosphor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-rest.inc: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-watchdog.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; mboxd.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-settings-manager.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-networkd-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; mrw-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Run legacy services with lowest priority</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-debug-collector.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; ffdc.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; witherspoon-pfault-analysis.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
inventory-upload.bb: bump version</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-rest.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-webui.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
pyphosphor.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; skeleton-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
witherspoon-pfault-analysis.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-networkd-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; mboxd.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-watchdog.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; witherspoon-pfault-analysis.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-hwmon.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-debug-collector.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-inventory-manager.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; ffdc.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Don't load =
non-UBI flash packages on UBI systems</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Use default =
priority for sensor service</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-watchdog.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-mapper.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-watchdog.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-webui.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-state-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Remove =
netman.py from the image</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; slpd-lite.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; pyphosphor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
witherspoon-pfault-analysis.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-hwmon.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
mrw-rev.bbclass: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
openpower-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Remove legacy =
settings service</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-fan.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-state-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-dbus-interfaces.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-fan.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-webui.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-webui.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-hwmon.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Bump priority of download service back =
to default</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Remove legacy bmc control package</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
mrw-rev.bbclass: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-webui.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-rest.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Make =
host-check a part of host state function</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
witherspoon-pfault-analysis.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-net.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-hwmon.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-net.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; mrw-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
openpower-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-webui.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; pyphosphor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; bmcweb.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-networkd-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-mapper.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
openpower-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
pyphosphor.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-webui.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-logging.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-hwmon.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-inventory-manager.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Remove legacy =
inventory service from startup</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-mapper.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower-debug-collector.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-mapper.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; op-proc-control.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
pyphosphor.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-net.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-rest.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; mboxd.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-software-manager.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Introduce new host-startmin action target</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Reset host =
reboot attempts on fresh boot</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; skeleton-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-networkd-rev.bbclass: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi-net.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-gpio-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-led-manager.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-time-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; pyphosphor.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-watchdog.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
openpower-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-led-sysfs.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-logging.bb: bump version</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-rest.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-interfaces.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; openpower-fru-vpd.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-networkd-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; ffdc.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-debug-collector.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-hwmon.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-ipmi-host.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus.bb: =
bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-net.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-dbus-monitor.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
skeleton-rev.bbclass: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-net.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; witherspoon-pfault-analysis.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-rest.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-fan.inc: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; ibm-dbus-interfaces.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-webui.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
mrw-rev.bbclass: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-logging.bb: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-hwmon.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-fan.inc: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-led-manager.inc: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
phosphor-webui.bb: bump version</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host.inc: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Fix build-from-scratch issue with u-boot</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
openpower-software-manager.bb: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Andrew Jeffery (7):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; busybox: Enable expand(1) =
utility</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-debugtools: Add latencytop tool</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; skiboot: Bump =
to 5.10-rc3</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; obmc-pydevtools: Install obmcutil =
completion file</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; kernel: Add MAX31785 devicetree support =
and communications workarounds</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; kernel: Introduce external throttling =
for ASPEED UART</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; u-boot: Ensure we rebuild on change of =
VERSION_ID</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Brad Bishop (80):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; gevent-websocket: move to Phosphor =
layer</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; logging: refactor virtualized recipe build =
deps</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; systemd: limit bbclass hooks to class-target =
scope</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add missing pkgconfig dependencies</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add missing =
build dependencies</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; setings: recipe =
renames</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; u-boot-fw-utils: Fix mtd-paritions =
warning</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; ipmi: Refactor whitelist generation</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; yaml-tiny: =
rename with native suffix</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; classes: ipmi: symlink: Add missing EOF =
newline</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; classes: ipmi: symlink: Don't change =
directories</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; u-boot: mkimage: Drop =
recipe</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; u-boot: add u-boot-common.inc</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; ipmi: Move =
ipmi sensor config recipe</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; u-boot: fw-utils: reset on Poky 2.2 =
upstream</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; u-boot: rename u-boot.inc to =
u-boot-ubi.inc</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; aspeed: Add Aspeed global configuration =
file</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; u-boot: ubi: Apply patches on Aspeed only</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; u-boot: Move =
recipes to the Aspeed BSP layer</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; image_version: Add missing os-release =
dependency</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; debug: Avoid lighttpd build dependency</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; =
preinit-mounts: Add a proper init alternative</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; tftpy: drop =
recipe</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; pexpect, ptyprocess: Drop recipes</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; bottle: =
update to bottle 0.12.13</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; pygobject2: bump to =
2.28.7</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; rocket: Drop recipe</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; sdbusplus: Add sdbus++ package in the =
usual manner</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; preinit-mounts: Fix =
dependencies</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Silence meta-virtualization warning =
message</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; systemd: Add journald-dbus to =
PACKAGECONFIG</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-gevent: Fix copy/paste =
error</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; flash: Add missing depenedency</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Address build =
break on RHEL</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Revert "Update <a =
href=3D"http://pypi.python.org" class=3D"">pypi.python.org</a> packages =
to use https"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; python-ipy: Drop unused =
recipe</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; i2c-tools: Remove dead code</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; i2c-tools: =
revert alternative download URI</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; ipmi: Add missing build =
dependency</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; openpower: Fix _appends with missing =
space</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; distro: Move distro config content to =
include</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; distro: Add MRW distro policy includes</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Remove =
obmc-mrw machine feature</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; MRW: Use a distro override to enable =
providers</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Convert obmc-ubi-fs to a distro feature</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Convert =
openpower-ubi-fs to a distro feature</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Remove =
obmc-openpower-* machine features</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Yocto 2.3</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; libgpg-error: =
Patch for ppc64le</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Yocto 2.4</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; json-perl: =
Move to recipes-devel</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Revert "binutils: allow build on =
RHEL6"</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Revert "qemu: remove unsupported linker option for =
RHEL6"</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; glibc: Drop glibc bbappend</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; distro: Cleanup distro =
features</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Clean up stale obmc-phosphor-utils =
references</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; python-*: use pypi class</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; clear-once: whitespace =
fix</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; clear-once: Remove redundant RPROVIDES</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Revert =
"Enable libyaml nativesdk bake"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Revert "Add support for c++ futures for =
armv5te"</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; aspeed: Remove duplicate kernel provider</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; fsp2: Append =
-layer to bb file collection name</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Revert "meta-phosphor: disable =
'uninative' for RHEL6 support"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; aspeed: Append -layer to bbfile =
collection name</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; image_types_phosphor: split =
make_tar_of_images</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; image_types_phosphor: drop =
overlay</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Use upstream autoconf-archive</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; nlohmann: =
Update to 3.1.2</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; iotools: bump =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; logging: virtual refactoring</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; clear-once: =
Add missing dependency on u-boot</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Remove ipmi distro feature, =
virtual</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Rocko refresh</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add recipe for OpenPOWER FFS =
repository</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Revert "Allow login on ttyS4"</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; aspeed: Move =
vuart rules to udev</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; minor yaml-tiny recipe =
enhancements</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; perl/yaml-tiny: Update to =
1.73</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Remove u-boot-fw-utils from IMAGE_INSTALL</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Brandon Wyman (2):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add service file to synchronize =
INPUT_HISTORY data</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Create recipe to add service for power =
supply SYNC</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Brendan Higgins (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; u-boot-fw-utils: Fix mtd-paritions =
failure</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">CamVan Nguyen (2):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Create RSA host key in user specified =
path</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; dropbear: Don't load default host keys</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Deepak Kodihalli (5):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; dcmi: get temperature readings - =
json</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; dcmi : get temperature readings: witherspoon =
json</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; dcmi: rename get temp readings json</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; dcmi: add =
record id to Witherspoon sensors JSON</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; ipmi: fix =
broken asset tag function</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Dhruvaraj Subhashchandran (3):</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; JSON file =
with DCMI capabilities.</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Change the capability values to match =
bmc capabilities.</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Reset boot progress and OS status =
sensors after reboot</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Ed Tanous (3):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add recipes for building webui on =
target</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add bmcweb target to S2600Wf</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Bump bmcweb =
targets and disable submodule use</span></font></div><div class=3D""><font=
 face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Eddie James (6):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; fix alternate boot after watchdog =
reset</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add image signing framework and open keys</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; busybox: =
patch "umount: ignore -c"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; systemd: enable watchdog and set =
watchdog device to wdt2</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add mirror u-boot option to =
obmc-flash-bmc</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Revert "systemd: enable watchdog and set =
watchdog device to wdt2"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Edward A. James (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; systemd: patch in watchdog device =
configuration change</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Gunnar Mills (9):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add PowerSupplyRedundancy to default =
settings</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add "after" PowerSupplyRedundancy mapper =
object</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Rename phosphor-settings-read-settings-mrw-native =
dir</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add support for building on ppc64le</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add "set -eo =
pipefail" to obmc-flash-bmc</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add Garrison =
README</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Remove Barreleye from README</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add Firestone =
README</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add POWER8 Barreleye README</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Ivan Mikhaylov (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; add sunray2, fsp2 based =
soc</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Jayanth Othayoth (9):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add in default for Turbo mode =
enable/disable</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; TurboAllowed: Add support for =
TurboAllowed sensor type</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Added "mutability" flag to indicate if a =
sensor is READ/WRITE/RW</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; firestone: added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; garrison: added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; palmetto: added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; romulus added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; zaius: added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; openpower:added =
"mutability"</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Jens Rehsack (2):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; recipes-devel: =
clean-up</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; json-perl: Update to 2.97001</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Joel Stanley (7):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; u-boot: FTGMAC100, GCC7, MX6651235F =
fixes</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-palmetto: Mirror host console to =
UART1</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; u-boot: Drop bootcmd support for legacy =
images</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-phosphor: Disable systemd manpage =
generation</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; palmetto: Enable mboxd</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; kernel: Move to 4.13 =
kernel</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; linux: Host PCIe VGA and random number =
fixes</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Ken Chen (6):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add Sensor conf file for =
centriq2400</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add IR38163 re-probe =
workaround</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add LED config for Centriq2400</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add =
obmc-console conf</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Create centruq2400-rep =
recipes-kernel</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add SOC update =
script</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Lei YU (13):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; meta-romulus: Add w83773g sensor =
config</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-romulus: Add fan presence yaml =
config</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-romulus: Add phosphor-cooling-type =
service</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-zaius: Fix pcie e2b inventory path</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; meta-romulus: =
Pick latest phosphor-hwmon</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; meta-romulus: Add pwm target for fan =
sensor</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-romulus: Add fan monitor config</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; bmc flash =
service: Remove non-existing dependency</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; meta-romulus: =
Add fan control yaml configs</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; meta-romulus: Bump phosphor-hwmon =
version</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-romulus hwmon: Use negative-errno-on-fail =
config</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; AST2500: Add loop device support in =
defconfig</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-romulus: fan-control: Handle service =
failures</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Mark Asselstine (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; python-*: switch remaining pypi recipes =
to use the pypi class</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Marri Devender Rao (5):</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; op-occ: add =
native recipe to install error yaml to shared =
location</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; DCMI: Get power reading - add config file</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; DCMI: Get =
power reading - add witherspoon config</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add =
witherspoon hardware sensors for SDR mapping to DBus =
objects</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Autogenerate output YAML for temperature sensors by parsing =
MRW</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Matt Spinler (18):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Use variables for MRW XML filename and =
path</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add Stonewither OpenPOWER system layer</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add args to =
Witherspoon power supply monitor</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Remove Stonewither fan and power supply =
support</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add the web UI to the Witherspoon image</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Update power =
supply inventory path to match MRW</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Witherspoon =
XML revision bump</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Set Witherspoon hwmon target =
mode</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Witherspoon processor overtemp path =
changes</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Add entry for gpu_func sensor in MRW config =
YAML</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Use OpenPower variable for PS derating =
factor</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Factor PS derating into power cap limit =
validation</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Fix wspoon power fault error yaml install</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; dreport: =
refactor install_dreport_user_scripts</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; dreport: =
Collect IBM error objects on IBM systems</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Enable =
recipes in meta-ibm/recipes-*/</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add ibm-dbus-interfaces =
recipe</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Tell the mapper about IBM D-Bus paths</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Matthew Barth (9):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; wspoon: Increase fan fail shutdown =
delay</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; wspoon: Increase watchdog timeout</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; wspoon: =
Handle dependent application fails</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Keep fan =
services running until poweroff completes</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; wspoon: =
Revert fan watchdog timeout</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; wspoon: Create fan rotors group with =
hard poweroff</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; wspoon: MAX31785revA fan controller =
workaround</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; wspoon: Support more than one group per =
event</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; wspoon: Remove OCC sensors on EAGAINs</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Michael Tritz (2):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Fix for MACHINE_FEATURES check in =
u-boot.inc</span></font></div><div class=3D""><font face=3D"Menlo-Regular"=
 class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; BMC firmware update: Dynamically size UBI volume to fit =
image</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Nagaraju Goruganti (1):</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; Add power =
supply to BMC accessible FRUs to generate FRU =
map</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Patrick Venture (7):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-ipmi-host: Add channel config =
default</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; minor reorganization of =
phosphor-defaults.inc</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; initfs: files: whitelist: =
Alphabetized</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Add Quanta-Q71l =
README</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-q71: sensors: phosphor-hwmon enable errno =
val</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-quanta-q71l: phosphor: sensors: add missing =
inherit</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; meta-quanta-q71l: new recipes for ipmi =
preferences</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Ratan Gupta (6):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; FRU: Add Entity ID in the host FRU =
inventory yaml</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; IPMI Sensor: Adding the replacable =
interface for GPU sensor</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; phosphor-dbus-monitor: Add the =
witherspoon specific config file</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Network: Bring libnl into the openbmc =
image</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; phosphor-ipmi: bump version</span></font></div><div =
class=3D""><font face=3D"Menlo-Regular" class=3D""><span =
style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; &nbsp; network: Add =
the ncsi-netlink service</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Tim Orling (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; pypi.bbclass: bring in from =
meta-python</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Tom Joseph (3):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; sensor: Modify config for sensor to add =
additional fields</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Set the nice value of mapper process to =
-5</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D"">&nbsp; &nbsp; =
&nbsp; Generate IPMI Aux firmware revision from VERSION_ID =
field</span></font></div><div class=3D""><font face=3D"Menlo-Regular" =
class=3D""><span style=3D"font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Xo Wang (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; obmc-phosphor-image: Don't build =
.cpio.lzma.u-boot</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">Yong Li (1):</span></font></div><div class=3D""><font =
face=3D"Menlo-Regular" class=3D""><span style=3D"font-size: 11px;" =
class=3D"">&nbsp; &nbsp; &nbsp; Systemd: backport a new api for uuid =
generation</span></font></div><div style=3D"font-family: Menlo-Regular; =
font-size: 11px;" class=3D""><br class=3D""></div></div></body></html>=

--Apple-Mail=_DBA9E0F0-D555-4AB2-9228-232B59193456--
