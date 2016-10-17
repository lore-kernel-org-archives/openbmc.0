Return-Path: <clg@kaod.org>
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
 [178.32.97.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy85h6RckzDt3H
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 17:52:24 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id AE49F14C46
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:52:19 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 774E12A0072;
 Mon, 17 Oct 2016 08:52:17 +0200 (CEST)
Subject: Re: [PATCH u-boot 06/12] aspeed: timer cleanups
To: Joel Stanley <joel@jms.id.au>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-7-git-send-email-clg@kaod.org>
 <CACPK8Xcv4EnXoRg9Lf1Mu4i8S7eSNH=yV96x=KN2=L=Ts0wvPw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e37a68f0-de3c-8054-c07c-54ad1e9638f7@kaod.org>
Date: Mon, 17 Oct 2016 08:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcv4EnXoRg9Lf1Mu4i8S7eSNH=yV96x=KN2=L=Ts0wvPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8440308655857502978
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedugdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 17 Oct 2016 06:52:25 -0000

On 10/10/2016 08:22 AM, Joel Stanley wrote:
> On Fri, Oct 7, 2016 at 8:26 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The code should not use static as it is relocated at init time. Also
>> add some definitions on the bits used to configure timer 1.
>>
> 
> Unrelated to this patch; would reusing the Linux driver in u-boot be a
> good idea?

I remember having done a relatively quick copy/paste for what we have 
in uboot. So yes, It is worth a check.

Thanks

C. 
