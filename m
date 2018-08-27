Return-Path: <marek.vasut@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::244; helo=mail-wm0-x244.google.com;
 envelope-from=marek.vasut@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E1VYOKs5"; 
 dkim-atps=neutral
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zVDs3FTFzDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 21:35:24 +1000 (AEST)
Received: by mail-wm0-x244.google.com with SMTP id y2-v6so7755771wma.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=idqZ/9XINklb5P/ie2zpURiBBWWCBzj0RwDDWf7ZycM=;
 b=E1VYOKs5pWxyBgW2wb51xjP3SloWyxieQxsYZvmVbQFhlHtfIP008hCpgYHUUk7nLk
 5L4eHGVvjOt4lF7i3NXY4nFA4ZRNiR4dJ/r4pc0PzMTorXsCOsfbgNO7pGCUq5dW3qYb
 8mpUZKL5BxZeINdWn1fof+KJxXACObmHU/Jmbsnri9yyUewfLzYWA9xmcf1ttjXGcg9U
 ENV/dOOIFhaNZPjl79SVFy11MG08vj1hMVcvcaQmpXp7bgvPpr7dWhQykBJdCEox4VB2
 VnmXexLciAlYw/SGN8RL8mlgyLD7GRqJEVzdD6hzXeP0ijUuZpmX2IN4kE2yeWiSlKJT
 62ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=idqZ/9XINklb5P/ie2zpURiBBWWCBzj0RwDDWf7ZycM=;
 b=XSvrRYUxG04aCjwWH/wVuq4RzNddXTGJzSgO1XjgSlsRWBcd48Objq6VhKx9FHf66O
 NSJuMok7ju74nLx0DdbQ0UOFe1/tALMbCO1fSBqLnqk2Z6mf9E/vDZOrlS4muOxPIkp5
 VZGFB5fjPGt+knhtAIkboJnJjagKCL6nmaYDuIoJWM+BQ+AFqfXTZZGF1C7/GHyn9eQr
 8Wf3S4jis0WxbqyU5YGaRuD4UJ7WrvjI6qdy3FgogCbpsjw6P2pV4v19+HTVa7BH4UaS
 CJs2lDjzcs58m0K/7KmAQbWHWgZRUyqM3/7u0Gjo2YBpsP0zzxer94EmL/wg8RD16O8G
 y9jw==
X-Gm-Message-State: APzg51Aiemdc3G8dOrpVaHoaXhwCfMEL8WIhiZufupBX26NhLdMdjIUi
 w72/KlQo3vw18JZbA2f4C38=
X-Google-Smtp-Source: ANB0VdbVvXR9u3qK6L8/KudsWg6HmsesXrDvtCJB6X/82s4iAPvK6VQmKB/k3jxbQGF7nq7v+zaKXg==
X-Received: by 2002:a1c:adcc:: with SMTP id
 w195-v6mr5699087wme.41.1535369720217; 
 Mon, 27 Aug 2018 04:35:20 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
 [86.49.107.50])
 by smtp.gmail.com with ESMTPSA id v133-v6sm13716236wma.36.2018.08.27.04.35.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Aug 2018 04:35:19 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
Date: Mon, 27 Aug 2018 13:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Aug 2018 02:51:48 +1000
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
X-List-Received-Date: Mon, 27 Aug 2018 11:35:27 -0000

On 08/27/2018 01:24 PM, Alexander Amelkin wrote:
> 27.08.2018 13:33, Marek Vasut wrote:
>> On 08/20/2018 12:26 PM, Alexander Amelkin wrote:
>>> Currently in spi-nor driver there is a line for mx66l51235l.
>>> According to Macronix site, there is no such part number. The chip
>>> detected as such is actually mx66l51235f. Hence, this commit renames
>>> the chip.
>> I wonder if this could pose a problem, since this might interfere with
>> the DT being an ABI. But I guess fixing the name is OK.
> Well, as far as I understand, in the DT you'll only have "compatible=jedec,spi-nor" for most cases.
> Anyway, I did `grep -r mx66l41235 arch/*/boot/dts` and found nothing, so I guess it's safe to rename.

The argument can go in the direction of out-of-tree DTs . I think it's
OK to fix it too though.

>>> According to the datasheet for mx66l51235f, "The device default is in
>>> 24-bit address mode" (section 9-10). Having option SPI_NOR_4B_OPCODES
>>> makes the code act as if the device was already in 4B mode and didn't
>>> need the EN4B command. That prevents this chip from functioning on
>>> systems where the boot loader left the chip in 3B mode (e.g. if the
>>> chip wasn't used during the boot process).
>>>
>>> Hence, this commit removes the SPI_NOR_4B_OPCODES option for
>>> mx66l51235f (added previously by commit d342b6a973af).
>> Could it be there are two variants of the chip, one which supports the
>> 4B opcodes and one which does not ? Wouldn't be the first time I saw
>> this. If this chip supports the SFDP tables, you can check those.
> I was unable to find another variant of the chip. There is only one specified in the datasheet:
> http://www.macronix.com/Lists/Datasheet/Attachments/7401/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf
> and it says that the device supports both 3B and 4B modes, but defaults to 3B (24-bit) mode.

So keep the 4B part in. Linux will just not reconfigure the device to 4B
mode using register write, but will instead issue the 4B opcode
directly, without any stateful change.

> Most probably, Roman Yeryomin, the author of commit d342b6a973af, was fighting post-effects of u-boot or some other boot loader that set his chip to 4B mode before jumping to Linux kernel.

It's the other way around, U-Boot keeps the flash in 3B mode.

> It is hard to say for sure, though, as neither his patch itself, nor his post to the mailing list contained any rationale for the change.
> 
> It is for sure though that for OpenPOWER systems using this chip as PNOR (BIOS flash in x86 terms), commit d342b6a973af broke host booting.

I CCed him, so maybe he can clarify.

But this is weird. If you reboot the system, isn't the SPI NOR
power-cycled and reset into defined default state ? If not, your
hardware is severely broken and you should fix your reset routing.

-- 
Best regards,
Marek Vasut
