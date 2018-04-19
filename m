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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RP414KNnzDqhm
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 13:05:04 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8BF076E231
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 23:05:00 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC v2.2
Date: Wed, 18 Apr 2018 23:05:00 -0400
References: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <8E4514F2-2842-487D-B727-2C2D17FFAE7A@fuzziesquirrel.com>
Message-Id: <7DAA333E-B443-4769-985F-B224166E0FE1@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 03:05:06 -0000

> On Apr 18, 2018, at 9:23 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>=20
> There has been lots of cool work in the last couple months and we=E2=80=99=
ve been
> reasonably stable with Yocto 2.4 and Linux 4.13 for some time now so =
lets
> have a tag!
>=20
> Last time I mentioned v2.1 might be the last tag before switching to =
some
> new branch strategy, but nothing has happened on that front.  So like =
before,
> stay tuned to the list for updates.=20
>=20
> Enjoy!
>=20
> -brad
>=20
> Adriana Kobylak (8):
>       Add Volatile sensor to ipmi inventory
>       ipmi volatile sensor: Add name pattern field
>       obmc-flash-bmc: Don't overwrite u-boot env vars if already set
>       obmc-flash-bmc: Remove checking for rwreset
>       Increase default size of UBI read-write volume
>       obmc-flash-bmc: Ignore fw_printenv return code
>       obmc-flash-bmc: Ignore error if rwfs_size is not set
>       witherspoon: Enable BMC signature verification
>=20
> Alexander Amelkin (1):
>       Add setup script for easy openbmc env setup
>=20
> Amithash Prasad (1):
>       Add Portwell Neptune machine
>=20
> Andrew Geissler (229):
>       ffdc.bb: bump version
>       phosphor-debug-collector.inc: bump version
>       phosphor-rest.inc: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-watchdog.bb: bump version
>       sdbusplus.bb: bump version
>       phosphor-user-manager.bb: bump version
>       openpower-dbus-interfaces.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-fan.inc: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-fan.inc: bump version
>       phosphor-time-manager.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-mapper.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-mapper.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       skeleton-rev.bbclass: bump version
>       Don't run mbox reset until dbus object available
>       mboxd.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-hwmon.bb: bump version
>       pyphosphor.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-rest.inc: bump version
>       phosphor-watchdog.bb: bump version
>       mboxd.bb: bump version
>       sdbusplus.bb: bump version
>       phosphor-settings-manager.inc: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       mrw-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       Run legacy services with lowest priority
>       phosphor-debug-collector.inc: bump version
>       ffdc.bb: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-ipmi-host.inc: bump version
>       inventory-upload.bb: bump version
>       phosphor-rest.inc: bump version
>       phosphor-webui.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       phosphor-watchdog.bb: bump version
>       pyphosphor.bb: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       skeleton-rev.bbclass: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-software-manager.bb: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-dbus-monitor.bb: bump version
>       phosphor-watchdog.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       sdbusplus.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       mboxd.bb: bump version
>       phosphor-watchdog.bb: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-debug-collector.inc: bump version
>       phosphor-inventory-manager.inc: bump version
>       ffdc.bb: bump version
>       phosphor-watchdog.bb: bump version
>       Don't load non-UBI flash packages on UBI systems
>       Use default priority for sensor service
>       phosphor-watchdog.bb: bump version
>       phosphor-dbus-monitor.bb: bump version
>       phosphor-mapper.bb: bump version
>       phosphor-watchdog.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-state-manager.bb: bump version
>       Remove netman.py from the image
>       slpd-lite.bb: bump version
>       pyphosphor.bb: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-dbus-monitor.bb: bump version
>       mrw-rev.bbclass: bump version
>       phosphor-software-manager.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-dbus-monitor.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-software-manager.bb: bump version
>       Remove legacy settings service
>       phosphor-ipmi-host.inc: bump version
>       phosphor-fan.inc: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-software-manager.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-watchdog.bb: bump version
>       phosphor-state-manager.bb: bump version
>       sdbusplus.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       phosphor-watchdog.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-fan.inc: bump version
>       phosphor-watchdog.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-webui.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       skeleton-rev.bbclass: bump version
>       sdbusplus.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-webui.bb: bump version
>       Bump priority of download service back to default
>       Remove legacy bmc control package
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-software-manager.bb: bump version
>       mrw-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-rest.inc: bump version
>       Make host-check a part of host state function
>       phosphor-networkd-rev.bbclass: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-ipmi-net.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-ipmi-net.bb: bump version
>       mrw-rev.bbclass: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-webui.bb: bump version
>       pyphosphor.bb: bump version
>       bmcweb.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-mapper.bb: bump version
>       phosphor-software-manager.bb: bump version
>       openpower-software-manager.bb: bump version
>       pyphosphor.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-logging.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       phosphor-hwmon.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-dbus-monitor.bb: bump version
>       phosphor-inventory-manager.inc: bump version
>       skeleton-rev.bbclass: bump version
>       Remove legacy inventory service from startup
>       phosphor-mapper.bb: bump version
>       openpower-debug-collector.inc: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-mapper.bb: bump version
>       op-proc-control.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       pyphosphor.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-ipmi-net.bb: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-rest.inc: bump version
>       mboxd.bb: bump version
>       phosphor-software-manager.bb: bump version
>       Introduce new host-startmin action target
>       Reset host reboot attempts on fresh boot
>       skeleton-rev.bbclass: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       phosphor-ipmi-net.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-software-manager.bb: bump version
>       phosphor-gpio-monitor.bb: bump version
>       phosphor-led-manager.inc: bump version
>       phosphor-time-manager.bb: bump version
>       phosphor-webui.bb: bump version
>       pyphosphor.bb: bump version
>       phosphor-watchdog.bb: bump version
>       openpower-software-manager.bb: bump version
>       phosphor-led-sysfs.bb: bump version
>       phosphor-dbus-monitor.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-logging.bb: bump version
>       phosphor-rest.inc: bump version
>       phosphor-dbus-interfaces.bb: bump version
>       sdbusplus.bb: bump version
>       openpower-fru-vpd.inc: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-networkd-rev.bbclass: bump version
>       ffdc.bb: bump version
>       phosphor-debug-collector.inc: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       sdbusplus.bb: bump version
>       phosphor-ipmi-net.bb: bump version
>       phosphor-dbus-monitor.bb: bump version
>       skeleton-rev.bbclass: bump version
>       phosphor-webui.bb: bump version
>       phosphor-ipmi-net.bb: bump version
>       witherspoon-pfault-analysis.inc: bump version
>       phosphor-rest.inc: bump version
>       phosphor-fan.inc: bump version
>       ibm-dbus-interfaces.bb: bump version
>       phosphor-webui.bb: bump version
>       mrw-rev.bbclass: bump version
>       phosphor-logging.bb: bump version
>       phosphor-hwmon.bb: bump version
>       phosphor-fan.inc: bump version
>       phosphor-ipmi-host.inc: bump version
>       phosphor-led-manager.inc: bump version
>       phosphor-webui.bb: bump version
>       phosphor-ipmi-host.inc: bump version
>       Fix build-from-scratch issue with u-boot
>       openpower-software-manager.bb: bump version
>=20
> Andrew Jeffery (7):
>       busybox: Enable expand(1) utility
>       phosphor-debugtools: Add latencytop tool
>       skiboot: Bump to 5.10-rc3
>       obmc-pydevtools: Install obmcutil completion file
>       kernel: Add MAX31785 devicetree support and communications =
workarounds
>       kernel: Introduce external throttling for ASPEED UART
>       u-boot: Ensure we rebuild on change of VERSION_ID
>=20
> Brad Bishop (80):
>       gevent-websocket: move to Phosphor layer
>       logging: refactor virtualized recipe build deps
>       systemd: limit bbclass hooks to class-target scope
>       Add missing pkgconfig dependencies
>       Add missing build dependencies
>       setings: recipe renames
>       u-boot-fw-utils: Fix mtd-paritions warning
>       ipmi: Refactor whitelist generation
>       yaml-tiny: rename with native suffix
>       classes: ipmi: symlink: Add missing EOF newline
>       classes: ipmi: symlink: Don't change directories
>       u-boot: mkimage: Drop recipe
>       u-boot: add u-boot-common.inc
>       ipmi: Move ipmi sensor config recipe
>       u-boot: fw-utils: reset on Poky 2.2 upstream
>       u-boot: rename u-boot.inc to u-boot-ubi.inc
>       aspeed: Add Aspeed global configuration file
>       u-boot: ubi: Apply patches on Aspeed only
>       u-boot: Move recipes to the Aspeed BSP layer
>       image_version: Add missing os-release dependency
>       debug: Avoid lighttpd build dependency
>       preinit-mounts: Add a proper init alternative
>       tftpy: drop recipe
>       pexpect, ptyprocess: Drop recipes
>       bottle: update to bottle 0.12.13
>       pygobject2: bump to 2.28.7
>       rocket: Drop recipe
>       sdbusplus: Add sdbus++ package in the usual manner
>       preinit-mounts: Fix dependencies
>       Silence meta-virtualization warning message
>       systemd: Add journald-dbus to PACKAGECONFIG
>       phosphor-gevent: Fix copy/paste error
>       flash: Add missing depenedency
>       Address build break on RHEL
>       Revert "Update pypi.python.org packages to use https"
>       python-ipy: Drop unused recipe
>       i2c-tools: Remove dead code
>       i2c-tools: revert alternative download URI
>       ipmi: Add missing build dependency
>       openpower: Fix _appends with missing space
>       distro: Move distro config content to include
>       distro: Add MRW distro policy includes
>       Remove obmc-mrw machine feature
>       MRW: Use a distro override to enable providers
>       Convert obmc-ubi-fs to a distro feature
>       Convert openpower-ubi-fs to a distro feature
>       Remove obmc-openpower-* machine features
>       Yocto 2.3
>       libgpg-error: Patch for ppc64le
>       Yocto 2.4
>       json-perl: Move to recipes-devel
>       Revert "binutils: allow build on RHEL6"
>       Revert "qemu: remove unsupported linker option for RHEL6"
>       glibc: Drop glibc bbappend
>       distro: Cleanup distro features
>       Clean up stale obmc-phosphor-utils references
>       python-*: use pypi class
>       clear-once: whitespace fix
>       clear-once: Remove redundant RPROVIDES
>       Revert "Enable libyaml nativesdk bake"
>       Revert "Add support for c++ futures for armv5te"
>       aspeed: Remove duplicate kernel provider
>       fsp2: Append -layer to bb file collection name
>       Revert "meta-phosphor: disable 'uninative' for RHEL6 support"
>       aspeed: Append -layer to bbfile collection name
>       image_types_phosphor: split make_tar_of_images
>       image_types_phosphor: drop overlay
>       Use upstream autoconf-archive
>       nlohmann: Update to 3.1.2
>       iotools: bump version
>       logging: virtual refactoring
>       clear-once: Add missing dependency on u-boot
>       Remove ipmi distro feature, virtual
>       Rocko refresh
>       Add recipe for OpenPOWER FFS repository
>       Revert "Allow login on ttyS4"
>       aspeed: Move vuart rules to udev
>       minor yaml-tiny recipe enhancements
>       perl/yaml-tiny: Update to 1.73
>       Remove u-boot-fw-utils from IMAGE_INSTALL
>=20
> Brandon Wyman (2):
>       Add service file to synchronize INPUT_HISTORY data
>       Create recipe to add service for power supply SYNC
>=20
> Brendan Higgins (1):
>       u-boot-fw-utils: Fix mtd-paritions failure
>=20
> CamVan Nguyen (2):
>       Create RSA host key in user specified path
>       dropbear: Don't load default host keys
>=20
> Deepak Kodihalli (5):
>       dcmi: get temperature readings - json
>       dcmi : get temperature readings: witherspoon json
>       dcmi: rename get temp readings json
>       dcmi: add record id to Witherspoon sensors JSON
>       ipmi: fix broken asset tag function
>=20
> Dhruvaraj Subhashchandran (3):
>       JSON file with DCMI capabilities.
>       Change the capability values to match bmc capabilities.
>       Reset boot progress and OS status sensors after reboot
>=20
> Ed Tanous (3):
>       Add recipes for building webui on target
>       Add bmcweb target to S2600Wf
>       Bump bmcweb targets and disable submodule use
>=20
> Eddie James (6):
>       fix alternate boot after watchdog reset
>       Add image signing framework and open keys
>       busybox: patch "umount: ignore -c"
>       systemd: enable watchdog and set watchdog device to wdt2
>       Add mirror u-boot option to obmc-flash-bmc
>       Revert "systemd: enable watchdog and set watchdog device to =
wdt2"
>=20
> Edward A. James (1):
>       systemd: patch in watchdog device configuration change
>=20
> Gunnar Mills (9):
>       Add PowerSupplyRedundancy to default settings
>       Add "after" PowerSupplyRedundancy mapper object
>       Rename phosphor-settings-read-settings-mrw-native dir
>       Add support for building on ppc64le
>       Add "set -eo pipefail" to obmc-flash-bmc
>       Add Garrison README
>       Remove Barreleye from README
>       Add Firestone README
>       Add POWER8 Barreleye README
>=20
> Ivan Mikhaylov (1):
>       add sunray2, fsp2 based soc
>=20
> Jayanth Othayoth (9):
>       Add in default for Turbo mode enable/disable
>       TurboAllowed: Add support for TurboAllowed sensor type
>       Added "mutability" flag to indicate if a sensor is READ/WRITE/RW
>       firestone: added "mutability"
>       garrison: added "mutability"
>       palmetto: added "mutability"
>       romulus added "mutability"
>       zaius: added "mutability"
>       openpower:added "mutability"
>=20
> Jens Rehsack (2):
>       recipes-devel: clean-up
>       json-perl: Update to 2.97001
>=20
> Joel Stanley (7):
>       u-boot: FTGMAC100, GCC7, MX6651235F fixes
>       meta-palmetto: Mirror host console to UART1
>       u-boot: Drop bootcmd support for legacy images
>       meta-phosphor: Disable systemd manpage generation
>       palmetto: Enable mboxd
>       kernel: Move to 4.13 kernel
>       linux: Host PCIe VGA and random number fixes
>=20
> Ken Chen (6):
>       Add Sensor conf file for centriq2400
>       Add IR38163 re-probe workaround
>       Add LED config for Centriq2400
>       Add obmc-console conf
>       Create centruq2400-rep recipes-kernel
>       Add SOC update script
>=20
> Lei YU (13):
>       meta-romulus: Add w83773g sensor config
>       meta-romulus: Add fan presence yaml config
>       meta-romulus: Add phosphor-cooling-type service
>       meta-zaius: Fix pcie e2b inventory path
>       meta-romulus: Pick latest phosphor-hwmon
>       meta-romulus: Add pwm target for fan sensor
>       meta-romulus: Add fan monitor config
>       bmc flash service: Remove non-existing dependency
>       meta-romulus: Add fan control yaml configs
>       meta-romulus: Bump phosphor-hwmon version
>       meta-romulus hwmon: Use negative-errno-on-fail config
>       AST2500: Add loop device support in defconfig
>       meta-romulus: fan-control: Handle service failures
>=20
> Mark Asselstine (1):
>       python-*: switch remaining pypi recipes to use the pypi class
>=20
> Marri Devender Rao (5):
>       op-occ: add native recipe to install error yaml to shared =
location
>       DCMI: Get power reading - add config file
>       DCMI: Get power reading - add witherspoon config
>       Add witherspoon hardware sensors for SDR mapping to DBus objects
>       Autogenerate output YAML for temperature sensors by parsing MRW
>=20
> Matt Spinler (18):
>       Use variables for MRW XML filename and path
>       Add Stonewither OpenPOWER system layer
>       Add args to Witherspoon power supply monitor
>       Remove Stonewither fan and power supply support
>       Add the web UI to the Witherspoon image
>       Update power supply inventory path to match MRW
>       Witherspoon XML revision bump
>       Set Witherspoon hwmon target mode
>       Witherspoon processor overtemp path changes
>       Add entry for gpu_func sensor in MRW config YAML
>       Use OpenPower variable for PS derating factor
>       Factor PS derating into power cap limit validation
>       Fix wspoon power fault error yaml install
>       dreport: refactor install_dreport_user_scripts
>       dreport: Collect IBM error objects on IBM systems
>       Enable recipes in meta-ibm/recipes-*/
>       Add ibm-dbus-interfaces recipe
>       Tell the mapper about IBM D-Bus paths
>=20
> Matthew Barth (9):
>       wspoon: Increase fan fail shutdown delay
>       wspoon: Increase watchdog timeout
>       wspoon: Handle dependent application fails
>       Keep fan services running until poweroff completes
>       wspoon: Revert fan watchdog timeout
>       wspoon: Create fan rotors group with hard poweroff
>       wspoon: MAX31785revA fan controller workaround
>       wspoon: Support more than one group per event
>       wspoon: Remove OCC sensors on EAGAINs
>=20
> Michael Tritz (2):
>       Fix for MACHINE_FEATURES check in u-boot.inc
>       BMC firmware update: Dynamically size UBI volume to fit image
>=20
> Nagaraju Goruganti (1):
>       Add power supply to BMC accessible FRUs to generate FRU map
>=20
> Patrick Venture (7):
>       phosphor-ipmi-host: Add channel config default
>       minor reorganization of phosphor-defaults.inc
>       initfs: files: whitelist: Alphabetized
>       Add Quanta-Q71l README
>       meta-q71: sensors: phosphor-hwmon enable errno val
>       meta-quanta-q71l: phosphor: sensors: add missing inherit
>       meta-quanta-q71l: new recipes for ipmi preferences
>=20
> Ratan Gupta (6):
>       FRU: Add Entity ID in the host FRU inventory yaml
>       IPMI Sensor: Adding the replacable interface for GPU sensor
>       phosphor-dbus-monitor: Add the witherspoon specific config file
>       Network: Bring libnl into the openbmc image
>       phosphor-ipmi: bump version
>       network: Add the ncsi-netlink service
>=20
> Tim Orling (1):
>       pypi.bbclass: bring in from meta-python
>=20
> Tom Joseph (3):
>       sensor: Modify config for sensor to add additional fields
>       Set the nice value of mapper process to -5
>       Generate IPMI Aux firmware revision from VERSION_ID field
>=20
> Xo Wang (1):
>       obmc-phosphor-image: Don't build .cpio.lzma.u-boot
>=20
> Yong Li (1):
>       Systemd: backport a new api for uuid generation
>=20

Oops.  Let me try this again.  Sorry about the HTML mail.

-brad
