Return-Path: <clg@kaod.org>
Received: from 10.mo177.mail-out.ovh.net (10.mo177.mail-out.ovh.net
 [46.105.73.133])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZW1v3bqhzDsTX
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 17:56:02 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 8348E100431B
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 09:55:55 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 5449C240094;
 Thu, 15 Sep 2016 09:55:52 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.7 6/6] ARM: dts: aspeed: Enable BT IPMI
 BMC device
To: Joel Stanley <joel@jms.id.au>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-7-git-send-email-clg@kaod.org>
 <CACPK8XdcvGKeTR5v_PZ_kwTydLjWS6FXkvdi=HWNV7KRxTLLVw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78c31e81-9e63-ed5a-421a-37aa211d00eb@kaod.org>
Date: Thu, 15 Sep 2016 09:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdcvGKeTR5v_PZ_kwTydLjWS6FXkvdi=HWNV7KRxTLLVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6055652651572235010
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeeggdduvdegucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 07:56:03 -0000

On 09/15/2016 09:11 AM, Joel Stanley wrote:
> On Thu, Sep 15, 2016 at 4:02 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index eb0122fa34c2..4480b858103e 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -391,6 +391,12 @@
>>                                 clocks = <&clk_apb>;
>>                         };
>>
>> +                       ibt: ibt@1e789140 {
> 
> Given this is part of the LPC register set, and we need to expose
> other parts of the LPC, I was wondering if we wanted to make this a
> sub-node of a mfd device that covered all of the LPC controller's
> registers. What do you think?

It will be cleaner. We don't have to put all of it right now.

>> +                               compatible = "aspeed,bt-bmc";
> 
> When getting bindings reviewed I've been told we should have something
> soc specific in the string, like aspeed,ast2400-bt-bmc. I'm to too
> fussed though.

yes, this is frequent, something like :

          compatible = "aspeed,bt-bmc", "aspeed,ast2400-bt-bmc";

Thanks,
C.

>> +                               reg = <0x1e789140 0x18>;
>> +                               interrupts = <8>;
>> +                       };
>> +
>>                         wdt1: wdt@1e785000 {
>>                                 compatible = "aspeed,ast2400-wdt";
>>                                 reg = <0x1e785000 0x1c>;
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index 79abac876abf..7c781fb613f8 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -255,6 +255,12 @@
>>                                 clocks = <&clk_apb>;
>>                         };
>>
>> +                       ibt: ibt@1e789140 {
>> +                               compatible = "aspeed,bt-bmc";
>> +                               reg = <0x1e789140 0x18>;
>> +                               interrupts = <8>;
>> +                       };
>> +
>>                         wdt1: wdt@1e785000 {
>>                                 compatible = "aspeed,ast2500-wdt";
>>                                 reg = <0x1e785000 0x1c>;
>> --
>> 2.7.4
>>
