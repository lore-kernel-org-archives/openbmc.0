Return-Path: <clg@kaod.org>
X-Greylist: delayed 4505 seconds by postgrey-1.36 at bilbo;
 Wed, 17 May 2017 01:14:22 AEST
Received: from 8.mo3.mail-out.ovh.net (8.mo3.mail-out.ovh.net [87.98.172.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wS1FV0HbKzDqb3
 for <openbmc@lists.ozlabs.org>; Wed, 17 May 2017 01:14:21 +1000 (AEST)
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2D96FD2DDE
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 15:59:11 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id A915A4400AE;
 Tue, 16 May 2017 15:59:07 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
 <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
 <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
 <7B0513B8-3B71-42AD-B9D5-2F05E7B000C2@linux.vnet.ibm.com>
 <3a8ba892-7560-a028-2441-61fe546792ed@kaod.org>
 <D4C24912-6520-4ECB-B80C-B13D1D3515AB@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7de4ad45-f675-b691-f3de-b7c02c5e5bfd@kaod.org>
Date: Tue, 16 May 2017 15:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <D4C24912-6520-4ECB-B80C-B13D1D3515AB@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 409546095297334018
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrudehgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 16 May 2017 15:14:22 -0000

On 05/16/2017 03:30 PM, Adriana Kobylak wrote:
> 
>> On May 16, 2017, at 1:01 AM, Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
>>
>> On 05/15/2017 02:41 AM, Adriana Kobylak wrote:
>>>
>>>> On May 13, 2017, at 3:49 PM, Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
>>>>
>>>> On 05/11/2017 02:12 PM, Joel Stanley wrote:
>>>>> On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
>>>>> <anoo@linux.vnet.ibm.com <mailto:anoo@linux.vnet.ibm.com>> wrote:
>>>>>> Milton stopped by and mentioned that you had tried to modify the 4K erase
>>>>>> sector previously for a perhaps bmc chip and saw some flash corruption when
>>>>>> moving to an image that changed it?
>>>>>>
>>>>>> Just wanted to add that this change only changes the pnor setting and I
>>>>>> didn’t see any issues powering on a system after updating the BMC with an
>>>>>> image with this change. Then I updated the pnor with an image that had the
>>>>>> mbox enabled. Also checked with AndrewJ and the hostboot team and there’s no
>>>>>> hard-coded assumptions in their side about the erase size.
>>>>>>
>>>>>> With all this info let me know if you have any thoughts or concerns.
>>>>>
>>>>> I recall issues relating to this option. I didn't record what they were 
>>>>> though.
>>>>
>>>> We tried to activate 4K erase on some chips, which supported it, 
>>>> and that the OpenPOWER systems use. That was because the PNOR 
>>>> sections were not aligned with the erase size and that caused 
>>>> some issues in pflash. But it breaks the compatibility with 
>>>> previously created jffs2 filesystems. jffs2 stores the erase 
>>>> size. So we stepped back.
>>>>
>>>>> Cedric, can you remind me what the issues are with the 4K kconfig option?
>>>>
>>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase commands, 
>>>> and without it, the driver will use the sector erase command, most
>>>> likely 64K. I suppose we could have the same problem as described 
>>>> above, as it can change the default erase size of a chip. to be
>>>> checked.
>>>>
>>> Thanks Cedric for the info. It appears there are no issues when 
>>> disabling the 4K sectors for the pnor chip (yes, the erase size 
>>> is then 64K), probably because the pnor is not formatted with 
>>> a jffs2 filesystem. We might need to clear the pnor chip anyways
>>> to be able to format it as a UBI volume. So would you say we’re 
>>> ok with this patch?
>>
>> Well, what if the BMC is using a flash module with a 4K erase size ? 
> 
> All the mtd devices except PNOR in the P8 and P9 systems running openbmc 
> have already an erase size of 64K.

So everything is fine for these.

Cheers,

C. 


> Ex witherspoon:
> root@witherspoon:~# cat /proc/mtd 
> dev:    size   erasesize  name
> mtd0: 02000000 00010000 "bmc"
> mtd1: 00060000 00010000 "u-boot"
> mtd2: 00020000 00010000 "u-boot-env"
> mtd3: 00440000 00010000 "kernel"
> mtd4: 01740000 00010000 "rofs"
> mtd5: 00400000 00010000 "rwfs"
> mtd6: 02000000 00010000 "alt"
> mtd7: 08000000 00001000 “pnor”
> 
> Ex barreleye:
> root@barreleye:~# cat /proc/mtd 
> dev:    size   erasesize  name
> mtd0: 02000000 00010000 "bmc"
> mtd1: 00060000 00010000 "u-boot"
> mtd2: 00020000 00010000 "u-boot-env"
> mtd3: 00440000 00010000 "kernel"
> mtd4: 01740000 00010000 "rofs"
> mtd5: 00400000 00010000 "rwfs"
> mtd6: 04000000 00001000 "pnor"
> 
>>
>> C.
> 
