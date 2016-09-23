Return-Path: <clg@kaod.org>
X-Greylist: delayed 5348 seconds by postgrey-1.36 at bilbo;
 Sat, 24 Sep 2016 01:16:21 AEST
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgcQG1QjHzDsms
 for <openbmc@lists.ozlabs.org>; Sat, 24 Sep 2016 01:16:11 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 5A28A2861
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 15:22:10 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 1FCB144009C;
 Fri, 23 Sep 2016 15:22:08 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.7 0/6] iBT interface changes
To: Joel Stanley <joel@jms.id.au>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <CACPK8XdYZWn9=KvdVJwrgf_w0verbAGKi0qBnDQgvYCcGvfTEQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bac5424f-acd3-550c-1af4-267d38b44624@kaod.org>
Date: Fri, 23 Sep 2016 15:22:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdYZWn9=KvdVJwrgf_w0verbAGKi0qBnDQgvYCcGvfTEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3207125888636455682
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrtdejgdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 23 Sep 2016 15:16:29 -0000

Hello,

On 09/23/2016 08:14 AM, Joel Stanley wrote:
> Hi Cedric,
> 
> On Thu, Sep 15, 2016 at 4:02 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> This patchset introduces a couple of changes on the driver for the iBT
>> interface on Aspeed SOCs. These were suggested by mainline and have
>> some conficts with the OpenBMC userspace. The most important are name
>> changes, which impact the btbridge daemon, but nothing is requiring a
>> redesign of the stack.
>>
>> The previous driver is reverted and and reincluded in its mainline
>> form. So you should mostly check patch 4 and quickly 5,6. The merge
>> in openbmc kernel can wait mainline's green light I think.
> 
> Congratulations on getting the bt driver upstream. Another one crossed
> off the list (https://github.com/openbmc/linux/wiki).
> 
> What are your thoughts on integrating the change in the OpenBMC tree?

I have been using it on palmetto without issues. We will need a new 
btbridged for that :

	https://github.com/legoater/btbridge

I would also like to add an extension adding a request expiry list
which is in the IPMI spec. Getting some exposure would be good, so 
that we can test and discuss on the feature. 

> With the release of v4.8 around the corner I was thinking we could
> move to a dev-4.8 tree, and move to your driver then. This would give
> us a chance to synchronise all of the patches with their upstream
> versions (gpio, watchdog, bt, pinmux).

+1

Thanks,

C. 
