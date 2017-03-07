Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x231.google.com (mail-yw0-x231.google.com
 [IPv6:2607:f8b0:4002:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcf5n2k5FzDqYQ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 12:22:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F6jBRMjn"; 
 dkim-atps=neutral
Received: by mail-yw0-x231.google.com with SMTP id v198so49196402ywc.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 17:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FIYDWXmwC/V39zx132HtlXPJ2uhZTFR8zRWwag7MHIw=;
 b=F6jBRMjnw9zzcgUgloZD8F1Ysmc81+63FrSDu2TX+YEROH1gct1MRm6d+OQH9uFYqP
 3T21YolTXFiWJLXIXmSEuXYoEfI/UEjCbW+4nCk+MKXCV5f/g5MImyUzC4sDINAZn7dM
 ugIPBBLttiL8M5kYOpSXiPuQp3py/4nMIrFWp5sB9H3KYuR6EmeCCu7rOCLJ4/sxxxUH
 yVEQOOJlV8hZosnh0rzEJsTFlEtZps6wshvKJTkyBCKOA2V9tF8rRfcFTr4PS/ysmFOg
 BSoo0KNksJ3+GzWY2R8J/j19oud4WyhWWpJTcvRz34ux9UuFg+XhHdfQ80xbfUO48nHD
 PfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FIYDWXmwC/V39zx132HtlXPJ2uhZTFR8zRWwag7MHIw=;
 b=ARz9abx11SdL6ZNm1EJrWDWpT/HHPQA0tfYNaxX1hVACUcQRghIWRbc5ccUIDKvs3d
 4J89KvXc96ecJljBflufPpXM1cSU/90Uyrv0IbQuMZBZRdUmywWKzfLUrlpnjZXH0kxs
 SY2QpYQJuJ9EP+hqejbxYIdifk+V9Yro6ntZjd3r+CsErgVCYmYPZfPca5oheHqAGTAl
 EVL5qMeHQRUkfpVCQhGc3UzqMoJpgE81TGY3eXr8LSaXj20lPFNmkGh2sevnERv/mDFv
 SDrOlluiRwICGlrCINg8+H+fX0xiUWWP6ea55rssgNIsxSK6yYIRKQaT4cQWKWW9tGUU
 kXgw==
X-Gm-Message-State: AMke39nb3a6AKlLuK8+YHRvn1X+jIrXFMBjlp/6p+4Wt7niTbrpETi4Y1u0mwhXZGnD0jCczDZo5GHuFQ/YFkQ==
X-Received: by 10.129.71.198 with SMTP id u189mr14430074ywa.174.1488849738592; 
 Mon, 06 Mar 2017 17:22:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 6 Mar 2017 17:21:58 -0800 (PST)
In-Reply-To: <CAPozSNrAzFnZpP9PgTXUtPvDtF6Ag6dijOqYhMn4f8OQs2OqFg@mail.gmail.com>
References: <CAPozSNrAzFnZpP9PgTXUtPvDtF6Ag6dijOqYhMn4f8OQs2OqFg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Mar 2017 11:51:58 +1030
X-Google-Sender-Auth: 05ozDzwSLEo8_50kwcWKg0gt3fw
Message-ID: <CACPK8XebaQ6qTQG5mm3nW2bLdwgZjDpg_Kfkt_786k6==m7L9Q@mail.gmail.com>
Subject: Re: Zaius can use a backport of pmbus device support
To: Peter Hanson <peterh@google.com>
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
X-List-Received-Date: Tue, 07 Mar 2017 01:22:22 -0000

Hello Peter,

Welcome to the project!

On Tue, Mar 7, 2017 at 10:55 AM, Peter Hanson <peterh@google.com> wrote:
> Device support added to 4.9 can be used to support the Zaius power brick.
>
> The relevant commit is cc00decf0e280953e9067e938ad331f93bda8b40
> also available as https://patchwork.kernel.org/patch/9245427/
>
> Tested the patch - it works. Suggesting to backport that commit.
>
> Of course, pulling ahead to 4.10 would work too...

I've started testing a 4.10 tree. We're looking good on the ast2400,
and I will do some ast2500 testing over the coming days.

I'd put a tentative ETA on switching of next week. I'll let you decide
if you want to do the backport now, or if you can wait until we rebase
on 4.10.

Cheers,

Joel
