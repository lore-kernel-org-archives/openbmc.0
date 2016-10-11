Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stHKy3rxPzDskb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 11:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FgnygNK6; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so239845vkl.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=p4kLzLa4jj5tCyj8BoVd55/mnUUEVczt8Sd4yfwbuoo=;
 b=FgnygNK63k5TpjgWO9L3HVi7OyrrNtVnJncSsl1QoxRLucgtgYcXr5nPlvnqdPofRv
 wCxiKxxe26PWR2eswd9cN2Qkk4g8lepkauGeqWFzh6YMWb4SnSKA5VMQRTI1IEyIAA9T
 2g+yZGwM9VxMdY7kz7yxN1Hfr3tDghJI6EjTxz4lklXOiaI4gcb3qzbznTfGTE71+/KU
 XUO/hrgypasq51c/78feIYHLfFfthkt5eCh/CinNXV0cVCe3jyQ/tJDCjP2a7wzsp6Hb
 1+mxfUtQhLdW2vzDPI6MNvO0ptcWp/N3XfycoUY2rqTEHDKRBPCitbpT26i7hG3rGx6u
 FqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=p4kLzLa4jj5tCyj8BoVd55/mnUUEVczt8Sd4yfwbuoo=;
 b=aOm2m9L5PbapSdjcN1Qx4nLMbTqGUXemBJdICRNGSvURIC5hhnI33K8+5WfTyF5oEZ
 3fNj+AR0ojENxrkpjfAHDPP+bkJ83k3lki233zUjzcxPStbjUutW2GdqzQIWCPrV77Ov
 ZOuuBCODkwfFoHJa30X5Jh/sshdhc1z2xpzOfTRWpz7NaSh4wRELjqI9+LNmlgiCMF+v
 AYVw2SnPpkahSkWVMQu1Io825QJy9G4er/Uxw3gjhCV4MUy2nEePHztxMH1yyVthuaBB
 qfzYsxmY39Y5QGHGcNlB6tU3/9AjEe+Czcf2D93TXESVHnW2kgC3FsT9bEI25nxQF/3b
 ut8A==
X-Gm-Message-State: AA6/9RmUSpsIOJuB1tQ3DRRktadsO64FjCxaZ5CWAoUIiU4LENfTVgWmSaXxtMd6LbcpeCTfL11Y5PXAOdMLAg==
X-Received: by 10.31.140.147 with SMTP id o141mr751258vkd.149.1476144276461;
 Mon, 10 Oct 2016 17:04:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 17:04:16 -0700 (PDT)
In-Reply-To: <0cf6507c-66f4-1717-eb16-925bb44f7f98@ozlabs.org>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
 <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
 <CAA0LjjUpFw5bv=WYp+zuPQU7rUtjxkr0YJZC-g3s_9pDDMsX_Q@mail.gmail.com>
 <0cf6507c-66f4-1717-eb16-925bb44f7f98@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Oct 2016 11:04:16 +1100
X-Google-Sender-Auth: glvsI8JnblYKTwL_k06wEPAewb0
Message-ID: <CACPK8XcpFZFDAMToZw4+ZPMi_02iZPvh-hL9CuYT=e26uu1nqQ@mail.gmail.com>
Subject: Re: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>,
 zahrens@us.ibm.com, xxpetri@de.ibm.com
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
X-List-Received-Date: Tue, 11 Oct 2016 00:04:39 -0000

Chris,

On Tue, Oct 11, 2016 at 2:48 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> It seems like the priority at the moment should be getting a single
> master going, with interrupts, then we can look at cascading.

This is an important point that I think is worth restating. Back when
we met in July, we agreed the goal should be implement only what was
required to perform a putscom on the host.

I believe this helps us work out what is essential for v1, and what
can be deferred to the second set of patches.

Cheers,

Joel
