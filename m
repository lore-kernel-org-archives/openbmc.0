Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.33.112; helo=8.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 59888 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Oct 2017 17:37:23 AEDT
Received: from 8.mo4.mail-out.ovh.net (8.mo4.mail-out.ovh.net [188.165.33.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yB6q74L12zDr4x
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 17:37:21 +1100 (AEDT)
Received: from player746.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id DEB96DAC45
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 08:37:16 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 6CAAA50009A;
 Tue, 10 Oct 2017 08:37:14 +0200 (CEST)
Subject: Re: [linux dev-4.13 0/6] SMC driver updates
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20171009134108.15860-1-clg@kaod.org>
 <CACPK8Xe2XWpiZLA1atw9nKpy5BZSZG8VWU6xLmQTWB7sQm9xAg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3191ab7a-35ba-d293-e1f7-fb7647f74a25@kaod.org>
Date: Tue, 10 Oct 2017 08:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe2XWpiZLA1atw9nKpy5BZSZG8VWU6xLmQTWB7sQm9xAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7682015068060158722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledruddttddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 10 Oct 2017 06:37:24 -0000

On 10/10/2017 05:04 AM, Joel Stanley wrote:
> Hello Cedric,
> 
> On Mon, Oct 9, 2017 at 11:11 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> Here is a series bringing the Aspeed SMC driver to the level of what
>> we had in openbmc kernel 4.10. There are a couple of changes :
>>
>>  - the DMA support is gone. It is not used, it only works for
>>    kmalloc'ed buffers and UBIFS uses vmalloc'ed buffers for instance.
>>
>>  - the driver was slightly adapted to take into account the new clk
>>    driver.
>>
>> Tested on a palmetto and an ast2500 eval boards.
> 
> Thanks! I applied these to dev-4.13. They did not cleanly apply. Can
> you double check that head of the remote you're using is
> c0df354f409687d3565073e17fab75913755ed07?

yes it is. See my branch from yesterday :

	https://github.com/legoater/linux/commits/openbmc-4.13

curious.

> I did them applied, but they appear to fail to probe on my evb:
> 
> [    1.901227] aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kbytes)
> [    1.908304] aspeed-smc 1e620000.flash-controller: CE0 window [
> 0x20000000 - 0x22000000 ] 32MB
> [    1.916831] aspeed-smc 1e620000.flash-controller: CE1 window [
> 0x22000000 - 0x2a000000 ] 128MB
> [    1.925540] aspeed-smc 1e620000.flash-controller: unsupported SPI read mode
> [    1.932516] aspeed-smc 1e620000.flash-controller: Aspeed SMC probe failed -22
> [    1.946376] aspeed-smc: probe of 1e620000.flash-controller failed
> with error -22
> [    1.955217] aspeed-smc 1e630000.flash-controller: w25q256 (32768 Kbytes)
> [    1.961943] aspeed-smc 1e630000.flash-controller: CE0 window [
> 0x30000000 - 0x32000000 ] 32MB
> [    1.970467] aspeed-smc 1e630000.flash-controller: CE1 window [
> 0x32000000 - 0x38000000 ] 96MB
> [    1.978982] aspeed-smc 1e630000.flash-controller: unsupported SPI read mode
> [    1.985941] aspeed-smc 1e630000.flash-controller: Aspeed SMC probe failed -22
> [    1.995375] aspeed-smc: probe of 1e630000.flash-controller failed
> with error -22
> [    2.004072] aspeed-smc 1e631000.flash-controller: Aspeed SMC probe failed -19

Looks ok on my side :

[    0.000000] Linux version 4.13.5-00039-gc0df354f4096-dirty (legoater@zorba.kaod.org) (gcc version 7.1.0 (Fedora 7.1.0-2.fc26)) #4 Mon Oct 9 12:58:44 CEST 2017
...
[    3.905220] aspeed-smc 1e620000.flash-controller: w25q256 (32768 Kbytes)
[    3.911980] aspeed-smc 1e620000.flash-controller: CE0 window [ 0x20000000 - 0x22000000 ] 32MB
[    3.920656] aspeed-smc 1e620000.flash-controller: CE1 window [ 0x22000000 - 0x2a000000 ] 128MB
[    3.929451] aspeed-smc 1e620000.flash-controller: read control register: 203b0641
[    3.962938] 5 ofpart partitions found on MTD device bmc
[    3.987941] Creating 5 MTD partitions on "bmc":
[    3.992642] 0x000000000000-0x000000060000 : "u-boot"
[    4.018345] 0x000000060000-0x000000080000 : "u-boot-env"
[    4.044080] 0x000000080000-0x0000004c0000 : "kernel"
[    4.069659] 0x0000004c0000-0x000001c00000 : "rofs"
[    4.095786] 0x000001c00000-0x000002000000 : "rwfs"
[    4.123717] aspeed-smc 1e630000.flash-controller: w25q256 (32768 Kbytes)
[    4.130625] aspeed-smc 1e630000.flash-controller: CE0 window [ 0x30000000 - 0x32000000 ] 32MB
[    4.139317] aspeed-smc 1e630000.flash-controller: CE1 window [ 0x32000000 - 0x38000000 ] 96MB
[    4.148031] aspeed-smc 1e630000.flash-controller: read control register: 203b0741
[    4.982664] aspeed-smc 1e631000.flash-controller: Aspeed SMC probe failed -19
[    5.019361] libphy: Fixed MDIO Bus: probed

are you sure we are using the same kernel ? 

Cheers,

C. 
