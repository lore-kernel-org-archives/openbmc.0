Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DccsrIeb"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42msSL1chmzF377
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 06:23:45 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id s5-v6so1420327plq.11
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMd8PQVYSfa+O6dduVXeQxgBG9G8x+vQDKcZvh2Lil0=;
 b=DccsrIeb12IiSE7s9TIubbnJGJ3uRU87gVt62uOhOcHjUbEL3NfS+PeEM0tRjOUnu1
 PBZ5lz0GZgeODYMlusUixczpB+rIhmq2PREcYbjugGZzb54zarEzfxwLK82Cdl6s4Ymq
 bsNTfMjq6v25sQk/96Bd16I4XT5Gz0j7N+awbNOI3SBb/N8OKvjc3hqPcKe5hDaZjVhx
 R2oRt2rcR/HczqqNHwffQOEMu9OkFyT5LZg+azjbWZPkhK1h/cA46s+b/zgOAlhtg8xo
 NTeoW9pzznw4iDH+Ex2FaRYQgwWxwrSq7KXdMnMuY4XoUTJDHtBHlqmKH1sl+gopHvYR
 WPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMd8PQVYSfa+O6dduVXeQxgBG9G8x+vQDKcZvh2Lil0=;
 b=Sze+hKdhJ44A31Q3Hwan8pQvFEgOVlIkCnhvYUbS3zcsY4rSQx4irNGYCwUYGbA4Xy
 3jHrITn844S+uB5BozMYfabyObDWolpugXMlkKR//BABDfiBaNQkbqK4Y6rLwhlsuLzK
 82fLCaxNVBPuKbxEbubKhB25p53535rq9+3XriHYLjC+p7ChYvLHqpaVf5ZvgscMgcDf
 nlIEoymtk2aiVqknnNxGAQlcaASWcFoFNah+wxMYsEx6cnjkqXJb8IhU1faRyjJgWt4A
 MJBsHiwT5K7G8T8iY12UP1tx7ydE2XP4iCM8DSy+eQZ+mNrf7HrMnHpNnLeXXF7bnT67
 gt1w==
X-Gm-Message-State: AGRZ1gIPOqtdXH+u+CLJS1gjOR1lzR2S0a9VSEAmAJFMvYMokhxc9Pyt
 4nhKVxJUGmy+sOPnO64eLcK2DmEYMxohCgTy4YMXrg==
X-Google-Smtp-Source: AJdET5dsVt2vTmtFNYyc3k/dc6PeZ+8sohDVC+bNwfPQU5SA8OgFbElmbgopiBkgKqZG07NK1D5bSG0lvX2EprzWRBE=
X-Received: by 2002:a17:902:4583:: with SMTP id
 n3-v6mr12833001pld.53.1541186623553; 
 Fri, 02 Nov 2018 12:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwzpwtUf63=0yna6eHJgwQWQW8k=FQLtZ5pWKwUoUcrsQ@mail.gmail.com>
 <8df19723dd96b88325b20db50092ff9f@linux.vnet.ibm.com>
In-Reply-To: <8df19723dd96b88325b20db50092ff9f@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 2 Nov 2018 12:23:32 -0700
Message-ID: <CAO=notwd8mvLbu0n+nE2zAAgogJFfu5rib00FSXptGU4d2NLng@mail.gmail.com>
Subject: Re: Firmware Update over Blobs
To: anoo@linux.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org
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
X-List-Received-Date: Fri, 02 Nov 2018 19:23:47 -0000

On Fri, Nov 2, 2018 at 12:06 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2018-11-02 14:02, Patrick Venture wrote:
> > Hi, I'm looking to see if anyone out there wants to review it as it's
> > built, per design here: https://gerrit.openbmc-project.xyz/14444.
> > It'll be a fair amount to review in very small patches over a few
> > weeks to start with.
>
> Hi Patrick, you can add me to the reviews.

Done

>
> >
> > Patrick
>
