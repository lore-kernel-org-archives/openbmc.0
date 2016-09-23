Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgLRv6xrGzDsm7
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 14:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uNRQrgfB; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 107so925553uah.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 21:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=L33DHwvi/57o+MN3WWoW3vLXzKUtF3NbOr+SwW+AvF8=;
 b=uNRQrgfBQEGjHbmFKq6djiryNwOQOHJM/MLeO8cpad9h3MYueue5buQql7TVJVVIXe
 aIOZmrAyUxl6krUP2sGBWuh4mheUNa2/HMbSLjoSBgdbOFMLNuSbjgVVg/Blrhcn7lTF
 RFV8AFXqQ3cHqCyEl4GHsoUS7wCHMzhEfzBNgY5CTHbm2fat7kcI8a6p7SHGGlItzEAI
 sdBvOr8omN8/9rrgkmjNgrhEXJhYAFB4D+xCJNFvkMlynka8ck28LyqImTw8SJ2Jq63k
 dco1veeFHQUrjseWBYs3K03A6o/O0TQmbAtQymsh8G3dnlmdZ2Tpj70a/gdAoc/LZNf1
 TfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=L33DHwvi/57o+MN3WWoW3vLXzKUtF3NbOr+SwW+AvF8=;
 b=fer9A0u6bxkzvxeZusZ8itWSmhwSQJwcEjfFpjQlpk16bKwPBWIEsR5Ym7JB9YlHqI
 oLR9rU88FvkrcLsLZ0IftWxtKy08Adm/qIx5R+tvxnV8skvYalX7c3gUHVyPICfOReht
 LuiupR0N/f1Kg+i+hJdpm/6FJwDaPNhr0yvrGAvRAx3QZlBX0e0kZEftUD6Xnr0COwRX
 VHjlnWcFVl0v4l+EgqJfE8ylgYCTOWp2a2HaJgmUk5l15j+XUqYczicQsNo0VnjOCkJT
 RiS77fa8fiC1Nv+y9FkkIuS2mRAbcKRI5bPAHzvEgkymlCVdGe3WtHWXaex/6VHagPYv
 QIig==
X-Gm-Message-State: AE9vXwO8J3SmAdK4MLTuROIYqrLA3BR3I072xcxF69sah3eXIUGjebVOtzTA5T48sqBDDbXAwkhrSplhTapANQ==
X-Received: by 10.159.36.177 with SMTP id 46mr2984914uar.78.1474606008724;
 Thu, 22 Sep 2016 21:46:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 21:46:28 -0700 (PDT)
In-Reply-To: <1474590854-104677-1-git-send-email-xow@google.com>
References: <1474590854-104677-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 14:16:28 +0930
X-Google-Sender-Auth: 0fX_X3EbKAI5WGYQB5alD5J3jPM
Message-ID: <CACPK8Xcw=7tTnzt9OSx3=uxWnyn_fY57FgYC2hDyzXUoZQ2i=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Ingrasys Technology, Inc.
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 23 Sep 2016 04:46:53 -0000

On Fri, Sep 23, 2016 at 10:04 AM, Xo Wang <xow@google.com> wrote:
> Ingrasys designs and manufactures cloud hardware and is part of Foxconn
> business group F: http://www.ingrasys.com/

Thanks, applied to dev-4.7 as 5df6ef640e58ec87fde655e466f1cbfc4cb68f56.

>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c2500d..54e9182 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -130,6 +130,7 @@ iom Iomega Corporation
>  img    Imagination Technologies Ltd.
>  inforce        Inforce Computing
>  ingenic        Ingenic Semiconductor
> +ingrasys       Ingrasys Technology Inc.
>  innolux        Innolux Corporation
>  intel  Intel Corporation
>  intercontrol   Inter Control Group
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
