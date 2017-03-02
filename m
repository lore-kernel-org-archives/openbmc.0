Return-Path: <clg@kaod.org>
X-Greylist: delayed 321 seconds by postgrey-1.36 at bilbo;
 Thu, 02 Mar 2017 19:02:48 AEDT
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYlD84lZKzDq66
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 19:02:47 +1100 (AEDT)
Received: from player763.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 785EF41407
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 08:57:23 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id B76A03C0098;
 Thu,  2 Mar 2017 08:57:16 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>,
 Joel Stanley <joel@jms.id.au>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
 <1488285610.4258.3.camel@aj.id.au> <1488337524.4258.9.camel@aj.id.au>
 <9f4dc608-fe29-10bc-08d5-d9fd4f36d167@kaod.org>
 <1488423338.4258.11.camel@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c976c62c-c97b-061b-a57e-dc76ad7b6238@kaod.org>
Date: Thu, 2 Mar 2017 08:57:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488423338.4258.11.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15015564109480233859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrfedugdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 02 Mar 2017 08:02:49 -0000

On 03/02/2017 03:55 AM, Andrew Jeffery wrote:
> On Wed, 2017-03-01 at 08:26 +0100, Cédric Le Goater wrote:
>> On 03/01/2017 04:05 AM, Andrew Jeffery wrote:
>>> Replying to myself again... I think I've learnt the lesson not to email
>>> whilst in bed.
>>>
>>> I've done some further investigation after jumping on a Romulus
>>> machine:
>>>
>>> On Tue, 2017-02-28 at 23:10 +1030, Andrew Jeffery wrote:
>>>> On Tue, 2017-02-28 at 20:27 +0800, Lei YU wrote:
>>>>> Hi Andrew, Joel,
>>>>>
>>>>> This patch is for issue https://github.com/openbmc/openbmc/issues/1214
>>>>>
>>>>> Here's what I have tested:
>>>>> 1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled;
>>>>> 2. Do a power cycle;
>>>>> 3. Once BMC is ready, check the registers by devmem:
>>>>>    ```
>>>>>>    root@romulus:/tmp# devmem 0x1e630034
>>>>>
>>>>>    0x70640000        <== Wrong, expect 0x70680000
>>>>>>    root@romulus:/tmp# devmem 0x1e630030
>>>>>
>>>>>    0x64600000        <== Wrong, expect 0x68600000
>>>>>    ```
>>>>> I can see the two registers have the unexpected value.
>>
>> These are the default values : 
>>
>> SPIR30: SPI1 CE0 Address Decoding Range Register Init = 0x6460 0000
>> SPIR34: SPI1 CE1 Address Decoding Range Register Init = 0x7064 0000
>>
>> We should let the driver configure these values I think.
>> see below.
>>
> 
> Agreed.
> 
>>>
>>> Looking at the driver[1] the only time we touch the segment register is
>>> to read the window start, we don't ever write the segment mapping
>>> configuration.
>>
>> yes, not in 4.7 yet. It is a little "complex" to configure the 
>> segments up to 5 chips handling the possible overlaps, the 
>> different chip sizes, which might be bigger than the maximum 
>> window size, and the HW bugs. AST2500 SPI controller has a bug 
>> when the CE0 chip size exceeds 120MB.
> 
> Yeah, I appreciate it's a finicky problem.
> 
>>
>> Also the controller only really makes use of them in command 
>> mode. In user mode, the start address is mostly used to 
>> identify the chip when writing commands on the AHB Bus.    
>>
>>> Cédric: Have you looked into supporting configuration of the segment
>>> mapping?
>>
>> yes. QEMU (openbmc and mainline) supports them already. 
>>
>> As for the kernel, here is an initial commit :
>>
>>    https://github.com/legoater/linux/commit/c08765882b4091cb1b9998d872415c072ecfe8af
>>
>> which I will send with a bunch of improvements when we switch 
>> to linux 4.10. I can eventually rebase on 4.7 but I would have
>> preferred not maintaining too much branches.
> 
> That's fair enough. If we apply Lei's patch to 4.7 as a hack it means
> that we can ignore the issue from then on. Any new systems will be
> based on at least 4.10, which should have your improvements.
>
>>
>>> We could configure the mapping if we know the chip sizes, however
>>> looking at the device's bindings documentation[2] we find:
>>>
>>>     ...
>>>     Required properties:
>>>     ...
>>>      - #size-cells : must be 0 corresponding to chip select child binding
>>>
>>> and
>>>
>>>     ...
>>>     Child node required properties:
>>>       - reg : must contain chip select number in first cell of address, must
>>>     be 1 tuple long
>>>     ...
>>>
>>> I think we need #size-cells to be 1 in the parent so we can define the
>>> mapping ranges. I don't know that its going to be an easy change to
>>> make though given the bindings are already upstream. Thoughts?
>>
>> In the aspeed-smc bindings, the mapping range is for the overall 
>> AHB window. This is a HW constant you can not change. 
>>
>> As for the settings of the each chip window, I would let the 
>> driver discover and configure them as you can ruin the controller 
>> behavior in command mode if they are wrong. 
> 
> I wasn't concerned about the overall AHB window so much as the chip
> windows. Letting the driver discover and configure them was what I was
> hoping for, and was investigating providing the information via the DT.

Well, we possibly could but given that we can change the 
chip (and possibly their size), it is better to try to 
detect them I think.

> If we have an alternative approach (querying the chip?) that would be
> great.

That is what my branch is trying to do but it still needs 
a couple of improvements. All segments should be configured, 
even those for which there are no chips. Lei just reminded 
me of that problem.    

>> What is the specific need ? Is it to have a window covering all 
>> the SPI CEx chips ? 
> 
> In this case it was to have CE0 window cover 64MB rather than 32MB.
> Supporting more than one chip would be a nice-to-have rather than
> something Lei needs as far as I understand.

There is still that segment overlap problem to cover even if
there are no chips.

>> If so, my tree should have that support 
>> already. But, please note that the HW is broken for chips > 128MB, 
>> on witherspoon for instance.
>>
> 
> I guess the question is about what support is going to be in which
> branch of openbmc/linux. As it stands it looks like dev-4.7 will not
> have chip window configuration support in the driver, and dev-4.10
> will.

Unless we start using what's in my branch which has a backport 
of the 4.11 driver on openbmc 4.7. It should be fine I think. 
I just need to cover the above case, moving the start address 
of the next segment should be it, plus a couple of checks.

Cheers,

C. 
