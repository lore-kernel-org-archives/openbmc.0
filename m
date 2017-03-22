Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vp54b1Xp4zDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 21:09:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h71dtkOV"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id d191so1982881ywe.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gS+OdCtP7fXoajrVRsJqbOLeYIvUl0oDId8BlgfWiiI=;
 b=h71dtkOVsTy49DRBWzVH8gXBMzIT+EP1SnN4DWKkCrox7Q6kpQoC0rjDreEI76UGTh
 fUTNhW9qiuOsQAcMJyN4ZuP/u7NmEgbqs3BohvOgwBBqQH4DK84ZVbkXJrIOlx1uj8YI
 owALsjXzcnIrZRUxOyDgWxOL+S5uWdiyqJgtHm96jEQXW6KPCYjEw+1RHK+rQnpaJ0kO
 J8U51Yf/uLGc8be4C+rqV5qlOKyxWTjV/p9fL1fNjGcMqmTmEO4VRn7/SLnSG0B9ZiaK
 9M1YaMQsB6XhRj/8uTwv07oharFUcPLcjB8ci4WOz+l4GiZlyZp/xhWmXTLySRaXQnhf
 kt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gS+OdCtP7fXoajrVRsJqbOLeYIvUl0oDId8BlgfWiiI=;
 b=SMuxhM/IMC/eFcar4p6Bwp7yl5btUXlV4Pba6imItYC4mQif8aIxOiHE66wgeUkV4C
 BpMICk3ZCcGcf9HITCt06z8prfvIC1FhqQUwOm0kM6M2DmdU6UxcaAdL1hNzXrGPkVwI
 jtVw7vhJWk9werzHwG4R8SpZDxexCHNtUX+ALHia8uB8rZuixOMZLTSI8bIlEq7wkf+k
 ulu70u8atSi/1ANqqR3glHRcfXl94JFb1amxaK2o09ThtFdiUWJ2Q+0IFbwQJKR1Ugg6
 gIewphDQ18o+sblCsoMk+kHHWQxp7UqZ2W37F4HBOLbT/1FDPOJ50LNFZggRoIN6ogV7
 jfTQ==
X-Gm-Message-State: AFeK/H1jdX3gx+mALk5ukW/uU0ix7fBEqOYyxS9K06xDWhgnUsSTH1oUXpeuTRvs5Zi9CuM7bT+aSeJuJRtXPg==
X-Received: by 10.129.71.198 with SMTP id u189mr23636582ywa.174.1490177340667; 
 Wed, 22 Mar 2017 03:09:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Wed, 22 Mar 2017 03:08:40 -0700 (PDT)
In-Reply-To: <5f245e55-4d4a-b744-3351-e8215432c315@free-electrons.com>
References: <20170321204828.31303-1-raltherr@google.com>
 <20170321204828.31303-2-raltherr@google.com>
 <5f245e55-4d4a-b744-3351-e8215432c315@free-electrons.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Mar 2017 20:38:40 +1030
X-Google-Sender-Auth: Ylq5YqqdnSL4H1LgsMXAZ9bfyx4
Message-ID: <CACPK8XcoQGo4uErK71aeUhmcJ-6Yt0k41q8N7wsemz6HLRSL4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: Aspeed AST2400/AST2500 ADC
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Andreas Klinger <ak@it-klinger.de>, Rob Herring <robh@kernel.org>, 
 linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Matt Ranostay <mranostay@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Crestez Dan Leonard <leonard.crestez@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Fabrice Gasnier <fabrice.gasnier@st.com>, Jonathan Cameron <jic23@kernel.org>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 22 Mar 2017 10:09:03 -0000

Hello Quentin,

On Wed, Mar 22, 2017 at 5:51 PM, Quentin Schulz
<quentin.schulz@free-electrons.com> wrote:

>> +
>> +#define ASPEED_ADC_CHAN(_idx, _addr) {                               \
>> +     .type = IIO_VOLTAGE,                                    \
>> +     .indexed = 1,                                           \
>> +     .channel = (_idx),                                      \
>> +     .address = (_addr),                                     \
>> +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
>> +     .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |  \
>> +                             BIT(IIO_CHAN_INFO_SAMP_FREQ),   \
>> +}
>> +
>> +static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
>> +     ASPEED_ADC_CHAN(0, 0x10),
>> +     ASPEED_ADC_CHAN(1, 0x12),
>> +     ASPEED_ADC_CHAN(2, 0x14),
>> +     ASPEED_ADC_CHAN(3, 0x16),
>> +     ASPEED_ADC_CHAN(4, 0x18),
>> +     ASPEED_ADC_CHAN(5, 0x1A),
>> +     ASPEED_ADC_CHAN(6, 0x1C),
>> +     ASPEED_ADC_CHAN(7, 0x1E),
>> +     ASPEED_ADC_CHAN(8, 0x20),
>> +     ASPEED_ADC_CHAN(9, 0x22),
>> +     ASPEED_ADC_CHAN(10, 0x24),
>> +     ASPEED_ADC_CHAN(11, 0x26),
>> +     ASPEED_ADC_CHAN(12, 0x28),
>> +     ASPEED_ADC_CHAN(13, 0x2A),
>> +     ASPEED_ADC_CHAN(14, 0x2C),
>> +     ASPEED_ADC_CHAN(15, 0x2E),
>
> It would make sense to name the registers (the _addr parameter of your
> macro) so it's easier to understand what it refers to.

I appreciate the desire to not have magic values. However, I think
these are okay. We don't use them anywhere else, and it is obvious
from reading that they are the registers containing the ADC values for
each channel.

The alternative would look like this:

+     ASPEED_ADC_CHAN(14, ASPEED_ADC_CHAN_14_DATA),
+     ASPEED_ADC_CHAN(15, ASPEED_ADC_CHAN_15_DATA),

Which doesn't really help me as someone reading the code.

>> +     /* Start all channels in normal mode. */
>> +     clk_prepare_enable(data->clk_scaler->clk);
>> +     adc_engine_control_reg_val = GENMASK(31, 16) |
>> +             ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE;
>> +     writel(adc_engine_control_reg_val,
>> +             data->base + ASPEED_ADC_REG_ENGINE_CONTROL);
>> +
>> +     indio_dev->name = dev_name(&pdev->dev);
>
> This isn't good practice (cf.: https://lkml.org/lkml/2017/1/28/145 end
> of the mail in the probe function). Better name it aspeed-adc or even
> better to have a different name per compatible: ast2400-adc or ast2500-adc.

The label comes out as "adc.1e6e9000". This is the reg property and
the node name from the device tree, which seems sensible, even if it
is a bit strange to be grabbing the name of the parent device for it.

Could the iio core fill in a sensible name for us here? Rick is the
31st person to make this mistake, so it would be nice to fix properly.

Cheers,

Joel
