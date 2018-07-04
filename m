Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::231; helo=mail-it0-x231.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="thLVIn3B"; 
 dkim-atps=neutral
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L4B00zgHzF1Dg
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 12:07:03 +1000 (AEST)
Received: by mail-it0-x231.google.com with SMTP id d191-v6so6621266ite.1
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 19:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kPqtHpBO+aClOfe4n3t6PUWxUmNF+Wi9KHfUZqq0YWM=;
 b=thLVIn3BL3j7pXCV7qJ9UXkVOA4i6QeAUbdYWJgyDowqf8f41W23Ub6JcUtCfRt/B5
 eYtFLu+C2ER5iLkYgrfHxAGL+AiFnrgrURydjOeMkDTb7QeqovydZc+T1GclQwHx+TWU
 s6zsIPn6szx4sPBx7K0UuQyFGFesh3KFyqZMWisXR6J1ijFoOfBbmfaI+LtCRzhdT/SZ
 CVMxdj3tYakwPcLq127De6apoLClz3P7XtHE2+ETFlgcOhYKTr85KhW0D9AcPj6RoA4E
 6t+KnWKkUz1HcAU41HNVnJljcqCTH/jLAFwMXvLX+5+EZQFWp0Rokj4D81VrMjD48EW+
 sLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPqtHpBO+aClOfe4n3t6PUWxUmNF+Wi9KHfUZqq0YWM=;
 b=F32yYQJnpKDkn1iV9DMb4bXPgDgIQ3Y92cLLd7lrE9F3GzirRRg/XXjFXL+VdsIb7/
 1jVdbi1soVKHIfNsdfxPOvcvT2Dpv+1hu+bnOx4ctEEMoWYYsjA625jE4cmqY94ymzoM
 UtuL8BAR6WDbbLPdu5b6aW/W++zCqSGwAya/P7PqFv2xfAUGUp7wSGNCEEFaDZ0rHJoH
 N0YgziKcx/dq105yy4HvkhJQqw2DLlYL9lAzf0bnKaHjgFdQJeqVKKgJjQl/33V2JsdE
 5uuyHoycIC3+LCg1Os4pbHkLlT+ufpUnEjH+PzTZxpDPkZv2H59gqxX432CF5CBDTpNE
 QosQ==
X-Gm-Message-State: APt69E2FhwQMfKDwcEqT+vKAsDiawTFGB1Y/omSq3OIrcUHDnURx1ybI
 N1m9mjkExK+BHjOSs4kRAVHq+mcEcnBh1Q50byE=
X-Google-Smtp-Source: AAOMgpcStqbPpGKf3F6QnkyMy+EKxkrT7Nh25dkjvYK6N2qd/pGLLneUVVxupffV2el0uT3S78CkN0Hm7W8CssJtm/g=
X-Received: by 2002:a24:f6c1:: with SMTP id
 u184-v6mr397133ith.14.1530670021754; 
 Tue, 03 Jul 2018 19:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
 <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
In-Reply-To: <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 4 Jul 2018 10:06:45 +0800
Message-ID: <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 02:07:05 -0000

On Wed, Jul 4, 2018 at 10:03 AM Henbin Chang <henbinchang@gmail.com> wrote:
>
> Thanks Lei Yu.
>
> Actually, I want to enable CONFIG_DEVMEM in my specific machine.
> I added the below config to my machine.cfg
> CONFIG_DEVMEM=y
> CONFIG_HWMON=y
> CONFIG_SENSORS_TMP421=y
>
> But I still saw the line in the ".config" after devtool modify linux-aspeed.
> # CONFIG_DEVMEM is not set
>
> How should I do?

OK, you are using devtool. Then the simplest you can do is to reset and
modify the recipe again:

    devtool reset linux-aspeed
    # Manullay delete the linux-aspeed dir in workspace
    devtool modify linux-aspeed
