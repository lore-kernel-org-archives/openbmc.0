Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409DDH2kDJzF27c;
 Tue, 27 Mar 2018 12:38:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="thKk1wsU"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 409DDF59D8z9s1S;
 Tue, 27 Mar 2018 12:38:05 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1522114686; bh=6iL2YbZMdLkvsCIiGaqgJX4kPT7XN2p3GFqbx6DnovE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=thKk1wsURrKS5Q0r/b/7na5qb06giCk8ObubRhwguV+LaUvKEd51gGrI2L1+0K+jT
 LHCMGlS6MSwgYM7g85J4khD+t5doKDAhazOdyj72A9KHKR6L7ymPizOia7fXnFqpnD
 tKWoa1oxfYObcl325KU2+3y7v7zGoEBycbSqCKnxzx9bKre4hYvi0tKwzPIE+RjLTy
 sncEqhDASDMaQEx1/leWR6UzIUZdi3Zxpvk2HsofvALlVtorzGrXiLK4brZJzZ6rP9
 EtDkpp6W/YCQgTucIKoXykdEMtV0SFHvGdx1tvR2lrRq+qohmdZ87K+duyQGFW/3ZX
 lptJo4+XL3EGg==
Subject: Re: [PATCH 1/5] serial: Introduce UPSTAT_SYNC_FIFO for synchronised
 FIFOs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-2-jk@ozlabs.org> <20180323153350.GC25972@kroah.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <004a2d60-5eae-040f-a944-308a8cf69af8@ozlabs.org>
Date: Tue, 27 Mar 2018 09:38:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180323153350.GC25972@kroah.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 01:38:08 -0000

Hi Greg,

>> --- a/drivers/tty/serial/serial_core.c
>> +++ b/drivers/tty/serial/serial_core.c
>> @@ -678,7 +678,7 @@ static void uart_throttle(struct tty_struct *tty)
>>  	if (C_CRTSCTS(tty))
>>  		mask |= UPSTAT_AUTORTS;
>>  
>> -	if (port->status & mask) {
>> +	if (port->status & (mask | UPSTAT_SYNC_FIFO)) {
>>  		port->ops->throttle(port);
>>  		mask &= ~port->status;
>>  	}
> 
> Why not just set mask to UPSTAT_SYNC_FIFO at the top of this function?

That was a bit of a line call - my thinking was that SYNC_FIFO is a
little different from the calculated bit values in mask, hence keeping
it separate and adding it explicitly at the check

However, adding it to the declaration of mask is a little simpler, so
I'll redo that in v2.

Cheers,


Jeremy
