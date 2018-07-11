Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Abzd3IQo"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NcTU59NY"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSLk3fhjzF35p
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:29:49 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id z74-v6so12838696qkb.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Py/TDZQNMxOjxict3iaNxtiG4cLb8T7a6CKLrqZgiFU=;
 b=Abzd3IQoPG0ONGMRR6Jto0wf8A4OcPyblxIkowTxqh12h3UdjLic3kZZSRSq9fkhvI
 OWGPUE00t8BBRJVtILBMzz28jYX5VJFs9Z0vIc4NK+OwiYMlkRQV6VSeTix64JzsX7ew
 ONYcNuinz46TRb4Y4bd1tMaoWLooZDwRYmg/t4SjB21UnDJwMEaStDi1ef26leIalWfn
 KnKkVZqjwtb03Wla4j5E6a+4HPBPBHcB8WM2VUdoLmfu8qlpuEvo0dS1AWjv0U2Q2dw7
 HjAmzw3RLY0X+rvTJK+8MPF73j/y1R/sg0zTXeZoFno34NwhONIUNZQ7DNobMOmBEgGS
 +9tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Py/TDZQNMxOjxict3iaNxtiG4cLb8T7a6CKLrqZgiFU=;
 b=NcTU59NYlg42v869WRujiNPhicQ60BTZlZYlxdt+KAIlYfHlyiINpGimjHsq+d210w
 heaj3Ol+5+19SXmSTqQeWi3j8MKVS2SZ/AglpbS6xMEqrTquXZC7ZxoEh2ZYMUaq97iw
 qQIJAgFf0kovB2ol6CK57b8+j1bnd5bB3RQcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Py/TDZQNMxOjxict3iaNxtiG4cLb8T7a6CKLrqZgiFU=;
 b=ddy2Kit43YjrC3SZqdnVQwcKvjVjCfh8NBDcjXHdvRAObqpEd0FLGqSokMmkA4v4gt
 hcJhiYPHXqCQ48rio5wtmXfmDwJxEsxE3Y6nViXZQPwR3JU4nHb8eOUjqNZc764kAnCL
 9EVcWWtlL4V2HEwFf716QPU0Lngrx39hOqCfK6UqM2gSRIiqBU2aqKbco+djEHd5My4y
 9tD0602gYJmHLWp149jvJjrDOa2D4COjHIxkjEV8Ge+Y3v0V4dnnRjpnNG2jH1TQgmKt
 DDDMILmSbLqXe+UOgDfbtsjIS/HBBJGJ995ekVBBFgWFMHdieUbEotMj3fdvvnCff4h/
 zz3g==
X-Gm-Message-State: AOUpUlGzmqjT9tH4a6shkgH20oSLn/TL2szpq4paw+l4WbMS2qi7BFQG
 DHyBoNQ1I1P1ycqZqpiBIkdlpO1qzRW9gaGpqlWiXvUxdyo=
X-Google-Smtp-Source: AAOMgpeoKGQjt+E84T8HpXRC1AzVNw72xc2pUsm/A6efuL9Wud7PCh2s1DL+O/NrTnoFhtJCi/ieEAkFgIxihaYJvz0=
X-Received: by 2002:a37:3a8a:: with SMTP id
 h132-v6mr9996514qka.352.1531286987406; 
 Tue, 10 Jul 2018 22:29:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 22:29:26
 -0700 (PDT)
In-Reply-To: <1531286230-28453-4-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-4-git-send-email-ryanchen.aspeed@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Jul 2018 15:29:26 +1000
X-Google-Sender-Auth: Fv2EZPt7mJIO29KZjzzxyMQ5yFg
Message-ID: <CACPK8XdP8-5vUAfahqprB1NzQrunv68G0QwC+Ht-EreMvDs=sg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 3/7] irqchip: Aspeed: Add Aspeed sdhci irq
 driver
To: Ryan Chen <ryanchen.aspeed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:29:52 -0000

On 11 July 2018 at 15:17, Ryan Chen <ryanchen.aspeed@gmail.com> wrote:
> In Aspeed SoC's sdhci have two slots and have a interrupt status and
> general information in top for register. so it need a sdhci irq driver
> probe defore sdhci driver probe

I suggest we keep the irq handing within in the sdhci driver instead
of creating a separate sdhci irqchip driver.
