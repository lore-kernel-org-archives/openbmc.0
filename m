Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IBTYlTuw"; 
 dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zV7w1zKxzDqBY
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:31:55 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id c13so22216014qtn.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v847hmyE9RsrbPu/LLBhzrBwhOGu0OE0s1wZVxpCDT0=;
 b=IBTYlTuwiGRO4ZrzlOgPKC0xC1iaNRDS6yN+o5tPrK7zfIeSza5M9Ci5/lh4vuvdSt
 l79fknq+4vyJ8sSfzvIOC+Ew6FDhjxWVWiXJuBlc3gYlhYfaQ1QveQjYKbbxPHZ0hJJm
 f59TSW6uLC2JDGu58ie4/JF0f8qKRofPqL0sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v847hmyE9RsrbPu/LLBhzrBwhOGu0OE0s1wZVxpCDT0=;
 b=phOaa5ZvQF7Ucf58RKVyzTkep32DCKqL+qLoxl34bkxsSjZNAgb/ayfcEFLMI5RKtZ
 N7DqTKatM+37N/qDh/Vpy3Ps6vg2zIMY4JUhqRj13let1yiK9tikIsXuKDfnL2BUYPTx
 2/4/mtYbe04SNJVQor5Zj3PipkBfM+C45HV8hepZWdxNBs5BDIBKaGr7SApZcq5bprNA
 IqHmq70YtsBXIr1UFjyrv+O3Cw5CYw4AOYOBoAYCYqs42jN8N0hvHxjlDexfvYJuKr+k
 C7+uG0HWanieDBYmX8TJ6nyNIN1ExoOo4wokDBo6LrathuogxQT4aSjJzfpH93AvDzif
 2pkQ==
X-Gm-Message-State: APjAAAX7oC9CJZSR9W72Y+nJtXQ1yeatrbGz+JH1FCULxNkAmjiksQ28
 jXtP3x8EloEnuG8zDOPBhBmDsMcJZvBQdG6+ZFg=
X-Google-Smtp-Source: APXvYqwf9yp8VPwTH0CGlE4tynvcJrHpVWpr/8NtehFoAzBpBFWptWu1kWjyTwwz64sznx/goAoT20GGjLgMqkGTEV4=
X-Received: by 2002:a0c:9e27:: with SMTP id p39mr1015868qve.85.1557304312464; 
 Wed, 08 May 2019 01:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK0-4r3ZD4YtOJKZW10FqySmCQ_Kzea=f7kmuyf5rCykitw@mail.gmail.com>
In-Reply-To: <CAHkHK0-4r3ZD4YtOJKZW10FqySmCQ_Kzea=f7kmuyf5rCykitw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 May 2019 08:31:41 +0000
Message-ID: <CACPK8Xcrm0Jfz4oz+KuZnXoLmnsDjT0EKr-2X5Exg=wRS212sw@mail.gmail.com>
Subject: Re: How to configure dram memory size
To: John Wang <wangzqbj@inspur.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 08 May 2019 08:31:56 -0000

On Wed, 8 May 2019 at 02:45, John Wang <wangzqbj@inspur.com> wrote:
> My machine memory is 256M, but why is uboot recognized as 512M, where should I set it?

Are you using the OpenBMC uboot tree on an ASPEED BMC?

If so, the code in platform.S should detect the amount of available RAM.

Can you provide the output of u-boot booting?

Cheers,

Joel
