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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xX1M154rzF3q4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 08:48:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <93138544f5433591c52d1d7bfb5472ee08033387.camel@fuzziesquirrel.com>
Subject: OpenBMC v2.4
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 16 Nov 2018 16:48:48 -0500
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 21:48:56 -0000

Tag time!  Please note that the next tag will be v2.6 sometime early
next year when we do our first pre-planned OpenBMC release.

Some quick highlights:

Linux 4.18
OE 2.5 bug fixes
new system: stardragon-rep2
new system: Enclustra Mars ZX3
new system: Tiogapass

Thanks and Enjoy!

-brad

Adriana Kobylak (22):
      phosphor-software-manager: Create new UBI bbclass
      whitelist: Add new phosphor settings directories
      openpower-software-manager: Remove ubiclear
      obmc-flash-bios: Remove UBI vols by id instead of name
      mtd-utils: Revert "Return correct error number in ubi_get_vol_in"
      ipmi-sensor: Add power supply redundancy
      ipmi-sensor: Add power supply derating factor
      packagegroup-obmc-apps: Remove obmc-mgr-sensor
      obmc-mgr-sensor: Remove recipe and service file
      settings-default: Add Power Supply Derating Factor
      mboxd.bb: Replace phosphor-mboxd with mboxbridge
      packagegroup-op-apps: Remove obmc-pcie-detect
      meta-openpower: Introduce openpower-host-ipmi-flash plugin
      jsnbd: Create recipe and add it to the REST server
      network.bb: Add sdeventplus
      Remove dependency to the system manager service
      packagegroups: Remove obmc-mgr-system
      packagegroups: Remove obmc-mgr-system
      openpower-software-manager: Add PNOR MSL service
      jsnbd: Add nbd-client as dependency
      jsnbd: Add config.json file
      skiboot: Bump to 6.0.13

Alexander Amelkin (1):
      Make CONTRIBUTING.md all caps as per the Charter

Alexander Filippov (5):
      Check size of the firmware image parts
      phosphor-rest: fix remote address in log messages
      split net-snmp-libs into smaller packages
      systemd: fix noisy messages about eBPF
      meta-phosphor: fix reboot of BMC

Alexander Hedges (2):
      Fix inconsistent indentation
      Add support for Enclustra Mars ZX3 board as a BMC

Amithash Prasad (2):
      powerwell-neptune: Rename linux-obmc to linux-aspeed
      setup: Allow user to pass in the build directory name

Andrew Geissler (463):
      phosphor-software-manager.bb: bump version
      phosphor-dbus-monitor.bb: bump version
      phosphor-led-manager.inc: bump version
      openpower-occ-control.inc: bump version
      phosphor-dbus-monitor.bb: bump version
      obmc-console_git.bb: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-host-postd.inc: bump version
      Remove TODO in phosphor-reset-host-running service
      openpower-software-manager.bb: bump version
      phosphor-software-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      openpower-software-manager.bb: bump version
      phosphor-fan.inc: bump version
      phosphor-host-postd.inc: bump version
      Move systemd bbappend to match base layer path
      phosphor-rest.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-led-manager.inc: bump version
      phosphor-dbus-interfaces.bb: bump version
      bmcweb.bb: bump version
      phosphor-software-manager.inc: bump version
      sdbusplus.bb: bump version
      openpower-software-manager.bb: bump version
      Add explicit dependency between mapper and sdbus
      phosphor-webui.bb: bump version
      Put bmcweb in common layer for others to use
      phosphor-logging.bb: bump version
      bmcweb.bb: bump version
      Move phosphor overrides of systemd into own recipe
      Prevent duplicate kernel message in journal
      Disable forwarding of journal to syslog
      ibm-logging.bb: bump version
      phosphor-webui.bb: bump version
      openpower-software-manager.bb: bump version
      phosphor-host-postd.inc: bump version
      Add bmcweb to meta-ibm layer for redfish support
      bmcweb.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-host-postd.inc: bump version
      sdbusplus.bb: bump version
      phosphor-state-manager.bb: bump version
      phosphor-ipmi-host.inc: bump version
      bmcweb.bb: bump version
      obmc-console_git.bb: bump version
      phosphor-rest.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-pid-control.bb: bump version
      phosphor-software-manager.inc: bump version
      phosphor-host-postd.inc: bump version
      phosphor-ipmi-net.bb: bump version
      phosphor-led-sysfs.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-host-postd.inc: bump version
      mboxd.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      openpower-ipmi-oem.inc: bump version
      phosphor-pid-control.bb: bump version
      bmcweb.bb: bump version
      sdbusplus.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-ipmi-host.inc: bump version
      bmcweb.bb: bump version
      phosphor-state-manager.bb: bump version
      phosphor-dbus-interfaces.bb: bump version
      phosphor-snmp_git.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-snmp_git.bb: bump version
      bmcweb.bb: bump version
      phosphor-ipmi-host.inc: bump version
      phosphor-logging.bb: bump version
      phosphor-host-postd.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-networkd-rev.bbclass: bump version
      bmcweb.bb: bump version
      phosphor-software-manager.inc: bump version
      bmcweb.bb: bump version
      bmcweb.bb: bump version
      bmcweb.bb: bump version
      phosphor-webui.bb: bump version
      phosphor-host-postd.inc: bump version
      phosphor-webui.bb: bump version
      phosphor-snmp_git.bb: bump version
      phosphor-software-manager.inc: bump version
      phosphor-webui.bb: bump version
      bmcweb.bb: bump version
      Remove deprecated PHOSPHOR_WEBUI define
      phosphor-pid-control.bb: bump version
      phosphor-gpio-monitor.bb: bump version
      inarp.bb: bump version
      phosphor-webui.bb: bump version
      sdbusplus.bb: bump version
      phosphor-pid-control.bb: bump version
      sdeventplus_git.bb: bump version
      Increase witherspoon host console log to 256K
      Disable bmcweb static hosting in IBM layer
      phosphor-dbus-interfaces: srcrev bump 4132f4b6b1..5af83f1528
      phosphor-inventory-manager: srcrev bump 566e096e97..d6819c9fcc
      phosphor-networkd: srcrev bump ad21fc2a86..189d44eddd
      phosphor-dbus-interfaces: srcrev bump 5af83f1528..e0e9aed2be
      phosphor-webui: srcrev bump dc36acc943..1ca1d7e10e
      phosphor-pid-control: srcrev bump 40be36ac31..da4a5dd133
      phosphor-fan-presence: srcrev bump 86be476bfb..ecd4bc7bf2
      phosphor-logging: srcrev bump 9fab279fb3..5ac1bde129
      sdbusplus: srcrev bump 69425eb7d3..8ce61e4e20
      bmcweb: srcrev bump 9b243a4ee4..a38b0b2063
      phosphor-state-manager: srcrev bump 9eab98618f..a965cf06a6
      phosphor-pid-control: srcrev bump da4a5dd133..991cf8757b
      phosphor-webui: srcrev bump 1ca1d7e10e..e364faa031
      phosphor-hwmon: srcrev bump 901f117733..043d32306e
      phosphor-pid-control: srcrev bump 991cf8757b..e2ec0f618a
      sdbusplus: srcrev bump 8ce61e4e20..e0d6965e73
      phosphor-hwmon: srcrev bump 043d32306e..c9c818ed85
      openpower-pnor-code-mgmt: srcrev bump 8be32f7ba3..90fdc707b8
      phosphor-networkd: srcrev bump 189d44eddd..ce26282763
      phosphor-webui: srcrev bump e364faa031..83dcedf108
      phosphor-hwmon: srcrev bump c9c818ed85..cc86915b98
      phosphor-dbus-monitor: srcrev bump 2ded5e1e39..3d6d3182ee
      bmcweb: srcrev bump a38b0b2063..1abe55ef98
      phosphor-dbus-interfaces: srcrev bump e0e9aed2be..02254dfeea
      sdbusplus: srcrev bump e0d6965e73..2c8f93fb44
      phosphor-snmp: srcrev bump f4ecf88338..aea53d071d
      phosphor-rest-server: srcrev bump 6691e7ca4e..6e1ca53062
      sdbusplus: srcrev bump 2c8f93fb44..b641d103ad
      obmc-console: srcrev bump 3c89b26348..1864435759
      phosphor-host-ipmid: srcrev bump 1e12112baf..26f80ab2cc
      ipmi-fru-parser: srcrev bump c19b813e79..25fbd433ec
      Introduce new phosphor-tiny distro feature
      phosphor-tiny: Reduce python.bb .py files
      phosphor-tiny: Remove python-gevent.bb .py files
      phosphor-tiny: Enable tiny distro on witherspoon
      phosphor-pid-control: srcrev bump e2ec0f618a..8f1791448e
      phosphor-logging: srcrev bump 5ac1bde129..7d111a85eb
      phosphor-webui: srcrev bump 83dcedf108..a788cf0182
      phosphor-bmc-code-mgmt: srcrev bump 76c79df3fc..fa34e02315
      phosphor-net-ipmid: srcrev bump fe5a645872..584fa8877d
      phosphor-host-ipmid: srcrev bump 26f80ab2cc..0b02be925a
      phosphor-webui: srcrev bump a788cf0182..dd9d4c3299
      phosphor-state-manager: srcrev bump a965cf06a6..14e14cddf6
      bmcweb: srcrev bump 1abe55ef98..2daf672562
      phosphor-host-postd: srcrev bump c820155fa7..b5754fd450
      pyphosphor: srcrev bump f63e191ca6..d2aadf1220
      skeleton: srcrev bump d7a8ba5b58..52efa6594b
      phosphor-webui: srcrev bump dd9d4c3299..0d7875b5b6
      phosphor-time-manager: srcrev bump 33752c75e8..bd024395f6
      phosphor-hwmon: srcrev bump cc86915b98..af6227a3eb
      openpower-pnor-code-mgmt: srcrev bump 90fdc707b8..70ca242282
      phosphor-pid-control: srcrev bump 8f1791448e..22c257abd2
      phosphor-webui: srcrev bump 0d7875b5b6..e6c3a443c1
      phosphor-host-postd: srcrev bump b5754fd450..384bc4c843
      gpioplus: srcrev bump 68cce0fad1..43171e3dc6
      phosphor-user-manager: srcrev bump 10eb23f8d6..9f630d9eb0
      sdeventplus: srcrev bump d38b8ffc4e..de22092139
      phosphor-webui: srcrev bump e6c3a443c1..b7ea279015
      phosphor-bmc-code-mgmt: srcrev bump fa34e02315..b0ce996ac6
      phosphor-dbus-interfaces: srcrev bump 02254dfeea..c6cfd2ce93
      mboxbridge: srcrev bump acdbdd141e..41c337e88b
      phosphor-host-ipmid: srcrev bump 0b02be925a..e59abfbade
      phosphor-rest-server: srcrev bump 6e1ca53062..958036845a
      phosphor-watchdog: srcrev bump d5353086a4..8f6c51564d
      phosphor-time-manager: srcrev bump bd024395f6..1cd4248d4a
      openpower-pnor-code-mgmt: srcrev bump 70ca242282..f6ed5897b7
      mboxbridge: srcrev bump 41c337e88b..93c8edc9a0
      openpower-host-ipmi-oem: srcrev bump 8fb3f03c0d..81e23107eb
      phosphor-networkd: srcrev bump ce26282763..1a054aeab1
      phosphor-host-postd: srcrev bump 384bc4c843..1c16ad897b
      sdbusplus: srcrev bump b641d103ad..035c73b213
      phosphor-dbus-interfaces: srcrev bump c6cfd2ce93..06b4df97b7
      phosphor-rest-server: srcrev bump 958036845a..4aa10001c7
      openpower-pnor-code-mgmt: srcrev bump f6ed5897b7..275bb98c90
      phosphor-bmc-code-mgmt: srcrev bump b0ce996ac6..d9341b4a9f
      Move screen package to debug tarball
      openpower-pnor-code-mgmt: srcrev bump 275bb98c90..1f985b69a6
      phosphor-webui: srcrev bump b7ea279015..295bcee474
      phosphor-bmc-code-mgmt: srcrev bump d9341b4a9f..1e648729a5
      bmcweb: srcrev bump 2daf672562..683f727657
      kcsbridge: srcrev bump a1c50751b5..ccf086f151
      phosphor-dbus-interfaces: srcrev bump 06b4df97b7..bf21cfa864
      phosphor-hwmon: srcrev bump af6227a3eb..86e58fffbb
      sdbusplus: srcrev bump 035c73b213..5b701c66a8
      phosphor-webui: srcrev bump 295bcee474..cff6150871
      phosphor-bmc-code-mgmt: srcrev bump 1e648729a5..a696359077
      phosphor-led-manager: srcrev bump 08d613e7d5..e77b8345d8
      bmcweb: srcrev bump 683f727657..e3cb5a319a
      phosphor-webui: srcrev bump cff6150871..c3abaa9b8b
      phosphor-host-ipmid: srcrev bump e59abfbade..1f4bc1f079
      sdeventplus: srcrev bump de22092139..7f58b2a1ec
      phosphor-pid-control: srcrev bump 22c257abd2..07c3a80e09
      phosphor-webui: srcrev bump c3abaa9b8b..23ec5bda1f
      sdeventplus: srcrev bump 7f58b2a1ec..81282e1a2b
      Increase StartLimitIntervalSec to 240s
      Enable kernel logs in journal
      phosphor-pid-control: srcrev bump 07c3a80e09..3dfaafdaca
      sdeventplus: srcrev bump 81282e1a2b..6a447baf3a
      phosphor-host-ipmid: srcrev bump 1f4bc1f079..bae471cb4e
      phosphor-watchdog: srcrev bump 8f6c51564d..3bb2f4006f
      sdbusplus: srcrev bump 5b701c66a8..703892e2d9
      phosphor-rest-server: srcrev bump 4aa10001c7..ba043644ad
      phosphor-host-ipmid: srcrev bump bae471cb4e..069db2fd85
      python: don't sort the manifest in create_manifest
      python: respect package order in manifest
      python: consolidate tests
      phosphor-webui: srcrev bump 23ec5bda1f..e8634e6bfc
      phosphor-watchdog: srcrev bump 3bb2f4006f..c2c26cebc2
      gpioplus: srcrev bump 43171e3dc6..88a89bc6bc
      phosphor-time-manager: srcrev bump 1cd4248d4a..19b37ee220
      phosphor-hwmon: srcrev bump 86e58fffbb..b28f432a3f
      phosphor-dbus-monitor: srcrev bump 3d6d3182ee..6383049ee6
      phosphor-webui: srcrev bump e8634e6bfc..5f0b776753
      phosphor-host-ipmid: srcrev bump 069db2fd85..fdfe501ea7
      phosphor-fan-presence: srcrev bump ecd4bc7bf2..bd2e80a65e
      phosphor-webui: srcrev bump 5f0b776753..e13275b837
      Remove mapper nice priority
      Keep _sysconfigdata.py in image
      phosphor-webui: srcrev bump e13275b837..806d39be67
      sdeventplus: srcrev bump 6a447baf3a..4755818efb
      phosphor-pid-control: srcrev bump 3dfaafdaca..ce15e02f68
      phosphor-ipmi-blobs: srcrev bump e4accf03bb..ffecf1b2af
      skeleton: srcrev bump 52efa6594b..7e48038afc
      phosphor-watchdog: srcrev bump c2c26cebc2..d4cbc5aad2
      sdeventplus: srcrev bump 4755818efb..ba04ffb5a9
      phosphor-webui: srcrev bump 806d39be67..8d6f37f9eb
      sdbusplus: srcrev bump 703892e2d9..17052240ae
      phosphor-ipmi-blobs: srcrev bump ffecf1b2af..b3e07e2b63
      phosphor-networkd: srcrev bump 1a054aeab1..548e9f13d2
      Revert "Increase StartLimitIntervalSec to 240s"
      phosphor-certificate-manager: srcrev bump 0aa0d11489..cfbc8dc890
      phosphor-rest-server: srcrev bump ba043644ad..dee2ef579b
      google-ipmi-sys: srcrev bump ef45005c2c..28557a1f6b
      phosphor-ipmi-blobs: srcrev bump b3e07e2b63..4dc584db90
      openpower-pnor-code-mgmt: srcrev bump 1f985b69a6..139604e561
      phosphor-bmc-code-mgmt: srcrev bump a696359077..71f6e739d5
      phosphor-user-manager: srcrev bump 9f630d9eb0..7ba3c71cb3
      phosphor-ipmi-blobs: srcrev bump 4dc584db90..5100a38640
      ibm-logging: srcrev bump 34af47ff62..c57aa4b931
      phosphor-host-ipmid: srcrev bump fdfe501ea7..0fbdbce227
      phosphor-webui: srcrev bump 8d6f37f9eb..77039a5e9a
      phosphor-objmgr: srcrev bump d6729ea39d..1036b4d131
      sdbusplus: srcrev bump 17052240ae..ca46b9d2e9
      phosphor-ipmi-blobs: srcrev bump 5100a38640..7210b3109d
      phosphor-objmgr: srcrev bump 1036b4d131..ea6516c4fe
      phosphor-dbus-interfaces: srcrev bump bf21cfa864..a58489312b
      bmcweb: srcrev bump e3cb5a319a..62d5e2e47f
      phosphor-user-manager: srcrev bump 7ba3c71cb3..dccee2b7ff
      phosphor-objmgr: srcrev bump ea6516c4fe..a493615230
      phosphor-gpio-monitor: srcrev bump 96e01b7c11..bd0904b1e9
      openpower-occ-control: srcrev bump f7d9e76dc7..1fcff95c38
      openpower-proc-control: srcrev bump 6d83ddf769..b3d71312fc
      openpower-dbus-interfaces: srcrev bump db61501f7a..998a82ec58
      openpower-vpd-parser: srcrev bump 0097cced1f..6e3c2b7a75
      ibm-logging: srcrev bump c57aa4b931..5b6d0f63c3
      ibm-dbus-interfaces: srcrev bump 62c7bff037..c9ae6bf297
      witherspoon-pfault-analysis: srcrev bump cab4834210..f4d72d82a1
      phosphor-settingsd: srcrev bump 58d2efeef8..e7e46df6ba
      phosphor-debug-collector: srcrev bump 90d147a1ee..d3d3774262
      phosphor-snmp: srcrev bump aea53d071d..ce714f4080
      phosphor-led-manager: srcrev bump e77b8345d8..2ff07f3fb6
      skeleton: srcrev bump 7e48038afc..b8da93ed7c
      phosphor-dbus-interfaces: srcrev bump a58489312b..c06f29ada4
      phosphor-fan-presence: srcrev bump bd2e80a65e..48df959b59
      phosphor-ipmi-blobs: srcrev bump 7210b3109d..b15b305060
      phosphor-dbus-monitor: srcrev bump 6383049ee6..8e273775ee
      phosphor-webui: srcrev bump 77039a5e9a..971ac1aaf4
      phosphor-watchdog: srcrev bump d4cbc5aad2..f505fc0674
      phosphor-host-ipmid: srcrev bump 0fbdbce227..021f2d116a
      sdbusplus: srcrev bump ca46b9d2e9..2b74e528cb
      phosphor-logging: srcrev bump 7d111a85eb..b17e8768da
      phosphor-pid-control: srcrev bump ce15e02f68..50fdfe3988
      phosphor-state-manager: srcrev bump 14e14cddf6..6425ab76f5
      ipmi-fru-parser: srcrev bump 25fbd433ec..5fcff6720e
      phosphor-net-ipmid: srcrev bump 584fa8877d..5e45209383
      openpower-host-ipmi-oem: srcrev bump 81e23107eb..d6c7b2ece1
      phosphor-host-ipmid: srcrev bump 021f2d116a..1cd8596397
      phosphor-time-manager: srcrev bump 19b37ee220..ab4cc6a558
      openpower-host-ipmi-oem: srcrev bump d6c7b2ece1..3288471dfc
      bmcweb: srcrev bump 62d5e2e47f..609145a7d1
      phosphor-dbus-interfaces: srcrev bump c06f29ada4..95fafa87ac
      openpower-host-ipmi-oem: srcrev bump 3288471dfc..34aca0135d
      phosphor-pid-control: srcrev bump 50fdfe3988..cd9e109fef
      phosphor-ipmi-blobs: srcrev bump b15b305060..e225540cc7
      phosphor-rest-server: srcrev bump dee2ef579b..c043cdda0b
      phosphor-webui: srcrev bump 971ac1aaf4..067a1cd156
      phosphor-ipmi-blobs: srcrev bump e225540cc7..5c4b17b2c5
      phosphor-pid-control: srcrev bump cd9e109fef..67efa24437
      phosphor-webui: srcrev bump 067a1cd156..628ba8b33d
      phosphor-pid-control: srcrev bump 67efa24437..d7a55bfdbd
      sdeventplus: srcrev bump ba04ffb5a9..c07ddb5ad6
      phosphor-pid-control: srcrev bump d7a55bfdbd..d73af2b5a2
      bmcweb: srcrev bump 609145a7d1..ca537928fb
      phosphor-hwmon: srcrev bump b28f432a3f..685efa165a
      phosphor-pid-control: srcrev bump d73af2b5a2..45153926a6
      mboxbridge: srcrev bump 93c8edc9a0..5f86227e16
      google-ipmi-sys: srcrev bump 28557a1f6b..216108f1da
      bmcweb: srcrev bump ca537928fb..f254ba77a5
      phosphor-pid-control: srcrev bump 45153926a6..36b7d8ebbb
      phosphor-objmgr: srcrev bump a493615230..db27894204
      sdbusplus: srcrev bump 2b74e528cb..b20866d311
      phosphor-ipmi-blobs: srcrev bump 5c4b17b2c5..c9ad5ffbca
      phosphor-rest-server: srcrev bump c043cdda0b..4b412ac926
      phosphor-pid-control: srcrev bump 36b7d8ebbb..d8a9a19e5a
      phosphor-hwmon: srcrev bump 685efa165a..0956017412
      bmcweb: srcrev bump f254ba77a5..6141c8b207
      sdbusplus: srcrev bump b20866d311..ad7e686b55
      phosphor-logging: srcrev bump b17e8768da..93b1b7c462
      phosphor-certificate-manager: srcrev bump cfbc8dc890..947258dcf1
      google-ipmi-sys: srcrev bump 216108f1da..acd5423aec
      phosphor-webui: srcrev bump 628ba8b33d..3d3e326692
      phosphor-host-postd: srcrev bump 1c16ad897b..f8a20835fb
      phosphor-certificate-manager: srcrev bump 947258dcf1..8f60085ebd
      ipmi-fru-parser: srcrev bump 5fcff6720e..c9508db8d3
      phosphor-logging: srcrev bump 93b1b7c462..aabb92ef56
      phosphor-webui: srcrev bump 3d3e326692..335ac3449f
      phosphor-user-manager: srcrev bump dccee2b7ff..c704519ef2
      openpower-pnor-code-mgmt: srcrev bump 139604e561..4772a944dc
      openpower-debug-collector: srcrev bump 5bc32f24a0..296f116583
      bmcweb: srcrev bump 6141c8b207..6228874eae
      sdbusplus: srcrev bump ad7e686b55..d94226d26f
      phosphor-inventory-manager: srcrev bump d6819c9fcc..3bb98f2901
      sdeventplus: srcrev bump c07ddb5ad6..27b7301a3a
      phosphor-gpio-monitor: srcrev bump bd0904b1e9..3c4a23e776
      phosphor-dbus-monitor: srcrev bump 8e273775ee..0b45a3ce6d
      google-ipmi-sys: srcrev bump acd5423aec..3ebf2dd524
      openpower-occ-control: srcrev bump 1fcff95c38..94df8c9015
      phosphor-webui: srcrev bump 335ac3449f..2f955bd86b
      bmcweb: srcrev bump 6228874eae..43fcbe55bc
      phosphor-webui: srcrev bump 2f955bd86b..cc619bdb09
      phosphor-hwmon: srcrev bump 0956017412..ee73f5bdd1
      phosphor-bmc-code-mgmt: srcrev bump 71f6e739d5..43699ca702
      phosphor-dbus-interfaces: srcrev bump 95fafa87ac..e79a2888b7
      bmcweb: srcrev bump 43fcbe55bc..9712f8ac42
      phosphor-settingsd: srcrev bump e7e46df6ba..4aa8d23723
      witherspoon-pfault-analysis: srcrev bump f4d72d82a1..f715b15c07
      openpower-debug-collector: srcrev bump 296f116583..b618ccbaa7
      openpower-pnor-code-mgmt: srcrev bump 4772a944dc..24bb08cc6c
      entity-manager: srcrev bump b5e32c2396..28dc2dae9f
      phosphor-pid-control: srcrev bump d8a9a19e5a..f77d5a573d
      phosphor-debug-collector: srcrev bump d3d3774262..6916cec8e1
      phosphor-webui: srcrev bump cc619bdb09..1085098beb
      phosphor-rest-server: srcrev bump 4b412ac926..0f7019df1e
      phosphor-state-manager: srcrev bump 6425ab76f5..d998f82bda
      phosphor-user-manager: srcrev bump c704519ef2..045b11231d
      phosphor-inventory-manager: srcrev bump 3bb98f2901..979eb59165
      phosphor-host-postd: srcrev bump f8a20835fb..ba7d1ec68e
      sdbusplus: srcrev bump d94226d26f..841d8d3517
      phosphor-webui: srcrev bump 1085098beb..cb7d29082e
      ipmi-fru-parser: srcrev bump c9508db8d3..5739ac3b37
      phosphor-ipmi-blobs: srcrev bump c9ad5ffbca..1c4d3d34af
      openpower-pnor-code-mgmt: srcrev bump 24bb08cc6c..5c33b4c6e5
      phosphor-ipmi-blobs: srcrev bump 1c4d3d34af..e50d4e4aa5
      phosphor-host-ipmid: srcrev bump 4001191ac3..687a43697c
      entity-manager: srcrev bump 28dc2dae9f..a3f1e72a5a
      phosphor-user-manager: srcrev bump 045b11231d..9891f2f8f3
      sdbusplus: srcrev bump 841d8d3517..076d14af2b
      ipmi-fru-parser: srcrev bump 5739ac3b37..5c787214b1
      ibm-logging: srcrev bump 5b6d0f63c3..9351665a5d
      phosphor-fan-presence: srcrev bump 48df959b59..3e781064f5
      witherspoon-pfault-analysis: srcrev bump f715b15c07..1a0c9176a3
      entity-manager: srcrev bump a3f1e72a5a..ce4367c687
      phosphor-pid-control: srcrev bump f77d5a573d..26e8c6a940
      entity-manager: srcrev bump ce4367c687..9cdeabbad0
      bmcweb: srcrev bump 9712f8ac42..f12894f8bd
      phosphor-hwmon: srcrev bump ee73f5bdd1..0dd0c4d728
      phosphor-state-manager: srcrev bump d998f82bda..acf54d089b
      entity-manager: srcrev bump 9cdeabbad0..57cf32d9fe
      ipmi-fru-parser: srcrev bump 5c787214b1..19bea9ae44
      Add Romulus to examples in README
      bmcweb: srcrev bump f12894f8bd..35a62c7ca3
      phosphor-webui: srcrev bump cb7d29082e..d7557e5c00
      phosphor-pid-control: srcrev bump 26e8c6a940..65ea92e7ff
      entity-manager: srcrev bump 57cf32d9fe..c1aff3a71d
      Disable systemd-coredump from phosphor layer
      jsnbd: srcrev bump fa1d37502c..d5b9857609
      ipmi-fru-parser: srcrev bump 19bea9ae44..69418ebc49
      bmcweb: srcrev bump 35a62c7ca3..af996fe4d1
      phosphor-net-ipmid: srcrev bump b00f8f7fdb..cc90c803e6
      phosphor-pid-control: srcrev bump 65ea92e7ff..f3252315f3
      phosphor-objmgr: srcrev bump cfe3e4424e..0570c6940c
      phosphor-debug-collector: srcrev bump 90d147a1ee..6916cec8e1
      ipmi-fru-parser: srcrev bump 69418ebc49..84c416125b
      phosphor-dbus-interfaces: srcrev bump e79a2888b7..08dc907b5f
      phosphor-pid-control: srcrev bump f3252315f3..7af157b10e
      phosphor-logging: srcrev bump aabb92ef56..f18bf836d2
      openpower-occ-control: srcrev bump 94df8c9015..5902d5f99c
      openpower-vpd-parser: srcrev bump 6e3c2b7a75..6c830e9dfa
      s2600wf-misc: srcrev bump 7f848c3e96..139cb575a2
      sdeventplus: srcrev bump 27b7301a3a..08ebb3993a
      phosphor-pid-control: srcrev bump 7af157b10e..e725286473
      phosphor-led-sysfs: srcrev bump 8609c65aaa..e0844ff447
      phosphor-webui: srcrev bump d7557e5c00..243e6caf71
      witherspoon-pfault-analysis: srcrev bump 1a0c9176a3..d3e4dad309
      openpower-host-ipmi-flash: srcrev bump 04d75136b4..ee70196b0d
      phosphor-certificate-manager: srcrev bump 8f60085ebd..4ab5f5cc9a
      bmcweb: srcrev bump af996fe4d1..66ac2b8ca5
      phosphor-net-ipmid: srcrev bump cc90c803e6..f6110552bd
      ipmi-fru-parser: srcrev bump 84c416125b..355c561df2
      phosphor-pid-control: srcrev bump e725286473..4fd8cff4a9
      sdbusplus: srcrev bump 076d14af2b..6b4fb2969c
      gpioplus: srcrev bump 88a89bc6bc..8ff581220a
      skeleton: srcrev bump b8da93ed7c..a9427c85f3
      rest-dbus: srcrev bump 3084b80c48..58996aedcc
      bmcweb: srcrev bump 66ac2b8ca5..27826b5f6a
      s2600wf-misc: srcrev bump 139cb575a2..b9d9b33f7f
      phosphor-pid-control: srcrev bump 4fd8cff4a9..c959c42960
      rest-dbus: srcrev bump 58996aedcc..403ce23066
      inarp: srcrev bump 6e296617f0..6d579909fc
      openpower-proc-control: srcrev bump b3d71312fc..f0d958dff5
      phosphor-objmgr: srcrev bump 0570c6940c..5935b1e351
      phosphor-webui: srcrev bump 243e6caf71..4640320d19
      phosphor-logging: srcrev bump f18bf836d2..3922d1bbda
      openpower-host-ipmi-oem: srcrev bump a9915b76b4..5dd0c1b689
      openpower-proc-control: srcrev bump f0d958dff5..f78d904209
      phosphor-dbus-interfaces: srcrev bump 08dc907b5f..a1acf5c639
      bmcweb: srcrev bump 27826b5f6a..c70f153548
      phosphor-certificate-manager: srcrev bump 4ab5f5cc9a..a1c5595675
      phosphor-fan-presence: srcrev bump 3e781064f5..1cfc2f11b1
      phosphor-pid-control: srcrev bump c959c42960..4b50106d75
      slpd-lite: srcrev bump 1f12e3805a..a592888328
      phosphor-webui: srcrev bump 4640320d19..35d18cbc34
      phosphor-gpio-monitor: srcrev bump 3c4a23e776..dace680fa4
      phosphor-host-postd: srcrev bump ba7d1ec68e..14c5d6f7af
      phosphor-led-manager: srcrev bump 2ff07f3fb6..91ac8d3aad
      phosphor-hwmon: srcrev bump 0dd0c4d728..db7ecb6aaa
      phosphor-networkd: srcrev bump 548e9f13d2..798c28119c
      phosphor-host-ipmid: srcrev bump 687a43697c..98c7bfc128
      openpower-pnor-code-mgmt: srcrev bump 5c33b4c6e5..ea4e6aee07
      phosphor-fan-presence: srcrev bump 1cfc2f11b1..22c36ab6b4
      phosphor-settingsd: srcrev bump 4aa8d23723..414db5a810
      entity-manager: srcrev bump c1aff3a71d..8ca708689f
      phosphor-webui: srcrev bump 35d18cbc34..569ccf66e5
      phosphor-logging: srcrev bump 3922d1bbda..f8d38bbebe
      phosphor-fan-presence: srcrev bump 22c36ab6b4..8ce4b5f55a
      bmcweb: srcrev bump c70f153548..162be7b8b8
      phosphor-time-manager: srcrev bump ab4cc6a558..1f1d8e012f
      mboxbridge: srcrev bump 5f86227e16..fab672bde6
      phosphor-hwmon: srcrev bump db7ecb6aaa..0e74975747
      phosphor-webui: srcrev bump 569ccf66e5..1cc7021c9e
      phosphor-host-ipmid: srcrev bump 98c7bfc128..b0431c7987
      mboxbridge: srcrev bump fab672bde6..5a124ea012
      phosphor-led-manager: srcrev bump 91ac8d3aad..555a279efd
      phosphor-dbus-interfaces: srcrev bump a1acf5c639..8d656133b3
      phosphor-inventory-manager: srcrev bump 979eb59165..6e94b65268
      phosphor-fan-presence: srcrev bump 8ce4b5f55a..52fbe0d934
      openpower-proc-control: srcrev bump f78d904209..1f733b3d82
      phosphor-ipmi-blobs: srcrev bump e50d4e4aa5..df53de1f72
      phosphor-net-ipmid: srcrev bump f6110552bd..9e801a2b5b
      openpower-proc-control: srcrev bump 1f733b3d82..5970484133
      phosphor-net-ipmid: srcrev bump 9e801a2b5b..a65e30df5d
      phosphor-ipmi-ethstats: srcrev bump d26fff4ecd..ee22bfb566
      phosphor-pid-control: srcrev bump 4b50106d75..ba3c8c1c15
      phosphor-ipmi-blobs: srcrev bump df53de1f72..45e428a2b2
      ipmi-fru-parser: srcrev bump 355c561df2..1816ff30cf
      openpower-occ-control: srcrev bump 5902d5f99c..29a8ed18cc
      google-ipmi-i2c: srcrev bump 38e8c6e170..ad05703ce0
      google-ipmi-sys: srcrev bump 3ebf2dd524..ff40f273a7
      entity-manager: srcrev bump 8ca708689f..d534f7433d
      phosphor-logging: srcrev bump f8d38bbebe..30047bf964
      phosphor-state-manager: srcrev bump acf54d089b..436f3b8815
      google-ipmi-sys: srcrev bump ff40f273a7..96b088a7d8
      phosphor-webui: srcrev bump 1cc7021c9e..bc5cc7f75c

Andrew Jeffery (1):
      witherspoon: Require openbmc-openpower configuration

AppaRao Puli (1):
      Default channel config JSON data

Armin Kuster (1):
      meta-openembedded: sumo refresh b0950aeff5..be79b8b111

Awais Belal (1):
      bitbake: toaster: Fix bitbake flexible path error from Bugzilla
#12891

Benjamin Fair (7):
      npcm7xx: kernel: replace linux-obmc with linux-nuvoton
      nuvoton: move npcm7xx support into meta-nuvoton layer
      meta-phosphor: nuvoton-layer: add gpio-keys kernel feature
      phosphor-host-postd: allow configuring the daemon
      nuvoton: Set LAYERSERIES_COMPAT
      meta-nuvoton: evb-npcm750: disable MTD image generation
      linux-nuvoton: move to v4.17.14

Brad Bishop (95):
      openpower: Set LAYERSERIES_COMPAT
      ingrasys: Set LAYERSERIES_COMPAT
      ibm: Set LAYERSERIES_COMPAT
      initfs: Move to initrdscripts
      initfs: Add proper license variables
      initfs: set package arch
      initfs: add missing dependencies
      aspeed: Add ASPEEDBASE
      phosphor: Rename bb file collection
      autoconf-archive: update to version to 2018.03.13
      remove use of meta-virtualization
      import-layers: Drop meta-virtualization
      Sumo refresh
      poky: sumo refresh 874976b..45ef387
      phosphor-bmc-code-mgmt: srcrev bump 28b2ba4a2d..76c79df3fc
      phosphor-logging: srcrev bump 477b731ad0..9fab279fb3
      phosphor-webui: srcrev bump 1073c1490f..dc36acc943
      phosphor-pid-control: srcrev bump 64f072a74c..40be36ac31
      phosphor-snmp: srcrev bump f3fac2228a..f4ecf88338
      phosphor-rest-server: srcrev bump 3a9a51c969..6691e7ca4e
      bmcweb: srcrev bump b79d4eef01..9b243a4ee4
      pyphosphor: srcrev bump 216b518a3c..f63e191ca6
      skeleton: srcrev bump 5da4f4fc17..d7a8ba5b58
      openpower-pnor-code-mgmt: srcrev bump c39d923fee..8be32f7ba3
      meta-openpower: Move layer content from common/
      skeleton: zaius: fix broken gpio config path
      meta-phosphor: Move layer content from common/
      meta-arm: Move layer content from common/
      skeleton: lanyang: fix broken gpio config path
      meta-raspberrypi: sumo refresh 05f21adb99..ade31d6d01
      skeleton: s2600wf: fix broken gpio config path
      phosphor-tiny: preserve existing distro overrides
      poky: sumo refresh 45ef387cc5..51872d3f99
      meta-raspberrypi: sumo refresh ade31d6d01..2d40b00002
      meta-ibm: Add license information
      witherspoon: workbook: drop devtree-config recipe
      witherspoon: REST: Move com.ibm to IBM layer
      meta-evb: Add license information
      aspeed: license: whitespace fixes
      meta-openpower: license: whitespace fixes
      meta-phosphor: license: whitespace fixes
      meta-openpower: Rename bb file collections
      meta-nuvoton: License wording cleanup
      meta-ibm: Rename bb file collections
      poky: sumo refresh 51872d3f99..3b8dc3a88e
      meta-openpower: maintainers: remove subtree words
      meta-phosphor: maintainers: remove subtree words
      phosphor: pcie: drop unused pcie-detect recipe
      meta-ibm: Add maintainers file
      meta-openembedded: sumo refresh be79b8b111..2bb21ef27c
      quanta: Add a layer license
      arm: Add a layer license
      packagegroups: Remove obmc-phosphor-license
      ingrasys: Add a layer license
      qualcomm: Add a layer license
      ibm: phosphor-image: minor style fix
      inventec: Add a layer license
      intel: Add a layer license
      quanta: layer.conf: Add QUANTABASE
      Add meta-xilinx subtree
      inventec: layer.conf: Add INVENTECBASE
      openpower: op-apps: Remove obmc-phosphor-license
      arm-apps: Remove obmc-phosphor-license
      intel-apps: Remove obmc-phosphor-license
      poky: sumo refresh 3b8dc3a88e..36d5cee56b
      openpower: Remove unused inventory-upload
      poky: sumo refresh 36d5cee56b..d240b885f2
      meta-phosphor: switch to meta-oe libcereal
      meta-phosphor: openssl: drop FILESEXTRAPATH
      meta-phosphor: temp remove PV for git recipes
      ipmi: host, net, oem srcrev bumps
      phosphor-mapper: Drop blacklist feature
      phosphor-objmgr: srcrev bump db27894204..cfe3e4424e
      phosphor: net-snmp: drop FILESEXTRAPATH
      openbmc: Add top-level link to poky/meta-skeleton
      phosphor-mapper: Add service namespaces
      openpower: Add to new mapper service whitelist
      ibm: Add to new mapper service whitelist
      openpower: pdbg: Set PV for git fetcher
      ibm: remove deprecated mapper path whitelist
      openpower: remove deprecated mapper path whitelist
      phosphor: distro: fix up uninative removal
      phosphor: distro: remove meta-poky content
      phosphor-mapper: remove deprecated path whitelist
      dbus-broker: fetch submodules too
      meta-phosphor: master refresh 3026b0fa5a..d76a657a63
      meta-inventec: master refresh cdec61e8ce..29d7566385
      meta-qualcomm: master refresh 2d5d845e7d..7272549020
      meta-quanta: master refresh bfbdc52828..a20f4c0ddd
      meta-phosphor: master refresh d71a48b236..f05db6a860
      meta-openpower: master refresh afc774a7f5..e9a2e1a2d8
      meta-ibm: master refresh baedc91099..a00d9b8a84
      meta-opnepower: master refresh e9a2e1a2d8..39ab114ed6
      meta-ingrasys: master refresh 94d26b9f7d..c5f9312e58
      meta-phosphor: master refresh c9d91120a2..1795f38b6f

Brian Yang (5):
      meta-lanyang: Rename obmc-console recipe
      meta-lanyang: add Lanyang config recipe
      meta-lanyang: add AVSBus script, services
      meta-lanyang: add LED recipe
      meta-lanyang: add IPMI recipe

Chen Qi (1):
      libfastjson: backport patch to fix compilation error

Dave Cobbley (4):
      [Subtree] Removing import-layers directory
      [Subtree] Move board support packages to top level
      [Subtree] Bring openbmc machines to top level
      Fixing bblayers conf versioning

David Cobbley (1):
      Seperate OpenBMC and Poky Distro

Dawid Frycki (1):
      Add IPMB bridge recipe

Deepak Kodihalli (8):
      openpower: inventory-config: fix-up interface
      webui: serve via nginx
      Revert "Disable forwarding of journal to syslog"
      Restructure phosphor-logging recipe
      Pull rsyslog into image
      Add new logging package
      Add setting to toggle rest api logging
      nginx: generate certificate on reload

Ed Tanous (6):
      Add recipe for phosphor-ipmi-kcs
      Fix bmcweb socket activation
      Add cjson recipe
      Allow use of insecure hashes in openssl-native
      meta-phosphor: Move to dbus-broker
      Allow mapper to introspect ObjectManager interface

Eddie James (1):
      busybox: patch "umount: ignore -c"

Fritjof Jonsson (2):
      Add recipe for cereal, a header-only C++11 serialization library.
      Move lonely libcereal from meta to meta-oe

Gunnar Mills (6):
      skiboot: bump to v6.1
      Add recipes-phosphor to Palmetto's recipes.txt
      Spelling fixes
      Spelling fixes
      Spelling fixes
      Spelling fixes

Ivan Mikhaylov (3):
      fsp2: move to 4.17.18
      add uImage kernel-imagetype for fsp2
      fsp2: add bsp(u-boot) recipe

James Feist (10):
      Fix license md5
      meta-phosphor: Update nlohmann-json
      meta-intel: Add d-bus sensors recipe
      nlohmann-json: Add recipe
      nlohmann-json: Add symlink to json.hpp and update to 3.3.0
      valijson: Add recipe
      meta-phosphor: remove nlohmann-json
      meta-intel: remove boost-dbus
      meta-phosphor: Add entity-manager recipe
      meta-intel: s2600wf: add entity-manager

Jason M. Bills (2):
      Intel: Add recipe for Intel-specific IPMI support
      meta-intel: Add intel-ipmi-oem to the Intel apps packagegroup

Jayanth Othayoth (1):
      Disable nslcd service restart during certificate upload

Joel Stanley (39):
      kernel: FSI fixes, FSI ColdFire master, AST2400 scratch regs
      kernel: Move to 4.17.7 stable release
      gcc: Backport fixes for std::pair high memory usage
      aspeed-kernel: ast2400: Remove DRM and unused FSI drivers
      u-boot-aspeed: Minor fixes and platform.S updates
      gcc-7.3: Fix build on ppc64le hosts
      kernel: GCC8 fixes, FSI I2C update, ASPEED USB gadget fix
      kernel: Move to 4.17.11 stable release
      cf-fsi-firmware: Update to v4
      openpower: Add ASPEED LPC Control tool
      Use ColdFire FSI interface on Palmetto (P8)
      kernel: Move to v4.17.14 stable release
      phosphor: Remove 'pflash -i' service
      kernel: ast2400 MTD, FSI ColdFire
      openpower: Add ColdFire firmware to initrd
      kernel: Use new FSI chardev system
      kernel: Move Romulus to ColdFire FSI driver
      meta-openbmc-machines: Remove Barreleye
      linux: Move to 4.17.18 stable release
      linux: Move to 4.17.18 stable release
      linux: Move to 4.18 based tree
      aspeed-lpc-ctrl: bump to version 0.2
      pdbg: bump to latest upstream
      linux-aspeed: Romulus battery ADC, NCSI netlink fix
      linux-aspeed: Update to 4.18.7 stable tree
      meta-aspeed: Document myself as maintainer
      linux-aspeed: Disable CONFIG_BPF_STREAM_PARSER
      linux-aspeed: i2c irq fixes
      linux-aspeed: Move to 4.18.8 stable release
      linux: Move to 4.18 based tree
      linux-aspeed: Fix UBI regression
      linux-aspeed: Add internal RTC driver
      linux-aspeed: Move to 4.18.12
      openpower: pdbg: Remove stray patch
      openpower: pdbg: Update to latest upstream
      openpower: Add myself to maintainers
      pdbg: Bump to v2.0
      romulus: Remove avbus-workaround
      linux-aspeed: Move to 4.18.16

Joseph Reynolds (4):
      Nginx adds http security headers
      Disable medium-strength dropbear ssh ciphers
      Nginx allow secure websocket connections
      Dropbear SSH remove HMAC-MD5

Khem Raj (3):
      m4: Workaround gnulib's fseeko.c implementation
      bison: Fix build break with glibc 2.28
      dbus-broker: Upgrade to latest and fix build on musl

Kun Yi (3):
      Add sdeventplus to DEPENDS/RDEPENDS
      meta-quanta: q71l: Update IPMI sensor config YAML to include rExp
      meta-ingrasys: zaius: Update sensor config YAML to include rExp

Lei YU (23):
      Add manifest and signature for fixed flash layout
      linux-aspeed: Fix defconfig SRC_URI
      phosphor-software-manager: ubifs_layout package config
      meta-romulus: Enable image signature check
      image_type_phosphor: refactor signatures generation
      meta-romulus: Add led groups for faults
      phosphor-reboot-host: Use environment file for sleep
      meta-romulus: Increase delay in host reboot
      obmc-init: Add factory reset support
      meta-romulus: Add ipmi channel.yaml
      meta-romulus: Add ipmi bmc-fru-config.yaml
      meta-romulus: sort ipmi sensor config
      meta-romulus: Add entityID/entityInstance to sensor config
      meta-romulus: ipmi: Add core/dimm temp sensors
      meta-romulus: Add missing sensorNamePattern in sensor config
      meta-palmetto: Update occ sensor names
      Make obmc-flash-bmc-setenv common for static and ubi
      phosphor-software-manager: Add MEDIA_DIR config
      phosphor-software-manager: Add ACTIVE_BMC_MAX_ALLOWED config
      meta-romulus: Add iio-hwmon-battery config
      meta-romulus: Add ipmi configs
      meta-palmetto: Update ipmi sensor config yaml
      meta-romulus: Add GPIOCHIP in iio-hwmon-battery.conf

Manojkiran Eda (1):
      Remove hidden-files in coredump(dir) during boot

Marri Devender Rao (4):
      SNMP error notification for error log entry objects
      phosphor-certificate-manager: Add recipe and certificate service
      Fix MD5 sum digest number in certificate recipes
      phosphor-certificate-manager: Package nginx and nslcd services

Matt Spinler (14):
      Add dependency to the chassis state service
      Tell phosphor-logging about the LED error yaml
      Tell phosphor-logging about the sw-mgr error yaml
      Install GPIO definition JSON
      Add Witherspoon GPIO JSON
      Add Romulus GPIO JSON
      Add Palmetto GPIO JSON
      Add Zaius GPIO JSON
      Add Lanyang GPIO JSON
      Add S2600WF GPIO JSON
      wspoon: Start PSEQ monitor after power workarounds
      wspoon: Error policy table version 1.7.5
      wspoon: Add IR35221 hwmon I/V/P monitoring
      Remove pam_systemd.so from common-session pam conf

Mingli Yu (1):
      libfastjson: Upgrade to 0.99.8

Nagaraju Goruganti (3):
      Get whitelisted URLs -json
      Get whitelisted URLs - openpower json
      Get whitelisted URLs - witherspoon json

Patrick Venture (260):
      recipes-phoshor: fans: add phosphor-pid-control
      phosphor-pid-control: enable OEM IPMI handler
      first commit
      meta-google: Add initial configuration layer
      phosphor-hwmon: add gpioplus dependency
      meta-google: add google-ipmi-sys package
      recipes-google: google-ipmi-sys: recipe cleanup
      meta-google: add google-ipmi-sys to obmc-phosphor-image
      meta-phosphor: add phosphor-ipmi-blobs package
      meta-zaius: phosphor-hwmon: add machine suffix
      meta-zaius: phosphor-hwmon: add iio-hwmon confs
      meta-zaius: obmc-phosphor-image: add machine suffix
      meta-zaius: obmc-libobmc-intf: add machine suffix
      meta-zaius: phosphor-ipmi-sensor-inventory: add machine suffix
      meta-zaius: phosphor-ipmi-fru-properties: add machine suffix
      meta-zaius: p9-host-start: add machine suffix
      meta-zaius: checkstop-monitor: add machine suffix
      meta-zaius: phosphor-hwmon: add onewire confs
      meta-zaius: phosphor-hwmon: add hotswap conf
      meta-zaius: phosphor-hwmon: add pwm-tacho-controller
      meta-zaius: phosphor-ipmi-sensor-inventory: add fan_tach
      meta-zaius: phosphor-ipmi-sensor-inventory: add fan pwm
      meta-zaius: phosphor-ipmi-sensor-inventory: add iio-hwmon
      meta-phosphor: add phosphor-ipmi-ethstats package
      meta-zaius: phosphor-ipmi-sensor-inventory: add onewire
      meta-openpower: phosphor-software-manager add distro suffix
      meta-openpower: obmc-phosphor-initfs add distro suffix
      meta-openpower: phosphor-rest add distro suffix
      meta-openpower: phosphor-webui add distro suffix
      meta-google: google-ipmi-sys_git.bb: cleanup
      meta-google: drop in LICENSEs: MIT and Apache-2.0
      meta-google: enable ipmi-ethstats and ipmi-blobs
      meta-phosphor: phosphor-ipmi-blobs: add logging dependency
      meta-phosphor: set phosphor-pid-control as git recipe
      meta-phosphor: hwmon: set as git recipe
      meta-google: add maintainers file
      meta-ibm: palmetto: rename phosphor-hwmon bbappend
      meta-ibm: romulus: rename phosphor-hwmon
      meta-ibm: witherspoon: rename phosphor-hwmon
      meta-openpower: op-proc-control: rename as git
      meta-openpower: openpower-dbus-interfaces: rename as git
      meta-ingrasys: zaius: rename phosphor-hwmon
      meta-phosphor: set phosphor-host-postd as git recipe
      meta-phosphor: host-postd: drop RDEPENDS
      meta-quanta: q71l: rename phosphor-hwmon bbappend
      meta-qualcomm: centriq2400-rep: phosphor-hwmon to _%
      meta-phosphor: led-sysfs: rename as git
      meta-phosphor: user-manager: rename as git recipe
      meta-ibm: phosphor-gevent: set append wildcard
      meta-ibm: phosphor-rest: set append wildcard
      meta-phosphor: ipmi-net: rename recipe as git
      meta-phosphor: dbus-interfaces: rename as git recipe
      meta-phosphor: ipmi-bt: rename as git
      meta-phosphor: mapper: rename as git
      meta-phosphor: slpd-lite: rename as git
      meta-phosphor: rest-dbus: rename as git
      meta-phosphor: ffdc: rename as git
      meta-phosphor: inarp: rename as git
      meta-phosphor: ipmi-tool: rename as git
      meta-phosphor: watchdog: rename as git recipe
      openpower: phosphor-rest: set append wildcard
      openpower: phosphor-webui: set append wildcard
      meta-phosphor: gpio-monitor: Add symlink as git
      meta-openpower: debug-collector: rename as git
      meta-phosphor: network: Add symlink to git
      meta-phosphor: logging: Add symlink to git
      meta-phosphor: state-manager: Add symlink to git
      meta-openpower: openpower-ipmi-oem: rename as git
      meta-phosphor: gevent: rename as git
      meta-google: added details to readme
      meta-phosphor: rest: rename as git
      meta-phosphor: webui: rename as git
      meta-openpower: phosphor-logging: set version wildcard
      meta-ibm: witherspoon: gpio-monitor: set version wildcard
      meta-ibm: witherspoon: network: set version wildcard
      meta-ibm: romulus: state-manager: set version wildcard
      class: obmc-phosphor-ipmiprovider-symlink: Add IPMI Blobs
      meta-phosphor: ipmi: phosphor-ipmi-hw-example: rename as git
      meta-phosphor: flash: software-manager-error-native: set as git
      meta-phosphor: host: obmc-op-control-host: rename as git
      meta-phosphor: chassis: obmc-button-power: rename as git
      meta-phosphor: chassis: obmc-button-reset: rename as git
      meta-phosphor: flash: obmc-flash-bios: rename as git
      meta-phosphor: fans: obmc-control-fan: rename as git
      meta-phosphor: flash: obmc-op-flasher: rename as git
      meta-phosphor: chassis: obmc-mgr-inventory: rename as git
      meta-phosphor: chassis: obmc-control-chassis: rename as git
      meta-phosphor: devtools: obmc-pydevtools: rename as git
      meta-phosphor: flash: obmc-flash-bmc: rename as git
      meta-phosphor: flash: obmc-mgr-download: rename as git
      meta-phosphor: system: obmc-mgr-system: rename as git
      meta-phosphor: obmc-inventory: rename as git
      meta-phosphor: led-manager: rename as git
      meta-phosphor: phosphor-led-manager-config-example-native: rename
as git
      meta-phosphor: phosphor-led-manager-error-native: rename as git
      meta-phosphor: system: obmc-control-bmc: rename as git
      meta-phosphor: ipmi-fru: rename recipe as git
      meta-phosphor: ipmi-host: Add symlink as git
      meta-phosphor: dbus: dbus-monitor: add symlink as git
      meta-phosphor: mboxd: add symlink as git
      meta-phosphor: phosphor-debug-collector: Add symlink as git
      meta-phosphor: phosphor-fan: Add symlink as git
      meta-ibm: palmetto: config: rename as git
      meta-ibm: romulus: config: rename as git
      meta-ibm: witherspoon: config: rename as git
      meta-ibm: bmcweb: set wildcard
      meta-ibm: witherspoon: phosphor-settings-manager: set wildcard
      meta-ibm: witherspoon: obmc-op-control-power: set wildcard
      meta-inventec: lanyang: config: rename as git
      meta-ingrasys: zaius: config: rename as git
      meta-ingrasys: zaius: phosphor-settings-manager: set wildcard
      meta-ingrasys: zaius: gpio-monitor: set version wildcard
      meta-ibm: phosphor-debug-collector: set version wildcard
      meta-ibm: witherspoon: dbus-monitor: set version wildcard
      meta-ibm: witherspoon: mboxd: set version wildcard
      meta-ibm: witherspoon: phosphor-ipmi-host: set version wildcard
      meta-ibm: romulus: phosphor-ipmi-host: set version wildcard
      meta-ibm: romulus: mboxd: set version wildcard
      meta-ibm: romulus: phosphor-fan: set version wildcard
      meta-phosphor: chassis: obmc-op-control-power: rename as git
      meta-phosphor: bmcweb: rename as git
      meta-phosphor: settings-manager: rename as git
      meta-quanta: q71l: phosphor-ipmi-fru version wildcard
      meta-inventec: lanyang: phosphor-ipmi-fru version wildcard
      meta-inventec: lanyang: mboxd: set version wildcard
      meta-ingrasys: zaius: mboxd: set version wildcard
      openpower: phosphor-rest: set wildcard to version
      openpower: phosphor-webui: set wildcard to version
      meta-ibm: phosphor-gevent: set wildcard to version
      meta-ibm: phosphor-rest: set wildcard to version
      meta-ingrasys: zaius: phosphor-settings-manager: set version
wildcard
      meta-ibm: bmcweb: set version wildcard
      meta-ibm: witherspoon: phosphor-settings-manager: set version
wildcard
      meta-google: restructured the README per norms
      meta-phosphor: python: pyphosphor: rename as git
      meta-phosphor: sdbusplus: rename as git
      meta-openpower: fsidbg: rename as git
      meta-phosphor: inventory-manager: rename as git
      meta-openpower: phosphor: host: aspeed-lpc-ctrl
      meta-openpower: occ: openpower-occ-control: rename as git
      meta-phosphor: logging: change version
      meta-phosphor: network: change version
      meta-phosphor: state-manager: change version
      meta-phosphor: gpio-monitor: change version
      meta-ibm: witherspoon: logging: ibm-logging: add wildcard
      meta-ibm: logging: ibm-logging: rename as git
      meta-ibm: witherspoon: logging: ibm-logging: set version wildcard
      meta-phosphor: ipmi-fru: add phosphor-logging dependency
      meta-ibm: witherspoon: openpower-software-manager: set wildcard
      meta-ibm: dbus: ibm-dbus-interfaces: rename as git
      meta-mellanox: msn: mlx-ipmid: rename as git
      meta-phosphor: fan: change version
      meta-phosphor: phosphor-debug-collector: change version
      meta-phosphor: mboxd: change version
      meta-phosphor: dbus: dbus-monitor: change version
      meta-phosphor: ipmi-host: change version
      meta-openpower: flash: software-manager: rename as git
      meta-ibm: witherspoon: gpio-monitor: drop symlink
      meta-ibm: witherspoon: network: drop symlink
      meta-ibm: witherspoon: phosphor-ipmi-host: drop symlink
      meta-ibm: witherspoon: openpower-software-manager: set version
wildcard
      meta-ibm: witherspoon: mboxd: drop symlink
      meta-ibm: witherspoon: dbus-monitor: drop symlink
      meta-ingrasys: zaius: gpio-monitor: drop symlink
      meta-ibm: romulus: phosphor-fan: drop symlink
      meta-ibm: phosphor-debug-collector: drop symlink
      meta-ibm: romulus: state-manager: drop symlink
      meta-ibm: romulus: phosphor-ipmi-host: drop symlink
      meta-ibm: romulus: mboxd: drop symlink
      meta-inventec: lanyang: mboxd: drop symlink
      meta-ingrasys: zaius: mboxd: drop symlink
      meta-openpower: phosphor-logging: drop symlink
      meta-intel: s2600wf: config; rename as git
      meta-phosphor: network: drop symlink
      meta-phosphor: dbus: dbus-monitor: drop symlink
      meta-phosphor: ipmi-host: drop symlink
      meta-phosphor: gpio-monitor: drop symlink
      meta-phosphor: phosphor-debug-collector: drop symlink
      meta-phosphor: mboxd: drop symlink
      meta-phosphor: fan: drop symlink
      meta-phosphor: logging: drop symlink
      meta-phosphor: state-manager: drop symlink
      meta-phosphor: skeleton: obmc-libobmc-intf: Add symlink to git
      meta-inventec: lanyang: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-inventec: lanyang: skeleton: obmc-libobmc-intf: drop symlink
      meta-ibm: palmetto: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-ibm: romulus: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-ibm: witherspoon: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-ingrasys: zaius: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-openpower: openpower-fru-vpd: Add symlink to git
      meta-intel: s2600wf: skeleton: obmc-libobmc-intf: set version
wildcard
      meta-intel: s2600wf: skeleton: obmc-libobmc-intf: drop symlink
      meta-google: add google-ipmi-i2c package
      meta-phosphor: led-manager-*_git: add package version
      meta-phosphor: skeleton: obmc-libobmc-intf: drop preferred
      meta-google: add google-ipmi-i2c to obmc-phosphor-image
      meta-ibm: witherspoon: openpower-fru-vpd: set version wildcard
      meta-ingrasys: zaius: skeleton: obmc-libobmc-intf: drop symlink
      meta-ibm: witherspoon: skeleton: obmc-libobmc-intf: drop symlink
      meta-ibm: romulus: skeleton: obmc-libobmc-intf: drop symlink
      meta-ibm: palmetto: skeleton: obmc-libobmc-intf: drop symlink
      meta-openpower: openpower-fru-vpd: drop preferred
      meta-ibm: witherspoon: openpower-fru-vpd: drop symlink
      meta-phosphor: skeleton: obmc-libobmc-intf: drop symlink
      meta-phosphor: phosphor-settings-manager: QA fixup PV
      meta-phosphor: phosphor-software-manager-error-native: QA fixup
PV
      meta-phosphor: ipmi-fru-*-example-native.bb: rename as git
      meta-phosphor: ipmi-fru-*inventory-mrw-native: rename as git
      meta-phosphor: aspeed-layer: cf-fsi-firmware: rename as git
      meta-phosphor: phosphor-software-manager: Add symlink as git
      meta-ibm: witherspoon-pfault-analysis-error-native: rename as git
      meta-ibm: witherspoon-pfault-analysis: rename as git
      meta-ibm: ibm-logging_git: QA fixup PV
      meta-openpower: bsp: skiboot: rename recipes as git
      meta-openpower: openpower-debug-collector: QA fixup PV
      meta-openpower: occ-control-config-example-native: rename as git
      meta-openpower: ipmi-oem-error-native: rename as git
      meta-openpower: openpower-fru-vpd: drop symlink
      meta-ibm: palmetto: set wildcard for mrw-native
      meta-openpower: phosphor-software-manager: set version wildcard
      meta-ibm: romulus: phosphor-software-managerset version wildcard
      meta-ibm: witherspoon: phosphor-software-managerset version
wildcard
      meta-phosphor: phosphor-software-manager: drop preferred
      meta-ibm: witherspoon: phosphor-software-manager: drop symlink
      meta-ibm: romulus: phosphor-software-manager: drop symlink
      meta-openpower: phosphor-software-manager: drop symlink
      meta-phosphor: phosphor-software-manager: drop symlink
      meta-phosphor: rename mrw-patch-native to git
      meta-phosphor: rename mrw-perl-tools-native to git
      meta-phosphor: rename mrw-native to git
      meta-phosphor: obmc-inventory: QA fixup PV
      meta-openpower: ipmi-oem: set LICENSE field
      meta-openpower: dbus-interfaces: set LICENSE field
      meta-openpower: aspeed-lpc-ctrl: set LICENSE field
      meta-openpower: ipmi-oem-error-native: drop extra license
      meta-openpower: ipmi-oem-whitelist-native: set LICENSE field
      meta-ibm: dbus-interfaces: set LICENSE field
      meta-ibm: witherspoon-pfault-analysis-error-native: drop extra
license
      meta-phosphor: obmc-phosphor-debug-tarball.bbclass: set LICENSE
field
      meta-phosphor: obmc-phosphor-image.bbclass: set LICENSE field
      meta-phosphor: obmc-phosphor-flashd: set LICENSE field
      meta-phosphor: obmc-phosphor-sysd: set LICENSE field
      meta-phosphor: host: postd: move service file to repo
      meta-quanta: q71l: enable phosphor-host-postd package
      meta-evb: add EVBBASE
      meta-evb: evb-zx3-pm3: led-manager-config-native: set LICENSE
field
      meta-hxt: add HXTBASE
      meta-hxt: stardragon4800-rep2: stardragon4800-rep2-config: set
LICENSE field
      meta-phosphor: obmc-phosphor-c-daemon.bbclass: drop inherit
license
      meta-phosphor: obmc-phosphor-py-daemon.bbclass: drop inherit
license
      meta-phosphor: skeleton-rev.bbclass: set LICENSE field
      meta-phosphor: skeleton.bbclass: drop inherit license
      meta-phosphor: config-in-skeleton.bbclass: drop inherit license
      meta-phosphor: mrw-native: set LICENSE field
      meta-ibm: palmetto: set mrw license
      meta-ibm: romulus: set mrw license
      meta-ibm: witherspoon: set mrw license
      meta-ibm: palmetto: set wildcard for version for mrw-native
      meta-phosphor: drop obmc-phosphor-license.bbclass
      meta-phosphor: ipmi-host: add sdeventplus dependency

Ratan Gupta (8):
      Add recipe for phosphor-snmp
      ldap: Add distro feature for LDAP
      ldap: Pull nss-pam-ldapd into the openbmc image
      ldap: Removing the openldap server related packages
      ldap: Enable name service cache daemon
      Moving fstab file into subdirectory
      nsswitch: Add LDAP lookup in passwd, group and shadow maps
      PAM:Enable password history pam module

Richard Marian Thomaiyar (9):
      Add privilege related groups
      Squashed 'import-layers/meta-security/' content from commit
4d139b9
      Add group names based on recipe
      Create ipmi folder under /run and /var/lib.
      Remove shadow package from initramfs
      Enforce password security through pam
      Include pam-ipmi recipe
      Add ipmi group in phosphor-ipmi-net
      Enable pam-ipmi modules in pam password stack

Richard Purdie (1):
      bitbake: tests/fetch: Update gnome.org urls after upstream
changes

Ross Burton (1):
      python2: Fix build with gcc8

Stewart Smith (1):
      Update README.md for Fedora 28, fixing missing build-dep

Tom Joseph (8):
      Fix to speed up boot to BMC Ready state
      Correct the dependency for state related service files
      Add shadow package to the rootfs
      Add dependency with boost for user manager changes.
      Add python library pamela as a dependency of phosphor-rest-server
      ipmi: Add dependency to iptables
      phosphor-ipmi-config: Refactor phosphor-ipmi-config provider
      ipmi-net: Restore the persisted iptables filter

Vernon Mauery (3):
      Bump ipmitool revision
      rename libapphandler.so to libipmi20.so
      boost: build context and coroutine for arm

Vijay Khemka (3):
      Introducing meta-facebook
      Add Preferred provider for obmc-host-ctl
      Add Entity Manager to Facebook Tiogapass

William A. Kennington III (12):
      sdeventplus: Add package
      gpioplus: Add library
      phosphor-watchdog: Enable sdeventplus support
      phosphor-state-manager: Depend on sdeventplus
      witherspoon-pfault-analysis: Add sdeventplus DEPEND
      phosphor-hwmon: Don't explicitly set RDEPENDS
      phosphor-hwmon: Depend on sdeventplus
      phosphor-dbus-monitor: Remove unneeded RDEPENDS
      phosphor-dbus-monitor: Add sdeventplus DEPEND
      phosphor-fan: Remove unneeded RDEPENDS
      phosphor-fan: Depend on sdeventplus
      phosphor-fan-presence: Depend on gpioplus

William A. Kennington III via Openembedded-devel (1):
      dbus-broker: update to 16

Yong Li (1):
      Set correct obmc-host-ipmi-hw for s2600wf

Yuan Yao (1):
      Add meta-hxt and meta-stardragon-rep2
