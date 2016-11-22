Return-Path: <clg@kaod.org>
Received: from mo3.mail-out.ovh.net (mo3.mail-out.ovh.net [178.32.228.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNHn40hSSzDw2B
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 18:54:47 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2C3D5607C3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 08:54:44 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 6E614280077;
 Tue, 22 Nov 2016 08:54:41 +0100 (CET)
Subject: Re: Aspeed VUART implementation for QEMU
To: Alastair D'Silva <alastair@au1.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1479776162.11116.85.camel@au1.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1912ed2c-1499-5e71-1817-10d955c060e2@kaod.org>
Date: Tue, 22 Nov 2016 08:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479776162.11116.85.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17997228538005851051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdeggdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 22 Nov 2016 07:54:48 -0000

On 11/22/2016 01:56 AM, Alastair D'Silva wrote:
> Hi folks,
> 
> I was thinking of getting stuck into the VUART implementation in QEMU
> soon.
> 
> After reading the docs, I think we should map in a 16550 uart at the
> address specified in the design docs, and attach the other end of the
> uart to a socket. Does this sound reasonable?

yes, using a chardev socket to connect it to the other end. 

I think we could event connect the console of a pnv guest for that. 
Use this branch, if you want a full working one :

	https://github.com/legoater/qemu/tree/powernv-ipmi-2.8

C. 


> Joel mentioned that Cedric has already given this some thought, so I'd
> love to hear it.
