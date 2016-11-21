Return-Path: <clg@kaod.org>
X-Greylist: delayed 480 seconds by postgrey-1.36 at bilbo;
 Mon, 21 Nov 2016 21:07:23 AEDT
Received: from 5.mo3.mail-out.ovh.net (5.mo3.mail-out.ovh.net [87.98.178.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMkmW5fCdzDvgf
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:07:23 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3C18C60222
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 10:59:19 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 437FC2800AF;
 Mon, 21 Nov 2016 10:59:15 +0100 (CET)
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <CACPK8Xeo7f9rJ9JdR9GGYtfPFu67ONEZKK8V6xq9+hRSuEvc=g@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1e600e7b-9724-64cc-6446-5b8af4eaf654@kaod.org>
Date: Mon, 21 Nov 2016 10:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xeo7f9rJ9JdR9GGYtfPFu67ONEZKK8V6xq9+hRSuEvc=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14228278600743619330
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 10:07:24 -0000

On 11/21/2016 08:26 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:51 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> If the second watchdog is activated, a second flash module is
>> available. It should be of the same model.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Nice. We should enable WDT2 in u-boot and the device tree for ast2500 systems.

Yes. I think we have ~20s to deactivate it before the system is reseted 
to boot on CS1.
 
Thanks,

C.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
