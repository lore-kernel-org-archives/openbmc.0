Return-Path: <raltherr@google.com>
Received: from mail-wr0-x22d.google.com (mail-wr0-x22d.google.com
 [IPv6:2a00:1450:400c:c0c::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpt2B132tzDqZj
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 03:54:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="d3qytdjV"; 
 dkim-atps=neutral
Received: by mail-wr0-x22d.google.com with SMTP id u1so17575763wra.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=R9y1ZFhHdBFLmRobVEja5T3VZdvIbqRU4gXVgmN7V+E=;
 b=d3qytdjVdmv9BMyFtnm+lZS6dXJzjtRp8bCifUl6OsEKi3jxm/X9YBZgZrOdKVLSKZ
 diHeVKTbMmTRrAA3KpW1u3cDaHKH0y3b0ZD0ZaE9HJlpgGkHWjw5/JKR8dHRoYsaKA5s
 +OcrnqiHLjh3F3DLvj7cWkkBsn0swwvMHpwMuFZtL8KLmJISer8djZ2FrP8cJAQ5ePXW
 GA5o4phe88lPY0mVEbianbe1QZMSCW72R13+iyzp/hcbpOFwP0yHCU5IRw3EaE0Lcrbj
 Nb0D74AeV+lkWuPAwwBj6dMqbsQMmSNcm6ezVQJ/ghNy+rNBst/uXzV6+2mBnoo4d9qH
 /k/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=R9y1ZFhHdBFLmRobVEja5T3VZdvIbqRU4gXVgmN7V+E=;
 b=r8Box0uQpb8RrxUZDM/Lj5dnPysDpAVIJeorxT+7IkssZcR7/r8aScJCCG7KAzmix8
 It/86yCefqBRsITzCsgpg2BX+8g/tYOd2M4fh/gEnWHExb5Pefun9tKN0JEyM/aReeI7
 EKyQmtejM0H6PeoT/zEsR4oY8pckogeYywOBwjjpE1oJMyscv6TnkQXmlDKleRXHU7Fe
 90FkRni13Fx3hA8t0yPh2az/xCvr3kXkOSOCgkeBmJFpHlSwA5dHdxgwso14BwZSBhPJ
 BjrbIiGEhMvuqj2Z+J5Pjq+Vh3fZ9DK6a7R9MWthSxXFMv8JfIPB7iMzRoDtlD1wljSL
 eLeg==
X-Gm-Message-State: AFeK/H1rWPlrvPj4flCPgCm2nnXkz+pNk2yB7yABjB2ouMLfSPEv2Sxgl0pbvz5EHr8qZjdEL8bMhv5qBormHhgr
X-Received: by 10.223.143.36 with SMTP id p33mr2562026wrb.120.1490288078425;
 Thu, 23 Mar 2017 09:54:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Thu, 23 Mar 2017 09:54:37 -0700 (PDT)
In-Reply-To: <CAPLgG=m3ex1dX+Xu8DFLb+DfTn3e-r0=Ln82Z1br6bSinEAcDQ@mail.gmail.com>
References: <20170321204828.31303-1-raltherr@google.com>
 <20170321204828.31303-2-raltherr@google.com>
 <CACPK8XeR=mDhJgGSO04jLAjdOH_oFuvbYC9Ge7J6HQuiLZ4MZQ@mail.gmail.com>
 <CAPLgG=m3ex1dX+Xu8DFLb+DfTn3e-r0=Ln82Z1br6bSinEAcDQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 23 Mar 2017 09:54:37 -0700
Message-ID: <CAPLgG=muPv1CU-3dbs9PgP1Tf+VJ3+xyweY8SozBs4Axk8DcUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: Aspeed AST2400/AST2500 ADC
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
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
X-List-Received-Date: Thu, 23 Mar 2017 16:54:43 -0000

Restoring the list after an accidental direct reply.

On Wed, Mar 22, 2017 at 2:32 PM, Rick Altherr <raltherr@google.com> wrote:
> On Wed, Mar 22, 2017 at 2:47 AM, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, Mar 22, 2017 at 7:18 AM, Rick Altherr <raltherr@google.com> wrote:
>>> Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. Low
>>> and high threshold interrupts are supported by the hardware but are not
>>> currently implemented.
>>>
>>> Signed-off-by: Rick Altherr <raltherr@google.com>
>>
>> Looks good Rick. I gave it a review from the perspective of the Aspeed
>> soc. I also gave it a spin on the Aspeed AST2500 EVB which mostly
>> worked, but uncovered some things that need addressing.
>>
>> My device tree additions looked like this:
>>
>>   adc: adc@1e6e9000 {
>>           compatible = "aspeed,ast2500-adc";
>>           reg = <0x1e6e9000 0xb0>;
>>           clocks = <&clk_apb>;
>>           #io-channel-cells = <1>;
>>
>>           pinctrl-names = "default";
>>           pinctrl-0 = <&pinctrl_adc0_default>;
>
> This shouldn't be strictly necessary as the ADCs are the default
> function for the pins they are available on.
>
>>   };
>>
>>   iio-hwmon {
>>           compatible = "iio-hwmon";
>>           io-channels = <&adc 0>;
>>   };
>
> This is necessary to make it show up as hwmon.  You can see the iio
> device directly at /sys/bus/iio/devices/.....
>
>>
>> I got this output from lm-sensors when booted:
>>
>> iio_hwmon-isa-0000
>> Adapter: ISA adapter
>> in1:          +1.28 V
>>
>> I then wired up ADC0 to ADC_12V_TW on the EVB. The above changed to:
>>
>>  iio_hwmon-isa-0000
>> Adapter: ISA adapter
>> in1:          +1.80 V
>>
>> ADC_12V_TW is the 12V rail sampled through a voltage divider. The
>> voltage should be: 12 * 680 / ( 5600 + 680) = 1.299
>>
>> cat /sys/bus/iio/devices/iio:device0/in_voltage1_raw
>> 738
>>
>> 738 / 1023 * 1.8 = 1.2975
>>
>> Looks like the first channel is working! However our reference is
>> incorrect. Your driver has ASPEED_ADC_REF_VOLTAGE but doesn't use it.
>> It does hardcode 2500 in the aspeed_adc_read_raw callback:
>>
>>           case IIO_CHAN_INFO_SCALE:
>>                   *val = 2500; // mV
>>                   *val2 = 10;
>>                   return IIO_VAL_FRACTIONAL_LOG2;
>>
>> Should this value the the constant you define?
>>
>> Regardless, I don't think the reference voltage should be a constant.
>> This is going to vary from system to system. Can we put it in the
>> device tree? I notice other devices have vref-supply in their
>> bindings.
>>
>
> Good catch.  AST2500 uses a 1.8Vref while AST2400 uses a 2.5Vref.  I
> decided against putting a vref-supply in the device tree as neither
> part allows for an external reference.  Both the 1.8V and 2.5V are
> fixed, internal references.  It just happens that the reference
> voltage changes with the chip generation.  Looking at the data sheet
> more, I also see the min/max sampling rate has changed for AST2500 as
> well.  This is probably best handled by attaching data to the
> of_device_ids in the of_match_table.  That would solve all of these
> per-chip variations.
>
>> I noticed that in_voltage_scale is writable. However, it did not
>> accept any of the values I give it. Is this because we do not handle
>> it in aspeed_adc_write_raw?
>>
>
> I think all attributes become writable because I implement write_raw
> even though only the sample frequency is actually writable.  I'm of
> two minds on allowing the scale to be written.  If the user knows
> there is a voltage divider before the ADC, why don't they apply that
> correction in userspace?  On the other hand, the existence of the
> voltage divider _could_ be specified in the device tree and the kernel
> takes care of the scaling entirely.  The latter seems like a
> general-purpose concept but I couldn't find an existing binding for
> specifying it.  I decided to start with the minimal functionality of
> only reporting the ADC's natural scaling and letting userspace deal
> with any additional information it has.
>
>> I suggest we add the reference in the device tree bindings, and also
>> allow the value to be updated from userspace.
>>
>>> ---
>>>
>>> Changes in v2:
>>> - Rewritten as an IIO device
>>> - Renamed register macros to describe the register's purpose
>>> - Replaced awkward reading of 16-bit data registers with readw()
>>> - Added Kconfig dependency on COMPILE_TEST
>>>
>>>  drivers/iio/adc/Kconfig      |  10 ++
>>>  drivers/iio/adc/Makefile     |   1 +
>>>  drivers/iio/adc/aspeed_adc.c | 271 +++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 282 insertions(+)
>>>  create mode 100644 drivers/iio/adc/aspeed_adc.c
>>>
>>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>>> index 2268a6fb9865..9672d799a3fb 100644
>>> --- a/drivers/iio/adc/Kconfig
>>> +++ b/drivers/iio/adc/Kconfig
>>> @@ -130,6 +130,16 @@ config AD799X
>>>           To compile this driver as a module, choose M here: the module will be
>>>           called ad799x.
>>>
>>> +config ASPEED_ADC
>>> +       tristate "Aspeed AST2400/AST2500 ADC"
>>
>> You could just say Aspeed ADC to save us having to update it when the
>> ast2600 comes out.
>
> Ack
>
>>
>>> +       depends on ARCH_ASPEED || COMPILE_TEST
>>> +       help
>>> +         If you say yes here you get support for the Aspeed AST2400/AST2500
>>> +         ADC.
>>> +
>>> +         To compile this driver as a module, choose M here: the module will be
>>> +         called aspeed_adc.
>>
>> Don't forget to test compiling as a module.
>
> Ack
>
>>
>>
>>> diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
>>> new file mode 100644
>>> index 000000000000..9220909aefd4
>>> --- /dev/null
>>
>>> +#define ASPEED_ADC_NUM_CHANNELS                        16
>>> +#define ASPEED_ADC_REF_VOLTAGE                 2500 /* millivolts */
>>> +#define ASPEED_ADC_RESOLUTION_BITS             10
>>> +#define ASPEED_ADC_MIN_SAMP_RATE               10000
>>> +#define ASPEED_ADC_MAX_SAMP_RATE               500000
>>> +#define ASPEED_ADC_CLOCKS_PER_SAMPLE           12
>>> +
>>> +#define ASPEED_ADC_REG_ENGINE_CONTROL          0x00
>>> +#define ASPEED_ADC_REG_INTERRUPT_CONTROL       0x04
>>> +#define ASPEED_ADC_REG_VGA_DETECT_CONTROL      0x08
>>> +#define ASPEED_ADC_REG_CLOCK_CONTROL           0x0C
>>> +#define ASPEED_ADC_REG_MAX                     0xC0
>>> +
>>> +#define ASPEED_ADC_OPERATION_MODE_POWER_DOWN   (0x0 << 1)
>>> +#define ASPEED_ADC_OPERATION_MODE_STANDBY      (0x1 << 1)
>>> +#define ASPEED_ADC_OPERATION_MODE_NORMAL       (0x7 << 1)
>>> +
>>> +#define ASPEED_ADC_ENGINE_ENABLE       BIT(0)
>>
>> Nit: You could chose to label these with a shorter prefix. Drop the
>> aspeed or adc, or both.
>
> Ack
>
>>
>>> +
>>> +static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
>>> +                              struct iio_chan_spec const *chan,
>>> +                              int *val, int *val2, long mask)
>>> +{
>>> +       struct aspeed_adc_data *data = iio_priv(indio_dev);
>>> +
>>> +       switch (mask) {
>>> +       case IIO_CHAN_INFO_RAW:
>>> +               *val = readw(data->base + chan->address);
>>> +               return IIO_VAL_INT;
>>> +
>>> +       case IIO_CHAN_INFO_SCALE:
>>> +               *val = 2500; // mV
>>> +               *val2 = 10;
>>
>> What does 10 mean?
>>
>
> ADC resolution in bits.  I'll use the constant defined above.
>
>>> +               return IIO_VAL_FRACTIONAL_LOG2;
>>> +
>>> +       case IIO_CHAN_INFO_SAMP_FREQ:
>>> +               *val = clk_get_rate(data->clk_scaler->clk) /
>>> +                               ASPEED_ADC_CLOCKS_PER_SAMPLE;
>>> +               return IIO_VAL_INT;
>>> +
>>> +       default:
>>> +               return -EINVAL;
>>> +       }
>>> +}
>>> +
>>> +static int aspeed_adc_write_raw(struct iio_dev *indio_dev,
>>> +                               struct iio_chan_spec const *chan,
>>> +                               int val, int val2, long mask)
>>> +{
>>> +       struct aspeed_adc_data *data = iio_priv(indio_dev);
>>> +
>>> +       switch (mask) {
>>
>> Handle IIO_CHAN_INFO_SCALE here too.
>
> See above reply.
>
>>
>>> +       case IIO_CHAN_INFO_SAMP_FREQ:
>>> +               if (val < ASPEED_ADC_MIN_SAMP_RATE ||
>>> +                   val > ASPEED_ADC_MAX_SAMP_RATE)
>>> +                       return -EINVAL;
>>> +
>>> +               clk_set_rate(data->clk_scaler->clk,
>>> +                               val * ASPEED_ADC_CLOCKS_PER_SAMPLE);
>>> +               return 0;
>>> +
>>> +       default:
>>> +               return -EINVAL;
>>> +       }
>>> +}
>>> +
>>> +static int aspeed_adc_reg_access(struct iio_dev *indio_dev,
>>> +                                unsigned int reg, unsigned int writeval,
>>> +                                unsigned int *readval)
>>> +{
>>> +       struct aspeed_adc_data *data = iio_priv(indio_dev);
>>> +
>>> +       if (!readval || reg % 4 || reg > ASPEED_ADC_REG_MAX)
>>> +               return -EINVAL;
>>> +
>>> +       *readval = readl(data->base + reg);
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct iio_info aspeed_adc_iio_info = {
>>> +       .driver_module = THIS_MODULE,
>>> +       .read_raw = &aspeed_adc_read_raw,
>>> +       .write_raw = &aspeed_adc_write_raw,
>>> +       .debugfs_reg_access = &aspeed_adc_reg_access,
>>> +};
>>> +
>>> +static int aspeed_adc_probe(struct platform_device *pdev)
>>> +{
>>> +       struct iio_dev *indio_dev;
>>> +       struct aspeed_adc_data *data;
>>> +       struct resource *res;
>>> +       const char *clk_parent_name;
>>> +       int ret;
>>> +       u32 adc_engine_control_reg_val;
>>> +
>>> +       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*data));
>>> +       if (!indio_dev) {
>>> +               dev_err(&pdev->dev, "Failed allocating iio device\n");
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       data = iio_priv(indio_dev);
>>> +
>>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +       data->base = devm_ioremap_resource(&pdev->dev, res);
>>> +       if (IS_ERR(data->base)) {
>>> +               dev_err(&pdev->dev, "Failed allocating device resources\n");
>>
>> The function you're calling will do that for you
>>
>> http://lxr.free-electrons.com/source/lib/devres.c?v=4.10#L134
>>
>> Just return the error here. I'd consider dropping the dev_errs for the
>> other cases in the probe. We still get a reasonable error message
>> without printing something ourselves. For example, when bailing out
>> with ENOMEM:
>>
>> [    5.510000] aspeed_adc: probe of 1e6e9000.adc failed with error -12
>>
>
> Ack
>
>>
>>> +               ret = PTR_ERR(data->base);
>>> +               goto resource_error;
>>> +       }
>>> +
>>> +       /* Register ADC clock prescaler with source specified by device tree. */
>>> +       spin_lock_init(&data->clk_lock);
>>> +       clk_parent_name = of_clk_get_parent_name(pdev->dev.of_node, 0);
>>> +
>>> +       data->clk_prescaler = clk_hw_register_divider(
>>> +                               &pdev->dev, "prescaler", clk_parent_name, 0,
>>> +                               data->base + ASPEED_ADC_REG_CLOCK_CONTROL,
>>> +                               17, 15, 0, &data->clk_lock);
>>
>> I couldn't see any other drivers that use these functions outside of
>> drivers/clk. I like what you've done here, but someone who understands
>> the clock framework should take a look.
>>
>
> I'll CC one of the clock maintainers in the next version.
>
>>
>>> +       if (IS_ERR(data->clk_prescaler)) {
>>> +               dev_err(&pdev->dev, "Failed allocating prescaler clock\n");
>>> +               ret = PTR_ERR(data->clk_prescaler);
>>> +               goto prescaler_error;
>>> +       }
>>> +
>>> +       /*
>>> +        * Register ADC clock scaler downstream from the prescaler. Allow rate
>>> +        * setting to adjust the prescaler as well.
>>> +        */
>>> +       data->clk_scaler = clk_hw_register_divider(
>>> +                               &pdev->dev, "scaler", "prescaler",
>>> +                               CLK_SET_RATE_PARENT,
>>> +                               data->base + ASPEED_ADC_REG_CLOCK_CONTROL,
>>> +                               0, 10, 0, &data->clk_lock);
>>> +       if (IS_ERR(data->clk_scaler)) {
>>> +               dev_err(&pdev->dev, "Failed allocating scaler clock\n");
>>> +               ret = PTR_ERR(data->clk_scaler);
>>> +               goto scaler_error;
>>> +       }
>>> +
>>> +       /* Start all channels in normal mode. */
>>> +       clk_prepare_enable(data->clk_scaler->clk);
>>> +       adc_engine_control_reg_val = GENMASK(31, 16) |
>>> +               ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE;
>>> +       writel(adc_engine_control_reg_val,
>>> +               data->base + ASPEED_ADC_REG_ENGINE_CONTROL);
>>> +
>>> +       indio_dev->name = dev_name(&pdev->dev);
>>> +       indio_dev->dev.parent = &pdev->dev;
>>> +       indio_dev->info = &aspeed_adc_iio_info;
>>> +       indio_dev->modes = INDIO_DIRECT_MODE;
>>> +       indio_dev->channels = aspeed_adc_iio_channels;
>>> +       indio_dev->num_channels = ARRAY_SIZE(aspeed_adc_iio_channels);
>>
>> Should we be able to enable just the channels that we want? Perhaps
>> only the ones that are requested through the device tree?
>>
>
> It shouldn't matter.  When the pins are muxed to other functions, the
> ADCs will read zero.  The only potential advantage is increased
> sampling speed by omitting unused channels in the scan.  I'm not
> concerned with that now and the code is much simpler by not dealing
> with per-channel enables.
>
>>> +
>>> +       ret = iio_device_register(indio_dev);
>>> +       if (ret) {
>>> +               dev_err(&pdev->dev, "Could't register the device.\n");
>>> +               goto iio_register_error;
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +iio_register_error:
>>> +       writel(0x0, data->base + ASPEED_ADC_REG_ENGINE_CONTROL);
>>
>> Should this be done in remove as well?
>>
> Yes.
>
>>> +       clk_disable_unprepare(data->clk_scaler->clk);
>>> +       clk_hw_unregister_divider(data->clk_scaler);
>>> +
>>> +scaler_error:
>>> +       clk_hw_unregister_divider(data->clk_prescaler);
>>> +
>>> +prescaler_error:
>>> +resource_error:
>>> +       return ret;
>>
>> You could just return from the error where it happens in the case
>> where no cleanup is required.
>>
>
> Ack.
>
>>> +}
>>> +
>>> +static int aspeed_adc_remove(struct platform_device *pdev)
>>> +{
>>> +       struct iio_dev *indio_dev = platform_get_drvdata(pdev);
>>> +       struct aspeed_adc_data *data = iio_priv(indio_dev);
>>> +
>>> +       iio_device_unregister(indio_dev);
>>> +       clk_disable_unprepare(data->clk_scaler->clk);
>>> +       clk_hw_unregister_divider(data->clk_scaler);
>>> +       clk_hw_unregister_divider(data->clk_prescaler);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +const struct of_device_id aspeed_adc_matches[] = {
>>> +       { .compatible = "aspeed,ast2400-adc" },
>>> +       { .compatible = "aspeed,ast2500-adc" },
>>> +};
>>
>> This is missing a null entry to terminate.
>
> Ack
>
>>
>>> +MODULE_DEVICE_TABLE(of, aspeed_adc_matches);
>>> +
>>> +static struct platform_driver aspeed_adc_driver = {
>>> +       .probe = aspeed_adc_probe,
>>> +       .remove = aspeed_adc_remove,
>>> +       .driver = {
>>> +               .name = KBUILD_MODNAME,
>>> +               .of_match_table = aspeed_adc_matches,
>>> +       }
>>> +};
>>> +
>>> +module_platform_driver(aspeed_adc_driver);
>>> +
>>> +MODULE_AUTHOR("Rick Altherr <raltherr@google.com>");
>>> +MODULE_DESCRIPTION("Aspeed AST2400/2500 ADC Driver");
>>> +MODULE_LICENSE("GPL");
>>> --
>>> 2.12.1.500.gab5fba24ee-goog
>>>
