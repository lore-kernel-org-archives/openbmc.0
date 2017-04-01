Return-Path: <jic23@kernel.org>
Received: from saturn.retrosnub.co.uk (saturn.retrosnub.co.uk [178.18.118.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vwFYF1kdRzDqHG
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 21:51:45 +1100 (AEDT)
Received: from localhost.localdomain
 (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net [81.96.234.148])
 by saturn.retrosnub.co.uk (Postfix;
 Retrosnub mail submission) with ESMTPSA id 7DD4C40621; 
 Sat,  1 Apr 2017 11:51:37 +0100 (BST)
Subject: Re: [PATCH v5 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed ADC
To: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>
References: <20170328215259.31622-1-raltherr@google.com>
 <CACPK8Xcf2A8RMy7cthJrdi2CA0L_Hfi+2Hy3JBCzLTsofjhEuA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>
From: Jonathan Cameron <jic23@kernel.org>
Message-ID: <968a3a78-49d3-138b-ef6e-7cee3c133471@kernel.org>
Date: Sat, 1 Apr 2017 11:51:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcf2A8RMy7cthJrdi2CA0L_Hfi+2Hy3JBCzLTsofjhEuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sat, 01 Apr 2017 10:51:45 -0000

On 29/03/17 03:33, Joel Stanley wrote:
> On Wed, Mar 29, 2017 at 8:22 AM, Rick Altherr <raltherr@google.com> wrote:
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>> ---
> 
> Acked-by: Joel Stanley <joel@jms.id.au>
I can't see why Rob would mind any of the changes made since he
Acked this (and having acked it I doubt he is looking at newer versions!)
so I'm going to take the view his Ack still applies.

Applied to the togreg branch of iio.git which will get pushed out first
as testing for the autobuilders to have a chance to play with it.

Thanks,

Jonathan
> 
>>
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3:
>> - Consistently write hex contstants with lowercase letters
>> - Drop model numbers from description as same IP is used in every generation
>>
>> Changes in v2:
>> - Rewritten as an IIO ADC device
>>
>>  .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
>> new file mode 100644
>> index 000000000000..674e133b7cd7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
>> @@ -0,0 +1,20 @@
>> +Aspeed ADC
>> +
>> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
>> +single ended.
>> +
>> +Required properties:
>> +- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
>> +- reg: memory window mapping address and length
>> +- clocks: Input clock used to derive the sample clock. Expected to be the
>> +          SoC's APB clock.
>> +- #io-channel-cells: Must be set to <1> to indicate channels are selected
>> +                     by index.
>> +
>> +Example:
>> +       adc@1e6e9000 {
>> +               compatible = "aspeed,ast2400-adc";
>> +               reg = <0x1e6e9000 0xb0>;
>> +               clocks = <&clk_apb>;
>> +               #io-channel-cells = <1>;
>> +       };
>> --
>> 2.12.2.564.g063fe858b8-goog
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
