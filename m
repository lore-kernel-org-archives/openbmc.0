Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22f; helo=mail-lf0-x22f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPwtt0k5"; 
 dkim-atps=neutral
Received: from mail-lf0-x22f.google.com (mail-lf0-x22f.google.com
 [IPv6:2a00:1450:4010:c07::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyRYR2R0czDqZv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 16:30:02 +1000 (AEST)
Received: by mail-lf0-x22f.google.com with SMTP id q132so4765734lfe.5
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 23:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cYgpHQcJ/NITp09x/pMIMCgQDOEc5+w8S6l9DFntVkM=;
 b=DPwtt0k59bxZZ4RslwEuhgBUNJ9t0JXYFb3BrwDFMuS+hV5rzFCVXbIl3sVEjVXWnT
 KFPa5wecjBlGJXrshgXiB8knvWsB99s8czMOkOBW57X/bwhsFbEj0p3Pys5mgUaxkG7m
 +z+AYuiFasajodhmRX8BNpdemvBy00qDbQEVeAhX2xpNro9QgO5AfJr+vx0lEs57XrKq
 O04MUFvVlGzdUGSXdc/5E+LLhZlFr2UyFAPq5z/AOYYft/Jdl7xJlBQTS1IwsgDUDbZG
 Acl7F9P2ocnOPY+KEuEMkJQJVJfgVImazEgABuVjVbMpTbfHrSTY+vt8VcnYsXSssSPT
 LcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cYgpHQcJ/NITp09x/pMIMCgQDOEc5+w8S6l9DFntVkM=;
 b=L6gYdHVBaUYgRGNUlHpLYhIGHy8XnbBU9AcHcLcsr5jnsYFIzBcWFOUOFq6hIl/k2j
 OERBk0B+KhJHUZJHwK/U1HRf671VyKoCpTcYpqkLTwodMb63tauYQuwLgHUscUhRQ4Mn
 caGdkm/UaxbAjTunuEyCpKTrrH461q0r872Hxq2rwhoDSBkBmsTkfXhQvn3uO45EK9ix
 bL9hokgYtUGJn7k5Uu+WByMhD1ygbFarLBojsO0HAgYIHwCcORyveNsNw8VmwxWub9HZ
 kZh3UW4BZ6xNNqpu0FC1GqhPWQuZUm24eymMVC7rqvV0E9UcQs7ra9+7syGH81ikcuK9
 x2YQ==
X-Gm-Message-State: AHPjjUioFlu3cpqsUMwz+y3z2+856M/1aZ/FevsKfUKRBzbAyrCdxRy2
 pbL9CRU8eEhXgF1N5cBdmlEsC7yrdCCgXIkpanMrJ6Tw
X-Google-Smtp-Source: AOwi7QAuSrf8V5scKEXUmXmaSm55F2isKoARWCutAJl/+aWndOLsN40S+WEqPU9CETWTHr8KNT2IhezKC3ZcreemuUA=
X-Received: by 10.46.80.4 with SMTP id e4mr504986ljb.129.1505975398814; Wed,
 20 Sep 2017 23:29:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Wed, 20 Sep 2017 23:29:38 -0700 (PDT)
In-Reply-To: <20170921054554.6169-1-andrew@aj.id.au>
References: <20170921054554.6169-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Sep 2017 15:59:38 +0930
X-Google-Sender-Auth: gdbCeunZFYXL3QVUth-1AaSTgAw
Message-ID: <CACPK8XfHgyo=HkkicuzJF-8wzjFUWwRk6FJMySPQbFSGLYLxwA@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: dts: Request mux as per strapping
 configuration
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 06:30:04 -0000

On Thu, Sep 21, 2017 at 3:15 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Prevents the error:
>
> [    5.750000] aspeed-smc 1e630000.spi: Error applying setting, reverse things back
>
> The pinmux driver is only capable of modifying selected strapping bits
> that make sense to change at runtime. The SPI strapping is not
> currently defined modifiable, so "request" the mux as per how the board
> is physically strapped.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, applied to dev-4.10.

Cheers,

Joel
