Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LVC1MCH2"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxq7b690tzDqBd;
 Wed, 20 Sep 2017 16:08:59 +1000 (AEST)
Received: by mail-lf0-x242.google.com with SMTP id h80so827687lfe.1;
 Tue, 19 Sep 2017 23:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=O4R0BNiFS+a0YweAdh64HJpvNSudnZTTL3QLKceyrJw=;
 b=LVC1MCH2VKKeojmmCBDc07TISmbw6wUWyRR6fnU/6MQZXJUWUSmcZ/35m9o3HnBtnz
 djJn7qG4438qsSdh9x/KMzEuIR9mqCidfqGRorm97ONhRXidLkWsRKQ0RAcHTKnRpeT1
 1bJdkY+s0G+LEnMa1dSdgGiG33iTwRXKET3MyjBt4EWwJHZJWtidd1SB3oKG80KERgTP
 63pYPtS8pOdbphrMF5xAqMZQg5QF5CTHVMpe0F4ajo0G+A3wtfjMv690WFhe7ORaZin9
 FyW9VMJoYte0mxEfWwjR6mMo5C8pAxcliJQ44kwrn9iLnfi8brwUrgDKCayJ6R+B/n1l
 B46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=O4R0BNiFS+a0YweAdh64HJpvNSudnZTTL3QLKceyrJw=;
 b=bEG7/2gAi2YE3Rdk+ei6O+s8vTT3CAZZ13lggk1yyuckiNuecStWlB06UT+ieUbd2G
 iIkmvrAAfktKS9kLqW/RNLKSnn9CmymBxZX6uKFYSrBelRT95ipR6tnXmbHQbOwbAR3i
 rcioxH3oeumLd2G8Kyusxj1W0F0eUbB8c0IAzXl0LWYxiaiYr6PlyEHeGUYmmIDtyutk
 1ZkfQAmIKqd9QiY2u/2T5b5t8Kqb89LxEGNOQ+JFly4KsMMuZ86mjYAEbQcOsL76leJ/
 SEvm8X14IkhnX2sqPQiARWYSrh2yOT9WvG0o4AKRtjF79MweOM1QplQ+yn+yncRXivkS
 DzgQ==
X-Gm-Message-State: AHPjjUilGZlqtBnDIFk4qa7IJmD3bg3Ki4ZefG/JCdHSt2WTHfaSGhZY
 ED6OXYDX17fy8DU0fLTOVDNlArvzAN35gvFKcg0=
X-Google-Smtp-Source: AOwi7QBozeM+b57yujVleYAka0mOjdakzQByvpZbPDSnikVEvUZhEYULAGapbb2+2SVL8lI62U46oBDGFtffuG/hWKw=
X-Received: by 10.25.143.27 with SMTP id r27mr374661lfd.85.1505887736565; Tue,
 19 Sep 2017 23:08:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 23:08:36 -0700 (PDT)
In-Reply-To: <20170920053020.6860-4-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 15:38:36 +0930
X-Google-Sender-Auth: 0-aVYzM71zdBACZVzuV5-JocxJw
Message-ID: <CACPK8Xcm4b=GzPykwNYiuEgbHsnOwt4ZepJ7WYLTDqE=e5JNfw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] watchdog: aspeed: Remove specific reference to
 AST2400 in Kconfig
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Wed, 20 Sep 2017 06:09:00 -0000

On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The driver also supports the watchdog in the AST25xx series, and
> may work on earlier SoCs as well.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>
