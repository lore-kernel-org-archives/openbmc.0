Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com
 [IPv6:2607:f8b0:4003:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVrgk21h8zDq5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 13:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SAtLhBk3; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fw/nYLYU; 
 dkim-atps=neutral
Received: by mail-ob0-x241.google.com with SMTP id wz1so2507705obc.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kfWpdLMmmuPBAieymgtd14696ggm2Ro3IusHXB3Qgyk=;
 b=SAtLhBk3s2WTdJQsK+7zZ0H9ziwZhUCazx+EveFn6Hfvu2PKe5ZFBHxd85t8CnMFZg
 0hFRkM5c4xamw2TaukgtK7ttUAJMPNoJ578W3aiw0pUV3byipn/IC5Zzw+3Ww8d2htgc
 U3NpLNn+DNKXaM1oUwZJvVZTxt8uP84CMNngxi0ZzpCBoocxDhxYGHF5dtB9jgGA74G5
 4Tev9GDZc95QmG3wuAQZjPW5GJGOd8LglPtN68n760mJWyi9HFkQLytcoTW0qIBAcBO0
 arGZTU497b4tzYqpBDSriVIiBOEosYM9iMCczX8TkuZo59kVRP/fHxZMbY4iNPsrSbsh
 CVeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kfWpdLMmmuPBAieymgtd14696ggm2Ro3IusHXB3Qgyk=;
 b=fw/nYLYU/76ZR6oOd6N8Q/uvDOn/mJhfgsqN7w+7dVe1JRq5kS/KW7TNGNsQ5orSdX
 83WkkaL3LunCmFbHy5a+8SkPFntpIdiIcOOLfjy8YIHx56t4PE348hjURHeklXqDuLKK
 w6djooOoG38XnMm/yZY/WnhYKl1FDZWo09rek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kfWpdLMmmuPBAieymgtd14696ggm2Ro3IusHXB3Qgyk=;
 b=H7ovZv4/BV0jNjfTtvibaWMv10QQaf2O4c+4VqXVzEK2+zs3YFZuEpHABV9pcko6tc
 2ttFh/myBhKw4A2p9VmyH/w2gqctvfq1u/OVs9zDAzAfWqtjloCHiIS+FymrAiETrgfi
 PS+7PwXSWmxupP0HzTkaLwrXQPtRmRXegKLkN0KFTmoihOrGRIbuhcz22VzQk6eqVs0P
 m1+CcMSYQFbnRg0OkqhsdcTZROaqoowbBF6ygpln7ynVBgoS28AttgWgTI+d7WEzhUkE
 aHWiHwfa5vZIr2abKqqr6MLlxjYIWE1BpSsWXQrRKGueF5yy+2MSxlp8rRmFqhuNrCZ4
 3dLg==
X-Gm-Message-State: AD7BkJJ3hhn5xWo32GaXJWsBuOIKt4LVgW67xAfhJCNLIyCoRAEN3xhGHesH5gPJDou9yfTaqglfHwZEP9vRyw==
X-Received: by 10.182.97.164 with SMTP id eb4mr3217307obb.39.1458788224082;
 Wed, 23 Mar 2016 19:57:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 23 Mar 2016 19:56:44 -0700 (PDT)
In-Reply-To: <1458720215-25302-3-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-3-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Mar 2016 13:26:44 +1030
X-Google-Sender-Auth: bnFDGS4CYqAH4xA_q-xj5AiAfIs
Message-ID: <CACPK8XdWZeuxF-fsZAxWGL370JAEtY_mum==r4cuA_haF4Z6Sg@mail.gmail.com>
Subject: Re: [RFC PATCH openbmc v3 2/8] runqemu: Add palmetto target
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 02:57:06 -0000

On Wed, Mar 23, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Example use:
>
>     $ bitbake obmc-phosphor-image
>     $ runqemu palmetto slirp

I like how easy to use this is.

Is there any way we can keep this patch out of meta-poky?

Joel
