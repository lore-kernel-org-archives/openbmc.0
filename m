Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::235; helo=mail-lf0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cTTQYWhQ"; 
 dkim-atps=neutral
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxq616zlszDqBd;
 Wed, 20 Sep 2017 16:07:37 +1000 (AEST)
Received: by mail-lf0-x235.google.com with SMTP id k23so1612389lfi.11;
 Tue, 19 Sep 2017 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6L97DFAJLZHICeCZAKIVITJ7Yo7ua6Nn3Lv5XJe5VSY=;
 b=cTTQYWhQkj01Bg8oIpZjLIqUVTcM2Or+NDwt85niFlzu520grmplE/zLxmo6EEwvW6
 88IURx4xHzExWfL/UdONIW3+U4Tx1oWQLO8Ofwo2rX9jZ8Cm8Y4g+bq9IPLzTztpOq0P
 sAWmPu/+IwuZg0YDPa00ilgiwEpv18PzrD0BEKrKCM8740ZJaNZ7qSZkR7Zc8TMWxkiC
 KZvPckaulcX+xvn/Uo6/OQzuTl5B3533c1Oft+WP2sN8e3mzhd5vmaT7J51w8Nt8E6eq
 8Mn5/T/G76dFcYsdCgGDhmvbjE6ls0KltOXnlIxjfyIfDOTlVwwpK//7uR4rJGjILorS
 g25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6L97DFAJLZHICeCZAKIVITJ7Yo7ua6Nn3Lv5XJe5VSY=;
 b=hUUu6eHPInXoSCGBojCHcnwZBWajneah/ciZZ3O93KuL7s22eIfmTIgA8/8xCKMaDv
 I8JCuFJHrC/skHxYxrcwliAcgqSp2qfxoofKaPf9/1R9rKlF4l2ku5beba3yOK2O/mQ0
 QlCe4znpz+WjF4bt1tlEMI/6fJwqE8i9yrWvHrxySmViVDEYDy+TK1tcMbt9wWo2nqZn
 +m+o7Fvmw/Paev+HG8H0D5fQqCqNp0n9TjsgxIp2BnnV0W9G3tV7dLKW06pR21w2ATiV
 Wt158mFk4phqfyS31aNMzVYIWQpOiLpB3h9qkx7ahDxlvaGIbbtG+GOp6zUxD14YWx83
 j5LQ==
X-Gm-Message-State: AHPjjUgo4Nupc/14gTR81Fgwrj7MIXZZ/RDJH+tYHHXMLVjGrzAE/Nn7
 rVxCSjJqMsrJkztKOSPgKNGDYgwEQkJD38CGByI=
X-Google-Smtp-Source: AOwi7QB7XYguIUEmEufBCLBWi3AqtB1fMObTDKh8IvjuAIPnmUnmaVHKv1r5/MVo5QaoaKDvY+LYVOwoUoyqPCuIx5M=
X-Received: by 10.25.100.18 with SMTP id y18mr370443lfb.257.1505887653935;
 Tue, 19 Sep 2017 23:07:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 23:07:13 -0700 (PDT)
In-Reply-To: <20170920053020.6860-2-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 15:37:13 +0930
X-Google-Sender-Auth: udAJrDn7aP58tuH0C7npxillv_M
Message-ID: <CACPK8XfK8voWhPoYg0kG-OhQoTH_B+=ES8BqbT26bdPYf39d1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] watchdog: aspeed: Retain watchdog enabled state
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
X-List-Received-Date: Wed, 20 Sep 2017 06:07:38 -0000

On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> An unintended post-condition of probe() is that the watchdog is
> disabled. This behaviour was introduced by an unnecessary write to the
> control register to configure the hardware based on the devicetree. The
> write is unnecessary because the cached control value that is
> manipulated by the code parsing the devicetree is eventually written by
> aspeed_wdt_enable(), which is when we care how the control register
> should be configured.
>
> Remove the write to restore expected behaviour.
>
> Fixes: b7f0b8ad25f3 ("drivers/watchdog: ASPEED reference dev tree properties for config")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks,

Joel
