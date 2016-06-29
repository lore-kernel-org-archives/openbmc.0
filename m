Return-Path: <clg@kaod.org>
Received: from 18.mo3.mail-out.ovh.net (18.mo3.mail-out.ovh.net
 [87.98.172.162])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnd92QyCzDr1x
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:07:41 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id E1F4FFF9852
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:01:29 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 4ED31440084;
 Wed, 29 Jun 2016 18:01:27 +0200 (CEST)
Subject: Re: [PATCH uboot/v2016.05-aspeed-openbmc 0/3] aspeed/ast-g4: misc
 fixes
To: openbmc@lists.ozlabs.org
References: <1467185838-28342-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b53b9fdc-11fc-f7c1-62ab-def302308555@kaod.org>
Date: Wed, 29 Jun 2016 18:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467185838-28342-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17354902641050880979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 16:07:41 -0000

On 06/29/2016 09:37 AM, Cédric Le Goater wrote:
> Here are couple of fixes for the AST2400 (G4) on the new uboot branch.

Joel,

Please forget about this patchset and take the coming one which adds Milton's
patches on the aspeednic and which includes a larger cleanup of the ast.

Thanks,

C.


> Cédric Le Goater (3):
>   aspeed/ast-g4: select the correct cpu
>   aspeed/ast-g4: use literal defines in misc_init_r()
>   net/aspeednic: start mac after ring buffers are initialized
> 
>  arch/arm/Kconfig             |  1 +
>  board/aspeed/ast-g4/ast-g4.c | 15 +++++++++------
>  drivers/net/aspeednic.c      |  2 +-
>  include/configs/ast-g4.h     |  1 +
>  4 files changed, 12 insertions(+), 7 deletions(-)
> 
