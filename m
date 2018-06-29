Return-Path: <andy.shevchenko@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c05::242; helo=mail-vk0-x242.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sj4ZZtrq"; 
 dkim-atps=neutral
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41HSrQ3rsCzF1dv;
 Sat, 30 Jun 2018 06:27:49 +1000 (AEST)
Received: by mail-vk0-x242.google.com with SMTP id h22-v6so6035005vke.4;
 Fri, 29 Jun 2018 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7MegwICDCW0a7zovTooM+UO42JJGMqBHmkKbNO9iiQ4=;
 b=sj4ZZtrqBTu+oDGpCDakPI26yVTAkDcY+DXiVa3G4QnqCg9KEM2enoS55VxaHdQBb7
 YiXvWfzE6zVQynNhQ77F2uEeqT+dwgAwglJITGU86gCRux2ZzaMwNqGAD+pkmtj4h1xM
 7Hsdo+OJU6Ka+WkCM/ZUD1+dCQ0ISI656EnFOM3k2MBwVbjVSjk0sVJ7yXVFB8Y42UkK
 su7KVugH6YGFe0f4wLlsWzhf6di++I1FPsdezte6WG+6Mklw5PYMWIJhvcotJXaLKFrF
 D1mbDhE1DjVmdN5+gO6Yrxnrc+LMYbACMYUYqR+cKOdoOtID0sE6mYodJRS+hThq5b8S
 qiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7MegwICDCW0a7zovTooM+UO42JJGMqBHmkKbNO9iiQ4=;
 b=qe70aL+ViE6mSTKskYCc0rr6lju8NoSBa18Felxf3nvz6sswoWfulQMTHiIGFO73GX
 TIp4JvoijqYzywxKNBTgPCLA5/dz6oi6ER8if8YFJA4kKl2cuM57pPg12903d9boJyQl
 0Ffa43wYSwEC3P2+CE7SdzwBGEtRO7P1OkJY7QeGcPD9hbglb0QZIpCyqiW9vaqFliXH
 YMYqw51BZ34B2RTtWdv+Yh3N4nAHC17a8WSWuIyp0z81Ue2dsTA6kHjdPW7yo09ZHD/x
 hInfTL+aYoFvJ7Ztcbiv1Cu2F2VjElIxPQyz+O6XDrcy46IAqhTZ3WK0CdWNWTHPsE31
 FDEg==
X-Gm-Message-State: APt69E0cEaJdhRjjyWVuM8HbV0/fU23Jl6HhCu75dwOTaK4GK4R3g3SA
 RK5HdrLxJ8BGlwS3MKHMIRjBUF+NbEirBb0bmFY=
X-Google-Smtp-Source: AAOMgpfsAtqbNDuiwuWo3qCpR7F6MBAHuYFU9VBGTL0ligMjg32LYyQZBF/7j/2mX7FIMsVeIi/x6QrjK/iIhFk1BXQ=
X-Received: by 2002:a1f:7d09:: with SMTP id y9-v6mr4156088vkc.15.1530304067524; 
 Fri, 29 Jun 2018 13:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:8b02:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 13:27:46
 -0700 (PDT)
In-Reply-To: <CACRpkdbhxjahYaVnQN0xqD0NLPouO8VCW8w-GZD0sbLFtFtY5g@mail.gmail.com>
References: <20180622043134.18238-1-benh@kernel.crashing.org>
 <20180622043134.18238-2-benh@kernel.crashing.org>
 <CACRpkdbhxjahYaVnQN0xqD0NLPouO8VCW8w-GZD0sbLFtFtY5g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jun 2018 23:27:47 +0300
Message-ID: <CAHp75VfshFLuvOSB4deALX=EUf2Z_RW4Ct-K5cMsAj4yifF-cg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/14] devres: Add devm_of_iomap()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 29 Jun 2018 20:27:51 -0000

On Fri, Jun 29, 2018 at 12:14 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> I wonder if it is easy to find these cases and replace them with
> this neat function...

Would be reasonable easy by using coccinelle.

-- 
With Best Regards,
Andy Shevchenko
