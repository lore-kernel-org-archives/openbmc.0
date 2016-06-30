Return-Path: <clg@kaod.org>
Received: from 17.mo6.mail-out.ovh.net (17.mo6.mail-out.ovh.net
 [46.105.36.150])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgQRV1xJ6zDrSW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 02:46:30 +1000 (AEST)
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 85A2BFFB5A3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 18:38:06 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 4F164120080;
 Thu, 30 Jun 2016 18:38:05 +0200 (CEST)
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 9/9] ast-g4/g5: large cleanup
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-10-git-send-email-clg@kaod.org>
 <1467268194.6386.29.camel@jms.id.au>
 <fb9428a4-877f-fe0c-0ad8-6d84e23f88c4@kaod.org>
 <b09c6fea-db1e-e5ab-5ecd-fbc8b0a1f0b1@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <421eeaeb-3d6b-03a4-55d7-7abf0df625fe@kaod.org>
Date: Thu, 30 Jun 2016 18:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <b09c6fea-db1e-e5ab-5ecd-fbc8b0a1f0b1@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5399253006700022530
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudejgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 30 Jun 2016 16:46:30 -0000

On 06/30/2016 10:34 AM, Cédric Le Goater wrote:
> On 06/30/2016 09:46 AM, Cédric Le Goater wrote:
>> On 06/30/2016 08:29 AM, Joel Stanley wrote:
>>> On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
>>>> This is 99% code alignment cleanups, some removal of code not related
>>>> to the G4 of G5 and some very light rewrite.
>>>>
>>>> Tested on palmetto and a ast2500 evb.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> I started reading from the bottom and about 45 minutes in I gave up
>>> taking a close look.
>>
>> I understand. I have taken a more brutal approach, I am removing the 
>> dead code.
> 
> Joel,
> 
> Here is the v2 with code removal (scu) :
> 
> 	https://github.com/legoater/u-boot/commits/v2016.05-aspeed-openbmc

I dropped the "aspeed/ast-g4: add a force saveenv config" patch in that
tree. It did not bring much.

Cheers,

C.
