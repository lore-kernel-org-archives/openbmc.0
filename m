Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="umniPhps"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lcXN27xH"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WgD7003pzDqGZ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 11:56:54 +1000 (AEST)
Received: by mail-qk0-x244.google.com with SMTP id b39so24333290qkb.5
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 18:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7ClkhMcj/8h/oSggolziongJb03MiUjWjEOrkcoJfzY=;
 b=umniPhpsCpvdc81mjnji92rqtatU0CBWmbQQmd/kl/jHuani6zscAKEwULzPFDjw3q
 ayFkzYRDndlltQucF9ZbK51CkkKA/ixN1304nV3/o8qh1nCPvwDcfA1Hcjw5vBV2HCvy
 EAvBSAvIcCcXRCevzM54B7Q/1ZiKwpwV3Yj+san+MtkZ92S947UMw1Hv1FtrWzTI4ICy
 nbNw6VZIxx40Zj228BaWV7TKkh5fuIDPHCgL6GwcmD40giYmy5/NO4k5agvKA+lchWsI
 6x6ihkyxxKAQaMlpn4z81Tw4+Q/yCeTdg/xqwBNNjYMI80SgePTMyJxMhb5USAK5OVAT
 0OOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7ClkhMcj/8h/oSggolziongJb03MiUjWjEOrkcoJfzY=;
 b=lcXN27xHSIGbrY8d8l8uhl7Q2dDBqmHP2HSw74GqL9n9BSl3KE3PUALGZx+8I1EavF
 ORMFn3VCFWJ0lETTftbLri+ueBTUwGqdhXY09RINrEzux9AciBTbbKW2jNQRhVEUpTF9
 E78STc00byBOopSFzTTOn4tLqgU25ErcItpkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7ClkhMcj/8h/oSggolziongJb03MiUjWjEOrkcoJfzY=;
 b=E4ipGQZSBMne2dcd1cIhlXcm7au+W6SzINXgN2Q4E4gOkrMPnVTiUjxZRKn+MkJtve
 KuslNLVFySkcmdsue6n5t8JSns0knQ74hbxcjv3ZpUvEEfpyKIcwwwe8OKmCLuaZgdAp
 tCY/SCzb5HikFUAZA5xVeSOosA3sX0rwyditTQXv8zis4LCFHBRGlD5lfLFOZfDpFHKm
 vHS7MqzqO9WFRoYPowWAcdXI+pdQFk4ne6XiRNmRuMA6AWUCCXoyDhwuAY5obYXBQCTC
 +zvQsbxoLhDs71DAcXpVIjBvyE7t8WWA5k/mWVMRYsoe7qgZVppfKplf8YCLbuffi6QW
 Srwg==
X-Gm-Message-State: ALQs6tARJD0iYGE7ppf/zux6tsEzy7eP660e5Pu24exfehvfV3eQDWgC
 /hrLf8Yy5Y13uJYw7I48cnZdcwKo17RZDJ0B2mH/xA==
X-Google-Smtp-Source: AB8JxZp+QTKMnt+zO6iaYlxm2U90WtsYgJs+XwaNdDMvcRb+b6FqhqkuC+nYnw/pnI+mVrBSj2QyBmdMg03Pyzmi8es=
X-Received: by 10.55.105.193 with SMTP id e184mr31596735qkc.352.1524707811006; 
 Wed, 25 Apr 2018 18:56:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 25 Apr 2018 18:56:30 -0700 (PDT)
In-Reply-To: <20180425223321.9290-1-jae.hyun.yoo@linux.intel.com>
References: <20180425223321.9290-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Apr 2018 11:26:30 +0930
X-Google-Sender-Auth: uK2fNwp80ub86cdUBYK7O0wmic8
Message-ID: <CACPK8XeDctYa3m9+waTbuSOzEppDd5W_XDMVvuQ75CZ=9feX6A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk:aspeed: Fix reset assert logic
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 26 Apr 2018 01:56:55 -0000

On 26 April 2018 at 08:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit fixes a bug in aspeed_reset_assert() which determines
> the second reset register using condition.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Thanks. This patch has not been applied upstream, so I will send a V2
that incorporates your fix.

I've applied this patch to dev-4.13.

Cheers,

Joel

> ---
>  drivers/clk/clk-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index de8e1dba6eec..c5d2af2ace2e 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -349,7 +349,7 @@ static int aspeed_reset_assert(struct reset_controller_dev *rcdev,
>         u32 reg = ASPEED_RESET_CTRL;
>         u32 bit = aspeed_resets[id];
>
> -       if (bit >= ASPEED_RESET_CTRL2) {
> +       if (bit >= ASPEED_RESET2_OFFSET) {
>                 bit -= ASPEED_RESET2_OFFSET;
>                 reg = ASPEED_RESET_CTRL2;
>         }
> --
> 2.17.0
>
