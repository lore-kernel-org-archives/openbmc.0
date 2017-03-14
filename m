Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22f.google.com (mail-yw0-x22f.google.com
 [IPv6:2607:f8b0:4002:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vhywz2flxzDqMd
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 13:14:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r94YfG1E"; 
 dkim-atps=neutral
Received: by mail-yw0-x22f.google.com with SMTP id v76so70936346ywg.0
 for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2017 19:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VjWrtdx9KZ50FQtFHvtLMrUop4H2FYxZcqZBs5JCk3I=;
 b=r94YfG1Ej5o07yD+23i6lvV7KeeOfvvCWkeHI5ZYV+UiT0fCuIrC03ZgmZEbt4/q73
 lfPieLXOs5gjsCqcY8g2L3yUhbO6qOfC+388kn5Qh9weHe1Pw+dk+KhcqQdYia+zfG15
 jlhnJDi+Lxq4ovfKSsV1jdBzEBzadGXxwCUyuqM1elJZ+9sorqrYRFDCE+44vg5QPLrQ
 FBd0UdFXoV0ZQTtNiGXRVVZnZophFLYFSAbVboYBuA6oM7j7NJsdz4RFDvNl2SpthglC
 uF1oDjKX/KEd2AT/JPBMFw+iYNWExxI5HFyh04xfI0WmENtTbGi+dL16z3UhCjLMNFrs
 cNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VjWrtdx9KZ50FQtFHvtLMrUop4H2FYxZcqZBs5JCk3I=;
 b=BZOpg8X7xdnDl7aLz4bgbp3JaDFBhTiZ29xYvY9C4EVJbE3549hD3gZjyslEQjIb5b
 UuQ4up/pMt0DakP3cA9CFkVwVkf9NBexYrm+9eUNQCRsDlx/wlyhe6uiWlEYcHUrvLiC
 +SF7oMtPHebj6mAFn1bf3lR4TbkrfnA6z4BgKC1bSq9U+JafAzTFk7PoMynmFzw8/4VN
 zZGOXOdOQzv45kXwcYxqKXWrvxmGKIafodVyadZ0f5E4bYaynzdkVx+vYfQqJHm8mhcd
 o4T3y+lQcMiVpNYYsI3MjP7pzW4xMpoFgm6R3xn94TfE1MqvZ+nq9QXbA0IH/UXFl6EW
 HRNA==
X-Gm-Message-State: AFeK/H111D/H/V5kgccGlj90sfl3ZeJpGlH8uNNCdBQMszpMZS4gqVNZRsG3d90/yLIrue/Bu/1Kz4wKCJLG+A==
X-Received: by 10.37.165.67 with SMTP id h61mr17057575ybi.153.1489457680720;
 Mon, 13 Mar 2017 19:14:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 13 Mar 2017 19:14:20 -0700 (PDT)
In-Reply-To: <CALLMt=rCfv4pLqKr+bgh-6HF3OTSP8qyM9XKVOsEG0yCmBhffA@mail.gmail.com>
References: <CALLMt=rCfv4pLqKr+bgh-6HF3OTSP8qyM9XKVOsEG0yCmBhffA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Mar 2017 12:44:20 +1030
X-Google-Sender-Auth: _U7p4NYq2t811ypLkvH_gSmQfjo
Message-ID: <CACPK8XdXPHTW7THH94Z2K+Eavf=TyxATrjP1SauKt38L=KVKaA@mail.gmail.com>
Subject: Re: determining host state after a bmc reset
To: Andrew Geissler <geissonator@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 14 Mar 2017 02:14:44 -0000

On Tue, Mar 14, 2017 at 7:43 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> Any thoughts out there on a good way to determine if the host is up
> and in a good state after a BMC reset?  This of course is without
> persisting anything into the filesystem about the host state, I'd like
> to just discover it.
>
> I'm currently going down a path where I'm going to first look at
> pgood, and if it's on, I'll use the SMS attention path to 'ping' the
> host and verify it's running.

I was going to suggest using IPMI. This is what I'd recommend.

Cheers,

Joel

>
> I'll need to fix up the SMS attention path (currently openbmc hard
> codes the SMS attention and response to the host to tell it to do a
> soft power off).  I'll change things around a bit to do the SMS, and
> then when the host responds, to do nothing except mark a ticky that
> says it responded.
>
> Andrew
