Return-Path: <clg@kaod.org>
X-Greylist: delayed 2208 seconds by postgrey-1.35 at bilbo;
 Thu, 19 May 2016 00:13:02 AEST
Received: from 19.mo6.mail-out.ovh.net (19.mo6.mail-out.ovh.net
 [188.165.56.177])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8x4G2NpxzDqCH
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 00:13:01 +1000 (AEST)
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0897FFFC553
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 15:36:05 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id E0C05440088;
 Wed, 18 May 2016 15:36:00 +0200 (CEST)
Subject: Re: [PATCH qemu 3/3] ast2400: add a temp sensor device on I2C bus 3
To: Joel Stanley <joel@jms.id.au>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-4-git-send-email-clg@kaod.org>
 <CACPK8XdhpRLh2Gg7eOgUKRfDYkt0zZCQ26bvfyy9=GB5X-TGfg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <573C6FB5.6030507@kaod.org>
Date: Wed, 18 May 2016 15:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdhpRLh2Gg7eOgUKRfDYkt0zZCQ26bvfyy9=GB5X-TGfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8053843508686457771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrfedtgdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 18 May 2016 14:13:02 -0000

On 05/18/2016 03:29 PM, Joel Stanley wrote:
> 
> How much does the tmp105 differ from the tmp421? Could we add a model
> for the 421?

tmp421_{g,s}et_temperature should be a little different, so will be the 
register read routine. nothing complex really. This tmp421 is on my TODO 
list.

C. 
