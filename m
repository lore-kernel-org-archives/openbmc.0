Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM82T4XCbzDqBW
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:02:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cnpjQhMj"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id q71so6275983ywg.3
 for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2017 18:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sa80OvV03Qkjhbj8sbZSd7EEn5xkdjb3AenZcqqY8vI=;
 b=cnpjQhMjhQLFxcteePetxXrhM0rreyClAz3bDsmfRRGYMIgpFWBblTzvcXSGIQlunq
 hkO69U4wsAv015QmhLxtioaS4oUjBf5NlGi2ftR4hN+Y4Z1I+59s6mO/gTM+vcZ3qJNa
 O24Xl7/67b/OEKTR8HsEHsZp98SCq16mDenaflVkRMnBpavKILMdRQGIEb5U1HA8RFDF
 kHLdthql7m4hXWam/cdLxXmIWwHr6UZCxvKShhEAD8jiTSCA5PrX2QvSA3e6BirTbvZL
 g0mUTJ6s0TtkYUtE1gJv5rXvkkPLOVf5FAtRBXZRDJNTfDB0eLVbtMgTYgG3Js7EPt+f
 TwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sa80OvV03Qkjhbj8sbZSd7EEn5xkdjb3AenZcqqY8vI=;
 b=qEWYzJxJNVQEB1wU5en2cB1nwlzpjQeT/bN1QyeOUmnjf+WLZs2WclID7DZSrmGfOy
 x04NB4rT84S+gXgKykL5d9gfzbq56IwBMikcq+1FPuKSufSsg5b8GOu//u/QuDVBB37R
 lT5t/lmqsKx/XEL6BenqXwpC7IaNbjBKMc/W7xlL9cnRNF5i+IESlCWzqzZGhliuNenX
 kFJwVuG7Pmn9VQ0T5KLxugzNWEko0Q4mKO0dOn+0SfJGSxDKBR1wIllhiWzync7Rctw9
 yQLnJgGi7bkc95t90KZIS7CZKZjtfAAolPP72vVAvq6iLDC6Mv8dH/xbA8f+59k5NSjj
 CJeQ==
X-Gm-Message-State: AMke39k2BXvl92HXB63Tv7SSrLJ8m2J0pc7hlvbekHonzPUONCcjuH48Wle319StlbLG7z2Cd0F/V4Ce/1omZw==
X-Received: by 10.129.73.65 with SMTP id w62mr14561395ywa.288.1486951359204;
 Sun, 12 Feb 2017 18:02:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Sun, 12 Feb 2017 18:02:18 -0800 (PST)
In-Reply-To: <1486745362-7790-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486745362-7790-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Feb 2017 12:32:18 +1030
X-Google-Sender-Auth: iWBury3pFtC20KqEi9gTzwix66E
Message-ID: <CACPK8XdtxH9-MW0ryO0SeDsHhGc825Af1Cwy-KXewOVbGsjKTQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/2] drivers: fsi: i2c fix ports
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 13 Feb 2017 02:02:42 -0000

On Sat, Feb 11, 2017 at 3:19 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> missing a couple of ports
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.7 with some fixes to the commit message.

Cheers,

Joel

> ---
>  drivers/fsi/i2c/iic-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
> index 6d5b045..9c70e38 100644
> --- a/drivers/fsi/i2c/iic-fsi.c
> +++ b/drivers/fsi/i2c/iic-fsi.c
> @@ -281,7 +281,7 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>         return 0;
>  }
>
> -#define IIC_FSI_PORTS  0xFFFULL
> +#define IIC_FSI_PORTS  0x7FFFULL
>  /*
>   * Called when an FSI IIC engine is plugged in.
>   * Causes creation of the /dev entry.
> --
> 1.8.3.1
>
