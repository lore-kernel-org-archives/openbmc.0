Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQRnt29MWzDrns
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 15:02:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GsY2Wkpi; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 35so6973200uaj.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Sep 2016 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7QPYhoQQQwUQkf6oQF93QQlwTyQmCEnyc6mnCXLqiOQ=;
 b=GsY2WkpiyvbPtp4oLLYCCGsCrtIFy17EC/Ca0dwPAWUVIy/pmCadreSKf+rb4qChCT
 uItteYW7kRjX6aeWvCpjOs2mat0ScAOcm2rGcOHdlssTfze3MjNOF99RWsZzGmMwlbP8
 VI1hfVvjcbl72Pr9WARUwVPp/f7jMc5aZ6taaj0vHjFtQnKRxTZ4UuBqAlzu6OFj1G+9
 25vZVjOsFIZGeFMsg6GQyueBM9kJ8g6qtbKYsjpx8/sTz4fx+Jv+0zuPPoGWoIzLv8Y0
 q1vYfEuMP2pxJh3qbB2JOjIjYG9qCH7F90j0gYpr6h+tDrlaP/rrnGfhMv9s5RcUHZzM
 BfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7QPYhoQQQwUQkf6oQF93QQlwTyQmCEnyc6mnCXLqiOQ=;
 b=lTr/En9emkZq5DpBB5wkxt7R4NyRwlE8ShQO4YrXlPDhqQ1PNTwjdgeMskHwrquSLO
 WLrBNuAANE3z2ZZkVQuDSiX2luyoruzKMCUGe6wIMD73MNLxzv2uj5OxldBdQdjrFjVl
 lEFBr5b3Au30e/+WmR0yT+ejYmWv5MsH4icUHQ2jerZGaJtAqnVV7bXoWoyrJgfdWAcy
 LcL9+fCfDVtwQtnG4tWwJ0ek9kgnpupaXKC8JlzOuaDaMW1+rI2WAZyXfF7qWAjt5jH1
 L4ArCS1c15/qXd4nf1UibOUtyXDJPx4cIUr7pb0urlIDU6N1V6a3zxD2pLu6MPjJMepj
 r7pw==
X-Gm-Message-State: AE9vXwOHwU7sRMET+1IqVJSYJbRIkkSXskI7ZGymX8WvKdnEpJGOOtuyNmHw3S0E5rgXdbHN7L3c4NOMZvFuYw==
X-Received: by 10.159.37.238 with SMTP id 101mr11832521uaf.57.1472792559638;
 Thu, 01 Sep 2016 22:02:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Thu, 1 Sep 2016 22:02:19 -0700 (PDT)
In-Reply-To: <CAFR_W8rNH056xbhh44Dh2wjnFoj7UeNPzaDS_=DC90Nw7jNsCw@mail.gmail.com>
References: <CAFR_W8rNH056xbhh44Dh2wjnFoj7UeNPzaDS_=DC90Nw7jNsCw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Sep 2016 14:32:19 +0930
X-Google-Sender-Auth: qDuQcxwNmfavCO8YZzCdfP_NWiw
Message-ID: <CACPK8XdgXoX2f_+Bc5Qcj89Hirrrfn+_U+m6YCP6k3TLvJz3HA@mail.gmail.com>
Subject: Re: [PATCH u-boot] Some cleanup of ast-g5 platform.S
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2016 05:02:43 -0000

Hello Maxim,

On Fri, Sep 2, 2016 at 6:34 AM, Maxim Sloyko <maxims@google.com> wrote:
> Added ast_uart.{c,h} files, moved most of the diagnostic message printing to
> ast-g5.c
>
> Set up a stack in SRAM at the beginning of lowlevel_init, which makes it
> possible to call non-trivial c functions, as well as put diagnostic strings
> themselves onto the stack.
>
> Several one-char writes to debug uart still remain in platform.S, I figured
> it's not worth it to make a separate call to c function for each of those.

Thanks for the patches!

Can you please send them to the list as inline patches. The easiest
way to do this is to use 'git send-email'.

This will allow us to review them.

Thanks,

Joel

>
> --
> Maxim Sloyko
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
