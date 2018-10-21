Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GnB6R8Qh"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dZ3Q0GR8zF0h9
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:25:21 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id j46-v6so44226910qtc.9
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 15:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C12ngnGgurY0unpaAYUbZaRt4IbUyldRM/sLKptRNqE=;
 b=GnB6R8QhabNI5+TrW4IEhJA4EVq8Qzbxa9hvQdrZkbNTLstf17or9vQ6wLx9uUiWsU
 spb7d8CCzIqR6o0fdxCX1t6/XPDIhb6Ms3kBSnGZHSyWm7uGm6ftgZAuDbvaFfoCNCV+
 nGeag1EYP0oj9NU8veRuSBnkdacWmUet+qiPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C12ngnGgurY0unpaAYUbZaRt4IbUyldRM/sLKptRNqE=;
 b=Npew7v9Yj8Iyyha0q52ax1ZR+hob9OssW6gwfWY9+GpHyTUxau6kJ/j5Omh1cvVcQl
 zwSHAXvdE2u5ZlsGG5mfe/2+DTmY+ri9o0cGqq1RU42cM87jKptNhX/Q5etEFTsU+LQ/
 kFqT6ZX8l7Qt+sw8Soa2l8SClbcMotQg05OXlSj5AMEL7v585Ca+FOUf5DRns0tAYwcn
 JcdDtRBl8BbHiig/aLTP2KZLpeHCvHjA2AjMpBfaJ5UdlHL7pOO7KRqe7W6MbSlBDlSz
 kk48qtbXuiBzUGSqtpgrBwv4mJjs1AVJ4uJdI+N8twVDKowt1rPYUm2t7Ho+bbz+/r/u
 9fSA==
X-Gm-Message-State: AGRZ1gIOcIFNGJ8FcbCj5nby9FLRqHi4z2F5FxkiLPcX83T2fppsbyO2
 gK/6+Othu8WojwLJmKVCoEyXM+a+gh7h3bUXcZk=
X-Google-Smtp-Source: AJdET5fkW1oPMyczhgPZ0RLMsT+dGuM0rNG+1VxRWsSSVf6IJME4nhkFTqm32enH0kB/Bk0noCJEBRp5EPgICsbO+vc=
X-Received: by 2002:ac8:3074:: with SMTP id
 g49-v6mr3218369qte.136.1540160719932; 
 Sun, 21 Oct 2018 15:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180927064651.3118-1-andrew@aj.id.au>
 <81979977-2E26-4276-9991-C7FD28125135@fuzziesquirrel.com>
In-Reply-To: <81979977-2E26-4276-9991-C7FD28125135@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Oct 2018 08:55:08 +1030
Message-ID: <CACPK8Xc-HzbPCXaPd14pLuAqCzj1LJ7FaiEKQV3Q=YMWv9-w-A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] arm: dts: aspeed: Use ColdFire FSI offload
 on Witherspoon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 21 Oct 2018 22:25:22 -0000

On Fri, 28 Sep 2018 at 01:58, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 27, 2018, at 2:46 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Thanks. Can you also submit this upstream?

If I merge this into the openbmc kernel tree and bump meta-aspeed,
does witherspoon have the appropriate bits in place to still work?

Cheers,

Joel
