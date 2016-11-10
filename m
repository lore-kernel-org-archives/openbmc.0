Return-Path: <clg@kaod.org>
Received: from 18.mo5.mail-out.ovh.net (18.mo5.mail-out.ovh.net [178.33.45.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tF25g5skHzDvHf
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 23:13:59 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2694F41D94
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 13:04:13 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id BFEDB600071;
 Thu, 10 Nov 2016 13:04:09 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 0/8] BT driver sync up
To: Joel Stanley <joel@jms.id.au>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <40804db4-242b-8e46-d435-ebae8a55ad7a@kaod.org>
 <CACPK8Xdzo5ONSrD7BCnjNfdF5+zX2t3=1hR52uF7qO3JC-j7Jg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8fac795c-8365-6731-806e-83c3457e2533@kaod.org>
Date: Thu, 10 Nov 2016 13:04:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xdzo5ONSrD7BCnjNfdF5+zX2t3=1hR52uF7qO3JC-j7Jg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7078251240166034178
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtdefgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 10 Nov 2016 12:14:00 -0000

On 11/10/2016 12:33 PM, Joel Stanley wrote:
> On Thu, Nov 10, 2016 at 7:43 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Joel,
>>
>> On 10/26/2016 08:57 AM, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> Here is a serie syncing the OpenBMC kernel with the BT driver merged
>>> in mainline linux. This kernel needs an updated version of btbridged :
>>>
>>>      https://github.com/legoater/btbridge/commits/master
>>>
>>> The last two patches add a request expiry list and some configuration
>>> through sysfs. These are for review only as they need to be sent to
>>> mainline first.
>>
>> So please drop these two patches. This is too early.
>>
>> I will send later an interesting fix from Corey which handles
>> concurrent reads and writes a little better than we do today.
>> But after this is all merged.
> 
> Okay, thanks for the clarification. I applied these patches to dev-v4.7:
> 
>  ARM: dts: aspeed: Enable BT IPMI BMC device
>  ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>  ipmi: add an Aspeed BT IPMI BMC driver
>  ARM: dts: aspeed: remove previous iBT definitions
>  ARM: aspeed: remove previous definitions in default config
>  Revert "misc: Add Aspeed BT IPMI host driver"

It looks safe to take that one also :

	http://patchwork.ozlabs.org/patch/690292/

May be, it is time now for a followup with :

+	{ .compatible = "aspeed,ast2500-ibt-bmc" },

? 

C.
