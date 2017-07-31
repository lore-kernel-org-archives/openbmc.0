Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLnnD4MxNzDrKW
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 04:20:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bf5+q/fg"; 
 dkim-atps=neutral
Received: by mail-qt0-x231.google.com with SMTP id 16so73281491qtz.4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nUWxnVGUqhMtDaPFNGT/MopBQskVjB3gAIGISPGc9X4=;
 b=bf5+q/fgPIMP7wjWgg8mdXDEy03ijh2VfACNNQWLGIEr9g6ni26Oup04rAR2qV5YkF
 P3Ddbx9CprBNjKvlkvMsXJIf9Otbka2nD6dl10ojNl4Q3Quik1tHVll91gYEwrU8pTIF
 M5pajjJH+PhVQHr6urquPgs+EB80CZpHRR5cwQFnPSyi0E4FdhN3Rk64Gu1g5PrASUEw
 bFUAp7rlhHOwnTTkcA7U+yzwoH1z68ceGtuD7sRIKcMbPMQzsm0DW44U0kgUFQfjWxM8
 CfUKJ8WMgnAHChfVD2OzU5JbBxbj0so0pjQaRx2psXuxgBMSPwzQY3QHs/MSljyLLWBZ
 Spjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nUWxnVGUqhMtDaPFNGT/MopBQskVjB3gAIGISPGc9X4=;
 b=rcQZQqH9GC9PGktucwbWPQ8ATgGcLftAPgJp0YvjofWmjpmv4DHG/YKftlpMbFiTFg
 BDxOFZB2mP+fCCFwfMqu6jE9WYuDDgnhughwicVyYpapEU/MBi6rf+BQ6/mRlVzuWmfq
 cMDQd6LPRYw71yKfo0XVXig+yl7mRaKvZvhZTNzztED7oEwxGi2cezbnlSThQp3Kyty9
 7lDQ65Cgqr0u1sskCXmrUDkg6dJ8liqrl2g47h6IrdJZMG27ZfQDqOnWMrV3DpX8O8L9
 8YedozzZKw0si70CaUfLvuk+rfzU1DMo52+/n0hqKCSxCf0XiE/bJf29Xxw8LBxL6NVs
 fwDQ==
X-Gm-Message-State: AIVw111SCAcHu7IMG42WVNxELNmy/EPNGn+Ny//kUAGanxod4rhXyRkT
 nmPU0PJ6CkHNgRFgQBHhipHXwnnqN0eO
X-Received: by 10.200.8.113 with SMTP id x46mr22046209qth.195.1501525229893;
 Mon, 31 Jul 2017 11:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.61.130 with HTTP; Mon, 31 Jul 2017 11:20:29 -0700 (PDT)
In-Reply-To: <CACPK8XdT5yxKFj75JCuXZ+3GT1Q6x0EYADmFdu6we6SHwTMnLw@mail.gmail.com>
References: <20170729010012.5032-1-brendanhiggins@google.com>
 <CACPK8XdT5yxKFj75JCuXZ+3GT1Q6x0EYADmFdu6we6SHwTMnLw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 31 Jul 2017 11:20:29 -0700
Message-ID: <CAFd5g44UjOfGwpCdCTQ7-0rPTXoWLvDcYAbekQ-JMtNsYHZneQ@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: aspeed: fixed potential null pointer dereference
To: Joel Stanley <joel@jms.id.au>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Patrick Venture <venture@google.com>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 31 Jul 2017 18:20:33 -0000

On Mon, Jul 31, 2017 at 2:27 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Jul 29, 2017 at 10:30 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Before I skipped null checks when the master is in the STOP state; this
>> fixes that.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> Out of interest, was this found by code review, or did you hit this in testing?

I am pretty sure we hit it in testing. Unfortunately, we had trouble reproducing
it, but we did see a null pointer dereference.

>
> Cheers,
>
> Joel
