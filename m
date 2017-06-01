Return-Path: <clg@kaod.org>
X-Greylist: delayed 50488 seconds by postgrey-1.36 at bilbo;
 Thu, 01 Jun 2017 16:51:34 AEST
Received: from 16.mo5.mail-out.ovh.net (16.mo5.mail-out.ovh.net
 [87.98.174.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wddKy40VwzDqBQ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 16:51:33 +1000 (AEST)
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id B5883100344
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 08:45:09 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 224D2460086;
 Thu,  1 Jun 2017 08:45:03 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
References: <20170531135614.7170-1-joel@jms.id.au>
 <ab9921a6-72b7-289b-b1ab-65738052a1ff@linux.vnet.ibm.com>
 <CACPK8Xd+bXUzVsXez1gF_S5Fgtp_c5ix8pWuUmZqj1r1yp=b4g@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>,
 Mykola Kostenok <c_mykolak@mellanox.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <17737bf1-ea87-a116-b362-e059e2fe82cc@kaod.org>
Date: Thu, 1 Jun 2017 08:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd+bXUzVsXez1gF_S5Fgtp_c5ix8pWuUmZqj1r1yp=b4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13255501080499030791
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrgeekgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 01 Jun 2017 06:51:34 -0000

On 06/01/2017 08:40 AM, Joel Stanley wrote:
> On Thu, Jun 1, 2017 at 2:45 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>
>>
>> On 05/31/2017 08:56 AM, Joel Stanley wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Reorganize flash controllers into the ast2400 device tree to match what
>>> is used upstream. This moves the nodes from the machine dts to the
>>> common dtsi.
>>>
>>> This also affected the newly added Mellanox MSN device tree, which is
>>> also updated in this series.
>>>
>>> Barreleye wasn't booting with the new aspeed-smc driver.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> [joel:
>>>    - rework commit message
>>>    - add missing m25p,fast-read properties
>>>    - add pinmux for pnor
>>>    - use upstream node names
>>>       * bmc_pnor becomes fmc
>>>       * host_pnor becomes spi
>>>    - fix the facebook machine
>>> ]
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>> Eddie, I reworked your patch for you. Please check it looks okay.
>>
>>
>> Thanks Joel!
>>
>> Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>
> 
> Thanks for the review Cedric and Eddie.
> 
> I have applied to dev-4.10.

I suppose that this patch applies now ? 
 
	http://patchwork.ozlabs.org/patch/752285/

Thanks,

C. 
