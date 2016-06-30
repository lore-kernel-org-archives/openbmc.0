Return-Path: <clg@kaod.org>
Received: from 7.mo53.mail-out.ovh.net (7.mo53.mail-out.ovh.net [46.105.61.78])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgCt66jn4zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 18:50:22 +1000 (AEST)
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id DB84EFF9046
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 10:34:50 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 9D71C620087;
 Thu, 30 Jun 2016 10:34:49 +0200 (CEST)
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 9/9] ast-g4/g5: large cleanup
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-10-git-send-email-clg@kaod.org>
 <1467268194.6386.29.camel@jms.id.au>
 <fb9428a4-877f-fe0c-0ad8-6d84e23f88c4@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b09c6fea-db1e-e5ab-5ecd-fbc8b0a1f0b1@kaod.org>
Date: Thu, 30 Jun 2016 10:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <fb9428a4-877f-fe0c-0ad8-6d84e23f88c4@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15684348654803454722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudejgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 30 Jun 2016 08:50:23 -0000

On 06/30/2016 09:46 AM, Cédric Le Goater wrote:
> On 06/30/2016 08:29 AM, Joel Stanley wrote:
>> On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
>>> This is 99% code alignment cleanups, some removal of code not related
>>> to the G4 of G5 and some very light rewrite.
>>>
>>> Tested on palmetto and a ast2500 evb.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> I started reading from the bottom and about 45 minutes in I gave up
>> taking a close look.
> 
> I understand. I have taken a more brutal approach, I am removing the 
> dead code.

Joel,

Here is the v2 with code removal (scu) :

	https://github.com/legoater/u-boot/commits/v2016.05-aspeed-openbmc

Thanks,

C.
