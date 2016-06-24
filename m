Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbNJ60rmszDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PMykFuDk; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id r136so122367qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CK0BgiJe67aNq4XYglaGTooFI3JQlzU4yaBSJ51l6ds=;
 b=PMykFuDkKS+Z2mpfQ+NnPo3WyqdluikhKbLXRo4/Rlkk3i7W3OOyHsgkif6PvW2OLn
 H5A4vCvZczj84hGcJSLD3cLH0iMBjqgGvrNeWjr5+viccZbbcjBl8YWiIoJSKJHvBWaT
 fTr0pGvbRAkzTzuIgKdNjmVbi/ZRKTyW9sWrDr+k1UosQPG+vYfhnKUZSvBQXy46RuxU
 g5pTEopeNI2vcVdGev2tN7PZICg5n6dXTQWDvVkQBCbtXYGNEfLSSXQPYAsBES8lfZnR
 mCVu452dw3o8rL5Rp8KWrExRppop82Km6nDD+sg/QGwYsVmS40rRv+UnnQ+cCwfS4cKf
 AsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CK0BgiJe67aNq4XYglaGTooFI3JQlzU4yaBSJ51l6ds=;
 b=WZX8uhwpAM0vJ8rwcdTF4NJQX+KMsYWDCrLLyrXEWNEfVbi1Bev2EBVA00D2OHeY4K
 xbPuoUWG/4sDchZrn4FEjjWA76mCSNbPP9TZw4phVffbgMysN6m0Tjocwtufev6EpLj7
 mT28zw+SBI0pxydijCDw9WgBH47cCeFPE6j/DbkZVGv/qJBTd2z8BfI+LGyo3x8J3nwO
 MPCiY6Xetrwe3uTBft15rHH9iTb2goR6NKpwpCunPH9UxGiOs9dhogD3ZiYtpCoDJIRg
 37R9wkw5yLAjNDPhI1+DVJeh4DQJCLCt83uLc1xq05OVmQG0baa96zQlTT8ZXuuokIcQ
 meMQ==
X-Gm-Message-State: ALyK8tIYSZ2owLiM5z7bYnfFjFvAsrvF32dfQFf5o0zv50ieF2klRYc+SK069sgkMfMKbImmePR6fFTPUfQfMQ==
X-Received: by 10.55.53.145 with SMTP id c139mr2026785qka.58.1466736964255;
 Thu, 23 Jun 2016 19:56:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:55:44 -0700 (PDT)
In-Reply-To: <20160623204033.13165-2-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-2-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:25:44 +0930
X-Google-Sender-Auth: bCDD0_pt0PYPSquoPYUjKBG2fUY
Message-ID: <CACPK8Xfa1c2-BBqPs0g_VbCWici0YwF=G-4n4WftXUaaCD7CCQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 01/11] meta-phosphor: Use obmc-phosphor-event
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
X-List-Received-Date: Fri, 24 Jun 2016 02:56:06 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>

Perhaps a small description of why we're making this change.

> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/conf/machine/include/sample.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/conf/machine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc
> index e66dc77..b499940 100644
> --- a/meta-phosphor/conf/machine/include/sample.inc
> +++ b/meta-phosphor/conf/machine/include/sample.inc
> @@ -24,7 +24,7 @@ VIRTUAL-RUNTIME_obmc-phosphor-ipmi-parsers = " \
>         "
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-host-ipmi-hw = "host-ipmi-hw-example"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-chassis-mgmt = "obmc-phosphor-chassisd"
> -PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-eventd"
> +PREFERRED_PROVIDER_virtual/obmc-phosphor-event-mgmt = "obmc-phosphor-event"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-fan-mgmt = "obmc-phosphor-fand"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-flash-mgmt = "obmc-phosphor-flashd"
>  PREFERRED_PROVIDER_virtual/obmc-phosphor-policy-mgmt = "obmc-phosphor-policyd"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
