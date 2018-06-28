Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pEz5WTvt"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZO1irrbl"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRFG2DvkzF1P7;
 Thu, 28 Jun 2018 14:12:18 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id y20-v6so3610419qto.8;
 Wed, 27 Jun 2018 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aWmg7im17exQy4rah0WROHH0M5ShiUcRIcxOcOPKVmE=;
 b=pEz5WTvtXJ9N00GnB+OEInVKdXFjpqfcle97OdLfJguTVUhbawI7k5hGwkDre6fo7A
 JOYHtnynkeCFG4q7eYKxtd52xAHe2B/got9rENANXeDGnm9SHxbElbi+6p6SCj12jirb
 AtSZQHiZKZ/7F0opTMnmPaSx1GFSQseR1V+VNRDrhNtbkGzMzgNzljGaVITSeKR68xo9
 oJkHXTT/XtV8xPHvLQJalS6p3CCR0vlHWuI7O7vu6yuczz2DNFXBYVYvv5dKR4P3c5Wi
 DWGYHMaL5C844worG5vYC5aec6Djx3QpdaFy1wd4hK/Ix0KAwJ6rEeKAkLaKo/nxPKDm
 KWUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aWmg7im17exQy4rah0WROHH0M5ShiUcRIcxOcOPKVmE=;
 b=ZO1irrblRVJ2FoWsZ2b3USp5W0bXLKkOa9qVG5NSgO88CqA/1MU2UKnIrtY6SAZT+B
 thiKIcipbdn2mu+jo3kwPfsEORTX9wERWojdXGKfEbwz8CKdtQI3q6+EvTXF4kKR1G6a
 dzUucpZOhcbL0UU607RWZ6w8A+4w5DrvQ1E4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aWmg7im17exQy4rah0WROHH0M5ShiUcRIcxOcOPKVmE=;
 b=DFpouUX/HLf1GUfgvO1bBo4F93Ydccv3wDxPd+4jLmM1jXOPLbCMpGI48qUBwY4rc4
 rwwhKjXQIx5pWOozOPdu31VuBECgvpjkE0NrVZZxdT1+AxcGmWHsXmFZbnS/4rR2LSmN
 ZgpQfKtjjpcATxt1z5L20fM4j2NzXne8N6tzQNRuHeAA1g7WAX9jRZAQLJL0BbjYsWHA
 mkGUvtCxoCq0HuiMARP2LF94V4yw1C1CQSZI20bSdmkLprayvGMnEsf8cAhQ7oTA93l1
 RTzdqg6Y2L1OrtYqMThcemKyAcV8ClXTt+UbEykezQ9oH250E/918eidChab8h3jzQgw
 tOnQ==
X-Gm-Message-State: APt69E3sY0kNvzCofPkg++Xxc8X163fPRNVZLtKwlAg0VYziryFh1wTl
 L+XwiGa7XLmyQCCpYRb3tFpTe9GyF5eM0wObggk=
X-Google-Smtp-Source: AAOMgpe9dF27Uc4vd+e+zItSw0KVKI5pxguRwV7Nc/B3on9hKgHIQB5n0qWiunFEW3LzPo9xUn5dgjulC3My7Obt/sY=
X-Received: by 2002:ac8:679a:: with SMTP id
 b26-v6mr907735qtp.347.1530159136156; 
 Wed, 27 Jun 2018 21:12:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:11:55
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-9-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-9-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:41:55 +0930
X-Google-Sender-Auth: OGgIS7P3poDCOMvNYW9-IRoOE0o
Message-ID: <CACPK8XdgZeDjz+Niyfo5UxvvHTjYXB+fWfhO768CPrUMXj0nkw@mail.gmail.com>
Subject: Re: [PATCH 08/14] fsi: master-gpio: Remove "GPIO" prefix on some
 definitions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2018 04:12:18 -0000

On 27 June 2018 at 08:55, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Some definitions are generic to the FSI protocol or any
> give master implementation. Rename them to remove the
> "GPIO" prefix in preparation for moving them to a common
> header.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
