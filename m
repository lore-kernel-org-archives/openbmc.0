Return-Path: <mpe@ellerman.id.au>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSBG83CzjzDqqX
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 23:00:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xSBG76Qs5z9s82;
 Wed,  9 Aug 2017 23:00:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
Subject: RE: [PATCH linux dev-4.10] aspeed_g5_defconfig: add CONFIG_OF_DYNAMIC.
In-Reply-To: <HE1PR05MB1227ECACCB6080B179026C54EF8A0@HE1PR05MB1227.eurprd05.prod.outlook.com>
References: <20170803144813.28010-1-c_mykolak@mellanox.com>
 <CACPK8XfC6=K7MUak2AQa9c1L-C4WBBWoxd8AbpXiM2KukQMUVQ@mail.gmail.com>
 <HE1PR05MB1227ECACCB6080B179026C54EF8A0@HE1PR05MB1227.eurprd05.prod.outlook.com>
User-Agent: Notmuch/0.21 (https://notmuchmail.org)
Date: Wed, 09 Aug 2017 23:00:46 +1000
Message-ID: <87shh0nbep.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 10 Aug 2017 13:05:18 +1000
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
X-List-Received-Date: Wed, 09 Aug 2017 13:00:48 -0000

Mykola Kostenok <c_mykolak@mellanox.com> writes:
>> -----Original Message-----
>> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel >> Stanley
>> 
>> Can you explain what you're wanting to do here?
>> 
>> I've added some of our device tree experts to cc so they can offer advice.
>
> Hi, Joel.
>
> We have now patchset supporting our CPLD device in upstream review.
> There we have support for dynamic (hotplug) devices, like PSUs, FANs, ASIC, etc.  
>
...
>
> They all sets with the state "disabled", and driver activates it with the below calls, when related hotplug event is received in interrupt handler:
>
> static struct property mlxreg_core_device_dis = {
> 	.name = MLXREG_CORE_PROP_STATUS,
> 	.value = MLXREG_CORE_PROP_DISABLED,
> 	.length = sizeof(MLXREG_CORE_PROP_DISABLED),
> };
>
> static void mlxreg_core_dev_enable(struct device_node *np) {
> 	/* Enable and create device. */
> 	of_update_property(np, &mlxreg_core_device_en); }
>
> static void mlxreg_core_dev_disable(struct device_node *np) {
> 	/* Disable and unregister platform device. */
> 	of_update_property(np, &mlxreg_core_device_dis);
> 	of_node_clear_flag(np, OF_POPULATED);
> }
>
> For that we must have OF_DYNAMIC set, and last one required OF_UNITEST.

But are you actually changing the structure of the device tree at run time?

If all you're doing is using of_update_property() to change the status
property I don't think you need OF_DYNAMIC.

cheers
