Return-Path: <clg@kaod.org>
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syK3n6wsLzDvHv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 00:36:21 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7FAB714F21
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 15:36:16 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id D62E02A0085;
 Mon, 17 Oct 2016 15:36:13 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 12/12] mtd: spi-nor: aspeed: use fast read
 when doing DMAs
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-13-git-send-email-clg@kaod.org>
 <CACPK8Xf0sLXLkfV_rGVZ6ppLN0590d3TTugYCTrT4sMNe5XBAA@mail.gmail.com>
 <15dbb415-1b10-da15-ede9-184e99304ab3@kaod.org>
 <CACPK8XdpcR354-1=PW8YEz1FL5P9g+gNua7wCiqpTEJTB6Dsuw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5522b7e4-8075-8b02-8c48-2e862341831a@kaod.org>
Date: Mon, 17 Oct 2016 15:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdpcR354-1=PW8YEz1FL5P9g+gNua7wCiqpTEJTB6Dsuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15262699137187285915
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedvgdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 17 Oct 2016 13:36:22 -0000

On 10/17/2016 11:10 AM, Joel Stanley wrote:
> On Mon, Oct 17, 2016 at 5:12 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Hello Joel,
>>
>> On 10/17/2016 07:04 AM, Joel Stanley wrote:
>>> On Fri, Oct 14, 2016 at 11:08 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>>> Try to improve the speed of transfers when doing DMAs
>>>
>>> This could get squashed into the DMA adding patch I think.
>>
>> If you haven't pushed yet, you can drop this one, it does not
>> change anything in fact.
>>
>> I am currently looking at introducing some timing support
>> to speed up reading on the SPI, like pflash does and I am
>> shuffling the code quite a lot to isolate the different settings.
>>
>>
>> Just to say they are more changes to come to cleanup the driver.
> 
> Okay, great.
> 
> I will hold off merging the patches for a little white. We will need
> to commit them some time this week though. If they are not the final
> version then that is okay.

I am tired of the little fixes so I will make one big patch for the 
aspeed smc, AST2400 and AST2500, then a couple more for the dts, plus 
one for the dma (as I am not sure it is useful). I have another one 
pending for timing optimizations but that is too drafty for the moment.

Hopefully, I can make the patchset common with mainline with a first 
revert of what we have today in openbmc and some API fixes for 4.8.

> Once you have something ready for upstream, we should cc Ben H (who 
> as you know wrote pflash) for his thoughts. We need to do that this 
> week as he won't have much time next week.

Sure. I have questions on the default settings. Some are strapped 
by hardware, like the Div 2, depending on the controller type, some 
are not but we would like that to work in all cases. I have started 
to maintain a static table per chip jedec for these in the driver. 
I am not sure of the approach, but first, let's get a clean common 
base to work with.

Thanks,

C. 
