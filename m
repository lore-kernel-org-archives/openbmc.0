Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJuftGbz"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rSF26NJrzDr2J
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 19:40:51 +1000 (AEST)
Received: by mail-io0-x242.google.com with SMTP id r9-v6so22000036iod.6
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RWwrOM43vyJjmhPErQY/tR6Rikm/iiPmdds8xl+akxQ=;
 b=OJuftGbz4l+yIss80JV1JrT1SGU2E98/FAnLm85f9nRGROjUX2dGs0xGc5ps0ol6qb
 WwT8RgN7XE7DkU937kfmeYm7TfQ8PP3j1yGLwYoeuUfKJdmK+8y3Yal/L3wm9Id3uulG
 CPiGL0Pr88ZcburRnadyQpfUrPUkgTVAy3tYHS/pCzNqdWWqnv4Co5jAHpc/5zMyIzRR
 DGYQQrhwlf6F+vAz5bA+fOAT2UxP7SohwL9+tFiBZpxqhty7ePZjAdfhSxjWM2BcATYd
 1HMZb0u9ozGMiLxOvTLyVbq14aohAZlSGZ8hKrU7l1QNrwJQYP6hknOo85aJR7uujINW
 R5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RWwrOM43vyJjmhPErQY/tR6Rikm/iiPmdds8xl+akxQ=;
 b=dwCuD9vPGjyBvkG+6EIrcW1GTX6EDBTLqc0kYcjAl3ofQHh+44SJN4GBukoz1+YOJH
 7RYzi02CErppAiwFQKGp30yIBa+BmJB+YJioCvEa3CyLX3FJ6NdeSHp28RqBsV5scqXr
 nAlqaNKg+eVcGPBpEcAM4qrHR0qoeaHSOFgnpXL5yRZeDP4eGnVfPBR9yA71ImJ6TJbJ
 RoXFVg+MSBSbOHU96Rah+jeqPnGwmuEZfMSnoDMo3ip+zxmPc8lHcv6xtCAo0KPIdfTX
 URg4InnZtrl5aVV1BxIwCbrBoppF0fICFA+uYvVkYOCXZS1qODP3cP2qHCUIoCusbeRN
 4rpg==
X-Gm-Message-State: ALKqPwdBIgdGKZvAVSkDsx04kOGw01CI6EZ8OwCFSjl5FICZGOaAidZZ
 gu5GKXkYfrB2BmDOFUUmNm00di/J4yxn78Zlsw==
X-Google-Smtp-Source: ADUXVKLMtU1VGOQXut3DA0Yig2oI6kj/fWTERcC9x2zUxLqht7NUgXwR4oQmv8/UmsIBlkizIczGUPSGJSlOWOwsWTk=
X-Received: by 2002:a6b:ab01:: with SMTP id
 u1-v6mr1708732ioe.214.1527068449335; 
 Wed, 23 May 2018 02:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:fc8:0:0:0:0:0 with HTTP;
 Wed, 23 May 2018 02:40:48 -0700 (PDT)
In-Reply-To: <3977bafa-3b0b-eb3c-7c20-57b333e8a2c8@acm.org>
References: <1526906399-30140-1-git-send-email-avifishman70@gmail.com>
 <1526906399-30140-2-git-send-email-avifishman70@gmail.com>
 <3977bafa-3b0b-eb3c-7c20-57b333e8a2c8@acm.org>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 23 May 2018 12:40:48 +0300
Message-ID: <CAKKbWA5oo_hKrLi=NKh_Xmko4T9RBv=PGpUqNtkoBB=7skO_9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
To: Corey Minyard <minyard@acm.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wang,
 Haiyue" <haiyue.wang@linux.intel.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, tali.perry1@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 23 May 2018 09:40:55 -0000

On Tue, May 22, 2018 at 9:52 PM, Corey Minyard <minyard@acm.org> wrote:
> On 05/21/2018 07:39 AM, avifishman70@gmail.com wrote:
>>
>> From: Avi Fishman <AviFishman70@gmail.com>
>>
>> Original kcs_bmc_npcm7xx.c was missing enabling to send interrupt to the
>> host on writes to output buffer.
>> This patch fixes it by setting the bits that enables the generation of
>> IRQn events by hardware control based on the status of the OBF flag.
>
>
> This look ok, I've added it to my 4.19 queue.

Thanks Corey,

Since drivers/char/ipmi/kcs_bmc_npcm7xx.c already exists in linux-next
(4.18) what not adding it as a fix in 4.18?

-Avi

>
> -corey
>
>
>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
>> Reviewed-by:   Haiyue Wang <haiyue.wang@linux.intel.com>
>> ---
>>   drivers/char/ipmi/kcs_bmc_npcm7xx.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> index 7bc898c5d372..722f7391fe1f 100644
>> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
>> @@ -39,6 +39,12 @@
>>   #define KCS3CTL               0x3C
>>   #define    KCS_CTL_IBFIE      BIT(0)
>>   +#define KCS1IE               0x1C
>> +#define KCS2IE         0x2E
>> +#define KCS3IE         0x40
>> +#define    KCS_IE_IRQE          BIT(0)
>> +#define    KCS_IE_HIRQE         BIT(3)
>> +
>>   /*
>>    * 7.2.4 Core KCS Registers
>>    * Registers in this module are 8 bits. An 8-bit register must be
>> accessed
>> @@ -48,12 +54,14 @@
>>    * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
>>    * dib: KCS Channel n Data In Buffer Register (KCSnDI).
>>    * ctl: KCS Channel n Control Register (KCSnCTL).
>> + * ie : KCS Channel n  Interrupt Enable Register (KCSnIE).
>>    */
>>   struct npcm7xx_kcs_reg {
>>         u32 sts;
>>         u32 dob;
>>         u32 dib;
>>         u32 ctl;
>> +       u32 ie;
>>   };
>>     struct npcm7xx_kcs_bmc {
>> @@ -63,9 +71,9 @@ struct npcm7xx_kcs_bmc {
>>   };
>>     static const struct npcm7xx_kcs_reg
>> npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
>> -       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
>> -       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
>> -       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
>> +       { .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL, .ie
>> = KCS1IE },
>> +       { .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL, .ie
>> = KCS2IE },
>> +       { .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie
>> = KCS3IE },
>>   };
>>     static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>> @@ -95,6 +103,9 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc
>> *kcs_bmc, bool enable)
>>         regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>>                            enable ? KCS_CTL_IBFIE : 0);
>> +
>> +       regmap_update_bits(priv->map, priv->reg->ie, KCS_IE_IRQE |
>> KCS_IE_HIRQE,
>> +                          enable ? KCS_IE_IRQE | KCS_IE_HIRQE : 0);
>>   }
>>     static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
>
>
>
