Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKF2q0wZzzDvks
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 19:41:06 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 119341FEE1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 08:25:36 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 4FE43480087;
 Thu, 17 Nov 2016 08:25:34 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: resurrect PNOR on ast2500
 evb
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479316169-25297-1-git-send-email-clg@kaod.org>
 <1479335546.5215.9.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0083fd05-60f7-8af9-d09d-149d58bfc9a3@kaod.org>
Date: Thu, 17 Nov 2016 08:25:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479335546.5215.9.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6588484780384881410
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudehgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 17 Nov 2016 08:41:07 -0000

On 11/16/2016 11:32 PM, Andrew Jeffery wrote:
> On Wed, 2016-11-16 at 18:09 +0100, Cédric Le Goater wrote:
>> It had gone to the Tartarus again. Let's bring it back to light.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
>> ---
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index 3dc472ae10e9..f60c367573f3 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -30,7 +30,10 @@
>>  
>>  &spi1 {
>>  	status = "okay";
>> -	pnor@0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_spi1_default>;
>> +
>> +pnor@0 {
> 
> Whitespace is a bit busted though?

completely. This PNOR is doomed ...

Joel,

Do you want a resend ?

C. 

> 
>>  		status = "okay";
>>  	};
>>  };
