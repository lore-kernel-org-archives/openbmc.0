Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS04L10BjzDqH4
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:21:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gsYKdyJY"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 2so3050261ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Z58I3NaPeNzkQm0bheIGd0kW8EMxvnnvR1YSn9Rg2KA=;
 b=gsYKdyJYrE4XcREHCq7f2YsgTnOQEsbVtwZcwYAxG+Ydp3ntrT3PyQKFYpJD6nN0kw
 IIoZF1vZ9RSB6aE3o15MEaqsICkPeo3nH0PfSD+ugGJKSjgpOMJa/dVrj/MVhn46//ii
 zHQjuGf0tJCpKqc0F6eFDev8c2YC5R/HtbM0otNaYc5j+/e24P77TvfQW90lrFkfjc5V
 rfqeO/tdPbYkzS06X+ab+8hPh7JHHz7O1UY5SGeNPpKSb9K+fWbZ5LLQ0F86czNrrppf
 wXZGDvbOsV+zgeYXbd6/swwUMXoSHa+cWxvcb/3ajMUt1nUn0JjxXR8d9hecwEwQA/wZ
 tA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Z58I3NaPeNzkQm0bheIGd0kW8EMxvnnvR1YSn9Rg2KA=;
 b=D/ZEcGJsV6PM0yNTsQrMGfTVrjnqNNaRIBm8OykCHjOrNrfLSkfnU6MmW0V6eaYMQG
 mSbvG94KKhd9ddZkq0AWpcPFr1iBV4wxKf955PHQXcrApNRO2lmL6laXhE0n7xMrG2Wo
 zx+qEAF2Ud57iwdNMom/3jQ8bWelyLnnZm2oPJFemPZ2skcAqqV7OIHd9kUgxHe13gEb
 XXZlCtxmbe2gqTSwiu/R+cOhOdkQl4tnhRprJ1nsIq+qqNLRIxsj06nl5G8HYcsEaaXJ
 uXNceL+SBJrNXrIcdsDF99XINJjkXRB+vfpLejwTbRMAtAzTKIZ2KQwIDh9zr2r5fBRp
 yyjw==
X-Gm-Message-State: AMke39kaMmGJ2FrTqOjDdS9SOxFDbS+DKp1ygIK6jo+4HQYazzBlCc58En8GIrdbzE6X0zp76HFKiFJ/vf/3ng==
X-Received: by 10.13.247.134 with SMTP id h128mr20666335ywf.56.1487632864055; 
 Mon, 20 Feb 2017 15:21:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:20:43 -0800 (PST)
In-Reply-To: <258d17ec-a52e-0706-bd84-cd972780bbf6@ozlabs.org>
References: <1487367482-24868-1-git-send-email-eajames@linux.vnet.ibm.com>
 <258d17ec-a52e-0706-bd84-cd972780bbf6@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 09:50:43 +1030
X-Google-Sender-Auth: hwgnS7dCH1FJsJBj5C_tNYuPl2Y
Message-ID: <CACPK8Xf3CSFMrcNU8buQjzOAZNhFREodWcn4uwQRoxzyjVNkZw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3] drivers: fsi: Use kernel ida to manage
 device indexes
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:21:06 -0000

On Mon, Feb 20, 2017 at 5:26 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Eddie,
>
>> Fixes bad device indexes and duplicates after fsi rescan
>
> Looks good to me - much cooler than the existing atomic counter.
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thanks for taking a look Jeremy.

Applied to dev-4.7.

Cheers,

Joel

>
> Cheers,
>
>
> Jeremy
