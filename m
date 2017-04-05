Return-Path: <raltherr@google.com>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com
 [IPv6:2a00:1450:400c:c0c::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz2dG0YPhzDqJX
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 09:49:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="N7WIO9qH"; 
 dkim-atps=neutral
Received: by mail-wr0-x233.google.com with SMTP id w11so34741829wrc.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fW+kY2ZEYkLMq2hwbKr3X7+4YzA4C0IpyptwczxCCdU=;
 b=N7WIO9qHgN1WQTx46V6FGLsFOXYuvcRshI26rmYlDXpaI8A17LTJXVkoMsTkJX2den
 YN75QcdfG/EU4Jil4mciPOe+VZY8fLNRrOGEnQev7R6kaHDfZkYORyJCEQY3vs+3Oz9i
 H8AbTbwtwsHG2j1Ah3nFweOm1ialozfAyEb2K137VwJV2+CdTN0HmJebEhceQrASRDbC
 UTJ0xnyBgY6yB40wEU+c5axJ6nH/VJkBlwRwY3R+oKFE8tbojagjzTPqj+RGrcRJQaMe
 Y+UA6iNMpwB0LWfB2EaK1R9vUphb1vjd4xp5GzlVHbAhR3lPri9BAjLxDGft5hRdkXXJ
 Vzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fW+kY2ZEYkLMq2hwbKr3X7+4YzA4C0IpyptwczxCCdU=;
 b=Xe5ogQvZ4aDZbbuP/QJ4Njue755NXAMkTVVzRyX4aSf7LYYdc0SIxBWW4n7zKYI6Ax
 nXClE52uyZL07cim4BY1ZHFabbG1ckcjkmjhcPleylxxBxhGXjioM8EHtat7NcxOk/58
 tqBGW2uL+LSmbd54+Vw0ZLJllML9uv0L01iUrs+U/vbq03lX3jpA4OokBLgvD2gSZczj
 9l3oK53T5vn1lt5q9Hyh5YnuJIaG/rdRUnjYeadxHce7k7/tBc9+q2tg3OYgfDJpr0pB
 DDiO6ZSI888t+RGmhQvYreQNK2YhdIfLa7q0Yj5FujP6F/woSNz3uHb1OdSxIuSmBOJA
 xPNw==
X-Gm-Message-State: AFeK/H1jfTp5oMMCvdY7ODuhTr3Cq3+8UnPGEnjAkSpup3NSsyMIBCklfYo6gXcqwO/69+BHJIfNI2VCQB4tsAqK
X-Received: by 10.28.157.150 with SMTP id g144mr21849719wme.89.1491436190055; 
 Wed, 05 Apr 2017 16:49:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Wed, 5 Apr 2017 16:49:49 -0700 (PDT)
In-Reply-To: <20170405202744.GB7065@codeaurora.org>
References: <20170323184136.7349-1-raltherr@google.com>
 <20170323184136.7349-2-raltherr@google.com>
 <20170405202744.GB7065@codeaurora.org>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 5 Apr 2017 16:49:49 -0700
Message-ID: <CAPLgG=nYnVuwRZOdXuFCaFy9P0cx_zqfk0f9orBv+8+HxcnqKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: Aspeed ADC
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-iio@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 David Lechner <david@lechnology.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-clk@vger.kernel.org, 
 Andreas Klinger <ak@it-klinger.de>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Alison Schofield <amsfield22@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, 
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, 
 Crestez Dan Leonard <leonard.crestez@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>, Matt Ranostay <mranostay@gmail.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 23:49:55 -0000

On Wed, Apr 5, 2017 at 1:27 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 03/23, Rick Altherr wrote:
>> +
>> +static int aspeed_adc_probe(struct platform_device *pdev)
>> +{
>> +     struct iio_dev *indio_dev;
>> +     struct aspeed_adc_data *data;
>> +     const struct aspeed_adc_model_data *model_data;
>> +     struct resource *res;
>> +     const char *clk_parent_name;
>> +     int ret;
>> +     u32 adc_engine_control_reg_val;
>> +
>> +     indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
>> +     if (!indio_dev)
>> +             return -ENOMEM;
>> +
>> +     data = iio_priv(indio_dev);
>> +     data->dev = &pdev->dev;
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     data->base = devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(data->base))
>> +             return PTR_ERR(data->base);
>> +
>> +     /* Register ADC clock prescaler with source specified by device tree. */
>> +     spin_lock_init(&data->clk_lock);
>> +     clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
>
> What if the parent clk is not registered yet? Or if we're not
> always using DT in this driver? Put another way, this code is
> fragile. But I guess it probably works well enough for now so no
> big deal, just pointing out my fear.

I'm not terribly worried about not using DT for this driver as it is
for an ARM SoC's built-in ADC which is only supported via DT.  I take
your point though.  What's the right way to do this?  Use clk_get() to
request by name and clock-names in the DT?

>
>> +
>> +     data->clk_prescaler = clk_hw_register_divider(
>> +                             &pdev->dev, "prescaler", clk_parent_name, 0,
>> +                             data->base + ASPEED_REG_CLOCK_CONTROL,
>> +                             17, 15, 0, &data->clk_lock);
>> +     if (IS_ERR(data->clk_prescaler))
>> +             return PTR_ERR(data->clk_prescaler);
>> +
>> +     /*
>> +      * Register ADC clock scaler downstream from the prescaler. Allow rate
>> +      * setting to adjust the prescaler as well.
>> +      */
>> +     data->clk_scaler = clk_hw_register_divider(
>> +                             &pdev->dev, "scaler", "prescaler",
>> +                             CLK_SET_RATE_PARENT,
>> +                             data->base + ASPEED_REG_CLOCK_CONTROL,
>> +                             0, 10, 0, &data->clk_lock);
>> +     if (IS_ERR(data->clk_scaler)) {
>> +             ret = PTR_ERR(data->clk_scaler);
>> +             goto scaler_error;
>> +     }
>> +
>> +     /* Start all channels in normal mode. */
>> +     clk_prepare_enable(data->clk_scaler->clk);
>
> Eventually we'd like to get rid of hw->clk pointer so that users
> have to call some sort of clk_get() API and then we get warm
> fuzzies from knowing who is consuming a clk structure. Can you
> change this to register a clk provider and call clk_get()? I
> think a device that references itself should be OK in DT still,
> and would properly reflect what's going on.

Do you mean call of_clk_add_hw_provider with of_clk_hw_simple_get or
something else?  I'm still wrapping my head around the distinction
between clk, clk_hw, and a clk provider.

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
