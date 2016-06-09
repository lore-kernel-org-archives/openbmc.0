Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
 [209.85.220.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5v263zGzDqQW
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:35:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=b4uxw9Mk; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=eN29doK0; 
 dkim-atps=neutral
Received: by mail-qk0-f193.google.com with SMTP id u63so1872494qkh.0
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=c/UIoaQitwDteizWGFY1dMkWyAAQtRKaduIGmMXmZwc=;
 b=b4uxw9MkaK2vC+tLnR6xqhMU31k/Yz1ZAqq1bnvO64DdcKGnV4pv1FuKqdJEMOBvnx
 s5bWw+X4mXPFEZ8DLWLG16DGdStKq1Jw0wy4Wq0Aoik65ruQ9kzG+9HgnHxLc7oPkW6v
 +IhXmTUCE3Z0UXKAAl+VKEnvm0teXIfwF5pMFp/jreGNEGQvVWSF62EJ0bDV0ttZpciQ
 DBHlI3V2GuEeR2iCtEeIohj0pzlhE/nP2FVFfJDof2lwXkgn3Y+P3vPeyrlei6HGpcbM
 d0iCzkocBApXXvW0BKVCJ9hi8pEe9ldlpNx9DxjKNBrVh2+VXoW9TUQLNL6B3uATOLcT
 zqQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=c/UIoaQitwDteizWGFY1dMkWyAAQtRKaduIGmMXmZwc=;
 b=eN29doK0aMWgY0idi+cillj/SwK+z40e5FYXWunq25yzKCMpeID8Ikqz8LYoeetRpf
 PcmuXrc0jW1gQtozHcCDeWXyHdgNo8+yx7DAT6N65NWM7KKH5wONtPGkcAW2/7ztkF5J
 MUwllc4r8wzLFdkDjNi2V94d/l2jeHeCC0AxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=c/UIoaQitwDteizWGFY1dMkWyAAQtRKaduIGmMXmZwc=;
 b=mSGSk0soCbwNwmq6p2kSJW/uhFljzaqyavjCCKQI1XrDmzkADN1G6Z6FeKRhBK9xVQ
 MM6ESoHr/InmPdkCsRbRbk3QKQXje+AfsFhrm5lYV9Orl37y9fJE1VGWzI8mrjBAp+98
 7w604tKr+vsKQUMuWjUYUsyIMJ9zK1vgv9BaFitEjSlWFkFk5Q4tmatOI0hAhAu5qrfQ
 YFzpB8RQQWaROMTYTLMtlhGpip97oHpyLO+4bydpLPQYNVWbUcw6V2o1UaHVE9sfVuEw
 BukjPM+nIKKfiTVijHyvpX9VZCeh+Q7Byk26iDZNyk9Bk0D2fLUi1qAnlhYI0xPWF8c5
 iLaA==
X-Gm-Message-State: ALyK8tLcBBpZflDE7IYNKxtPSoPN/ek46dA0+Idp3/ccz4nOZEXSIwH7Rr/3GGodPmxCY/gb6vDCuvWfV2hJfQ==
X-Received: by 10.55.149.135 with SMTP id x129mr7746334qkd.140.1465432480330; 
 Wed, 08 Jun 2016 17:34:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:34:20 -0700 (PDT)
In-Reply-To: <20160609002032.984-7-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-7-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:34:20 -0500
X-Google-Sender-Auth: nqOiEyK580R_Dpf0E2ginLKrBmQ
Message-ID: <CACPK8Xe0cCwv-umiU6UnumtLXsXkqtgtBDo1tBoRvK3M0OrH7g@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 06/11] Add a kernel 4.6 recipe
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
X-List-Received-Date: Thu, 09 Jun 2016 00:35:44 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Adding a 4.6 kernel recipe for the AST2500.  AST2400 remains on
> 4.4.

As discussed we are using a SHA instead of a tag for now.

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
> new file mode 100644
> index 0000000..78bf3b2
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
> @@ -0,0 +1,5 @@
> +KBRANCH ?= "dev-4.6"
> +LINUX_VERSION ?= "4.6"
> +SRCREV="6bf0b62ef667270f8a8cce46abc6c1f9b68785a5"
> +
> +require linux-obmc.inc
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
