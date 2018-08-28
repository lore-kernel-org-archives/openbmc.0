Return-Path: <marek.vasut@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::242; helo=mail-wm0-x242.google.com;
 envelope-from=marek.vasut@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dWXCn7B9"; 
 dkim-atps=neutral
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com
 [IPv6:2a00:1450:400c:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420D8P3M9QzDrVP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 02:04:03 +1000 (AEST)
Received: by mail-wm0-x242.google.com with SMTP id b19-v6so2478386wme.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LTFryXqVND7F0Y3VRc8KYjyvT0Ez7FzU3MlzeDBaXEA=;
 b=dWXCn7B99Wal6W5hFpkIdEUaPnAXZhQXyuGKFlEo0MH/tLtlOwezXYZc+w5oxnrvBd
 SafRfNY5e0Jt+Z6OWZ98LNitYZEUzDBGE7JI2gCYekbPsxPnlvwINspaxwm0vqgkQnx6
 xYhHNftlkyBpV5l4z3XffyZextg4t1qOBWPgi4j1evnZ3kPAKflh/Wz1abzX2058sHch
 idRjl87YNP5NXWMr8DXhaPwLXW+E9hcTwJK795Y5IlmIJ9Xh8CDFzr/PhJ6lHDfFQP/l
 mnKvKQKGmIknMxpAhspvZgijgTh6ealJvUxP9QKzpfSy4KT6wr7T9oVlG06rXufMp28I
 3n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LTFryXqVND7F0Y3VRc8KYjyvT0Ez7FzU3MlzeDBaXEA=;
 b=lXc93erbBzBrBncL96qgnYmn+ZjJQY3mXvZfMPBMrHwpZmNR3mvn65aAoSIaA0NMc4
 GdhBMm5tqdxnQsxlwDNqIb/qWyko/NHe2KLGuIqvUFubhgyJ0IzaXsCqzXQ7wCEd3EF8
 X1CD1Xm9xCmPFi8KzQj7nGu3gm3uuqbK5zMkBXWqa4BpdA2qE09PLrC1mx6eOPtIEa6G
 ehd7m53Afg/FRAIS7gTfEJxgxDH/jNQ9xz+GE3LkFfQM6BeQsuwNvZjcsGyesyO1LgmJ
 WHwgjYNH3ZqEK/cRdOcQ2HK8En0HgrYk8pyCf1C81arMFV/1NGSUaRkjvaI2nAaxINVR
 8xQw==
X-Gm-Message-State: APzg51DUOwqui6iG2GZbLXf7z2edFAztqHD6m2ye0TdRWRtto9y7JRIQ
 FCy18UPtkoIOvTYIr5aLq64=
X-Google-Smtp-Source: ANB0VdbIWOfWf7X/m93WG0ru+4fS1Lnxp59iCq7zQ3cqqhBbcSL1Iv4myHp9YBcdUimgX2klvdTViA==
X-Received: by 2002:a1c:b441:: with SMTP id
 d62-v6mr1803758wmf.17.1535472240653; 
 Tue, 28 Aug 2018 09:04:00 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
 [86.49.107.50])
 by smtp.gmail.com with ESMTPSA id w204-v6sm2408282wmw.5.2018.08.28.09.03.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Aug 2018 09:03:59 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
Date: Tue, 28 Aug 2018 18:03:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 28 Aug 2018 16:04:06 -0000

On 08/28/2018 05:54 PM, Alexander Amelkin wrote:
> 28.08.2018 14:43, Marek Vasut wrote:
>> On 08/28/2018 01:29 PM, Alexander Amelkin wrote:
>>> 27.08.2018 14:34, Marek Vasut wrote:
>>>>>>> According to the datasheet for mx66l51235f, "The device
>>>>>>> default is in 24-bit address mode" (section 9-10). Having
>>>>>>> option SPI_NOR_4B_OPCODES makes the code act as if the
>>>>>>> device was already in 4B mode and didn't need the EN4B
>>>>>>> command. That prevents this chip from functioning on 
>>>>>>> systems where the boot loader left the chip in 3B mode
>>>>>>> (e.g. if the chip wasn't used during the boot process).
>>>>>>> 
>>>>>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option
>>>>>>> for mx66l51235f (added previously by commit
>>>>>>> d342b6a973af).
>>>>>> Could it be there are two variants of the chip, one which
>>>>>> supports the 4B opcodes and one which does not ? Wouldn't
>>>>>> be the first time I saw this. If this chip supports the
>>>>>> SFDP tables, you can check those.
>>>>> I was unable to find another variant of the chip. There is
>>>>> only one specified in the datasheet: 
>>>>> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
>>>>>
>>>>> 
and it says that the device supports both 3B and 4B modes, but defaults
to 3B (24-bit) mode.
>>>> So keep the 4B part in. Linux will just not reconfigure the
>>>> device to 4B mode using register write, but will instead issue
>>>> the 4B opcode directly, without any stateful change.
>>> Marek, thank you for asking all these questions. They made me
>>> conduct a deeper investigation than just finding the commit that
>>> broke it and reverting it. It appears that OpenPOWER P8's SBE
>>> code (the thing that P8 CPU runs first from its built-in memory)
>>> expects the PNOR flash chip to be in EN4B mode. It reads the rest
>>> of OpenPOWER Firmware using a usual READ (0x03) command with 4
>>> bytes of address. Always. That's why, I believe, Roman's commit
>>> broke host booting for us.
>> Uh oh, I seem to remember some flashes had this weird quirk where
>> they were in EN4B mode by default, and if U-Boot/Linux reset the
>> flash into "sane default" state (3B addressing etc), some systems
>> failed to boot. Furthermore, this EN4B is non-volatile bit on this
>> flash, right ? That means it is retained across power-cycles, which
>> sucks even more.
> No, EN4B is volatile. It doesn't survive power cycling. A quote from
> datasheet:
>>>> The 4BYTE bit may be cleared by power-off or writing EX4B
>>>> instruction to reset the state to be "0".

OK, that's good. I probably thought of different flash.

>>> Probably it would be best not to merge this patch into Linux
>>> kernel. I'll discuss it with colleagues from OpenPOWER community
>>> and we'll probably fix it on SBE side.
>> Can you fix the firmware ? If so, that'd be amazing.
>
> It turns out that it is impossible to fix that on firmware side
> mainly because the firmware does not send any opcodes over SPI at
> all. It relies on the SPI flash controller to do the address mapping
> so the firmware accesses the chip as a usual memory address range.
> The flash controller is located in our case inside Aspeed AST2400 BMC
> SoC and does not support 4B opcodes. It expects the chip to respond
> to generic READ and WRITE opcodes with (configurable) either 3 or 4
> address byte cycles. So the only way to make it work is put the chip
> in EN4B mode when BMC boots.

And who does that ? Or is the EN4B set by default and U-Boot/Linux
_clears_ it , thus making the board unbootable ?

Doesn't it simply mean your board is missing SPI NOR hardware reset line?

> As this is quite a specific case, I
> guess you won't be willing to remove the SPI_NOR_4B_OPCODES option
> globally. We'll have to keep the patch local to openbmc project

I am more worried about this being actually unfixable in reliable way.

>> But still, there can be a software which does rogue transmission on
>> the SPI bus and flips the flash into 3B mode before reset, so the
>> system will not boot anyway. Do you have a way to deal with that
>> somehow ?
>
> Sure. As I said, there is no way to turn on the host without BMC
> knowing/controlling it. The BMC ensures the chip is in the right
> mode. That's actually the reason why this patch appeared in the first
> place. Also, there is no rogue software on BMC.

OK, but if the BMC puts the chip in a defined state, how come the system
will refuse to (re)boot if Linux interferes with the chip's volatile
register settings ?

-- 
Best regards,
Marek Vasut
