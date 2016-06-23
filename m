Return-Path: <clg@kaod.org>
X-Greylist: delayed 474 seconds by postgrey-1.35 at bilbo;
 Fri, 24 Jun 2016 03:08:59 AEST
Received: from 15.mo1.mail-out.ovh.net (15.mo1.mail-out.ovh.net
 [188.165.38.232])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rb7Gg6x9bzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 03:08:59 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id AAEDDFF8F54
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:01:00 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id EDEC52C0073;
 Thu, 23 Jun 2016 19:00:57 +0200 (CEST)
Subject: Re: [PATCH qemu 00/12] SMC and network support
To: openbmc@lists.ozlabs.org
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c3003f09-8281-d22a-eeb9-6ef126a39192@kaod.org>
Date: Thu, 23 Jun 2016 19:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464556805-4340-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1570630371421883347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdeigdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 17:09:00 -0000

Hello,


On 05/29/2016 11:19 PM, Cédric Le Goater wrote:
> 
> The following patchset adds to the qemu palmetto-bmc platform initial
> support for the AST2400 SMC controllers and for the FTGMAC100 network
> adapter. The device models don't implement all the features the HW
> proposes but they are complete enough to run OpenBMC on a qemu guest.
> 
> To boot one, use the following command line :
> 
>   $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
> 	-mtdblock ./flash-palmetto-20160512040959  \
> 	-mtdblock ./palmetto.pnor 
> 	-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu
> 	
> or, if you have a libvirt bridge, you can tie the nic to it :
> 	
> 	-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100 \
> 	-net bridge,id=net0,helper=/usr/lib/qemu/qemu-bridge-helper,br=virbr0 
> 
> The first block device uses the file './flash-palmetto-20160512040959'
> which will act as a SPI flash module for the BMC, handled by the
> SMC/FMC controller. The second block device uses the file
> './palmetto.pnor' which is an OpenPower firmware image for a palmetto
> OpenPower system. This one will be handled by the SMC/SPI controller.
> 
> 
> Code is based on Andrew's qemu and the full tree can be found here
> 
>     https://github.com/legoater/qemu/commits/aspeed
> 
> Flash images can be grabbed here :
> 
>     https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
>     https://openpower.xyz/job/openpower-op-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor

Here is a quick update as I just did a rebase of my branch on mainline qemu 
(commit c7288767523f) :

	https://github.com/legoater/qemu/commits/aspeed

A couple of patches, that have been sent and discussed on qemu-devel@ but 
not merged yet, are included : 

	a828f92a1807 hw/misc: Add a model for the ASPEED System Control Unit
	1181e14788a9 ast2400: Integrate the SCU model and set silicon revision
	e17aa27fa6b8 palmetto-bmc: Configure the SCU's hardware strapping register
	26582428d17c ssi: change ssi_slave_init to be a realize ops
	7b50ed94582f m25p80: qdev-ify drive property
	9d058cd9dd81 ast2400: add SMC controllers (FMC and SPI)
	1f92166a189d ast2400: add SPI flash slave object
	a1fff8b8776f ast2400: create SPI flash slaves
	b93fe85af7b8 tests: add a m25p80 test

plus these for booting from the rom. There are some changes due to the rework 
of the previous and "fixes" for the block layer ... Looks stable now and mostly
ok.

	2f0dabacf3b9 m25p80: use synchronous writes to update the block backend
	0e7345a2d430 m25p80: add a m25p80_set_rom_storage() routine
	3f02fba0c02f ast2400: handle SPI flash Command mode (read only)
	8325fc4b1ad9 ast2400: use contents of first SPI flash as a rom

These are devices enhancements, nothing major :

	85f49de1c31e m25p80: add RDCR instruction for Macronix chip
	c519cdde94c6 m25p80: add mx25l25635f chip
	a520956879b1 ast2400: use a mx25l25635f chip
	31871f768618 hw/misc: add a TMP42{1,2,3} device model
	b09b8a5088a2 ast2400: add a temp sensor device on I2C bus 3
	8750ab3e2400 ast2400: add a rtc device on I2C bus 0

and to finish, the network device which has not changed but should with 
the recent findings on the ast2500 :

	4e57f68ccaf5 net: add FTGMAC100 support
	ba7a28c66ec3 ast2400: add a FTGMAC100 nic


To give it a try, use :

	$ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
		-drive file=flash-palmetto,format=raw,if=mtd \
		-drive file=palmetto.pnor,format=raw,if=mtd \ 
		-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu
		-serial stdio

and if you have a libvirt bridge :

	 	-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100 \
		-net bridge,id=net0,helper=/usr/lib/qemu/qemu-bridge-helper,br=virbr0 


I could boot the OpenBMC 1.0 image with it. Comments welcome !

Cheers,

C.
