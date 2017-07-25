Return-Path: <clg@kaod.org>
X-Greylist: delayed 357 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Jul 2017 20:06:06 AEST
Received: from 3.mo1.mail-out.ovh.net (3.mo1.mail-out.ovh.net [46.105.60.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGv5V3zmQzDqm2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 20:06:05 +1000 (AEST)
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B471B88FBA
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 12:00:05 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 12E901200BB;
 Tue, 25 Jul 2017 12:00:03 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] mtd: spi-nor: aspeed: set 4B setting for
 all chips
To: Joel Stanley <joel@jms.id.au>
References: <1500889206-25863-1-git-send-email-clg@kaod.org>
 <CACPK8XeO-MwMR4Yd6G-0MoJiW2AWZpM_EMDCmnPrQ89R2Ot8pg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cf1e5881-8080-dbd8-6e14-1cdb4a90c185@kaod.org>
Date: Tue, 25 Jul 2017 12:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeO-MwMR4Yd6G-0MoJiW2AWZpM_EMDCmnPrQ89R2Ot8pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1631710443218438914
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrheehgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 25 Jul 2017 10:06:07 -0000

On 07/25/2017 05:51 AM, Joel Stanley wrote:
> On Mon, Jul 24, 2017 at 7:10 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> The driver made the wrong assumption that the 4B setting was
>> autodetected for all chips of the AST2500 FMC flash controller. This
>> is only the case for the CS0.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> I tested this on a witherspoon and it appeared to work. I have applied
> it to dev-4.10. Thanks for hunting it down!
> 
> root@spoon1-bmc:~# time flashcp /tmp/flash-witherspoon /dev/mtd6
> real 3m44.212s
> user 0m0.750s
> sys 3m42.620s

It can be improved with a spi-max-frequency property to set 
the hclk divider. I sent a patch for it but it is not entirely
correct as the hclk divider is set a little too early.

C.
