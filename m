Return-Path: <clg@kaod.org>
Received: from 2.mo177.mail-out.ovh.net (2.mo177.mail-out.ovh.net
 [178.33.109.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdCqN1VcZzDvHh
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 19:41:35 +1100 (AEDT)
Received: from player779.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id A59ED663B
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 09:03:27 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 0D5497C0095;
 Tue, 13 Dec 2016 09:03:22 +0100 (CET)
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
To: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
 <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9baffcb9-1a0a-ad10-d089-384543020c79@kaod.org>
Date: Tue, 13 Dec 2016 09:03:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdisKkgmE2PT5JGE06AD73rrBizsgL0+SbyFkSHShaEKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12344085106464164610
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrieefgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 13 Dec 2016 08:41:36 -0000

On 12/13/2016 02:26 AM, Joel Stanley wrote:
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index b2fb6dbf..7bcaf30 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
> "misc seems a bit too misc" - Andrew Jeffery.
> 
> How about drivers/soc? Or drivers/mfd?
> 

I would say drivers/mailbox. There are quite a few of these drivers already there.

C. 
