Return-Path: <clg@kaod.org>
Received: from 5.mo3.mail-out.ovh.net (5.mo3.mail-out.ovh.net [87.98.178.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpfZ1rcWzDvj4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:02:29 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id AE5AE6025E
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:53:44 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id BE16F2800C5;
 Mon, 21 Nov 2016 13:53:43 +0100 (CET)
Subject: Re: [PATCH qemu 31/38] aspeed: add a watchdog controller
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-32-git-send-email-clg@kaod.org>
 <CACPK8XcHgj5RVLCWdyxWLPTaPadm+9VU1u_QXpgAyBTQdhUmpw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a3790736-4ff2-9078-5ef0-8851b3b708e8@kaod.org>
Date: Mon, 21 Nov 2016 13:53:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcHgj5RVLCWdyxWLPTaPadm+9VU1u_QXpgAyBTQdhUmpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17174477181783608066
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 13:02:30 -0000

On 11/21/2016 08:27 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:52 AM, Cédric Le Goater <clg@kaod.org> wrote:
> 
> I assume with this we can reboot the guest? Might be worth mentioning
> in the commit message.

yes. The commit message is a bit short :) we need to write a minimum 
one.

>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  hw/arm/aspeed_soc.c         | 13 +++++++++++++
>>  include/hw/arm/aspeed_soc.h |  2 ++
>>  2 files changed, 15 insertions(+)
