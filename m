Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNHR6LmrzDqlj
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AOlnqp6N; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id j2so18996764qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=e7CHCGzBaDOjGGb9fh0E1Qt1do/PW+kN5GBLPYPZiLU=;
 b=AOlnqp6Nwi3PNoo1E2J0Lmgvj92IEKhzhlyzmBuIj6Mm/FQr8UJAE89FBCDr/bt3ZY
 DruVJtEmGTugfw3vVmNvJvDGC79bg4EmBNVkTX9tk8DD2ZeAsXg6JvX62aeZN9In72Jc
 yWD+hU+mtQZeK+TMBjmfcRWaUvajcm9+8R9crd+0U0sn4XbigqX6R0OZNYE/iE5flnrI
 +aQCNmVEa+LmNylj7Ct67px8JW3GiKteaTBXa/XEtUoUJVAGZe0h44E92IBvKzlN0RC0
 2D8eOE/OfAId/KyztfTFYZVgBht93BM2/cWOucXAFDqH7ai4O1hLCcOsYepvVWXuK9DH
 s2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=e7CHCGzBaDOjGGb9fh0E1Qt1do/PW+kN5GBLPYPZiLU=;
 b=hVBgOojNcKs6vwIQq02hGNCSto/z0zca46WGD1ZaxGm5+Lo/frVjVQ0qrNG7HVFpWg
 G4pmvWj2JD566WgSCmFLFRS3DsbNcC1e8ug150x7l59gTt/8HtVvtDJ/WZZHMpi+UnlY
 +z65JhxgaIZQq+eIHJ2CeQql2K0dgQP9Y1WD/XVTA6uCZPs0nW0XbvvIyGn2IL90bUd2
 l1WIZ8nqnAnNjw6YRs6iqWCP+9RgXDXRh0zH0204KZioh8//bKu6o+eeCt9g48IAYBZl
 BAGAWDu5lG02VczgoIwWZib17XjCTcBo794LTe4yPmLKksTMhd/6x+3Vs/H5139JhEHV
 QDaA==
X-Gm-Message-State: ALyK8tKgiMyVuZ8j5bqwX5Xk6G6VXxHwrPp/UVxQPpzBfqUf4kXNoHG9auL29eTNvwz1tM7Tw4LvPvgKWwUrng==
X-Received: by 10.55.107.6 with SMTP id g6mr1938675qkc.166.1466736930017; Thu,
 23 Jun 2016 19:55:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:55:10 -0700 (PDT)
In-Reply-To: <20160623204033.13165-3-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-3-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:25:10 +0930
X-Google-Sender-Auth: UZZsKYZJzMzn4jy1oe5FF4F6oaQ
Message-ID: <CACPK8Xdf2LXZ7f3dOo9WK7gGJm_QCHHFkpJt=67R+t_uNEo6UQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 02/11] meta-phosphor: use obmc-phosphor-user
 for qemu systems
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 02:55:32 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/conf/machine/include/sample.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
> index b499940..e4d70d1 100644
> --- a/meta-phosphor/conf/machine/include/sample.inc
> +++ b/meta-phosphor/conf/machine/include/sample.inc
> @@ -30,4 +30,4 @@ PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-sensor-mgmt = "obmc-phosphor-sensord"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-system-mgmt = "obmc-phosphor-sysd"
> -PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-userd"
> +PREFERRED_PROVIDER_virtual/obmc-phosphor-user-mgmt = "obmc-phosphor-user"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
