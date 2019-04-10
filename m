Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Kq0g2gdL"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44f7970wB6zDqHG
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 12:17:46 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id k14so1169058qtb.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 19:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWz/cmoN/LqeWgniTppKDgWtaiomZIQWBOseoR7PThw=;
 b=Kq0g2gdL/YYRhUhnJ3j1smuAr4KA1D3UU2ZCTCmiviPuJaVmRsOI0HpojPFnOrxhTw
 bpiPr4z/4G875O+dC0oXnO5g9BPzp7YzO30eqpCgqI9p5jlDGN7tYB9ZI0cp7kDD9W4L
 GQQnwW27i1LPd4o11eM6vZ5SWbkL6iY41vn8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWz/cmoN/LqeWgniTppKDgWtaiomZIQWBOseoR7PThw=;
 b=dFXollEnzqfDaNHJikbdcqNPD0ssHBvN2YdnGIZ3hygl7BLNRPZKaPlxwXNJ310U4y
 C3KYY25lDlYNB6tiG8MmUI45GIcDIqD8WfF1q3IdevNdDUHUgBzmYVkAusrq3uPwNq9N
 c1rdmwKdKSTBpaFVn7nyGjk4UGcu17EHE4H4VUzmvg345/2lSV9ZxB2632x9ElaTSI0f
 gstR/Ip2AEgBgEx4HVz46adhcS92l7cS8nHsR08qeqPWSI+BjqzB/8CQLdJwose/VQzn
 hwokEddQ5PAv8mOTG60uDSU17rE1Fyd6nhRYrcX3geSEniJUlPD3AWtG/Dyc0P+PEz4y
 H4SA==
X-Gm-Message-State: APjAAAUnoUXnw03xmJI7Op+ilSq4RLirlU0e9B68RdX3cMw8vjUmMJWI
 LUghJBd8PnTJwJWsCAj1XunkqMlrPmrIga8EN9s=
X-Google-Smtp-Source: APXvYqwke+cVhA0Ilx+IJH71enZ3aFOZq+/WgBLWKKzKQsQXrfllve2n8pbnbU2PDxawpqC916B8Ki12qrMvXD+Qgoo=
X-Received: by 2002:ac8:2f85:: with SMTP id l5mr34165295qta.269.1554862662675; 
 Tue, 09 Apr 2019 19:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
In-Reply-To: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Apr 2019 02:17:31 +0000
Message-ID: <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: Patrick Venture <venture@google.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 10 Apr 2019 02:17:48 -0000

On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com> wrote:
>
> HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.6
> with the quanta-q71l board.  More specifically now my host can't talk
> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, I
> can talk to ipmid file via dbus, and btbridge is running.
>
> Has anyone else run into weirdness?

I've not seen that.

My only guess is there is an issue with clocking. Can you try booting
the machine with clk_ignore_unused in your kernel command line?

>
> I am seeing:
>
> [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
> [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
>
> The dts file I'm using is basically identical to the upstream one, and
> my defconfig is also nearly identical to what's in meta-aspeed for the
> ast2400.
>
> Patrick
