Return-Path: <marek.vasut@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=marek.vasut@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxqldyP/"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421PhF716czF374
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 00:17:17 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id k5-v6so8222790wre.10
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s1Xls8e/QGsCTYgN56JvdBiEFb611BHe1LnmSzTEiXc=;
 b=mxqldyP/Aw4A5Ob5mBHHNvft6unE0igdSBMmoVqhCj4+FhwbQAIgcuY8FiSH36Po97
 zrSFXvWcZlUsI9vBPEXAmkGAVoDdmq+AwHdOd6Nk1Infc9FLbV2SOe1ouzhixgosRJl0
 ZCb3iovPBLoy3dyCV2i/DjMdYjGvZOee1PpsSktwbrt7slKrcXLOc0NfczSP/Kt7AMih
 2Ga1q3A/say1zZvN6xy+rsKdEXdaOr+IH+VU6hr1PyAwA2ECHUS/B9MD/7nauAM6UTTT
 q6LiaWKJJ2G3d5jMSzSEfXU2WW0b4cM8qG5Hz9+LcLiKkqtvNcOxYZbUxCagZuInVFbB
 60dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s1Xls8e/QGsCTYgN56JvdBiEFb611BHe1LnmSzTEiXc=;
 b=ZywFUVmbdebc8IZtE79G5fKeGreATMQlBk4Bk0nI1hqn/+6mqV3hueLRpVMMg7bQUB
 mZqbgIJRgmQUZifFtgBNyiRiCrMy+3CUiCu0gIo1dKUE1FW0tAtz3v7FYx253QkRbUHQ
 Jg9F8SJp7XHQNPuURCPjeKQuaoiWrr1THphIJ2ARTGZSnMOmjLxSN58GLezGmonTaeC+
 BOGi1vuqGllY2HRc2gI2CwwuoabBismarNqq4u1B0YnGKOkMTKCb20KQaNRbBLlUuTBx
 VshFCFG5moHbCx4nTXl+7aWQrsm9yPSt7JBZhZMk0R3eFV7Ku2zDovUyDQQIns1LpozX
 ni8A==
X-Gm-Message-State: APzg51BPw2jO0BoNWSercNKaL9T/hkevt1YcGctIjNbr4XANPsBBBeZd
 mty7x+imJ26cAG2zAu8ChxY=
X-Google-Smtp-Source: ANB0VdZkTctElKAPagkluUg7PHI/9m9Xhfzng9PoSzDGoEjKLumpdWLoDhNOXwi6l2BnPHt0Sh7CzQ==
X-Received: by 2002:adf:8167:: with SMTP id
 94-v6mr7930214wrm.127.1535638634479; 
 Thu, 30 Aug 2018 07:17:14 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
 [86.49.107.50])
 by smtp.gmail.com with ESMTPSA id z14-v6sm2094038wma.18.2018.08.30.07.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Aug 2018 07:17:13 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: leroi.lists@gmail.com, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
 <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
 <c8b2b68f-b5fe-00ce-df53-f1d32400460b@kaod.org>
 <4c99e942-6641-97ca-bbac-040b05a308cb@wedev4u.fr>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <259aa37f-9837-ad38-43e3-4fa71e721a9d@gmail.com>
Date: Thu, 30 Aug 2018 16:17:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <4c99e942-6641-97ca-bbac-040b05a308cb@wedev4u.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 30 Aug 2018 14:17:19 -0000

On 08/30/2018 04:16 PM, Cyrille Pitchen wrote:
> Hi all,
> 
> Le 29/08/2018 à 14:12, Cédric Le Goater a écrit :
>> [ ... ] 
>>
>>> Ah, so the whole problem is, the ASpeed 2400 SPI NOR controller does
>>> memory-mapped read from the flash and that has some limitations when the
>>> flash is over 16 MiB in size -- it sends 3 byte standard opcodes with 4
>>> byte address ?
>>
>> yes.
>>
>> [ ... ]
>>
>>> To simplify the situation, if the ASpeed 2400 SPI NOR controller tried
>>> reading the SPI flash past 16 MiB, it would also require that the flash
>>> is in EN4B mode, yes ?
>>
>> yes.
>>
>> [ ... ]
>>
>>>> I start thinking about maybe adding an option to "jedec,spi-nor" DTS
>>>> binding like "enable-4byte-mode", so that we could get rid of our
>>>> local patch and just specify that option in the devicetree. The
>>>> option would force EN4B on the chip if it supports that mode. What do
>>>> you think? How do I do it if you approve? Send patches separately in
>>>> here and in the devicetree mailing list or cross-post both patches to
>>>> both lists?
>>>
>>> That's an option. But what I think this is really about is a fact that
>>> we completely lack any way to negotiate limitations between the SPI NOR
>>> and the controller.
>>
>> what about the hwcaps in spi_nor_scan() ? 
>>
> 
> Maybe only a matter of taste but I agree with Cedric: a new hwcaps sounds
> better than a new DT property. There are already different "compatible"
> strings to make the difference between AST2400 and AST2500, so we can
> add the new hwcap only to AST2400 entries. Then no need to update any
> existing device trees, at least in this case.
> 

Good idea :)

-- 
Best regards,
Marek Vasut
