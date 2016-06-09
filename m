Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
 [209.85.192.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ6675Z2ZzDqHm
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:45:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AcQiBgnN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=GCMgC0Z2; 
 dkim-atps=neutral
Received: by mail-qg0-f66.google.com with SMTP id t106so1848019qgt.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1bG6nNXJQcDqSc1xKR1kyj1IFbs82w9TjNnivxnlfXs=;
 b=AcQiBgnNTQYl/a1N0C6hfTtQ2mQPgp/2FQ3iHi/g5mVzdtXf6y51x/Ge9MRyGlXqEb
 Oz+B91N7qqQrTeQxoQLQXPSaNrn3wht1nSw7sPLHi8GoSIe9tAwk2BsB1bcTaS026p5W
 UsUjJKTHp3rp/38hMVnvsWyWFa5Ez4ZZicO79nxWy+jczE3Y6/Qus5gJePrf8U20CyiF
 3UEjW+zmiOn+DYJDIfRTJTfrNgtio0ysDpc8KdDPv5TK6c9wxtdMgFK4PaV4/ZqNjJvu
 +aW3VDxXrzxUWg6sClyBfYEQLxypARZYweQbaAnPi9tli5tq9BPi5bL+RHXWCIiUJCNr
 PqmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1bG6nNXJQcDqSc1xKR1kyj1IFbs82w9TjNnivxnlfXs=;
 b=GCMgC0Z2ASQi+6hIf2f9xxEpD64rTvDz9NG+DgPa4/Ysyfea0KM7lx5DLv4ouWbv9w
 K2/eCRt+z+R3fAKv/693jtjT6LlWyOj77a66frwSBYXFXD48+MkntIpImnTg8/E29CtM
 I27Y+OmZiiewAH8WK4FcTu28SXRSLPgHRRHLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1bG6nNXJQcDqSc1xKR1kyj1IFbs82w9TjNnivxnlfXs=;
 b=QVctQvAhURfuT36xWxGeAbmJJerST7GI7NaeeVRgru1ksq7pgyAMp+8jKbWkozd6lI
 WOz8OYo/C2tS+X364tONwhyFtq4FUServYCZ5wv105+A2JF6Qj9AnViMhbamCPsjHAzH
 JtPrw/XoI1KLiFHVPV4/MaVvcIlIJvqZEvz134qB+3WtBiHUWgYnLsdc63Xc9lT/d3sK
 nrJkyG3uAPzTNVGjfcRGXuVfvjlWdhjWMtCFGLKvB6cFhV8fwWxf1J5uE/uuPV28NxqB
 Jy17WQ7i0MYZ5RTE4cn/JLz2mFgy67Zzyfb4c7LEwo6p/FZkzaiN5JiWQNe49RSU+kXa
 orEw==
X-Gm-Message-State: ALyK8tK4zr7iGcwfo+wDBywaMb3AQ12iPo0y0PCCAqB+RIhF/NXMxuQQzb6GxW+SiBOXNLJGiPcwgVbD02h3Xw==
X-Received: by 10.140.129.82 with SMTP id 79mr7521366qhb.28.1465433057613;
 Wed, 08 Jun 2016 17:44:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:43:58 -0700 (PDT)
In-Reply-To: <20160609002032.984-9-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-9-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:43:58 -0500
X-Google-Sender-Auth: xMcKOgA6nwLs_oTn9xEMTKtyVac
Message-ID: <CACPK8Xe5C6GrHwp02DtEVSt10jkceKV_F2doZ5+iNOskt3TDoQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 08/11] AST2400: Use Palmetto as the default
 uboot target
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 00:45:20 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> An evaluation board target would be nice here but at least Palmetto is
> an improvement over the generic ARM target.

Can you open a ticket for someone to create a evb target?

Does anyone have a ast2400 evb to test on?

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> index 97a8834..964de9a 100644
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
> @@ -5,7 +5,7 @@
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
>  PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
>
> -UBOOT_MACHINE ?= "versatileab_config"
> +UBOOT_MACHINE ?= "palmetto_config"
>  UBOOT_ENTRYPOINT ?= "0x40001000"
>  UBOOT_LOADADDRESS ?= "0x40001000"
>
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
