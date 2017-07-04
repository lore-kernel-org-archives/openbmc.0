Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1q6f2vSQzDqhp
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 13:21:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3x1q6f1FH7z9s7B;
 Tue,  4 Jul 2017 13:21:46 +1000 (AEST)
Subject: Re: [PATCH linux dev-4.10 v2] ARM: aspeed: Release UARTs from reset
 for all platforms
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170704022928.1618-1-joel@jms.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <2fe59789-a468-8838-777f-7debae42e5a5@ozlabs.org>
Date: Tue, 4 Jul 2017 11:21:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170704022928.1618-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 04 Jul 2017 03:21:46 -0000

Hi Joel,

> This workaround was in place for Zaius. Make it common to all
> platforms as the held-in-reset behaviour breaks the Linux tty layer
> where users expect the existence of a device to mean it is usable.
> 
> We release all four UARTs that are covered by this register from reset.

This fixes issues where UART1 is non-functional, so meaning that the
obmc console infrastructure blocks when mirroring to a local tty.

Resolves: https://github.com/openbmc/openbmc/issues/1882
Resolves: https://github.com/openbmc/openbmc/issues/1865

Tested-by: Jeremy Kerr <jk@ozlabs.org>

Thanks!


Jeremy
