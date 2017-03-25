Return-Path: <jic23@kernel.org>
X-Greylist: delayed 464 seconds by postgrey-1.36 at bilbo;
 Sun, 26 Mar 2017 04:19:40 AEDT
Received: from saturn.retrosnub.co.uk (saturn.retrosnub.co.uk [178.18.118.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vr6V447G5zDq7Z
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 04:19:40 +1100 (AEDT)
Received: from localhost.localdomain
 (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net [81.96.234.148])
 by saturn.retrosnub.co.uk (Postfix;
 Retrosnub mail submission) with ESMTPSA id D56404076D; 
 Sat, 25 Mar 2017 17:11:48 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] iio: Aspeed AST2400/AST2500 ADC
To: Joel Stanley <joel@jms.id.au>,
 Quentin Schulz <quentin.schulz@free-electrons.com>
References: <20170321204828.31303-1-raltherr@google.com>
 <20170321204828.31303-2-raltherr@google.com>
 <5f245e55-4d4a-b744-3351-e8215432c315@free-electrons.com>
 <CACPK8XcoQGo4uErK71aeUhmcJ-6Yt0k41q8N7wsemz6HLRSL4w@mail.gmail.com>
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
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Jacopo Mondi <jacopo@jmondi.org>
From: Jonathan Cameron <jic23@kernel.org>
Message-ID: <866cabad-d151-a54f-e316-201aa05cbbf5@kernel.org>
Date: Sat, 25 Mar 2017 17:11:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcoQGo4uErK71aeUhmcJ-6Yt0k41q8N7wsemz6HLRSL4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 26 Mar 2017 13:16:54 +1100
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
X-List-Received-Date: Sat, 25 Mar 2017 17:19:41 -0000

On 22/03/17 10:08, Joel Stanley wrote:
> Hello Quentin,
> 
> On Wed, Mar 22, 2017 at 5:51 PM, Quentin Schulz
> <quentin.schulz@free-electrons.com> wrote:
> 
>>> +
>>> +#define ASPEED_ADC_CHAN(_idx, _addr) {                               \
>>> +     .type = IIO_VOLTAGE,                                    \
>>> +     .indexed = 1,                                           \
>>> +     .channel = (_idx),                                      \
>>> +     .address = (_addr),                                     \
>>> +     .info_mask_separate = BIT(IIO_CHAN_INFO_RAW),           \
>>> +     .info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE) |  \
>>> +                             BIT(IIO_CHAN_INFO_SAMP_FREQ),   \
>>> +}
>>> +
>>> +static const struct iio_chan_spec aspeed_adc_iio_channels[] = {
>>> +     ASPEED_ADC_CHAN(0, 0x10),
>>> +     ASPEED_ADC_CHAN(1, 0x12),
>>> +     ASPEED_ADC_CHAN(2, 0x14),
>>> +     ASPEED_ADC_CHAN(3, 0x16),
>>> +     ASPEED_ADC_CHAN(4, 0x18),
>>> +     ASPEED_ADC_CHAN(5, 0x1A),
>>> +     ASPEED_ADC_CHAN(6, 0x1C),
>>> +     ASPEED_ADC_CHAN(7, 0x1E),
>>> +     ASPEED_ADC_CHAN(8, 0x20),
>>> +     ASPEED_ADC_CHAN(9, 0x22),
>>> +     ASPEED_ADC_CHAN(10, 0x24),
>>> +     ASPEED_ADC_CHAN(11, 0x26),
>>> +     ASPEED_ADC_CHAN(12, 0x28),
>>> +     ASPEED_ADC_CHAN(13, 0x2A),
>>> +     ASPEED_ADC_CHAN(14, 0x2C),
>>> +     ASPEED_ADC_CHAN(15, 0x2E),
>>
>> It would make sense to name the registers (the _addr parameter of your
>> macro) so it's easier to understand what it refers to.
> 
> I appreciate the desire to not have magic values. However, I think
> these are okay. We don't use them anywhere else, and it is obvious
> from reading that they are the registers containing the ADC values for
> each channel.
> 
> The alternative would look like this:
> 
> +     ASPEED_ADC_CHAN(14, ASPEED_ADC_CHAN_14_DATA),
> +     ASPEED_ADC_CHAN(15, ASPEED_ADC_CHAN_15_DATA),
> 
> Which doesn't really help me as someone reading the code.
> 
>>> +     /* Start all channels in normal mode. */
>>> +     clk_prepare_enable(data->clk_scaler->clk);
>>> +     adc_engine_control_reg_val = GENMASK(31, 16) |
>>> +             ASPEED_ADC_OPERATION_MODE_NORMAL | ASPEED_ADC_ENGINE_ENABLE;
>>> +     writel(adc_engine_control_reg_val,
>>> +             data->base + ASPEED_ADC_REG_ENGINE_CONTROL);
>>> +
>>> +     indio_dev->name = dev_name(&pdev->dev);
>>
>> This isn't good practice (cf.: https://lkml.org/lkml/2017/1/28/145 end
>> of the mail in the probe function). Better name it aspeed-adc or even
>> better to have a different name per compatible: ast2400-adc or ast2500-adc.
> 
> The label comes out as "adc.1e6e9000". This is the reg property and
> the node name from the device tree, which seems sensible, even if it
> is a bit strange to be grabbing the name of the parent device for it
The intent is this provides the part number rather than a device tree
handle.  The devicetree handle is available via other routes if desired.

.
> 
> Could the iio core fill in a sensible name for us here? Rick is the
> 31st person to make this mistake, so it would be nice to fix properly.
It's not easy to actually generate it.  Quite a few drivers do it by
querying the hardware to get precise model numbers.  Manufacturers
of certain devices have an irritating habit of switching 'compatiblish'
chips without bothering to update device tree blobs.

Jonathan
> 
> Cheers,
> 
> Joel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
