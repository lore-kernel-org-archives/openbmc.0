Return-Path: <clg@kaod.org>
X-Greylist: delayed 1183 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Mar 2017 18:46:33 AEDT
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vY6vs56WdzDqKn
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 18:46:33 +1100 (AEDT)
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id DD292D7800
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 08:26:45 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 6CC1546008B;
 Wed,  1 Mar 2017 08:26:34 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>,
 Joel Stanley <joel@jms.id.au>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
 <1488285610.4258.3.camel@aj.id.au> <1488337524.4258.9.camel@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9f4dc608-fe29-10bc-08d5-d9fd4f36d167@kaod.org>
Date: Wed, 1 Mar 2017 08:26:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488337524.4258.9.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8625519186816633731
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrvdelgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2017 07:46:34 -0000

On 03/01/2017 04:05 AM, Andrew Jeffery wrote:
> Replying to myself again... I think I've learnt the lesson not to email
> whilst in bed.
> 
> I've done some further investigation after jumping on a Romulus
> machine:
> 
> On Tue, 2017-02-28 at 23:10 +1030, Andrew Jeffery wrote:
>> On Tue, 2017-02-28 at 20:27 +0800, Lei YU wrote:
>>> Hi Andrew, Joel,
>>>
>>> This patch is for issue https://github.com/openbmc/openbmc/issues/1214
>>>
>>> Here's what I have tested:
>>> 1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled;
>>> 2. Do a power cycle;
>>> 3. Once BMC is ready, check the registers by devmem:
>>>    ```
>>>>    root@romulus:/tmp# devmem 0x1e630034
>>>
>>>    0x70640000        <== Wrong, expect 0x70680000
>>>>    root@romulus:/tmp# devmem 0x1e630030
>>>
>>>    0x64600000        <== Wrong, expect 0x68600000
>>>    ```
>>> I can see the two registers have the unexpected value.

These are the default values : 

SPIR30: SPI1 CE0 Address Decoding Range Register Init = 0x6460 0000
SPIR34: SPI1 CE1 Address Decoding Range Register Init = 0x7064 0000

We should let the driver configure these values I think.
see below.

>>> Without manually setting the two registers, `obmcutil poweron` results in
>>> no output at all in host console.
>>
>> Okay, can you please open an issue on github? I'd like to have a play
>> with a Romulus system tomorrow to better understand what's going on
>> here. We shouldn't need this kernel patch.
>>
>> This makes me wonder if something's wrong with Zaius and Witherspoon as
>> well, and whether the problem is masked by these register writes in the
>> boardfile.
>>
> 
> I had assumed here you were talking about the HICR{7,8} registers, and
> if I was paying more attention I would have realised you are not.
> 
> Instead, these are the {S,F}MC segment mapping configuration registers.
> The default values correspond to a 32MB part.

All the defaults value can be found in the QEMU Aspeed SMC model 
also : 

  https://github.com/openbmc/qemu/blob/master/hw/ssi/aspeed_smc.c#L174

It might be a little easier to find.

> From the datasheet if we
> do the transform ((0x64600000 >> 16) >> 1) we get 0x3230 which
> translates to "start the mapping at 0x30000000, end at 0x32000000" and 

You can multiply 0x64 by 8MB, which would give the same results. 

> thus a 32MiB mapping. With your expected values: ((0x68600000 >> 16) >>
> 1) we get 0x3430, or "start the mapping at 0x30000000, end at
> 0x34000000", which is a 64MiB mapping.
> 
> Looking at the driver[1] the only time we touch the segment register is
> to read the window start, we don't ever write the segment mapping
> configuration.

yes, not in 4.7 yet. It is a little "complex" to configure the 
segments up to 5 chips handling the possible overlaps, the 
different chip sizes, which might be bigger than the maximum 
window size, and the HW bugs. AST2500 SPI controller has a bug 
when the CE0 chip size exceeds 120MB.

Also the controller only really makes use of them in command 
mode. In user mode, the start address is mostly used to 
identify the chip when writing commands on the AHB Bus.    

> Cédric: Have you looked into supporting configuration of the segment
> mapping?

yes. QEMU (openbmc and mainline) supports them already. 

As for the kernel, here is an initial commit :

   https://github.com/legoater/linux/commit/c08765882b4091cb1b9998d872415c072ecfe8af

which I will send with a bunch of improvements when we switch 
to linux 4.10. I can eventually rebase on 4.7 but I would have
preferred not maintaining too much branches.

> We could configure the mapping if we know the chip sizes, however
> looking at the device's bindings documentation[2] we find:
> 
>     ...
>     Required properties:
>     ...
>      - #size-cells : must be 0 corresponding to chip select child binding
> 
> and
> 
>     ...
>     Child node required properties:
>       - reg : must contain chip select number in first cell of address, must
>     be 1 tuple long
>     ...
> 
> I think we need #size-cells to be 1 in the parent so we can define the
> mapping ranges. I don't know that its going to be an easy change to
> make though given the bindings are already upstream. Thoughts?

In the aspeed-smc bindings, the mapping range is for the overall 
AHB window. This is a HW constant you can not change. 

As for the settings of the each chip window, I would let the 
driver discover and configure them as you can ruin the controller 
behavior in command mode if they are wrong. 
 
What is the specific need ? Is it to have a window covering all 
the SPI CEx chips ? If so, my tree should have that support 
already. But, please note that the HW is broken for chips > 128MB, 
on witherspoon for instance.


Cheers,

C.  
 

> Lei: So as it stands you should drop the HICRx writes from your patch.
> However as it stands, we still need the writes to the SMC segment
> registers until we can sort out proper driver support.
> 
> Cheers,
> 
> Andrew
> 
> [1] https://github.com/openbmc/linux/blob/dev-4.7/drivers/mtd/spi-nor/aspeed-smc.c#L728
> [2] https://github.com/openbmc/linux/blob/dev-4.7/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> 
