Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YMkClm6C"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rWRV0GjJzF0x4
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 22:05:09 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id u7-v6so831058pgp.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X4qgPO5pXoi0ZvfSGQcMFgSIbI8CtlVB1E5MmKAgoqk=;
 b=YMkClm6CYTqpbM+GOXx8eZd4ORE0d0tBAWNkcPAX1tcDM0vVW0tAEnyu7+WDhQc4D3
 xtpo9AbyT+MqaljG+3yUxWi33ihAqudJBw3gwlIQqUYk62CnMp5dZM2BY+G6iSc9HSNZ
 fGpuM2M9YNDBDJ4RH9zBxRxQj/3uJUjeNAiJEExV9Ge7BkQ3pPYY7cMcfXjy2N5FjoYU
 2Ecj6ySnpZVc7t35dibLCosA1RI4FHGnHDKX/8kYMRhVcVVaHizB1pInwBJnhkyfJUb2
 rTCA1ztCotjyRJ1pWj1jqo9se2CJ1LTvZwy2ZIIi/xBaFdhjHDdCLeu/JsK0Mt/wWVE5
 7jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=X4qgPO5pXoi0ZvfSGQcMFgSIbI8CtlVB1E5MmKAgoqk=;
 b=WaNDiGiydFi+McJrPVaA+oMcFKstqH8iwjp8kC/FMDNttrSIXlfezOOvfBHAJB7m+q
 qdR91F+ZoYixCda9coFuTUTwQmAygBB/+EcWPnMW6whHTtEoDSgdXjOBmIx/NuLvT5L8
 2QhdkuEYjC1VHGjgXT39iI5+oMTcgGlLSUswB7rDMXwEaV8mGxfZ97zdvttBrQZ+ico8
 PsrzUTJ3fZXQGobRxoD55T8wphEe/cJD/GyWfvoe0eJUXgANKxxSgiskL5sC5A3DO+Wn
 2/BeGhzD1//8xTnlNSp3N8u8Rr4b2l/Cvk95b38eCGMmJf7d2c+ZQcHWTJLnCV8WTO//
 GNgQ==
X-Gm-Message-State: ALKqPwelxv+IagelLTvtpmwASTFfJ/7Ge3mMbcrZ+sqcZkPPAyvm146Y
 EKMaX/8wpy1o3SB6xNGoSg==
X-Google-Smtp-Source: AB8JxZrQS6dZOiik/u/ojLeba+lnCFJjpn6Am4Gl9U/ssVX3eqTCTkzfE3tGpZ9LNBXZDirBY0Nglw==
X-Received: by 2002:a65:534d:: with SMTP id
 w13-v6mr647481pgr.178.1527077106699; 
 Wed, 23 May 2018 05:05:06 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.59])
 by smtp.gmail.com with ESMTPSA id c20-v6sm46657519pfk.63.2018.05.23.05.05.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 05:05:05 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 9AFBBA7;
 Wed, 23 May 2018 07:05:03 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
To: Avi Fishman <avifishman70@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Wang, Haiyue" <haiyue.wang@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>, tali.perry1@gmail.com
References: <1526906399-30140-1-git-send-email-avifishman70@gmail.com>
 <1526906399-30140-2-git-send-email-avifishman70@gmail.com>
 <3977bafa-3b0b-eb3c-7c20-57b333e8a2c8@acm.org>
 <CAKKbWA5oo_hKrLi=NKh_Xmko4T9RBv=PGpUqNtkoBB=7skO_9w@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <b00ca01a-1984-5b41-3c9d-fda70b988e33@acm.org>
Date: Wed, 23 May 2018 07:05:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKKbWA5oo_hKrLi=NKh_Xmko4T9RBv=PGpUqNtkoBB=7skO_9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 12:05:12 -0000

On 05/23/2018 04:40 AM, Avi Fishman wrote:
> On Tue, May 22, 2018 at 9:52 PM, Corey Minyard <minyard@acm.org> wrote:
>> On 05/21/2018 07:39 AM, avifishman70@gmail.com wrote:
>>> From: Avi Fishman <AviFishman70@gmail.com>
>>>
>>> Original kcs_bmc_npcm7xx.c was missing enabling to send interrupt to the
>>> host on writes to output buffer.
>>> This patch fixes it by setting the bits that enables the generation of
>>> IRQn events by hardware control based on the status of the OBF flag.
>>
>> This look ok, I've added it to my 4.19 queue.
> Thanks Corey,
>
> Since drivers/char/ipmi/kcs_bmc_npcm7xx.c already exists in linux-next
> (4.18) what not adding it as a fix in 4.18?

I try not to add new stuff at this stage in the game.  I was debating 
whether this is a bugfix or a new feature.  If you have a pressing need 
to have it in 4.18, I can consider that.

-corey

> -Avi
>
>> -corey
>>
>>
>>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
>>> Reviewed-by:   Haiyue Wang <haiyue.wang@linux.intel.com>
>>> ---
>>>    drivers/char/ipmi/kcs_bmc_npcm7xx.c | 17 ++++++++++++++---
>>>    1 file changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>> b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>> index 7bc898c5d372..722f7391fe1f 100644
>>> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>> @@ -39,6 +39,12 @@
>>>    #define KCS3CTL               0x3C
>>>    #define    KCS_CTL_IBFIE      BIT(0)
>>>    +#define KCS1IE               0x1C
>>> +#define KCS2IE         0x2E
>>> +#define KCS3IE         0x40
>>> +#define    KCS_IE_IRQE          BIT(0)
>>> +#define    KCS_IE_HIRQE         BIT(3)
>>> +
>>>    /*
>>>     * 7.2.4 Core KCS Registers
>>>     * Registers in this module are 8 bits. An 8-bit register must be
>>> accessed
>>> @@ -48,12 +54,14 @@
>>>     * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
>>>     * dib: KCS Channel n Data In Buffer Register (KCSnDI).
>>>     * ctl: KCS Channel n Control Register (KCSnCTL).
>>> + * ie : KCS Channel n  Interrupt Enable Register (KCSnIE).
>>>     */
>>>    struct npcm7xx_kcs_reg {
>>>          u32 sts;
>>>          u32 dob;
>>>          u32 dib;
>>>          u32 ctl;
>>> +       u32 ie;
>>>    };
>>>      struct npcm7xx_kcs_bmc {
>>> @@ -63,9 +71,9 @@ struct npcm7xx_kcs_bmc {
>>>    };
>>>      static const struct npcm7xx_kcs_reg
>>> npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
>>> -       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
>>> -       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
>>> -       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
>>> +       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL, .ie
>>> = KCS1IE },
>>> +       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL, .ie
>>> = KCS2IE },
>>> +       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie
>>> = KCS3IE },
>>>    };
>>>      static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>>> @@ -95,6 +103,9 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc
>>> *kcs_bmc, bool enable)
>>>          regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>>>                             enable ? KCS_CTL_IBFIE : 0);
>>> +
>>> +       regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE |
>>> KCS_IE_HIRQE,
>>> +                          enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
>>>    }
>>>      static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
>>
>>
