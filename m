Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
 [209.85.220.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ65458YYzDqST
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:44:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TwObcoHB; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=SLGPS/5g; 
 dkim-atps=neutral
Received: by mail-qk0-f194.google.com with SMTP id v3so1878186qki.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jKZBN8cyogM9TcY7M8APSAYZHurl2WzjALMX8YaOEF0=;
 b=TwObcoHBocJ3kIT8KTVsFo//7JEwV5NCVI/UCeL0uLqN39jgjXfgMTuhEoTuSSADfh
 NqatYtkGNt3ycYt24BXfJeyspWGG68/Augx3RvQxFcCk/wmHTGXpuj8jT18zMJuIdiHS
 gns5yVCP7GAqKaY6IFFBP94Ec7yKo0n09zt2sC3kQqhE6+Jp1zzaGFDcE//oVsIPkjGA
 DKz2w8XAsD4b1RzIhBz2NwJ/L+bOcPbcgEeDvcicqDht6pS+EOaPxhwPfxnZ9I+VGKQK
 I1aMrv9oZu8qi7vZqg2tpocLs1G573ifP3cCF6YY0g178v/Mk6qzsbT6XqW+8xzxf7mt
 Xvaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jKZBN8cyogM9TcY7M8APSAYZHurl2WzjALMX8YaOEF0=;
 b=SLGPS/5g2Ocqeq+fazD2a2lCkrPRw4MAkx+dnOH0TiurJS3BfVSJdjK5pLP4sMobTj
 KkHMIvL0xOYD0EOa13a8WS3um3GJwx9x/M6WtgkWqWGsDoFZ02Oh20q9PY/cojGDF/1y
 iQRKJtiyUF0In2UxtsluF4N06nRmBN4QURfDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jKZBN8cyogM9TcY7M8APSAYZHurl2WzjALMX8YaOEF0=;
 b=Xr95dFwLbEm9CsWAh5F0dYzXVBrUnaUEkDM52yZPItepDzM6OPo80qYLb+hwfODL2x
 uvGgsl2wkahU6nWQNk6GZArOdF5MLpSgFQDou9jMfKbI+T5MU6EqzJNBJ3OwterSm6A2
 oGaMuRvyS5JZjxugUuPpyp7BUSViObkA7wy6Upp4kd0cU4DLCsYIIOp7umnPVdBp2q4P
 /LEvJOFu41iDbi+4+Mn+jUtSavj5q1Qwumk087U1DP3gNQ9lN9XRVTnqSbbUez2EYr6t
 1UN+pnapl6rM9TkJPR4Iau2bnLMlGPAT3ZTmVEYx7eUY1Pmh0tZkwF/2LTpbdpr3Pj4l
 ityQ==
X-Gm-Message-State: ALyK8tJRq8d1lo+n1ZTLxrqoAZBtyp4XwGcmgd1MiXhpl96RYC6HshbGsbFKGIC/ULT1v2ests99sTUDbX5t8w==
X-Received: by 10.55.53.145 with SMTP id c139mr7479742qka.58.1465433002558;
 Wed, 08 Jun 2016 17:43:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:43:03 -0700 (PDT)
In-Reply-To: <20160609002032.984-4-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-4-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:43:03 -0500
X-Google-Sender-Auth: Dz4CxEnaqrMh35Mqp2DJv2-eq_A
Message-ID: <CACPK8XeZ6cdouA3_iCxiudSLviERef7rGEsFXVUd4H6eRb8nhw@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 03/11] Remove empty devtrees
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
X-List-Received-Date: Thu, 09 Jun 2016 00:44:25 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> At the moment the in-tree devtrees are used.  Remove these to
> minimize confusion.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts         | 1 -
>  .../meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts  | 1 -
>  .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts  | 1 -
>  3 files changed, 3 deletions(-)
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
>
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
