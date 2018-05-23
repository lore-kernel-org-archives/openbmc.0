Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RodiXxhO"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rYLB48dFzF0vb
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 23:30:42 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id w19-v6so13039070plq.4
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fN8SXZGICdw3L/Xt8IxcYpChs2Is32DlG5RYJCNLP6c=;
 b=RodiXxhOnJAls5zNkucXNPXYFfwEqF/BzyaZ2H4fq9fwWa2qCJGBF2umh8ZGFDSTpW
 H2F+XecosNtKuOq8oiNx7329kzHsUk8qchgeCrjGtVxJ7uDATXb7ceny1MrbLchPVCsE
 uz4cfMW6anVcuJh20yUtn7nTO4R07CC+K92KwaFTzf74tdAgn8dPdVgUOi4Exo2fnzOq
 IPz9K013cS/C8GJPSRxDsaBXwZrjTO7ISx/U7tgMuj2hjQSZVqLGotRFnX/OMh+d6xxQ
 q3Mlq6+Q1Fe376QHPzkz/XjEmDwNR1MsWKVqPYFt0Xn+Sa17yj/vtzuqZum0S/V/qC4X
 G30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=fN8SXZGICdw3L/Xt8IxcYpChs2Is32DlG5RYJCNLP6c=;
 b=m2Fg9oGLH1tfgrC/WCJGHuZS9wE9alw4YkB6BEjuKiB5VpJDEAKtVIDiyxBwqhCNmw
 CxGB9uXCUW0tP8hE+Yq3c/Cey5/7spEHSMUv8mh2PUfYApT5oDiKBIZhCdiYl3DdUq7d
 e33d59zjl75522hfS7tDjZW2lqI66sGA05rONQMJK0r43hTeQ/lKDc/hQANNetbSMrA9
 rosWQTData5o04NsD2fPo/l6pIedbhzSWU+lIgs5Yqu2s3kQb2lICx1kOLFg7Az5EjVY
 Hu6L7+BWTEYpkgNH2/qwY+mEkLDwA3I6aZXyZSOXtow1CP2Efv4t8+AEuZB2AyeZInzc
 xPUg==
X-Gm-Message-State: ALKqPweW110Eo85JnHbNIIvlsNYH+AxEc9g8EZb6/ciRYuOd1rDfGsfV
 8V2wS/yGnEDF5Td4Y+Zc2w==
X-Google-Smtp-Source: AB8JxZpP/lqVYykmrTXInBWdtpkAHJ6dMieEpZuAYlIsH08XyJysiTzMkOZ5GkcXVHTgAv1Yw3jDmA==
X-Received: by 2002:a17:902:6ac6:: with SMTP id
 i6-v6mr3088425plt.31.1527082239856; 
 Wed, 23 May 2018 06:30:39 -0700 (PDT)
Received: from serve.minyard.net ([47.184.170.59])
 by smtp.gmail.com with ESMTPSA id x88-v6sm55916096pfj.126.2018.05.23.06.30.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 May 2018 06:30:38 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id 02BD967D;
 Wed, 23 May 2018 08:30:36 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH v2 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
To: Avi Fishman <avifishman70@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Wang, Haiyue" <haiyue.wang@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>
References: <1526906399-30140-1-git-send-email-avifishman70@gmail.com>
 <1526906399-30140-2-git-send-email-avifishman70@gmail.com>
 <3977bafa-3b0b-eb3c-7c20-57b333e8a2c8@acm.org>
 <CAKKbWA5oo_hKrLi=NKh_Xmko4T9RBv=PGpUqNtkoBB=7skO_9w@mail.gmail.com>
 <b00ca01a-1984-5b41-3c9d-fda70b988e33@acm.org>
 <CAKKbWA6SXc4O8unAZE06irBri2YSQJs8BoDo94hbyj1B8poG6Q@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <d1a5bceb-4809-847a-cb68-d71a9d2f5474@acm.org>
Date: Wed, 23 May 2018 08:30:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKKbWA6SXc4O8unAZE06irBri2YSQJs8BoDo94hbyj1B8poG6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 23 May 2018 13:30:44 -0000

On 05/23/2018 08:06 AM, Avi Fishman wrote:
> On Wed, May 23, 2018 at 3:05 PM, Corey Minyard <minyard@acm.org> wrote:
>> On 05/23/2018 04:40 AM, Avi Fishman wrote:
>>> On Tue, May 22, 2018 at 9:52 PM, Corey Minyard <minyard@acm.org> wrote:
>>>> On 05/21/2018 07:39 AM, avifishman70@gmail.com wrote:
>>>>> From: Avi Fishman <AviFishman70@gmail.com>
>>>>>
>>>>> Original kcs_bmc_npcm7xx.c was missing enabling to send interrupt to the
>>>>> host on writes to output buffer.
>>>>> This patch fixes it by setting the bits that enables the generation of
>>>>> IRQn events by hardware control based on the status of the OBF flag.
>>>>
>>>> This look ok, I've added it to my 4.19 queue.
>>> Thanks Corey,
>>>
>>> Since drivers/char/ipmi/kcs_bmc_npcm7xx.c already exists in linux-next
>>> (4.18) what not adding it as a fix in 4.18?
>>
>> I try not to add new stuff at this stage in the game.  I was debating
>> whether this is a bugfix or a new feature.  If you have a pressing need to
>> have it in 4.18, I can consider that.
>>
>> -corey
> Without this fix the host is doing polling at a very slow rate, when
> the host is triggered by an interrupt the response is much more
> faster.
> Note that the same people who tested and approved the original driver
> reported the performance issue and they tested it with this fix and
> also approved.
> They and I will appriciate if it will be in 4.18 :)
>
> -Avi

Ok, it's in my linux-next queue for 4.18.

-corey

>>
>>> -Avi
>>>
>>>> -corey
>>>>
>>>>
>>>>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
>>>>> Reviewed-by:   Haiyue Wang <haiyue.wang@linux.intel.com>
>>>>> ---
>>>>>     drivers/char/ipmi/kcs_bmc_npcm7xx.c | 17 ++++++++++++++---
>>>>>     1 file changed, 14 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>>>> b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>>>> index 7bc898c5d372..722f7391fe1f 100644
>>>>> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>>>> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>>>>> @@ -39,6 +39,12 @@
>>>>>     #define KCS3CTL               0x3C
>>>>>     #define    KCS_CTL_IBFIE      BIT(0)
>>>>>     +#define KCS1IE               0x1C
>>>>> +#define KCS2IE         0x2E
>>>>> +#define KCS3IE         0x40
>>>>> +#define    KCS_IE_IRQE          BIT(0)
>>>>> +#define    KCS_IE_HIRQE         BIT(3)
>>>>> +
>>>>>     /*
>>>>>      * 7.2.4 Core KCS Registers
>>>>>      * Registers in this module are 8 bits. An 8-bit register must be
>>>>> accessed
>>>>> @@ -48,12 +54,14 @@
>>>>>      * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
>>>>>      * dib: KCS Channel n Data In Buffer Register (KCSnDI).
>>>>>      * ctl: KCS Channel n Control Register (KCSnCTL).
>>>>> + * ie : KCS Channel n  Interrupt Enable Register (KCSnIE).
>>>>>      */
>>>>>     struct npcm7xx_kcs_reg {
>>>>>           u32 sts;
>>>>>           u32 dob;
>>>>>           u32 dib;
>>>>>           u32 ctl;
>>>>> +       u32 ie;
>>>>>     };
>>>>>       struct npcm7xx_kcs_bmc {
>>>>> @@ -63,9 +71,9 @@ struct npcm7xx_kcs_bmc {
>>>>>     };
>>>>>       static const struct npcm7xx_kcs_reg
>>>>> npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
>>>>> -       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
>>>>> -       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
>>>>> -       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
>>>>> +       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL,
>>>>> .ie
>>>>> = KCS1IE },
>>>>> +       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL,
>>>>> .ie
>>>>> = KCS2IE },
>>>>> +       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL,
>>>>> .ie
>>>>> = KCS3IE },
>>>>>     };
>>>>>       static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>>>>> @@ -95,6 +103,9 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc
>>>>> *kcs_bmc, bool enable)
>>>>>           regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>>>>>                              enable ? KCS_CTL_IBFIE : 0);
>>>>> +
>>>>> +       regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE |
>>>>> KCS_IE_HIRQE,
>>>>> +                          enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
>>>>>     }
>>>>>       static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
>>>>
>>>>
