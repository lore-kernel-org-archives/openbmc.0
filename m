Return-Path: <clg@kaod.org>
X-Greylist: delayed 4271 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Nov 2016 01:14:49 AEDT
Received: from 2.mo3.mail-out.ovh.net (2.mo3.mail-out.ovh.net [46.105.75.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMrG16HJ2zDvhY
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 01:14:49 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id B5009605DB
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 15:14:46 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 2322528007C;
 Mon, 21 Nov 2016 15:14:40 +0100 (CET)
Subject: Re: [PATCH qemu 02/38] aspeed: QOMify the CPU object and attach it to
 the SoC
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-3-git-send-email-clg@kaod.org>
 <1479725953.5215.24.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10550901-c8d0-262e-51a1-7658494af56e@kaod.org>
Date: Mon, 21 Nov 2016 15:14:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479725953.5215.24.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 95982970309413843
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 14:14:50 -0000

On 11/21/2016 11:59 AM, Andrew Jeffery wrote:
> On Fri, 2016-11-18 at 15:21 +0100, Cédric Le Goater wrote:
>> > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> With this I think we can finally drop
> 
>     dc->cannot_destroy_with_object_finalize_yet = true;
> 
> from aspeed_soc_class_init() in hw/arm/aspeed_soc.c. See commit
> 
>     ce5b1bbf624b exec: move cpu_exec_init() calls to realize functions
> 

Indeed. I just checked and added a patch for it.

Thanks,

C. 
