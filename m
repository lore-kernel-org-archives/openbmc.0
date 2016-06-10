Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQwr250CGzDqHY
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 18:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=n5SlNh9C; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id u63so33966502qkh.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Krfvr/T+f/US/ncI3eyuQoXN59i5GEWgYq2k4of9UHY=;
 b=n5SlNh9C+BBq0HIBXhwUR+8ZC7GPlHAZmR8Tb6iti+c147YsfY58HUh0oEZMQd78jZ
 8AkIPtsw9mIuNSfiv2ZUNNFa0vbAl1j78kos3bmF3oufl2vNx8K1VK8aYXAWmMAdv8Hk
 TzG9nukXGCpxmSC79QJ3UTAiGH4RQFEJvU9mU9f/J80hQqw+cTyb/OMWfkMYFR8kXZlF
 q0SfGWS/Hgm8/qEWUDMAeFFEtQtW+75YQfl4penhMenVgWEDwX6GOeVj/xByZiwE+vQ8
 SKNMjxVFgzvnjxPVQOs7aDzVHaGF13H9RBaYXWJVUkOpjsdNKC0zhsSFvogGYfgqdGBy
 sVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Krfvr/T+f/US/ncI3eyuQoXN59i5GEWgYq2k4of9UHY=;
 b=YuGSP0yqlS6kLNeDoov2UyFQjIBoX6BaVztGWxxXpDoa5MSgzjIxodnKpvW9TgWTz3
 LruZ6IyNYs/yyqhcZwRBLuxbLOrvDXPUkqrSHA4MAi04R4Sq3m5oZSlDtSSWeSuCVYQW
 jNx7eMKMBS7C7aj3fFKDtedslLgHQO1/x+N8UmCXIyUaNBm2rbHb8xYmpws5jfCOnZpQ
 2Ff3BWvmgThLroj56UucC9rjRd3ciuJCajvsPM5+gMzHw3eMtIVzvxBfhF2JUpfcAdwh
 JousnYsooMpsvy8kExG13JkrQ6w64y8zGkdNhYGpOhCn2q6rpZvmYWhOgPkbNilMY2dQ
 DgAQ==
X-Gm-Message-State: ALyK8tLD+wsD4FjeDvaq1heohWV3xrqUBKsY6jRfroL/q9PDH5wktZkoTIVbLQVRnvWQnSQ0Wnk4iM0jQL5vqA==
X-Received: by 10.55.107.6 with SMTP id g6mr281975qkc.166.1465548656443; Fri,
 10 Jun 2016 01:50:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 10 Jun 2016 01:50:37 -0700 (PDT)
In-Reply-To: <5759B6EE.3010700@google.com>
References: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <5759B6EE.3010700@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2016 03:50:37 -0500
X-Google-Sender-Auth: k51iGpl-Ozv_44hky_kKojE3l3c
Message-ID: <CACPK8Xd7xQ=tofdBw9P0JuzQacLmfsXFpeQ_pBHXd2Z2JhY26Q@mail.gmail.com>
Subject: Re: AST2500 support questions
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Fri, 10 Jun 2016 08:50:59 -0000

On Thu, Jun 9, 2016 at 1:35 PM, Xo Wang <xow@google.com> wrote:
>> We tried to boot it with uImage and separate DTB image using the
>> command 'bootm <KERNEL_ADDR> - <DTB_ADDR>'
>
> If I understand correctly, the configuration you tried is to load the DTB at
> 0x82000000 and pass that address to a CONFIG_OF_LIBFDT kernel in register
> r2. This should work and is probably considered the preferred/idiomatic ARM
> way, but not how the phosphor build is doing it.

Yep. We would prefer to do it this way, but I believe the bootm
command in the u-boot tree we're running lacks support. On the
ast2500, where we're using u-boot 2016.05, we can stop appending the
device tree to the kernel and do things this way.

I think we will hold off until we move to a common, modern u-boot for
all platforms.

Cheers,

Joel
