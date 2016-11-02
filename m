Return-Path: <clg@kaod.org>
Received: from 2.mo173.mail-out.ovh.net (2.mo173.mail-out.ovh.net
 [178.33.251.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7zht5ST8zDvJy
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 18:08:30 +1100 (AEDT)
Received: from player687.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5398810444
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 08:08:26 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id AD2FA2C0075;
 Wed,  2 Nov 2016 08:08:22 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 4/8] ipmi: add an Aspeed BT IPMI BMC driver
To: Joel Stanley <joel@jms.id.au>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-5-git-send-email-clg@kaod.org>
 <CACPK8Xd8BthXky3+Bufxu8n-3VnZRJz=rpKjjVPR+9Sdunyvxg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4bccd032-73aa-bcf5-7621-5a1a391dde2d@kaod.org>
Date: Wed, 2 Nov 2016 08:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd8BthXky3+Bufxu8n-3VnZRJz=rpKjjVPR+9Sdunyvxg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10441877211048938326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkedvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 02 Nov 2016 07:08:31 -0000

On 11/02/2016 01:00 AM, Joel Stanley wrote:
> Hey Cedric,
> 
> On Wed, Oct 26, 2016 at 5:27 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> Backport from mainline of the main IPMI BMC driver patch plus fixes :
>>
>>  - commit d94655b405ba ("ipmi/bt-bmc: remove redundant return value
>>    check of platform_get_resource()")
>>  - commit a3e6061bad62 ("ipmi/bt-bmc: add a dependency on
>>    ARCH_ASPEED")
>>  - commit 1a377a79211a ("ipmi: Fix ioremap error handling in bt-bmc")
>>  - commit 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
> 
> It has just occurred to me that this driver is written for the iBT
> hardware in the Aspeed, and we also have the BT hardware.

This is true. one is IPMI compliant, the other follows H8S/2168.
 
> If we were to write a driver for the BT hardware it would clash with
> this one. In particular the compatible string and the character device
> name.
> 
> I propose sending a patch to upstream before the release of 4.9 that
> changes the chardev name to ipmi-ibt-host and changing the comaptible
> string to ast2400-ibt-bmc.
> 
> What do you think?

I can include the change in the patchset I will send for the expiry list 
and see how Corey reacts. 

C.
