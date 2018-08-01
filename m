Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gFJB6pR7zF18f
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 10:56:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="h6Lbq06Y"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41gFJ969ptz9s0R;
 Wed,  1 Aug 2018 10:56:57 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1533085018; bh=gYoqYf6MaMLLrWy30jYDZmQvakjZ7MMH327ZMYJf5nI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h6Lbq06YB+WIXbC6OwyzRbgIsWXa7qw3jWUWcJgW/OB4EL2bGCmBFk+240eXiGZct
 GxPtRaqQOu5ec3Rxim8wDeHCA84J5RadB35qux0SYkXk3poAl/e2DMazZxNmDtWO3B
 zumSt7eHD/lfJwrBDnU0kY8C8jrxZ8oYnWyg+6rh35xwX8gGHvFAVfozHZQIvbD1jk
 vYAVz3SPcAD4PEjBssvlhlSCoCGm8nBm0wH9S6jQHKh24o4Vaj2GlcdEFs1tBew5Mz
 CquZOfO4CtIKzAbv2cCBIOdlcS8B4dO1L4+j74zaUQXU9IjkRPsvlcwkIcCK1pnKIN
 CIMG5zwrsiEuw==
Subject: Re: Virtual Media
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
 <20180731180257.GJ105329@mauery>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <e1b784dc-3434-cfda-a07b-3a065458fef0@ozlabs.org>
Date: Wed, 1 Aug 2018 08:56:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180731180257.GJ105329@mauery>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 00:57:00 -0000

Hi Vernon,

> In past BMC implementations, we offered up to four virtual devices to be 
> mounted remotely. I can't remember if this included the one used for 
> firmware updates or not. But we will probably need more than one.

That would definitely be possible with this design, we'd just need to
parameterise the nbd device and USB endpoint.

However, I've personally never encountered a need for more than one
virtual media device. As you say, most of this will be for host OS
installs.

But if we do have a compelling case to implement multiple devices, that
shouldn't be a hassle.

> That sounds pretty good from a high level. Nice job using off-the-self 
> parts.

Thanks! Was nice to find that we didn't need to implement custom
protocols & kernel interfaces for this.

> RO files should really be the biggest use case for this -- host OS 
> installs and such. I really don't know how much people will complain if 
> we take their RW files away.

Yes, I'd agree there. As above, I'm not sure how much this would be
used. The one use-case I can imagine is a small writeable filesystem for
saving debug logs (in our case, from petitboot). However, we also have
actual host network available at that point...

It *could* be possible to do RW media in javascript by storing CoW data
of modified blocks client-side (eg, in an IndexedDB). The UX isn't great
for this though, as the user would need to explicitly "download" and
save the modified file after use (and I guarantee that folks will forget
to do that and lose data).

> We are also not requiring them to install Java,

Hooray! :)

Cheers,


Jeremy
