Return-Path: <clg@kaod.org>
Received: from 10.mo5.mail-out.ovh.net (10.mo5.mail-out.ovh.net
 [46.105.52.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNyw936pFzDw0r
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 21:18:17 +1100 (AEDT)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8A5A444759
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:33:07 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id B7F1B60007C;
 Wed, 23 Nov 2016 10:33:05 +0100 (CET)
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
 <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
 <1479784251.2503.18.camel@aj.id.au>
 <b6082460-d8a0-9dfb-9b84-9f98a660e6aa@kaod.org>
 <1479864143.2503.44.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0187082e-64b6-4b84-61bc-bc3014c24d0c@kaod.org>
Date: Wed, 23 Nov 2016 10:33:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479864143.2503.44.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7084725164639095554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 23 Nov 2016 10:18:19 -0000

On 11/23/2016 02:22 AM, Andrew Jeffery wrote:
> On Tue, 2016-11-22 at 08:21 +0100, Cédric Le Goater wrote:
>>>> So we should set or unset these SCU regs when the SoC is created
>>>> and 
>>>> derive the wdt2 enablement from them. I suppose that the helper
>>>> routine 
>>>> to check for the conditions would be under SCU. 
>>>>
>>>> or do we start a simple pinctrl model and slowly add the
>>>> enablement
>>>> of the pins we need ? 
>>>>
>>>
>>> From the discussion on IRC last night between Cédric, Joel and
>>> myself
>>> we decided to start on a pinmux backend to help manage these
>>> issues.
>>
>> Do you have a rough idea of an API that the SoC could use ? 
>>
>> 	enum AspeedAST2500Function {
>> 		FWSPICS0,
>> 		FWSPICS1,
>> 		FWSPICS2,
>> 	};
>>
>> 	enum AspeedAST2400Function {
>> 		ROMCS1,
>> 		ROMCS2,
>> 		ROMCS3,
>> 		ROMCS4,
>> 	};
>>
>> 	bool aspeed_pin_is_enabled(AspeedPinmux *p, int func);
> 
> Largely this looks good.
> 
> But bikeshedding a bit, but I think the function name should focus on
> functions, not pins. The function maps to some pin in the physical
> case, but for qemu's purposes we don't care about that just yet. Even
> if we do care in the future we can internally map functions to pins
> behind a pinmux abstraction. As such I think we can get away with a
> small tweak:
> 
> bool aspeed_pinmux_is_enabled(AspeedPinmux *p, int func);

ok Looks good to me. I will fake this in the patchset to ease the 
change in the future.

> Did you have any thought about how we hoist ourselves from a
> AspeedPinmux to say an AspeedAST2500Pinmux with this interface? 

There are different solutions. We could introduce a class like

#define TYPE_ASPEED_PINMUX "aspeed-pinmux"
#define ASPEED_PINMUX(obj)
     OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX)
#define ASPEED_PINMUX_CLASS(klass) \
     OBJECT_CLASS_CHECK(AspeedPinmuxClass, (klass), TYPE_ASPEED_PINMUX)
#define ASPEED_PINMUX_GET_CLASS(obj) \
     OBJECT_GET_CLASS(AspeedPinmuxClass, (obj), TYPE_ASPEED_PINMUX)

typedef struct AspeedPinmux {
	...
} AspeedPinmux;

typedef struct AspeedPinmuxClass {
	...
	AspeedPinmuxType pinmux_type;
        ... 

or
	... 
        bool (*is_enabled)(AspeedPinmux *pmux, int func);
	....
} AspeedPinmuxClass;

#define TYPE_ASPEED_PINMUX_POWER8E TYPE_ASPEED_PINMUX "-ast2500"
#define ASPEED_PINMUX_AST2500(obj) \
    OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX_AST2500)

#define TYPE_ASPEED_PINMUX_POWER8E TYPE_ASPEED_PINMUX "-ast2400"
#define ASPEED_PINMUX_AST2400(obj) \
    OBJECT_CHECK(AspeedPinmux, (obj), TYPE_ASPEED_PINMUX_AST2400)


and use 'pinmux_type' to dispatch to specific handlers or directly
include the handlers we need under the class. 

If we only have handlers and no state, we could define a Interface
and tie it to the soc object.

typedef struct AspeedPinmuxInterface {
    Object parent;
} AspeedPinmuxInterface;

#define TYPE_ASPEED_PINMUX_INTERFACE "aspeed-pinmux-interface"
#define ASPEED_PINMUX_INTERFACE(obj) \
     OBJECT_CHECK(AspeedPinmuxInterface, (obj), TYPE_ASPEED_PINMUX_INTERFACE)
#define ASPEED_PINMUX_INTERFACE_CLASS(klass)                \
    OBJECT_CLASS_CHECK(AspeedPinmuxInterfaceClass, (klass), \
                       TYPE_ASPEED_PINMUX_INTERFACE)
#define ASPEED_PINMUX_INTERFACE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(AspeedPinmuxInterfaceClass, (obj), TYPE_ASPEED_PINMUX_INTERFACE)

typedef struct AspeedPinmuxInterfaceClass {
    InterfaceClass parent;
    bool (*is_enabled)(AspeedPinmuxInterface *dev, int func);
    ...
} AspeedPinmuxInterfaceClass;


Conceptually, the SoC object would have a set of routines to handle
muxing. that seems ok to me as pinmux is a rather invasive component 
needing access to all controllers to be able to set the functions. 

C.

> As it
> stands (without specifying parts of AspeedPinmux) we don't have the
> context to correctly interpret the func arg. Already with these few
> functions we have to test different bits depending on the SoC at hand,
> and the 2500 has the extra requirements of talking to the GFX and LPC
> controllers in other cases.
> 
> I expect having a tag field internal to p is enough. I'll have a think
> about it.
> 
> Andrew
> 
>>
>> Thanks,
>>
>> C. 
