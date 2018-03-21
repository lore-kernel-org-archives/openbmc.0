Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405b305mDnzF0g4;
 Wed, 21 Mar 2018 14:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Q2R2CiYJ"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 405b2z6vKVz9s0n;
 Wed, 21 Mar 2018 14:32:27 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521603148; bh=Fw7QOxKXSdGOgqpBCb/mvrW0zPwR26miSCvzCl08Au8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q2R2CiYJ5LIm+/6nQeP/dtrzfwUsZWNOUXONoIzVg16yVm7wz/6JULXlCmmmaYqsW
 aM0oQgTSi820CglhFyYYd8km3bnyj0aKyvEzxuK+It2iOaaoJ/PIGGmAOfHy1CEc2J
 6JxGK3QXvT9qBNNn3T0aaBfhzSLaNjFJPH1nRJUYc0Xt+37YPPNsvrD87T3QeQB1Q2
 Asoc1mSsjNGcQ3tXIIEfezZ7UGtZ6EBiQVuuTXufdnHldfvU73n01IHSJTsz7SUZUK
 ej2kakBMTRIqe5r2x8OMOHW57MTmOHuoVysuFs9wPsOEAeajqkKsW4KZ8tqJndelbj
 qkeW+ks0VJ+Kw==
Subject: Re: [PATCH 5/5] serial/aspeed-vuart: Implement quick throttle
 mechanism
To: Joel Stanley <joel@jms.id.au>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-6-jk@ozlabs.org>
 <CACPK8Xc+BhX+8o3-z1tVWCc81rCnf5EBaFA8VqU64ywvJg6aZw@mail.gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <acd1382f-b2fe-3476-b3a8-d4777b856f4c@ozlabs.org>
Date: Wed, 21 Mar 2018 11:32:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc+BhX+8o3-z1tVWCc81rCnf5EBaFA8VqU64ywvJg6aZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 03:32:29 -0000

Hi Joel,

> The diff is a bit confusing, considering you just added these
> functions. Can you explain why you did it that way?

Sure. The initial versions were the standard callbacks for struct
uart_ops, which all need to take the port lock.

Patch 5/5 needs a lockless version of these for calling from the irq
handler, which already has the lock held. So, we introduce the
__-versions there.

I could add the lockless version in the earlier 4.5 patch, but it looks
a bit redundant there. Happy to go either way. Or, I can elaborate why
in the commit log (I'll need a v2 anyway for the setup_timer change...).

Cheers,


Jeremy
