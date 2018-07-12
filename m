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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RN1R184lzF35S
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 03:18:02 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 79A2FFA10C
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 13:17:56 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC v2.3
Message-Id: <415A6CFF-EAA4-4812-9F4C-7D27012225D5@fuzziesquirrel.com>
Date: Thu, 12 Jul 2018 13:17:56 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 17:18:04 -0000

We=E2=80=99ve moved to Yocto 2.5.  We have Linux 4.17.  Tag time!

It wouldn=E2=80=99t be an OpenBMC release note without a warning about =
an upcoming
change to our branching strategy.  So like before, stay tuned to the =
list
for news on that front.  With the formation of the OpenBMC planning =
workgroup
led by Kurt Taylor we may actually start to see some progress on that.

Enjoy!

-brad

Adriana Kobylak (10):
      systemd: Remove journald sync patches
      obmc-flash-bmc: Add set_wdt2bite
      openpower-software-manager: Add verify_pnor_signature
      Witherspoon: Set default value of TPMEnable to true
      obmc-flash-bmc: Mount alt rwfs
      Witherspoon: Enable PNOR signature verification
      Witherspoon: Add sync manager
      phosphor-software-manager: Add synclist
      obmc-flash-bmc: DeleteAll cleanup fixes for alt BMC
      obmc-flash-bmc: Check alt rwfs volume exists

Alexander Amelkin (1):
      Refix 68a967d: setup: Fix subshell spawning

Andrew Geissler (196):
      phosphor-ipmi-host.inc: bump version
      phosphor-logging.bb: bump version
      Change over-current warning value on witherspoon
      phosphor-gpio-monitor.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      bmcweb.bb: bump version
      openpower-occ-control.inc: bump version
      openpower-ipmi-oem.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-gpio-monitor.bb: bump version
      phosphor-hwmon.bb: bump version
      ibm-logging.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-led-manager.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-settings-manager.inc: bump version
      openpower-software-manager.bb: bump version
      sdbusplus.bb: bump version
      phosphor-ipmi-host.inc: bump version
      Change the StartLimitIntervalSec to 30s
      phosphor-rest.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-net.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      Allow web socket over nginx https connection
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      boost-dbus.bb: bump version
      phosphor-logging.bb: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      mboxd.bb: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-state-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      pyphosphor.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-hwmon.bb: bump version
      bmcweb.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      pyphosphor.bb: bump version
      phosphor-mapper.bb: bump version
      phosphor-fan.inc: bump version
      pyphosphor.bb: bump version
      ibm-logging.bb: bump version
      phosphor-webui.bb: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-inventory-manager.inc: bump version
      phosphor-fan.inc: bump version
      Increase nginx timeouts from 10s to 30s
      phosphor-ipmi-fru.inc: bump version
      phosphor-hwmon.bb: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-webui.bb: bump version
      bmcweb.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-host-postd.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-software-manager.bb: bump version
      ibm-logging.bb: bump version
      phosphor-logging.bb: bump version
      obmc-console.bb: bump version
      inventory-upload.bb: bump version
      phosphor-ipmi-bt.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-networkd-rev.bbclass: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-logging.bb: bump version
      mboxd.bb: bump version
      bmcweb.bb: bump version
      ibm-dbus-interfaces.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-state-manager.bb: bump version
      openpower-debug-collector.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-time-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-rest.inc: bump version
      openpower-occ-control.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      slpd-lite.bb: bump version
      openpower-dbus-interfaces.bb: bump version
      phosphor-mapper.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      ffdc.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-user-manager.bb: bump version
      phosphor-inventory-manager.inc: bump version
      openpower-fru-vpd.inc: bump version
      phosphor-gpio-monitor.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-led-manager.inc: bump version
      phosphor-rest.inc: bump version
      openpower-ipmi-oem.inc: bump version
      phosphor-fan.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-ipmi-oem.inc: bump version
      phosphor-gpio-monitor.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-state-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      Move nginx ciphers to mozilla guidelines
      phosphor-rest.inc: bump version
      phosphor-mapper.bb: bump version
      ibm-logging.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      rest-dbus.bb: bump version
      skeleton-rev.bbclass: bump version
      pyphosphor.bb: bump version
      phosphor-mapper.bb: bump version
      openpower-occ-control.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      obmc-console.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-user-manager.bb: bump version
      sdbusplus.bb: bump version
      phosphor-watchdog.bb: bump version
      phosphor-host-postd.inc: bump version
      sdbusplus.bb: bump version
      op-proc-control.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-time-manager.bb: bump version
      phosphor-hwmon.bb: bump version
      bmcweb.bb: bump version
      boost-dbus.bb: bump version
      phosphor-webui.bb: bump version
      witherspoon-pfault-analysis.inc: bump version
      ffdc.bb: bump version
      phosphor-debug-collector.inc: bump version
      phosphor-software-manager.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-mapper.bb: bump version
      inarp.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-hwmon.bb: bump version
      bmcweb.bb: bump version
      phosphor-settings-manager.inc: bump version
      phosphor-led-manager.inc: bump version
      phosphor-mapper.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-mapper.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      slpd-lite.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-ipmi-fru.inc: bump version
      phosphor-logging.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      phosphor-hwmon.bb: bump version
      phosphor-webui.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-state-manager.bb: bump version
      bmcweb.bb: bump version
      openpower-occ-control.inc: bump version
      phosphor-dbus-monitor.bb: bump version

Andrew Jeffery (7):
      phosphor: u-boot: Switch sides on failure to boot
      kernel: Add phosphor-wdt-on-panic KERNEL_FEATURE
      witherspoon: Enable phosphor-wdt-on-panic KERNEL_FEATURE
      phosphor: systemd: Cleanup unused patches
      phosphor-ipmi-host: Move configuration to phosphor-ipmi-config
      obmc-mgr-system: Fix 'Phoshpor' typo in service file
      Add MAINTAINERS file

Benjamin Fair (1):
      obmc-phosphor-fand.bb: inherit pkgconfig

Brad Bishop (45):
      aspeed: move MTD partition rules
      gpio-monitor: Favor ALLOW_EMPTY
      cereal: Favor ALLOW_EMPTY
      image_types_phosphor: Add UBOOT_SUFFIX default
      phosphor-fan: Favor ALLOW_EMPTY
      state-manager: Favor ALLOW_EMPTY
      fw-utils:  Apply Aspeed patches
      debug-collector: Favor ALLOW_EMPTY
      software-manager: Favor ALLOW_EMPTY
      leds: Favor ALLOW_EMPTY
      cereal: set PV
      aspeed: cleanup u-boot-fw-utils config
      Use BB collections for Aspeed tree patches
      aspeed: Rename u-boot recipes
      Revert "Adding patch to remove GNOME compiler warning(deprecated)"
      Rename and move kernel recipe
      aspeed: Move remaining config to common base layer
      aspeed: Move README.md to common base layer
      machines: Drop ast2400/ast2500 layers
      aspeed: Remove SOC specific layers
      aspeed: remove common directory
      obmc-bsp-common.inc: Remove a number of vars
      phosphor-time-manager: Rename recipe
      obmc-console: Rename recipe
      Drop phosphor-rocket
      Revert "Add workaround to avoid disabling serial console"
      Fix dbus.Byte JSON encoding
      Revert "python-dbus dbus.Byte.__str__ produces broken utf8"
      bottle: pull in vanilla python email modules
      python: Drop unused python-email-utils package
      Remove use of mapper call
      systemd: Use systemd_unitdir
      witherspoon: Move systemd to recipes-core
      witherspoon: Use systemd_unitdir
      flash: Move image manager tmpfile config
      drop latencytop
      Remove udev-hwdb differently for sumo
      Add meta-aspeed subtree maintainers file
      Add meta-openpower subtree maintainers file
      Add meta-phosphor subtree maintainers file
      remove oe-init-build-memres
      Yocto 2.5
      zaius: Rename u-boot bbappend to u-boot-aspeed
      phosphor: Set LAYERSERIES_COMPAT
      aspeed: Set LAYERSERIES_COMPAT

Brendan Higgins (1):
      npcm750-evb: added support for npcm750-evb

Brian Yang (3):
      Add meta-inventec and meta-lanyang
      meta-lanyang: Mirror host console to UART1
      meta-phosphor: Add Mailbox Daemon

Chris Austen (2):
      Enable use of meta-webserver layer
      Move phosphor-gevent to http and enable nginx on 443

Ed Tanous (1):
      Update bmcweb to latest

Eddie James (2):
      U-Boot mirroring: remove check_is_alt()
      Add CONFIG_WATCHDOG_SYSFS to kernel config

Gunnar Mills (1):
      Spelling fixes

Ivan Mikhaylov (1):
      add kernel-uimage class for fsp2

James Feist (1):
      Remove bt from intel images

Jeremy Kerr (4):
      openpower/witherspoon: add fbterm package for UART rendering
      openpower/witherspoon: add a monospace-only liberation font =
package
      openpower/witherspoon: add uart-render-controller package
      openpower/witherspoon: configure video-related packages into build

Joel Stanley (31):
      kernel: Add Nuvoton NPCM (Poleg), ncsi and romulus fixes
      kernel: DRM update, ASPEED misc registers, AST2500 clk fix
      kernel: Add ASPEED AST2500 DRM driver
      kernel: Add Neptune and Lanyang, clk and OCC bug fixes, GFX for =
Romulus
      meta-phosphor: Add host UART over VGA packages
      witherspoon: Remove machine specific host UART over VGA packages
      romulus: Enable host UART VGA output
      kenrel: OCC fixes and rng dts fix
      kernel: Add SIO registers fix
      meta-openpower: Add hb_settings tool
      meta-openpower: Add hostboot-boot-settings unit
      meta-openpower: Add hostboot-settings packaging
      openbmc-machines: Enable hostboot-settings for all machines
      kernel: GPIO and soft FSI stability and speed improvements
      kernel: Poleg pinctrl, clk fixes, KCS driver, pmbus fix
      kernel: FSI improvements, hwrng fix
      skiboot: Remove PREFIX patch
      skiboot: bump to v6.0.4
      meta-openbmc-machines: Remove Garrison from tree
      meta-openbmc-machines: Remove Firestone from tree
      openbmc-machines: Remove unncessary CONFIG_HWMON
      pdbg: bump version
      kernel: Move to 4.17
      linux: Merge 4.17.2 stable release
      kernel: GPIO features, device tree fixes, quieten NCSI
      kernel: Move to 4.17.3, aspeed clk fix
      aspeed: Add cf-fsi firmware
      openpower: Remove fsi-bind service
      kernel: FSI, ASPEED SPI NOR, ASPEED GFX
      kernel: SBE, ASPEED USB VHUB, ASPEED clk, GPIO
      kernel: 4.17.4 stable release

Lei YU (10):
      meta-romulus: Add id-button.bb
      phosphor-gpio-monitor: Add EXTRA_ARGS in service
      Add RDEPENDS to mtd-utils-ubifs in phosphor-software-manager
      meta-romulus: Add ipmi-fru-read-inventory config
      op-start-host: Fix reboot for P8
      nginx.conf: increase client_max_body_size
      meta-romulus: Add webui recipe
      linux-aspeed: Add loop device support in defconfig
      meta-romulus: Add callouts yaml config
      meta-romulus: Add ipmi inventory sel config

Matt Spinler (24):
      Add the IBM log manager recipe and service
      Install the Witherspoon error policy table
      Add optional do_report task for ibm-logging
      Witherspoon: Change hwmon GPU power labels
      wspoon: Make cooling-type service a oneshot
      wspoon: Script to help start MAX31785 hwmon daemon
      wspoon: Add service to help start MAX31785 hwmon
      wspoon: Start hwmon differently for the MAX31785
      wspoon: Add critical thresholds for fan speeds
      wspoon: Fixup watchdog monitor config on fan apps
      wspoon: Find OCC power labels using function IDs
      openpower: Read the BMC VPD from the OPFR record
      Witherspoon v1.7.1 RAS policy table
      wspoon: Copy in the MAX31785 hwmon config file
      wspoon: Rename GPU power sensors in IPMI YAML
      wspoon: Remove GPU power sensors
      wspoon: Retry on VRM bind fails
      wspoon: Change ir35221-on-bind.service dependency
      wspoon: Improve fan error resolving rules
      Remove the meta-stonewither layer
      Fix openpower-ipmi-oem error yaml installation
      openpower: Fix typo in enable-clearvolatile
      Fix typos in some targets
      Fix dependency in fsi-enable.service

Matthew Barth (5):
      wspoon: Enable use of InterfacesRemoved
      wspoon: Handle faulted OCC temp sensors
      wspoon: Only create/monitor fan1 on air cooled
      wspoon: Move faulted OCC sensor events
      wspoon: Revert increase fan fail shutdown delay

Michael Tritz (1):
      Clear volatile PNOR partitions when required

Nagaraju Goruganti (3):
      Providing infra for FRUs which are accessible through host but =
host is not sending the details for those FRUs
      witherspoon: Add support for GPU FRUS
      Add witherspoon specific channel.yaml

Patrick Venture (2):
      recipes-phosphor: host: phosphor-host-postd recipe
      meta-x86: quanta--q71l: drop ipmi-fru-properties

Ratan Gupta (2):
      Avahi: Don't start the avahi-daemon if dot local domain is there
      Revert "Avahi: Don't start the avahi-daemon if dot local domain is =
there"

Tom Joseph (2):
      Add cipher list json to the Witherspoon image
      Add the default cipher list for all platforms

Tomer Maimon (1):
      Add Nuvoton NPCM7XX BSP support

William A. Kennington III (5):
      phosphor-dbus-interfaces.bb + phosphor-watchdog.bb: Bump versions
      phosphor-watchdog: Continue after performing action
      sdbusplus: Bump version
      kernel: specify dependencies for compilation for config tasks
      phosphor-mapper: oneshots should restart on failure

Yong Li (1):
      Linux-aspeed: Restore kernel crypto related items needed by =
systemd

causten (1):
      Add Nginx as a external facing reverse proxy
