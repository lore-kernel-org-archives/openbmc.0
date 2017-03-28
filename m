Return-Path: <clg@kaod.org>
Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [87.98.181.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsxW21hsvzDqC2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 03:41:49 +1100 (AEDT)
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id F00D47818D
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 18:41:45 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 80EB04E0070;
 Tue, 28 Mar 2017 18:41:42 +0200 (CEST)
Subject: Re: [PATCH] net/ftgmac100: Rewrite the driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1490610516.3177.72.camel@kernel.crashing.org>
 <8034ac73-e5ee-fd0f-cfd9-9b552e4d5ec8@kaod.org>
 <1490649293.3177.84.camel@kernel.crashing.org>
 <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5b1b8621-c20d-f100-0875-8f2264d70e8e@kaod.org>
Date: Tue, 28 Mar 2017 18:41:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f5146202-a82d-17b3-2e23-7b8954aa4092@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10540956406694382338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrkeehgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 28 Mar 2017 16:41:51 -0000


>>>> It does that by, among other things, rewriting the receive and
>>>> transmit code, to both simplify the fast path as much as possible,
>>>> avoid flushing of the caches (the aspeed chips have really slow
>>>> little ARM cores), implementing support for fragmented sends,
>>>> fixing HW checksum generation (AST2500 only), etc...
>>>>
>>>> In addition, I've added netpoll support, tx timeout recovery,
>>>> better handling of link speed changes, multicast filter
>>>> and promisc support, various ethtool config additions etc...
>>>
>>> Nice. So I will need to update the QEMU model as it is quite 
>>> basic for the moment.
>>
>> You will need to support fragmented sends yes ;-)
> 
> among other things yes ... I will add that on the TODO list. Anyhow
> the model needed some cleanups. 

The fragmented tx was not taking into account the full size of 
the frame ... That is fixed now and I also added cksum offload 
support for the AST2500. So the new and old n/w drivers are now
supported in QEMU, in a very basic way. no nifty tuning.

I reworked a bit the way the rx queue is flushed but this is not 
enough to support iperf yet. it needs more work to sustain high 
throughput. U-Boot support would be nice also but I think we will 
need a more complete NCSI model. 

Cheers,

C. 
 
