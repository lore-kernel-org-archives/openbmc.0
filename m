Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JADmYlH9"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Sd1+gB1X"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRFS44PDzF1Nj;
 Thu, 28 Jun 2018 14:12:28 +1000 (AEST)
Received: by mail-qt0-x231.google.com with SMTP id y20-v6so3610671qto.8;
 Wed, 27 Jun 2018 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wBMyEArjaVNzZAe9wNYG3G97pFpmCcAlOcFVFn6bA7s=;
 b=JADmYlH9t8Ysj0QsKzwxF17aUKVG0CFPIynVPKWaXIE8aZ/fEz/Twr28LSb19uEeEX
 PwR+Cns9lJODknSuHF8tAaMIhY3Xj2D7oLF60EzzjVBSBUj2qobRUrw4XssNitIiqWOV
 zr7WnMW2HbtLrEotwIfZEaRdR36/82Cys2H2FiDRebCe0Ya5HghyDVWKI6p7zIHBmTcl
 thrayZpQdFR0N8QcEFeBf4c6m165obN3rk/uQ6H+r50IAAkGxxHp2amnPOTmpLA7Jf0C
 gvfknzH8qUSFFCb17vw0pbRi8wsv2tooM8pDB8taNGEuVI53Q1gDPUutoiPxtjlwfumz
 2XCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wBMyEArjaVNzZAe9wNYG3G97pFpmCcAlOcFVFn6bA7s=;
 b=Sd1+gB1XsYktVkbt2wYPJZ5v287/swToyA2uZNtAaorDiNRXUQxerOyy94rvRLpAWS
 kN8R5OQ5ImzDzXqOWmqgKzrYS6NHUXa0kQMJxrEqGrHN05VpW9N5qOU7g+gSLlMla4tp
 +weUt2zTB3pMocPbRPqmrikYzBKCEzaWu0sws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wBMyEArjaVNzZAe9wNYG3G97pFpmCcAlOcFVFn6bA7s=;
 b=aTNH8TVN7cwYx1g8QDfnsN99mw5iIedS3MEiH4ylzINeI7M0sSsHFhcwAyu/LXq2Ts
 TsxZu0uypPrcqjcV0PT48xPB3aEPD9dUCQ4/aNc0+M9H8+pVu7MC+26J/y8h+bjMfRsh
 lOlVkSRwUlbUPkCqmj5tz66aS2EgDsxl5enTpNbKyrSzWWAz9iZmtpFpHoXQqWhiP4A4
 a6eSHYrjkiq8nUDqqdCxowpcIsvNuIqELfGY/+i65/T2YHDrwgkbmvz1VOtq9PX2relV
 OjtkHo4aOK4Sn+xsHjU0yg7kpD8wg6Hy7ypLRdgtuXf+zI2FSGcDUNYkc3DKBmVbc83M
 xixQ==
X-Gm-Message-State: APt69E0KRmmK3GEaFX4uprzxGkGJQioP/l8BOqhUmHq0V+STNA1Wb8rV
 qah3jhAcF5ycN3e7nS6/B2OgHnrNI4QKaAsjLBU=
X-Google-Smtp-Source: AAOMgpdL7QmRyCkIFLWY440UQKWF6FnmPn6JJnyt7zNimwWgruxfkpkSo9+SUwm1NLMxR+cXg0S1HowxaHiBhuQRI5w=
X-Received: by 2002:a0c:a943:: with SMTP id
 z3-v6mr7766738qva.208.1530159146177; 
 Wed, 27 Jun 2018 21:12:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:12:05
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-10-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-10-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:42:05 +0930
X-Google-Sender-Auth: XQY3RutJhIjSRLfSBJQsBlhc9ew
Message-ID: <CACPK8Xf0AKAgwH7JBcRNg=2jbW4Q+5XgGOkn1AHBf4X-3ASZfA@mail.gmail.com>
Subject: Re: [PATCH 09/14] fsi: master-gpio: Add missing release function
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
X-List-Received-Date: Thu, 28 Jun 2018 04:12:29 -0000

On 27 June 2018 at 08:56, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> The embedded struct device needs a release function to be
> able to successfully remove the driver.
>
> We remove the devm_gpiod_put() as they are unnecessary
> (the resources will be released automatically) and because
> fsi_master_unregister() will cause the master structure to
> be freed.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
