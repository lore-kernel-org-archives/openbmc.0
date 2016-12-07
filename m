Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYv3L3BMhzDvk6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 09:55:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zCjppN4c"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id p9so20647999vkd.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 14:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=h+id6iUH/i54XBxsKp9xQUB5WUpbAG2d3cdfMRw6mes=;
 b=zCjppN4cYSAfF+tthpVEcuS0Ab4ZMGyzahoN0L1yG7wBPV8ORUHUp1s7mQSbHtRuhS
 dFm6cgwiJvK3Upwh8vxfx0Rc3slxExUrFvYYSP0jSI+ZZ5JgfxQ8HutWefeWTRGXtKd7
 tshRH7pXxPybjdil6PkofHYK4KxnAIQQpwCP+Q2r0ukbRPVpJXYR+bqhW3eD2fjNwSTN
 /jwx0ndsACpMVcqLz1t9bA7vn0YponRamHwRZEYjP+22WyQa9cMLVSvNcj7G+knPjEQd
 wVyt+w4TCV5S4I/Bc9mWpdZCWbB6FiYMmS7W3l/xNU9cUN1UjOMJTpRYyZ1tDM8k4ny6
 LqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=h+id6iUH/i54XBxsKp9xQUB5WUpbAG2d3cdfMRw6mes=;
 b=eKQ/AUz/RQliMlDfZgkc79QK8ozXvJ1YPdGml4K5IYhRJCS/zEraeTdvWw+t9rmU5f
 JiVGFjbPpjzEbb8rNLe9+19dUF7GbeMdW4lNgCJwxjV4ka61L1/E0ApLVh3+E3kc73sp
 Ao5w1juHNQSW24WhkR/HaaaT/59sXbPj3rot2a4UCig5rtA9RSw8LnSJP9e4khMyolTc
 SUL66qBBH8h8/L5WbSLbQe3dE9Mfr6HdvphAkg7HlB9F7YfK8YkT+x8WjqyPxAi68Qh3
 Jt75+QgHZmk7ufx40rr59lbqlfEbaCTgeZK6xPAfLWt+Os4nD+VeMEmZCr9ZZsc8Znn9
 fZ4Q==
X-Gm-Message-State: AKaTC03TIb0sdB9WM5ufE7MrL00oNL54IFR0HPBDWB8mhdntqOyoqlIqilBndPxuBPWiwbeEEyXYgzx6TC3QKA==
X-Received: by 10.31.223.68 with SMTP id w65mr19994220vkg.124.1481151324013;
 Wed, 07 Dec 2016 14:55:24 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 7 Dec 2016 14:55:03 -0800 (PST)
In-Reply-To: <8d6aac0e-9d92-3ad9-67ea-f9cbf9032377@linux.vnet.ibm.com>
References: <8d6aac0e-9d92-3ad9-67ea-f9cbf9032377@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Dec 2016 09:25:03 +1030
X-Google-Sender-Auth: NMPcM4TS3uqVlmc13lgQqOJby7M
Message-ID: <CACPK8XcKAiTxALun5YiTW-wnQ9BzH0itoqKOqgzxux5ywKXTzw@mail.gmail.com>
Subject: Re: Supporting different temp sensors at same I2C location
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 07 Dec 2016 22:55:27 -0000

Hi Matt,

On Wed, Dec 7, 2016 at 8:21 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> On Witherspoon the hardware team is asking us(or maybe warning us?) if they
> can change the ambient temp/altitude sensor from the BMP280 to a DPS310,
> which would have the same I2C address.  Only the new one would ship.
>
> How are things like this usually handled in Linux?  Can both drivers be kept
> around and just activate based on their probing? Or do we just drop support
> for the old chip completely, though I haven't asked if this is OK yet.  Or
> should we push for having a different I2C address and then support both
> still?

We can keep both drivers around without issue. It takes a few KB of
extra flash space, but we are still a long way from overflowing the
space set aside for the kernel.

The harder bit is the device tree. We would need to update the device
tree depending on which piece of hardware is attached. I'm not sure
the best way to handle that.

Cheers,

Joel
