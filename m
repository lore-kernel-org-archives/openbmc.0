Return-Path: <clg@kaod.org>
Received: from 19.mo5.mail-out.ovh.net (19.mo5.mail-out.ovh.net [46.105.35.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzJ9c6pXnzDqJr
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 06:00:04 +1100 (AEDT)
Received: from player688.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 0ED526998E
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 19:50:45 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id 5CAED20083;
 Wed, 11 Jan 2017 19:50:42 +0100 (CET)
Subject: Re: [PATCH linux 2/3] mtd: spi-nor: aspeed: add support for SPI dual
 IO read mode
To: Rob Lippert <roblip@gmail.com>
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-3-rlippert@google.com>
 <fbab9bcc-1fa5-cc91-a5ff-d242d0465029@kaod.org>
 <CAN+5HW0ibdtp4cLmE6DhpGcNao3+6AGPdJYfAtVoHYRx5NxmKw@mail.gmail.com>
 <4ff48c6c-d65a-4b41-50e6-24bcbb1bdf72@kaod.org>
 <CAN+5HW0-kZigB+WxYdGdUmgXxk7_mWFC_d-0Jcz-mYuPy8LRVQ@mail.gmail.com>
Cc: openbmc@lists.ozlabs.org, Robert Lippert <rlippert@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <abe9191f-7839-3ccf-d9ce-37188505f031@kaod.org>
Date: Wed, 11 Jan 2017 19:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAN+5HW0-kZigB+WxYdGdUmgXxk7_mWFC_d-0Jcz-mYuPy8LRVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9116411547501824860
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrvdekgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuoehnohhnvgeqnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 11 Jan 2017 19:00:05 -0000

On 01/11/2017 07:34 PM, Rob Lippert wrote:
> On Wed, Jan 11, 2017 at 3:43 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 01/10/2017 11:54 PM, Rob Lippert wrote:
>>> On Tue, Jan 10, 2017 at 12:10 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> Hello Robert,
>>>>
>>>> On 01/10/2017 02:05 AM, Robert Lippert wrote:
>>>>> Implements support for the dual IO read mode on aspeed SMC/FMC
>>>>> controllers which uses both MISO and MOSI lines for data during a read
>>>>> to double the read bandwidth.
>>>>>
>>>>> Signed-off-by: Robert Lippert <rlippert@google.com>
>>>>> ---
>>>>>
>>>>>  drivers/mtd/spi-nor/aspeed-smc.c | 28 ++++++++++++++++++++++------
>>>>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> index d3bed34f5aa0..a8ca2ab308d7 100644
>>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>>> @@ -540,6 +540,9 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>>>>>  {
>>>>>       struct aspeed_smc_chip *chip = nor->priv;
>>>>>       int ret;
>>>>> +     u32 ctl;
>>>>> +     int i;
>>>>> +     u8 dummy = 0;
>>>>
>>>> OxFF would be a better value.
>>>
>>> OK.
>>>
>>>>
>>>>>       mutex_lock(&chip->controller->mutex);
>>>>>
>>>>> @@ -557,6 +560,18 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>>>>>
>>>>>       aspeed_smc_start_user(nor);
>>>>>       aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>>>>> +
>>>>> +     /* Send dummy bytes */
>>>>> +     for (i = 0; i < (chip->nor.read_dummy / 8); ++i)
>>>>
>>>> the parentheses are not needed I think.
>>>
>>> Yes not needed, removed.
>>>
>>>>
>>>>> +             aspeed_smc_write_to_ahb(chip->base, &dummy, 1);
>>>>> +
>>>>> +     if (chip->nor.flash_read == SPI_NOR_DUAL) {
>>>>> +             /* Switch to dual I/O mode for data cycle */
>>>>> +             ctl = readl(chip->ctl) & ~CONTROL_SPI_IO_MODE_MASK;
>>>>> +             ctl |= CONTROL_SPI_IO_DUAL_DATA;
>>>>> +             writel(ctl, chip->ctl);
>>>>> +     }
>>>>
>>>> So why can not we set the controller in aspeed_smc_chip_setup_finish()
>>>> once and for all ?
>>>
>>> It needs to make sure to only effect the data part of the operation
>>> (the command+addr writes to the device should not be dual-IO mode),
>>> and also needs to not interfere with the aspeed_smc_read_reg read
>>> calls in which the data phase cannot be dual IO mode.
>>
>> ok. it makes sense. Is it much faster ?
> 
> Yea it is about twice as much bandwidth, as I mentioned in the cover
> letter it drops the time to dump an entire 64MB flash from 12s to 7s.

Good. Sorry for asking, I scanned the cover a bit quickly it seems. 

> With a companion change to u-boot to double the SPI frequency to
> 104Mhz that time drops to 3s and speeds up the entire bmc boot process
> (including uboot) by about 15s.

yes we need to add that to the driver also. I have a few other patches
improving the timing settings but I have been focusing on upstreaming 
first.

Thanks,

C. 

 
> Thanks,
> -Rob
> 
>>
>> Thanks,
>>
>> C.
>>
>>>>
>>>>> +
>>>>>       aspeed_smc_read_from_ahb(read_buf, chip->base, len);
>>>>>       aspeed_smc_stop_user(nor);
>>>>>
>>>>> @@ -868,6 +883,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>>>>               cmd = CONTROL_SPI_COMMAND_MODE_NORMAL;
>>>>>               break;
>>>>>       case SPI_NOR_FAST:
>>>>> +     case SPI_NOR_DUAL:
>>>>>               cmd = CONTROL_SPI_COMMAND_MODE_FREAD;
>>>>>               break;
>>>>>       default:
>>>>> @@ -876,9 +892,13 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>>>>       }
>>>>>
>>>>>       chip->ctl_val[smc_read] |= cmd |
>>>>> +             spi_control_fill_opcode(chip->nor.read_opcode) |
>>>>>               CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8);
>>>>>
>>>>> -     dev_dbg(controller->dev, "base control register: %08x\n",
>>>>> +     if (chip->nor.flash_read == SPI_NOR_DUAL)
>>>>> +             chip->ctl_val[smc_read] |= CONTROL_SPI_IO_DUAL_DATA;
>>>>
>>>> may be we can move that part in the switch setting above  ?
>>>
>>> Done.
>>>
>>>>
>>>>> +     dev_info(controller->dev, "read control register: %08x\n",
>>>>>                chip->ctl_val[smc_read]);
>>>>
>>>> may be keep dev_dbg, but the change of 'base' by 'read' is ok.
>>>
>>> OK.
>>>
>>>>
>>>> Thanks,
>>>>
>>>> C.
>>>>
>>>>>       return 0;
>>>>>  }
>>>>> @@ -980,11 +1000,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
>>>>>               if (err)
>>>>>                       continue;
>>>>>
>>>>> -             /*
>>>>> -              * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL attach
>>>>> -              * when board support is present as determined by of property.
>>>>> -              */
>>>>> -             err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
>>>>> +             err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_DUAL);
>>>>>               if (err)
>>>>>                       continue;
>>>>>
>>>>>
>>>>
>>
