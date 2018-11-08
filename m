Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LvN/DBd6"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rCxg2SCHzDqVD
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 17:27:18 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id v198-v6so16069848oif.2
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 22:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBVpC/wwB5kvTvY/DoVxMhGckrbzRQySK34m9+wwq08=;
 b=LvN/DBd6swdljwvcknxsNaxCtzyAPycGiGiiHK2t3MxJEBBl+XEua5KQV4yzeN0Z7y
 xrnFzSKJh0OmZxaJOwg/segRsI4M6CtycXn+jWIYno6O6jN6HIuOnoWoOzDS9Trit9Go
 3/xj9tCw6VB/lR718cqmYQffubhBok+jiPzHr9jVfb/PNYRbFzd1rJSq7AlYyf6hMUlX
 ZnFycI3JQLg+rQwLJoV/3xvvHy20mkakZMv/vwYQZEfQ7deBuceco5lny+2iqXgCklMH
 AcLrmefmmSR68mLNVELga5wDBILxuZC8QZN+5kH4wui0FqWVdlwpavB+d7LWGAFPAV2e
 wDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBVpC/wwB5kvTvY/DoVxMhGckrbzRQySK34m9+wwq08=;
 b=sqMiSLtxG8yu4YP5CXg7UALuz2GnB5r75Qh8OIq8HyJZNq3DykBbEHoPKITiANBuUv
 FC7RtjeCqLzC0djPFWYykJPEtCvtIucETpYIhMn8KEUllAOd63XB0a9lZ3/jKo4jmx8k
 3TAq40z4mZi/hyOS/1t374ay3tue4pFFh5acI/xzQKjXkyfSepDlzjxyFrZk/OabwJ8p
 ZNBnkDKRV25OTQtJWtdxOkJ8DmTY7xPqZEB93zRqTr60LXp8vtKOsgYgZWPBOTiGoffr
 3V1K9DJXVaySH8q/0KGjLfNinleVyiQG/ILAMpAwqbxc3gNvIBPtpLORmU4B2zZSvZVP
 fdhQ==
X-Gm-Message-State: AGRZ1gJT4w1qGGAyzgNydHTJN/9hC/xBP4nUkpwdLLzfLsTgosKcV/gc
 W1cr3A+qFhYGrDT37o79+LtpHZoxq/HdSsGkzP8=
X-Google-Smtp-Source: AJdET5f15P1DYLCbGDul1jn2heQosmX96rUt5S7PP9j6Um4mQtkk4E3mSOPUSThi8TQxw4lB/iMev6vHuA+XY0e0jsM=
X-Received: by 2002:aca:d694:: with SMTP id
 n142-v6mr1843207oig.32.1541658436271; 
 Wed, 07 Nov 2018 22:27:16 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
 <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
 <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
 <CAN9Jwz32MtVCdXtfF-iJhEc6bHgbtddz6ETGQ1Sik-s2+_B3AA@mail.gmail.com>
 <CAGMNF6WJiNJC0GMSb9PuC+HPvx+PjwwL2wqmcoLVMcUob0TtYQ@mail.gmail.com>
 <CAE33tLEuF0DXJvdPxA1xfVTq4YuHZppOSShP71_vEBt_nsKxyw@mail.gmail.com>
 <CAGMNF6Wz8JzTB5XGKLii9wzPi=9YruKaYqHBPn0giym8RdQJ7Q@mail.gmail.com>
In-Reply-To: <CAGMNF6Wz8JzTB5XGKLii9wzPi=9YruKaYqHBPn0giym8RdQJ7Q@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 8 Nov 2018 11:56:57 +0530
Message-ID: <CAE33tLES5+AZm_7NJAdHdr3HfUxuGn7Jdbdwrpi=dZFtcw=9sQ@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: Kun Yi <kunyi@google.com>
Cc: Troy Lee <leetroy@gmail.com>, Emily Shaffer <emilyshaffer@google.com>, 
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007583de057a215331"
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
X-List-Received-Date: Thu, 08 Nov 2018 06:27:20 -0000

--0000000000007583de057a215331
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually the I2C address mentioned in board schematics is 0x90. When I gave
that in device tree file, it is showing the following error message.

i2c i2c-12: Invalid 7 bit I2C address 0x90
i2c i2c-12: of_i2c: Failure registering /ahb/apb/i2c1e78a000/i2c-bus@440
/tmp75@90
i2c i2c-12: of_i2c: Failed to create I2C device for
/ahb/apb/i2c1e78a000/i2c-bus@440/tmp75@90

So I took first 7 MSB bits 0f 0x90, that is 0x48 and I used that in device
tree file.

Following is the  content of dmesg.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version
4.18.7-b7ba2a0af62b835fb3cac7bd3bbc72dcb1955b65 (oe-user@oe-host) (gcc
version 7.3.0 (GCC)) #1 Thu Nov 8 06:06:20 UTC 2018
[    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7
(ARMv7), cr=3D00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Zaius BMC
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0x9cc00000
[    0.000000] On node 0 totalpages: 110592
[    0.000000]   Normal zone: 992 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 110592 pages, LIFO batch:31
[    0.000000] random: get_random_bytes called from start_kernel+0x8c/0x4b4
with crng_init=3D0
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 10960=
0
[    0.000000] Kernel command line: console=3DttyS4,115200n8 root=3D/dev/ra=
m rw
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072
bytes)
[    0.000000] Memory: 396452K/442368K available (6144K kernel code, 373K
rwdata, 1208K rodata, 1024K init, 143K bss, 29532K reserved, 16384K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x9f800000 - 0xff800000   (1536 MB)
[    0.000000]     lowmem  : 0x80000000 - 0x9f000000   ( 496 MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (7136 kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 374 kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 144 kB)
[    0.000000] ftrace: allocating 19300 entries in 57 pages
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] i2c controller registered, irq 16
[    0.000000] clocksource: FTTMR010-TIMER2: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 77222644334 ns
[    0.000017] sched_clock: 32 bits at 24MHz, resolution 40ns, wraps every
86767015915ns
[    0.000085] Switching to timer-based delay loop, resolution 40ns
[    0.001073] Calibrating delay loop (skipped), value calculated using
timer frequency.. 49.50 BogoMIPS (lpj=3D247500)
[    0.001125] pid_max: default: 32768 minimum: 301
[    0.001802] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.001843] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
bytes)
[    0.003239] CPU: Testing write buffer coherency: ok
[    0.004862] Setting up static identity map for 0x80100000 - 0x80100038
[    0.009381] devtmpfs: initialized
[    0.024442] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.024495] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.027637] pinctrl core: initialized pinctrl subsystem
[    0.028592] NET: Registered protocol family 16
[    0.031007] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.033079] hw-breakpoint: found 6 breakpoint and 1 watchpoint registers=
.
[    0.033111] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.130549] usbcore: registered new interface driver usbfs
[    0.130740] usbcore: registered new interface driver hub
[    0.130947] usbcore: registered new device driver usb
[    0.141551] clocksource: Switched to clocksource FTTMR010-TIMER2
[    0.184913] NET: Registered protocol family 2
[    0.186058] tcp_listen_portaddr_hash hash table entries: 512 (order: 0,
4096 bytes)
[    0.186138] TCP established hash table entries: 4096 (order: 2, 16384
bytes)
[    0.186226] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.186320] TCP: Hash tables configured (established 4096 bind 4096)
[    0.186539] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.186597] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.186965] NET: Registered protocol family 1
[    0.189270] Unpacking initramfs...
[   19.439065] Freeing initrd memory: 15708K
[   19.446805] workingset: timestamp_bits=3D30 max_order=3D17 bucket_order=
=3D0
[   19.447297] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[   19.447335] jffs2: version 2.2. (SUMMARY)  =EF=BF=BD=C2=A9 2001-2006 Red=
 Hat, Inc.
[   19.452647] NET: Registered protocol family 38
[   19.452725] io scheduler noop registered
[   19.452899] io scheduler cfq registered (default)
[   19.453388] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: could not map pin
config for "C7"
[   19.453512] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: could not map pin
config for "B7"
[   19.453850] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin_config_set op
failed for pin 233
[   19.453872] gpio_aspeed 1e780000.gpio: Error applying setting, reverse
things back
[   19.454219] GPIO line 396 (iso_u164_en) hogged as output/high
[   19.454304] GPIO line 400 (ncsi_mux_en_n) hogged as output/low
[   19.454372] GPIO line 401 (bmc_i2c2_sw_rst_n) hogged as output/high
[   19.454435] GPIO line 403 (bmc_i2c5_sw_rst_n) hogged as output/high
[   19.455906] ipmi-bt-host 1e789140.ibt: Found bt bmc device
[   19.456944] ipmi-bt-host 1e789140.ibt: Using IRQ 32
[   19.467271] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[   19.474908] 1e787000.serial: ttyS5 at MMIO 0x1e787000 (irq =3D 32,
base_baud =3D 1546875) is a 16550A
[   19.479132] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq =3D 30,
base_baud =3D 1500000) is a 16550A
[   19.481258] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 31,
base_baud =3D 1500000) is a 16550A
[   19.963806] console [ttyS4] enabled
[   20.110086] timeriomem_rng 1e6e2078.hwrng: 32bits from 0x(ptrval) @ 1us
[   20.119184] aspeed_gfx 1e6e6000.display: failed to initialize reserved
mem: -19
[   20.136001] random: fast init done
[   20.150290] loop: module loaded
[   20.155637] aspeed-lpc-ctrl 1e789080.lpc-ctrl: Loaded at [mem
0x98000000-0x9bffffff flags 0x200]
[   20.171871] aspeed-smc 1e620000.flash-controller: Using 50 MHz SPI
frequency
[   20.179140] aspeed-smc 1e620000.flash-controller: mx25l25635e (32768
Kbytes)
[   20.186217] aspeed-smc 1e620000.flash-controller: CE0 window [
0x20000000 - 0x22000000 ] 32MB
[   20.194856] aspeed-smc 1e620000.flash-controller: CE1 window [
0x22000000 - 0x2a000000 ] 128MB
[   20.203483] aspeed-smc 1e620000.flash-controller: read control register:
203b0641
[   20.689020] 5 fixed-partitions partitions found on MTD device bmc
[   20.695136] Creating 5 MTD partitions on "bmc":
[   20.699685] 0x000000000000-0x000000060000 : "u-boot"
[   20.708545] 0x000000060000-0x000000080000 : "u-boot-env"
[   20.717721] 0x000000080000-0x0000004c0000 : "kernel"
[   20.727542] 0x0000004c0000-0x000001c00000 : "rofs"
[   20.737317] 0x000001c00000-0x000002000000 : "rwfs"
[   20.749007] aspeed-smc 1e630000.flash-controller: Using 100 MHz SPI
frequency
[   20.756392] aspeed-smc 1e630000.flash-controller: mx25l25635e (32768
Kbytes)
[   20.763470] aspeed-smc 1e630000.flash-controller: CE0 window [
0x30000000 - 0x32000000 ] 32MB
[   20.772110] aspeed-smc 1e630000.flash-controller: CE1 window [
0x32000000 - 0x38000000 ] 96MB
[   20.780646] aspeed-smc 1e630000.flash-controller: read control register:
203b0241
[   20.813318] aspeed-smc 1e630000.flash-controller: Calibration area too
uniform, using low speed
[   20.828013] aspeed-smc 1e631000.flash-controller: Using 50 MHz SPI
frequency
[   20.835142] aspeed-smc 1e631000.flash-controller: unrecognized JEDEC id
bytes: 00, 00, 00
[   20.843331] aspeed-smc 1e631000.flash-controller: Aspeed SMC probe
failed -2
[   20.858037] aspeed-smc: probe of 1e631000.flash-controller failed with
error -2
[   20.867590] libphy: Fixed MDIO Bus: probed
[   20.872732] ftgmac100 1e660000.ethernet: Generated random MAC address
62:0e:a0:5b:c9:d8
[   20.880773] ftgmac100 1e660000.ethernet: Using NCSI interface
[   20.887639] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at (ptrval)
[   20.894956] ftgmac100 1e680000.ethernet: Read MAC address
00:de:ad:be:ef:01 from chip
[   20.922800] libphy: ftgmac100_mdio: probed
[   20.968049] random: crng init done
[   21.005895] Broadcom BCM54612E 1e680000.ethernet--1:01: attached PHY
driver [Broadcom BCM54612E] (mii_bus:phy_addr=3D1e680000.ethernet--1:01,
irq=3DPOLL)
[   21.020452] ftgmac100 1e680000.ethernet eth1: irq 20, mapped at 52db8149
[   21.027520] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[   21.034112] ehci-platform: EHCI generic platform driver
[   21.040400] i2c /dev entries driver
[   21.063218] aspeed-i2c-bus 1e78a040.i2c-bus: i2c bus 0 registered, irq 3=
4
[   21.072475] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 1 registered, irq 3=
5
[   21.082579] aspeed-i2c-bus 1e78a140.i2c-bus: i2c bus 4 registered, irq 3=
6
[   21.092719] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 registered, irq 3=
7
[   21.102868] aspeed-i2c-bus 1e78a340.i2c-bus: i2c bus 8 registered, irq 3=
8
[   21.113105] aspeed-i2c-bus 1e78a440.i2c-bus: i2c bus 12 registered, irq
39
[   21.122370] i2c i2c-7: Added multiplexed i2c bus 215
[   21.127366] pca9541 7-0070: registered master selector for I2C pca9541
[   21.138262] pca954x 1-0071: probe failed
[   21.142888] pca954x 4-0071: probe failed
[   21.155079] pmbus 7-0061: PMBus status register not found
[   21.165593] ucd9000 0-0064: Failed to read device ID
[   21.173323] usbcore: registered new interface driver usbhid
[   21.179018] usbhid: USB HID core driver
[   21.202652] NET: Registered protocol family 10
[   21.218129] Segment Routing with IPv6
[   21.222653] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[   21.229964] NET: Registered protocol family 17
[   21.234478] 8021q: 802.1Q VLAN Support v1.8
[   21.248244] console [netcon0] enabled
[   21.251931] netconsole: network logging started
[   21.257926] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[   21.266549] hctosys: unable to open rtc device (rtc0)
[   21.283017] Freeing unused kernel memory: 1024K
[   21.290261] Checked W+X mappings: passed, no W+X pages found
[   21.390012] systemd[1]: systemd 237 running in system mode. (+PAM -AUDIT
-SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP -LIBCRYPTSETUP -GCRYPT
-GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID)
[   21.412916] systemd[1]: Detected architecture arm.
[   21.452208] systemd[1]: Set hostname to <zaius>.
[   21.457517] systemd[1]: Initializing machine ID from random generator.
[   22.750590] systemd[1]: Created slice System Slice.
[   22.784248] systemd[1]: Created slice
system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.
[   22.823433] systemd[1]: Listening on udev Kernel Socket.
[   22.863473] systemd[1]: Started Dispatch Password Requests to Console
Directory Watch.
[   22.903540] systemd[1]: Listening on Syslog Socket.
[   22.943952] systemd[1]: Created slice
system-obmc\x2dled\x2dgroup\x2dstart.slice.
[   24.937714] systemd-journald[501]: Received request to flush runtime
journal from PID 1
[   28.126038] 8021q: adding VLAN 0 to HW filter on device eth0
[   28.432290] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
[   30.331771] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found
with link
[   32.674557] ftgmac100 1e680000.ethernet eth1: Link is Up - 1Gbps/Full -
flow control rx/tx
[   32.682901] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   34.826333] ftgmac100 1e680000.ethernet eth1: Link is Down
[   36.988855] ftgmac100 1e680000.ethernet eth1: Link is Up - 1Gbps/Full -
flow control rx/tx
[   39.057815] ftgmac100 1e680000.ethernet eth1: Link is Down
[   41.254826] ftgmac100 1e680000.ethernet eth1: Link is Up - 100Mbps/Full
- flow control rx/tx
root@zaius:~#          Stopping Network Time Synchronization...
[  OK  ] Started Phosphor Time Manager daemon.
[  OK  ] Reached target Phosphor System - Standby.
         Starting Assert bmc_booted LED...
[  OK  ] Reached target Power0 On (Pre).
[  OK  ] Reached target Power0 On.
[  OK  ] Reached target Power0 (On).
[  OK  ] Started Phosphor Fan Monitor Initialization.
         Starting Scan FSI devices...
[  OK  ] Started Phosphor Fan Control Initialization.
[  OK  ] Started Phosphor Fan Presence Tach Daemon.
[  OK  ] Created slice system-phosphor\x2dfan\x2dcontrol.slice.
[  OK  ] Started Phosphor Fan Control Daemon.
[  OK  ] Created slice system-phosphor\x2dfan\x2dmonitor.slice.
[  OK  ] Started Phosphor Fan Monitor Daemon.
[  OK  ] Reached target Fan Control Ready.
[  OK  ] Started Assert bmc_booted LED.
[FAILED] Failed to start Scan FSI devices.
See 'systemctl status fsi-scan@0.service' for details.
[DEPEND] Dependency failed for Chassis0 (Power On).
[  OK  ] Stopped Start chassis0 on after BMC reset.
[  OK  ] Stopped target Host0 running after reset.
[  OK  ] Created slice system-avsbus\x2ddisable.slice.
         Starting Wait for /org/openbmc/control/chassis0...
[  OK  ] Stopped target Chassis0 power on after reset.
[  OK  ] Stopped target Host0 (Reset Check).
[  OK  ] Created slice system-obmc\x2dled\x2dgroup\x2dstop.slice.
[  OK  ] Created slice system-op\x2dpowered\x2doff.slice.
[  OK  ] Stopped Check Host0 status on BMC reset.
[  OK  ] Created slice system-op\x2dwait\x2dpower\x2doff.slice.
[  OK  ] Created slice system-vcs\x2doff.slice.
         Starting Assert power_on LED...
[  OK  ] Stopped target Power0 (On).
[  OK  ] Stopped target Power0 On.
[  OK  ] Stopped target Power0 On (Pre).
[  OK  ] Stopped Reload mboxd during power on.
[  OK  ] Stopped Assert power_on LED.
[  OK  ] Created slice system-op\x2dpower\x2dstop.slice.
[  OK  ] Stopped target Chassis0 (Reset Check).
         Starting Turn VCS rails off...
[  OK  ] Created slice system-op\x2docc\x2ddisable.slice.
         Starting OpenPOWER OCC Active Disable...
[  OK  ] Started Wait for /org/openbmc/control/chassis0.
[FAILED] Failed to start Turn VCS rails off.
See 'systemctl status vcs-off@0.service' for details.
[  OK  ] Started Assert power_on LED.
[  OK  ] Started OpenPOWER OCC Active Disable.
[  OK  ] Reached target Stop Host0 (Pre).
[  OK  ] Reached target Host0 (Stopping).
[  OK  ] Reached target Host0 (Stopped).
[  OK  ] Reached target Power0 Off (Pre).
[  OK  ] Started Stop Power0.
         Starting Wait for Power0 to turn off...
[  OK  ] Started Wait for Power0 to turn off.
[  OK  ] Started Power is off to chassis0.
[  OK  ] Reached target Chassis0 (Power Off).
[  OK  ] Reached target Stop Host0.
[  OK  ] Reached target Power0 Off.


On Wed, Nov 7, 2018 at 12:53 AM Kun Yi <kunyi@google.com> wrote:

> Well the temp1_input not showing in sysfs is related to linux kernel, not
> with userspace. Please double check your device tree node matches physica=
l
> bus, and the corresponding kernel configs are enabled. Attach dmesg and
> bootlog would be  helpful for people to help debug.
>
> On Tue, Nov 6, 2018 at 1:53 AM AKASH G J <akashgj91@gmail.com> wrote:
>
>> I corrected the path of the environment file to be
>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwon/ahb/apb/i2=
c@1e78a000
>> /i2c-bus@440/tmp75@48.conf.
>>
>> Still temp1_input is not coming on the sysfs (/sys/class/hwmon/hwmon0)
>>
>> On Tue, Nov 6, 2018 at 12:01 PM Kun Yi <kunyi@google.com> wrote:
>>
>>>
>>> On Mon, Nov 5, 2018 at 10:17 PM Troy Lee <leetroy@gmail.com> wrote:
>>>
>>>> The *service* here doesn't relate to systemd service.
>>>>
>>>> It is the name on D-Bus.
>>>> https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names
>>>>
>>>> Try this command to list all the services related to hwmon:
>>>> # busctl --no-page list | grep -E "Hwmon1|PID"
>>>>
>>>> First column will be the service name.
>>>>
>>>> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>>>> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A
>>>> >
>>>> > No such service is available in root file system. The output of the
>>>> command ls / -R | grep Hwmon  is
>>>> >
>>>> > root@zaius:~# ls / -R | grep Hwmon
>>>> > xyz.openbmc_project.Hwmon@.service
>>>> > system-xyz.openbmc_project.Hwmon.slice
>>>> >
>>>> /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:
>>>> > system-xyz.openbmc_project.Hwmon.slice
>>>> >
>>>> /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:
>>>> > root@zaius:~#
>>>> >
>>>> > On Mon, Nov 5, 2018 at 1:20 PM Troy Lee <leetroy@gmail.com> wrote:
>>>> >>
>>>> >> Your service path doesn't look right.
>>>> >>
>>>> >> According to:
>>>> >>
>>>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-b=
us
>>>> >>
>>>> >> It should be something like this:
>>>> >>   xyz.openbmc_project.Hwmon-<hash>.Hwmon1
>>>> >>
>>>> >>
>>>> >>
>>>> >> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>>>> >> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=
=9A
>>>> >> >
>>>> >> > I tried the command busctl --system introspect
>>>> xyz.openbmc_project.Hwmon@.service
>>>> /xyz/openbmc_project/Sensors/temperature/ambient
>>>> xyz.openbmc_project.sensor.Threshold.Warning | grep property and it ou=
tputs
>>>> >> >
>>>> >> > Failed to introspect object
>>>> /xyz/openbmc_project/Sensors/temperature/ambient of service
>>>> xyz.openbmc_project.Hwmon@.service: Invalid argument.
>>>> >> >
>>>> >> > I added the file
>>>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb=
/i2c@1e6e2000
>>>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>>>> following contents for dbus mapping.
>>>> >> >
>>>> >> > LABEL_temp1 =3D ambient
>>>> >> > WARNLO_temp1=3D-40
>>>> >> > WARNHI_temp1=3D125
>>>> >> >
>>>> >> > Whether this is correct or not?
>>>> >> >
>>>> >> > On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <
>>>> emilyshaffer@google.com> wrote:
>>>> >> >>
>>>> >> >> Have you tried a dbus introspect to see if the sensor is coming
>>>> across dbus correctly? There is a sample introspect command on the sen=
sor
>>>> howto, check out the busctl usage.
>>>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>>>> >> >>
>>>> >> >> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com>
>>>> wrote:
>>>> >> >>>
>>>> >> >>> I added the sensor configuration to phosphor-host-ipmid's senso=
r
>>>> configuration like.
>>>> >> >>>
>>>> >> >>> 0x12: &temperature
>>>> >> >>>   sensorType: 0x01
>>>> >> >>>   path: /xyz/openbmc_project/sensors/temperature/ambient
>>>> >> >>>   sensorReadingType: 0x01
>>>> >> >>>   multiplierM: 235
>>>> >> >>>   offsetB: 0
>>>> >> >>>   bExp: 0
>>>> >> >>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
>>>> >> >>>   scale: -3
>>>> >> >>>   rExp: -3
>>>> >> >>>   serviceInterface: org.freedesktop.DBus.Properties
>>>> >> >>>   readingType: readingData
>>>> >> >>>   interfaces:
>>>> >> >>>     xyz.openbmc_project.Sensor.Value:
>>>> >> >>>       Value:
>>>> >> >>>         Offsets:
>>>> >> >>>           0xFF:
>>>> >> >>>             type: int64_t
>>>> >> >>>
>>>> >> >>>
>>>> >> >>> When I run the command ipmitool -I dbus sdr elist full, it give=
s
>>>> the following.
>>>> >> >>>
>>>> >> >>> ambient          | 12h | ns  |  0.0 | Disabled
>>>> >> >>>
>>>> >> >>> It is not giving the sensor reading and it is showing the senso=
r
>>>> device is disabled.
>>>> >> >>>
>>>> >> >>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <
>>>> venture@google.com> wrote:
>>>> >> >>>>
>>>> >> >>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.co=
m>
>>>> wrote:
>>>> >> >>>> >
>>>> >> >>>> > Hi All,
>>>> >> >>>> >
>>>> >> >>>> > I built OpenBMC Linux using Zaius configuration and booted o=
n
>>>> BMC Aspeed AST-2500. The board we are using have one temperature senso=
r
>>>> (Texas Instruments TMP75) on I2C-12 interface.
>>>> >> >>>> >
>>>> >> >>>> > I added the file
>>>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb=
/i2c@1e6e2000
>>>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>>>> following contents.
>>>> >> >>>> >
>>>> >> >>>> > LABEL_temp1 =3D ambient
>>>> >> >>>> > WARNLO_temp1=3D-40
>>>> >> >>>> > WARNHI_temp1=3D125
>>>> >> >>>> >
>>>> >> >>>> > I added the following patch to the kernel file
>>>> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
>>>> >> >>>> >
>>>> >> >>>> >  &i2c12 {
>>>> >> >>>> > -    status =3D "disabled";
>>>> >> >>>> > +    status =3D "okay";
>>>> >> >>>> > +
>>>> >> >>>> > +    tmp75@48 {
>>>> >> >>>> > +        compatible =3D "ti,tmp75";
>>>> >> >>>> > +        reg =3D <0x48>;
>>>> >> >>>> > +    };
>>>> >> >>>> > +
>>>> >> >>>> >  };
>>>> >> >>>> >
>>>> >> >>>> > After booting Linux, the changes are reflected in
>>>> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440
>>>> /tmp75@48. Also,
>>>> >> >>>> > tmp78.conf is showing in
>>>> /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90.
>>>>
>>>
>>> Besides what others suggested looks like you have a mismatch between
>>> your device path and the path for the environment file. They need to ha=
ve
>>> the same path.
>>>
>>> Steps to try:
>>> 1. Fix the path of your environment file to be
>>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwon/ahb/apb/i=
2c@1e78a000
>>> /i2c-bus@440/tmp75@48.conf
>>> 2. Make sure the hwmon sysfs interface shows up and temp1_input reads a
>>> valid value
>>> 3. Play with busctl as others suggested and make sure the sensor value
>>> is reported over DBus
>>>
>>>
>>>> >> >>>> >
>>>> >> >>>> > when I am running the ipmitool command: ipmitool -I dbus sdr
>>>> elist full it is not showing the temperature sensor and its reading.
>>>> >> >>>> >
>>>> >> >>>> > Please someone help to resolve the problem.
>>>> >> >>>>
>>>> >> >>>> You'll need to add the sensor configuration to the
>>>> >> >>>> phosphor-host-ipmid's sensor configuration, see:
>>>> >> >>>>
>>>> >> >>>>
>>>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaiu=
s/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>>>> >> >>>>
>>>> >> >>>> >
>>>> >> >>>> >
>>>> >> >>>> > Thanks and Regards,
>>>> >> >>>> >
>>>> >> >>>> > Akash
>>>> >> >>>> >
>>>>
>>>
>>>
>>> --
>>> Regards,
>>> Kun
>>>
>>
>
> --
> Regards,
> Kun
>

--0000000000007583de057a215331
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Actually the I2C address mentioned i=
n board schematics is 0x90. When I gave that in device tree file, it is sho=
wing the following error message.</div><div><br></div><div>i2c i2c-12: Inva=
lid 7 bit I2C address 0x90</div><div>i2c i2c-12: of_i2c: Failure registerin=
g /ahb/apb/i2c1e78a000/i2c-bus@440/tmp75@90</div><div>i2c i2c-12: of_i2c: F=
ailed to create I2C device for /ahb/apb/i2c1e78a000/i2c-bus@440/tmp75@90</d=
iv><div><br></div><div>So I took first 7 MSB bits 0f 0x90, that is 0x48 and=
 I used that in device tree file. <br></div><div><br></div><div>Following i=
s the=C2=A0 content of dmesg.<br></div><div><br></div><div>[=C2=A0=C2=A0=C2=
=A0 0.000000] Booting Linux on physical CPU 0x0<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] Linux version 4.18.7-b7ba2a0af62b835fb3cac7bd3bbc72dcb1955b65 (oe-use=
r@oe-host) (gcc version 7.3.0 (GCC)) #1 Thu Nov 8 06:06:20 UTC 2018<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] CPU: ARMv6-compatible processor [410fb767] revisi=
on 7 (ARMv7), cr=3D00c5387d<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VI=
PT nonaliasing data cache, VIPT nonaliasing instruction cache<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] OF: fdt: Machine model: Zaius BMC<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Memory policy: Data cache writeback<br>[=C2=A0=C2=A0=C2=A0 0.=
000000] cma: Reserved 16 MiB at 0x9cc00000<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 On node 0 totalpages: 110592<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 =
Normal zone: 992 pages used for memmap<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0 Normal zone: 0 pages reserved<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0 Normal zone: 110592 pages, LIFO batch:31<br>[=C2=A0=C2=A0=C2=A0 0=
.000000] random: get_random_bytes called from start_kernel+0x8c/0x4b4 with =
crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: s0 r0 d32768 u32=
768 alloc=3D1*32768<br>[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: [0] 0 <br>=
[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 109600<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command lin=
e: console=3DttyS4,115200n8 root=3D/dev/ram rw<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 32768 (order: =
5, 131072 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 396452K/442368K a=
vailable (6144K kernel code, 373K rwdata, 1208K rodata, 1024K init, 143K bs=
s, 29532K reserved, 16384K cma-reserved)<br>[=C2=A0=C2=A0=C2=A0 0.000000] V=
irtual kernel memory layout:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=
=C2=A0=C2=A0 vector=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0=C2=A0 (=C2=A0=C2=
=A0 4 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0 fixmap=
=C2=A0 : 0xffc00000 - 0xfff00000=C2=A0=C2=A0 (3072 kB)<br>[=C2=A0=C2=A0=C2=
=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0 vmalloc : 0x9f800000 - 0xff800000=C2=
=A0=C2=A0 (1536 MB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=
=A0 lowmem=C2=A0 : 0x80000000 - 0x9f000000=C2=A0=C2=A0 ( 496 MB)<br>[=C2=A0=
=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text : 0x(ptrva=
l) - 0x(ptrval)=C2=A0=C2=A0 (7136 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init : 0x(ptrval) - 0x(ptrval)=C2=A0=C2=
=A0 (1024 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .data : 0x(ptrval) - 0x(ptrval)=C2=A0=C2=A0 ( 374 kB)<br>[=C2=A0=
=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss : 0x(=
ptrval) - 0x(ptrval)=C2=A0=C2=A0 ( 144 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 ftrace: allocating 19300 entries in 57 pages<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] i2c controller registered, irq 16<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] clocksource: FTTMR010-TIMER2: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 77222644334 ns<br>[=C2=A0=C2=A0=C2=A0 0.000017] sched_clock: 32 =
bits at 24MHz, resolution 40ns, wraps every 86767015915ns<br>[=C2=A0=C2=A0=
=C2=A0 0.000085] Switching to timer-based delay loop, resolution 40ns<br>[=
=C2=A0=C2=A0=C2=A0 0.001073] Calibrating delay loop (skipped), value calcul=
ated using timer frequency.. 49.50 BogoMIPS (lpj=3D247500)<br>[=C2=A0=C2=A0=
=C2=A0 0.001125] pid_max: default: 32768 minimum: 301<br>[=C2=A0=C2=A0=C2=
=A0 0.001802] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)<b=
r>[=C2=A0=C2=A0=C2=A0 0.001843] Mountpoint-cache hash table entries: 1024 (=
order: 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.003239] CPU: Testing write b=
uffer coherency: ok<br>[=C2=A0=C2=A0=C2=A0 0.004862] Setting up static iden=
tity map for 0x80100000 - 0x80100038<br>[=C2=A0=C2=A0=C2=A0 0.009381] devtm=
pfs: initialized<br>[=C2=A0=C2=A0=C2=A0 0.024442] clocksource: jiffies: mas=
k: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns<br>=
[=C2=A0=C2=A0=C2=A0 0.024495] futex hash table entries: 256 (order: -1, 307=
2 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.027637] pinctrl core: initialized pinctrl=
 subsystem<br>[=C2=A0=C2=A0=C2=A0 0.028592] NET: Registered protocol family=
 16<br>[=C2=A0=C2=A0=C2=A0 0.031007] DMA: preallocated 256 KiB pool for ato=
mic coherent allocations<br>[=C2=A0=C2=A0=C2=A0 0.033079] hw-breakpoint: fo=
und 6 breakpoint and 1 watchpoint registers.<br>[=C2=A0=C2=A0=C2=A0 0.03311=
1] hw-breakpoint: maximum watchpoint size is 4 bytes.<br>[=C2=A0=C2=A0=C2=
=A0 0.130549] usbcore: registered new interface driver usbfs<br>[=C2=A0=C2=
=A0=C2=A0 0.130740] usbcore: registered new interface driver hub<br>[=C2=A0=
=C2=A0=C2=A0 0.130947] usbcore: registered new device driver usb<br>[=C2=A0=
=C2=A0=C2=A0 0.141551] clocksource: Switched to clocksource FTTMR010-TIMER2=
<br>[=C2=A0=C2=A0=C2=A0 0.184913] NET: Registered protocol family 2<br>[=C2=
=A0=C2=A0=C2=A0 0.186058] tcp_listen_portaddr_hash hash table entries: 512 =
(order: 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.186138] TCP established has=
h table entries: 4096 (order: 2, 16384 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.1862=
26] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)<br>[=C2=A0=C2=
=A0=C2=A0 0.186320] TCP: Hash tables configured (established 4096 bind 4096=
)<br>[=C2=A0=C2=A0=C2=A0 0.186539] UDP hash table entries: 256 (order: 0, 4=
096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.186597] UDP-Lite hash table entries: 25=
6 (order: 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.186965] NET: Registered p=
rotocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.189270] Unpacking initramfs...<br=
>[=C2=A0=C2=A0 19.439065] Freeing initrd memory: 15708K<br>[=C2=A0=C2=A0 19=
.446805] workingset: timestamp_bits=3D30 max_order=3D17 bucket_order=3D0<br=
>[=C2=A0=C2=A0 19.447297] squashfs: version 4.0 (2009/01/31) Phillip Loughe=
r<br>[=C2=A0=C2=A0 19.447335] jffs2: version 2.2. (SUMMARY)=C2=A0 =EF=BF=BD=
=C2=A9 2001-2006 Red Hat, Inc.<br>[=C2=A0=C2=A0 19.452647] NET: Registered =
protocol family 38<br>[=C2=A0=C2=A0 19.452725] io scheduler noop registered=
<br>[=C2=A0=C2=A0 19.452899] io scheduler cfq registered (default)<br>[=C2=
=A0=C2=A0 19.453388] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: could not m=
ap pin config for &quot;C7&quot;<br>[=C2=A0=C2=A0 19.453512] aspeed-g5-pinc=
trl 1e6e2000.syscon:pinctrl: could not map pin config for &quot;B7&quot;<br=
>[=C2=A0=C2=A0 19.453850] aspeed-g5-pinctrl 1e6e2000.syscon:pinctrl: pin_co=
nfig_set op failed for pin 233<br>[=C2=A0=C2=A0 19.453872] gpio_aspeed 1e78=
0000.gpio: Error applying setting, reverse things back<br>[=C2=A0=C2=A0 19.=
454219] GPIO line 396 (iso_u164_en) hogged as output/high<br>[=C2=A0=C2=A0 =
19.454304] GPIO line 400 (ncsi_mux_en_n) hogged as output/low<br>[=C2=A0=C2=
=A0 19.454372] GPIO line 401 (bmc_i2c2_sw_rst_n) hogged as output/high<br>[=
=C2=A0=C2=A0 19.454435] GPIO line 403 (bmc_i2c5_sw_rst_n) hogged as output/=
high<br>[=C2=A0=C2=A0 19.455906] ipmi-bt-host 1e789140.ibt: Found bt bmc de=
vice<br>[=C2=A0=C2=A0 19.456944] ipmi-bt-host 1e789140.ibt: Using IRQ 32<br=
>[=C2=A0=C2=A0 19.467271] Serial: 8250/16550 driver, 6 ports, IRQ sharing e=
nabled<br>[=C2=A0=C2=A0 19.474908] 1e787000.serial: ttyS5 at MMIO 0x1e78700=
0 (irq =3D 32, base_baud =3D 1546875) is a 16550A<br>[=C2=A0=C2=A0 19.47913=
2] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq =3D 30, base_baud =3D 150=
0000) is a 16550A<br>[=C2=A0=C2=A0 19.481258] 1e784000.serial: ttyS4 at MMI=
O 0x1e784000 (irq =3D 31, base_baud =3D 1500000) is a 16550A<br>[=C2=A0=C2=
=A0 19.963806] console [ttyS4] enabled<br>[=C2=A0=C2=A0 20.110086] timeriom=
em_rng 1e6e2078.hwrng: 32bits from 0x(ptrval) @ 1us<br>[=C2=A0=C2=A0 20.119=
184] aspeed_gfx 1e6e6000.display: failed to initialize reserved mem: -19<br=
>[=C2=A0=C2=A0 20.136001] random: fast init done<br>[=C2=A0=C2=A0 20.150290=
] loop: module loaded<br>[=C2=A0=C2=A0 20.155637] aspeed-lpc-ctrl 1e789080.=
lpc-ctrl: Loaded at [mem 0x98000000-0x9bffffff flags 0x200]<br>[=C2=A0=C2=
=A0 20.171871] aspeed-smc 1e620000.flash-controller: Using 50 MHz SPI frequ=
ency<br>[=C2=A0=C2=A0 20.179140] aspeed-smc 1e620000.flash-controller: mx25=
l25635e (32768 Kbytes)<br>[=C2=A0=C2=A0 20.186217] aspeed-smc 1e620000.flas=
h-controller: CE0 window [ 0x20000000 - 0x22000000 ] 32MB<br>[=C2=A0=C2=A0 =
20.194856] aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - =
0x2a000000 ] 128MB<br>[=C2=A0=C2=A0 20.203483] aspeed-smc 1e620000.flash-co=
ntroller: read control register: 203b0641<br>[=C2=A0=C2=A0 20.689020] 5 fix=
ed-partitions partitions found on MTD device bmc<br>[=C2=A0=C2=A0 20.695136=
] Creating 5 MTD partitions on &quot;bmc&quot;:<br>[=C2=A0=C2=A0 20.699685]=
 0x000000000000-0x000000060000 : &quot;u-boot&quot;<br>[=C2=A0=C2=A0 20.708=
545] 0x000000060000-0x000000080000 : &quot;u-boot-env&quot;<br>[=C2=A0=C2=
=A0 20.717721] 0x000000080000-0x0000004c0000 : &quot;kernel&quot;<br>[=C2=
=A0=C2=A0 20.727542] 0x0000004c0000-0x000001c00000 : &quot;rofs&quot;<br>[=
=C2=A0=C2=A0 20.737317] 0x000001c00000-0x000002000000 : &quot;rwfs&quot;<br=
>[=C2=A0=C2=A0 20.749007] aspeed-smc 1e630000.flash-controller: Using 100 M=
Hz SPI frequency<br>[=C2=A0=C2=A0 20.756392] aspeed-smc 1e630000.flash-cont=
roller: mx25l25635e (32768 Kbytes)<br>[=C2=A0=C2=A0 20.763470] aspeed-smc 1=
e630000.flash-controller: CE0 window [ 0x30000000 - 0x32000000 ] 32MB<br>[=
=C2=A0=C2=A0 20.772110] aspeed-smc 1e630000.flash-controller: CE1 window [ =
0x32000000 - 0x38000000 ] 96MB<br>[=C2=A0=C2=A0 20.780646] aspeed-smc 1e630=
000.flash-controller: read control register: 203b0241<br>[=C2=A0=C2=A0 20.8=
13318] aspeed-smc 1e630000.flash-controller: Calibration area too uniform, =
using low speed<br>[=C2=A0=C2=A0 20.828013] aspeed-smc 1e631000.flash-contr=
oller: Using 50 MHz SPI frequency<br>[=C2=A0=C2=A0 20.835142] aspeed-smc 1e=
631000.flash-controller: unrecognized JEDEC id bytes: 00, 00, 00<br>[=C2=A0=
=C2=A0 20.843331] aspeed-smc 1e631000.flash-controller: Aspeed SMC probe fa=
iled -2<br>[=C2=A0=C2=A0 20.858037] aspeed-smc: probe of 1e631000.flash-con=
troller failed with error -2<br>[=C2=A0=C2=A0 20.867590] libphy: Fixed MDIO=
 Bus: probed<br>[=C2=A0=C2=A0 20.872732] ftgmac100 1e660000.ethernet: Gener=
ated random MAC address 62:0e:a0:5b:c9:d8<br>[=C2=A0=C2=A0 20.880773] ftgma=
c100 1e660000.ethernet: Using NCSI interface<br>[=C2=A0=C2=A0 20.887639] ft=
gmac100 1e660000.ethernet eth0: irq 19, mapped at (ptrval)<br>[=C2=A0=C2=A0=
 20.894956] ftgmac100 1e680000.ethernet: Read MAC address 00:de:ad:be:ef:01=
 from chip<br>[=C2=A0=C2=A0 20.922800] libphy: ftgmac100_mdio: probed<br>[=
=C2=A0=C2=A0 20.968049] random: crng init done<br>[=C2=A0=C2=A0 21.005895] =
Broadcom BCM54612E 1e680000.ethernet--1:01: attached PHY driver [Broadcom B=
CM54612E] (mii_bus:phy_addr=3D1e680000.ethernet--1:01, irq=3DPOLL)<br>[=C2=
=A0=C2=A0 21.020452] ftgmac100 1e680000.ethernet eth1: irq 20, mapped at 52=
db8149<br>[=C2=A0=C2=A0 21.027520] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Hos=
t Controller (EHCI) Driver<br>[=C2=A0=C2=A0 21.034112] ehci-platform: EHCI =
generic platform driver<br>[=C2=A0=C2=A0 21.040400] i2c /dev entries driver=
<br>[=C2=A0=C2=A0 21.063218] aspeed-i2c-bus 1e78a040.i2c-bus: i2c bus 0 reg=
istered, irq 34<br>[=C2=A0=C2=A0 21.072475] aspeed-i2c-bus 1e78a080.i2c-bus=
: i2c bus 1 registered, irq 35<br>[=C2=A0=C2=A0 21.082579] aspeed-i2c-bus 1=
e78a140.i2c-bus: i2c bus 4 registered, irq 36<br>[=C2=A0=C2=A0 21.092719] a=
speed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 registered, irq 37<br>[=C2=A0=C2=
=A0 21.102868] aspeed-i2c-bus 1e78a340.i2c-bus: i2c bus 8 registered, irq 3=
8<br>[=C2=A0=C2=A0 21.113105] aspeed-i2c-bus 1e78a440.i2c-bus: i2c bus 12 r=
egistered, irq 39<br>[=C2=A0=C2=A0 21.122370] i2c i2c-7: Added multiplexed =
i2c bus 215<br>[=C2=A0=C2=A0 21.127366] pca9541 7-0070: registered master s=
elector for I2C pca9541<br>[=C2=A0=C2=A0 21.138262] pca954x 1-0071: probe f=
ailed<br>[=C2=A0=C2=A0 21.142888] pca954x 4-0071: probe failed<br>[=C2=A0=
=C2=A0 21.155079] pmbus 7-0061: PMBus status register not found<br>[=C2=A0=
=C2=A0 21.165593] ucd9000 0-0064: Failed to read device ID<br>[=C2=A0=C2=A0=
 21.173323] usbcore: registered new interface driver usbhid<br>[=C2=A0=C2=
=A0 21.179018] usbhid: USB HID core driver<br>[=C2=A0=C2=A0 21.202652] NET:=
 Registered protocol family 10<br>[=C2=A0=C2=A0 21.218129] Segment Routing =
with IPv6<br>[=C2=A0=C2=A0 21.222653] sit: IPv6, IPv4 and MPLS over IPv4 tu=
nneling driver<br>[=C2=A0=C2=A0 21.229964] NET: Registered protocol family =
17<br>[=C2=A0=C2=A0 21.234478] 8021q: 802.1Q VLAN Support v1.8<br>[=C2=A0=
=C2=A0 21.248244] console [netcon0] enabled<br>[=C2=A0=C2=A0 21.251931] net=
console: network logging started<br>[=C2=A0=C2=A0 21.257926] input: gpio-ke=
ys as /devices/platform/gpio-keys/input/input0<br>[=C2=A0=C2=A0 21.266549] =
hctosys: unable to open rtc device (rtc0)<br>[=C2=A0=C2=A0 21.283017] Freei=
ng unused kernel memory: 1024K<br>[=C2=A0=C2=A0 21.290261] Checked W+X mapp=
ings: passed, no W+X pages found<br>[=C2=A0=C2=A0 21.390012] systemd[1]: sy=
stemd 237 running in system mode. (+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMA=
CK +SYSVINIT -UTMP -LIBCRYPTSETUP -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +B=
LKID)<br>[=C2=A0=C2=A0 21.412916] systemd[1]: Detected architecture arm.<br=
>[=C2=A0=C2=A0 21.452208] systemd[1]: Set hostname to &lt;zaius&gt;.<br>[=
=C2=A0=C2=A0 21.457517] systemd[1]: Initializing machine ID from random gen=
erator.<br>[=C2=A0=C2=A0 22.750590] systemd[1]: Created slice System Slice.=
<br>[=C2=A0=C2=A0 22.784248] systemd[1]: Created slice system-phosphor\x2dd=
iscover\x2dsystem\x2dstate.slice.<br>[=C2=A0=C2=A0 22.823433] systemd[1]: L=
istening on udev Kernel Socket.<br>[=C2=A0=C2=A0 22.863473] systemd[1]: Sta=
rted Dispatch Password Requests to Console Directory Watch.<br>[=C2=A0=C2=
=A0 22.903540] systemd[1]: Listening on Syslog Socket.<br>[=C2=A0=C2=A0 22.=
943952] systemd[1]: Created slice system-obmc\x2dled\x2dgroup\x2dstart.slic=
e.<br>[=C2=A0=C2=A0 24.937714] systemd-journald[501]: Received request to f=
lush runtime journal from PID 1<br>[=C2=A0=C2=A0 28.126038] 8021q: adding V=
LAN 0 to HW filter on device eth0<br>[=C2=A0=C2=A0 28.432290] IPv6: ADDRCON=
F(NETDEV_UP): eth1: link is not ready<br>[=C2=A0=C2=A0 30.331771] ftgmac100=
 1e660000.ethernet eth0: NCSI: No channel found with link<br>[=C2=A0=C2=A0 =
32.674557] ftgmac100 1e680000.ethernet eth1: Link is Up - 1Gbps/Full - flow=
 control rx/tx<br>[=C2=A0=C2=A0 32.682901] IPv6: ADDRCONF(NETDEV_CHANGE): e=
th1: link becomes ready<br>[=C2=A0=C2=A0 34.826333] ftgmac100 1e680000.ethe=
rnet eth1: Link is Down<br>[=C2=A0=C2=A0 36.988855] ftgmac100 1e680000.ethe=
rnet eth1: Link is Up - 1Gbps/Full - flow control rx/tx<br>[=C2=A0=C2=A0 39=
.057815] ftgmac100 1e680000.ethernet eth1: Link is Down<br>[=C2=A0=C2=A0 41=
.254826] ftgmac100 1e680000.ethernet eth1: Link is Up - 100Mbps/Full - flow=
 control rx/tx<br>root@zaius:~#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Stopping Network Time Synchronization...<br>[=C2=A0 OK=C2=A0 ]=
 Started Phosphor Time Manager daemon.<br>[=C2=A0 OK=C2=A0 ] Reached target=
 Phosphor System - Standby.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Starting Assert bmc_booted LED...<br>[=C2=A0 OK=C2=A0 ] Reached targ=
et Power0 On (Pre).<br>[=C2=A0 OK=C2=A0 ] Reached target Power0 On.<br>[=C2=
=A0 OK=C2=A0 ] Reached target Power0 (On).<br>[=C2=A0 OK=C2=A0 ] Started Ph=
osphor Fan Monitor Initialization.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Starting Scan FSI devices...<br>[=C2=A0 OK=C2=A0 ] Started Pho=
sphor Fan Control Initialization.<br>[=C2=A0 OK=C2=A0 ] Started Phosphor Fa=
n Presence Tach Daemon.<br>[=C2=A0 OK=C2=A0 ] Created slice system-phosphor=
\x2dfan\x2dcontrol.slice.<br>[=C2=A0 OK=C2=A0 ] Started Phosphor Fan Contro=
l Daemon.<br>[=C2=A0 OK=C2=A0 ] Created slice system-phosphor\x2dfan\x2dmon=
itor.slice.<br>[=C2=A0 OK=C2=A0 ] Started Phosphor Fan Monitor Daemon.<br>[=
=C2=A0 OK=C2=A0 ] Reached target Fan Control Ready.<br>[=C2=A0 OK=C2=A0 ] S=
tarted Assert bmc_booted LED.<br>[FAILED] Failed to start Scan FSI devices.=
<br>See &#39;systemctl status fsi-scan@0.service&#39; for details.<br>[DEPE=
ND] Dependency failed for Chassis0 (Power On).<br>[=C2=A0 OK=C2=A0 ] Stoppe=
d Start chassis0 on after BMC reset.<br>[=C2=A0 OK=C2=A0 ] Stopped target H=
ost0 running after reset.<br>[=C2=A0 OK=C2=A0 ] Created slice system-avsbus=
\x2ddisable.slice.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Star=
ting Wait for /org/openbmc/control/chassis0...<br>[=C2=A0 OK=C2=A0 ] Stoppe=
d target Chassis0 power on after reset.<br>[=C2=A0 OK=C2=A0 ] Stopped targe=
t Host0 (Reset Check).<br>[=C2=A0 OK=C2=A0 ] Created slice system-obmc\x2dl=
ed\x2dgroup\x2dstop.slice.<br>[=C2=A0 OK=C2=A0 ] Created slice system-op\x2=
dpowered\x2doff.slice.<br>[=C2=A0 OK=C2=A0 ] Stopped Check Host0 status on =
BMC reset.<br>[=C2=A0 OK=C2=A0 ] Created slice system-op\x2dwait\x2dpower\x=
2doff.slice.<br>[=C2=A0 OK=C2=A0 ] Created slice system-vcs\x2doff.slice.<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Assert power_on=
 LED...<br>[=C2=A0 OK=C2=A0 ] Stopped target Power0 (On).<br>[=C2=A0 OK=C2=
=A0 ] Stopped target Power0 On.<br>[=C2=A0 OK=C2=A0 ] Stopped target Power0=
 On (Pre).<br>[=C2=A0 OK=C2=A0 ] Stopped Reload mboxd during power on.<br>[=
=C2=A0 OK=C2=A0 ] Stopped Assert power_on LED.<br>[=C2=A0 OK=C2=A0 ] Create=
d slice system-op\x2dpower\x2dstop.slice.<br>[=C2=A0 OK=C2=A0 ] Stopped tar=
get Chassis0 (Reset Check).<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Starting Turn VCS rails off...<br>[=C2=A0 OK=C2=A0 ] Created slice s=
ystem-op\x2docc\x2ddisable.slice.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Starting OpenPOWER OCC Active Disable...<br>[=C2=A0 OK=C2=A0 ]=
 Started Wait for /org/openbmc/control/chassis0.<br>[FAILED] Failed to star=
t Turn VCS rails off.<br>See &#39;systemctl status vcs-off@0.service&#39; f=
or details.<br>[=C2=A0 OK=C2=A0 ] Started Assert power_on LED.<br>[=C2=A0 O=
K=C2=A0 ] Started OpenPOWER OCC Active Disable.<br>[=C2=A0 OK=C2=A0 ] Reach=
ed target Stop Host0 (Pre).<br>[=C2=A0 OK=C2=A0 ] Reached target Host0 (Sto=
pping).<br>[=C2=A0 OK=C2=A0 ] Reached target Host0 (Stopped).<br>[=C2=A0 OK=
=C2=A0 ] Reached target Power0 Off (Pre).<br>[=C2=A0 OK=C2=A0 ] Started Sto=
p Power0.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Wait=
 for Power0 to turn off...<br>[=C2=A0 OK=C2=A0 ] Started Wait for Power0 to=
 turn off.<br>[=C2=A0 OK=C2=A0 ] Started Power is off to chassis0.<br>[=C2=
=A0 OK=C2=A0 ] Reached target Chassis0 (Power Off).<br>[=C2=A0 OK=C2=A0 ] R=
eached target Stop Host0.<br>[=C2=A0 OK=C2=A0 ] Reached target Power0 Off.<=
br><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Wed, Nov 7, 2018 at 12:53 AM Kun Yi &lt;<a href=3D"mailto:kunyi@google.com=
">kunyi@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr">Well the temp1_input not showing in sysfs is related to lin=
ux kernel, not with userspace. Please double=C2=A0check your device tree no=
de matches physical bus, and the corresponding kernel configs are enabled. =
Attach dmesg and bootlog would be=C2=A0 helpful for people to help debug.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Nov 6, 2018 at =
1:53 AM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_bla=
nk">akashgj91@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>I corrected the path of the envi=
ronment file to be meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc=
/hwon/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.conf.</div><div><br></div><=
div>Still temp1_input is not coming on the sysfs (/sys/class/hwmon/hwmon0)<=
br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Nov 6, 2018 at 12:01 PM Kun Yi &lt;<a href=3D"mailto:kunyi@google.com" ta=
rget=3D"_blank">kunyi@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Mon, Nov 5, 2018 at 10:17 PM Troy Lee &lt;<a href=3D"mailto:leetroy@=
gmail.com" target=3D"_blank">leetroy@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">The *service* here doesn&#39;t relate to systemd=
 service.<br>
<br>
It is the name on D-Bus.<br>
<a href=3D"https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-hwmon=
#d-bus-bus-names</a><br>
<br>
Try this command to list all the services related to hwmon:<br>
# busctl --no-page list | grep -E &quot;Hwmon1|PID&quot;<br>
<br>
First column will be the service name.<br>
<br>
Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:LeeTroy@gmail.com" target=3D"_=
blank">LeeTroy@gmail.com</a>&gt;<br>
AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akas=
hgj91@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; No such service is available in root file system. The output of the co=
mmand ls / -R | grep Hwmon=C2=A0 is<br>
&gt;<br>
&gt; root@zaius:~# ls / -R | grep Hwmon<br>
&gt; xyz.openbmc_project.Hwmon@.service<br>
&gt; system-xyz.openbmc_project.Hwmon.slice<br>
&gt; /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:<br>
&gt; system-xyz.openbmc_project.Hwmon.slice<br>
&gt; /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:<br>
&gt; root@zaius:~#<br>
&gt;<br>
&gt; On Mon, Nov 5, 2018 at 1:20 PM Troy Lee &lt;<a href=3D"mailto:leetroy@=
gmail.com" target=3D"_blank">leetroy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Your service path doesn&#39;t look right.<br>
&gt;&gt;<br>
&gt;&gt; According to:<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/sensor-arch=
itecture.md#d-bus" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/docs/blob/master/sensor-architecture.md#d-bus</a><br>
&gt;&gt;<br>
&gt;&gt; It should be something like this:<br>
&gt;&gt;=C2=A0 =C2=A0xyz.openbmc_project.Hwmon-&lt;hash&gt;.Hwmon1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:LeeTroy@gmail.com" ta=
rget=3D"_blank">LeeTroy@gmail.com</a>&gt;<br>
&gt;&gt; AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_bl=
ank">akashgj91@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I tried the command busctl --system introspect xyz.openbmc_pr=
oject.Hwmon@.service /xyz/openbmc_project/Sensors/temperature/ambient xyz.o=
penbmc_project.sensor.Threshold.Warning | grep property and it outputs<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Failed to introspect object /xyz/openbmc_project/Sensors/temp=
erature/ambient of service xyz.openbmc_project.Hwmon@.service: Invalid argu=
ment.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I added the file meta-zaius/recipes-phosphor/sensors/phosphor=
-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine=
 configuration directory with the following contents for dbus mapping.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; LABEL_temp1 =3D ambient<br>
&gt;&gt; &gt; WARNLO_temp1=3D-40<br>
&gt;&gt; &gt; WARNHI_temp1=3D125<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Whether this is correct or not?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer &lt;<a href=3D"m=
ailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@google.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Have you tried a dbus introspect to see if the sensor is =
coming across dbus correctly? There is a sample introspect command on the s=
ensor howto, check out the busctl usage. <a href=3D"https://github.com/open=
bmc/docs/blob/master/sensor-architecture.md" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openbmc/docs/blob/master/sensor-architecture.md</=
a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Nov 2, 2018, 3:21 AM AKASH G J &lt;<a href=3D"mai=
lto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; I added the sensor configuration to phosphor-host-ipm=
id&#39;s sensor configuration like.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; 0x12: &amp;temperature<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0sensorType: 0x01<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0path: /xyz/openbmc_project/sensors/temper=
ature/ambient<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0sensorReadingType: 0x01<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0multiplierM: 235<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0offsetB: 0<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0bExp: 0<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0unit: xyz.openbmc_project.Sensor.Value.Un=
it.DegreesC<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0scale: -3<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0rExp: -3<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0serviceInterface: org.freedesktop.DBus.Pr=
operties<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0readingType: readingData<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0interfaces:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0xyz.openbmc_project.Sensor.Value:<=
br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Value:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Offsets:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type: =
int64_t<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; When I run the command ipmitool -I dbus sdr elist ful=
l, it gives the following.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; ambient=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12h | ns=
=C2=A0 |=C2=A0 0.0 | Disabled<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; It is not giving the sensor reading and it is showing=
 the sensor device is disabled.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture &lt;<=
a href=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; On Tue, Oct 30, 2018 at 10:13 PM AKASH G J &lt;<a=
 href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Hi All,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I built OpenBMC Linux using Zaius configurat=
ion and booted on BMC Aspeed AST-2500. The board we are using have one temp=
erature sensor (Texas Instruments TMP75) on I2C-12 interface.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I added the file meta-zaius/recipes-phosphor=
/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@4=
8.conf in machine configuration directory with the following contents.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; LABEL_temp1 =3D ambient<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; WARNLO_temp1=3D-40<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; WARNHI_temp1=3D125<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I added the following patch to the kernel fi=
le linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;=C2=A0 &amp;i2c12 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 status =3D &quot;disabled&quo=
t;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<=
br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 tmp75@48 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;ti,tmp75&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x4=
8&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; After booting Linux, the changes are reflect=
ed in /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@=
48. Also,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; tmp78.conf is showing in /etc/default/obmc/h=
wmon/ahb/apb/i2c@1e78a000/i2c-bus@90.<br></blockquote><div><br></div><div>B=
esides what others suggested looks like you have a mismatch between your de=
vice path and the path for the environment file. They need to have the same=
 path.<br></div><div><br></div><div>Steps to try:</div><div>1. Fix the path=
 of your environment file to be meta-zaius/recipes-phosphor/sensors/phospho=
r-hwmon%/obmc/hwon/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.conf=C2=A0</di=
v><div>2. Make sure the hwmon sysfs interface shows up and temp1_input read=
s a valid value</div><div>3. Play with busctl as others suggested and make =
sure the sensor value is reported over DBus</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; when I am running the ipmitool command: ipmi=
tool -I dbus sdr elist full it is not showing the temperature sensor and it=
s reading.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Please someone help to resolve the problem.<=
br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; You&#39;ll need to add the sensor configuration t=
o the<br>
&gt;&gt; &gt;&gt;&gt;&gt; phosphor-host-ipmid&#39;s sensor configuration, s=
ee:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blo=
b/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-senso=
r-inventory%25/config.yaml" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosp=
hor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml</a><br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Thanks and Regards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Akash<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_-6431686263195104149m_-7536202244457219981m_-473395608062007115=
3m_5375469761459664922gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr">Regards,<div>Kun</div></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_-6431686263195104149gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr">Regards,<div>Kun</div></div></div>
</blockquote></div>

--0000000000007583de057a215331--
