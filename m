Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.172.75; helo=4.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 547 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Sep 2017 17:36:00 AEST
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxRh1v5fzDqm5
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:35:59 +1000 (AEST)
Received: from player770.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 897DAA53AB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 09:26:48 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 3C6763C008A;
 Tue, 12 Sep 2017 09:26:43 +0200 (CEST)
Subject: Re: QEMU 2.10.0
To: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
References: <1505200336.4080.3.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
Date: Tue, 12 Sep 2017 09:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505200336.4080.3.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10103544292575579091
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedugdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 12 Sep 2017 07:36:00 -0000

On 09/12/2017 09:12 AM, Andrew Jeffery wrote:
> Hello,
> 
> I've updated openbmc/qemu's master to 2.10.0. For anyone maintaining
> patches on top of master I've merged the old master state into 2.10.0
> with the --ours strategy, then applied the series Cédric is maintaining
> on top. This means any patches you might have on top of master should
> rebase easily due to shared history, whilst keeping our yet-to-be-
> upstreamed patches in an easily identified set.

Here are some updates on the QEMU wiki : 

	https://github.com/openbmc/qemu/wiki

Thanks,

C. 
