Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 433L3l5sjnzDqMP
 for <openbmc@lists.ozlabs.org>; Mon, 26 Nov 2018 19:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="kgJL9yXG"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 433L3l13Lyz9s7h;
 Mon, 26 Nov 2018 19:41:07 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1543221667; bh=Hhpwtz/kq5e/iOefm83IT5ELHIJCyq9fpHrmAn8kH+A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kgJL9yXG+W/N/jQy2NOQ8aAaolpKX1GUXNJtk/dvfwPQ/Z1kcq1fFs/zqO6awJbCW
 GsZqAAtHE3thcMy/SM3gnSi+ABwPNaY8DL9l7F61KrVtz67yTeiOBwUXj3RHXZwiVO
 lp1BZb8JvZ/rpgNBuY4x7JZLWp9VUNiPC97OzeNKloq0RKi9p0pg8gew1as7uSOeON
 /5U6FiVfL+6z6cyGeWOUR2Zl3XfFl+YRgM5gzHIQvlbkTs3ZuY1VmiKZ8ugLo3zMc4
 K0xcycxexz0iXmQZklIyv9oULMOdf+ogn4973OQKoW6gtKOFFKcxFKYK5RNsQBOamS
 p3PtugbCLvCGA==
Message-ID: <ae8e1ca665138cf469fc728a0e6568bc719e51a5.camel@ozlabs.org>
Subject: Re: Re:  SOL,obmc-console-client can't connect to the host OS
From: Jeremy Kerr <jk@ozlabs.org>
To: xiuzhi <1450335857@qq.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 26 Nov 2018 16:41:06 +0800
In-Reply-To: <tencent_4DC97888286A14BA6909E22C@qq.com>
References: <mailman.13.1542934803.27188.openbmc@lists.ozlabs.org>
 <tencent_3E424D8E19D15B754896EDBB@qq.com>
 <54d6a0985b858c42671abf294cd64dec1970df5b.camel@ozlabs.org>
 <tencent_0E48BB6E60EFF8C048940433@qq.com>
 <5190db8cd01920ea71636c7a87813f4d9182dad3.camel@ozlabs.org>
 <tencent_4DC97888286A14BA6909E22C@qq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 08:41:08 -0000

HI Xiuzhi,

>    Thank you for your patient explanation extremely . 

No problem!

> Now, 'cat /dev/ttyS3' on AST2500 can read string from the host ttyS0.

OK, great. So ttyS3 is the device that we want obmc-console-server to be
using.

> I also changed or removed  the "local-tty" from ttyS5 to  ttyS3, and
> then
>  systemctl restart obmc-console\@ttyVUART0, It didn't work.
> root@haiguang1:~# strace obmc-console-server --config /etc/obmc-
> console.conf ttyVUART0
> execve("/usr/sbin/obmc-console-server", ["obmc-console-server", "
> --config", "/etc/obmc-console.conf", "ttyVUART0"], 0x7edd0d5c /* 15
> vars */) = 0

You're still passing ttyVUART0 to the obmc-console-server command-line,
so it will try to use this for the connection to the host. In your
system though, you want it to be using ttyS3 for the connection to the
host.

So, you should be running something like this instead:

   obmc-console-server --config /etc/obmc-console.conf ttyS3

And because you're not using the VUART device, you do not need to
specify the LPC address (with the `lpc-address = x`) in obmc-
console.conf. You should be able to remove that line.

We only need on our platforms this configure the VUART to be at the
correct address on the AST2500 LPC bus. Because you're not using that,
you don't need the lpc-address line.

> Why and how to  achieve this link the ttyVUART0 to ttyS3 by modifying
> the compilation configuration ?

No compiled configuration changes are needed - just tell obmc-console-
server to use ttyS3 rather than ttyVUART, by modifying the command-line
argument.

Regards,


Jeremy
