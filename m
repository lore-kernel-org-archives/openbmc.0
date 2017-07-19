Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBvv5JnmzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:44:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n2Ag+Tmt"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id v193so2340627ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+bNmfOqQ9l35lme/OhLJpZPI0HwQ6OCklf1h/RHbPos=;
 b=n2Ag+Tmtzz744RvUnwTo+54SA/6DHlpO7gFAu6Zt/dEVts2sDITXQpTIg7HXtwmBDp
 AYWgECbKRPfA7I0rxqwG/e4yEw0d7F9rMg3r+Ro41QAPMlYBdUgWY8Xexdu+QWuIJRWV
 xzBx7ge1IEw72Nj8NvwjPpsJDBr9rh6/R035xgcSSkUYatIMwKxbjHJkYWlgKScY6VQV
 wHTA+HcNGEQ55zS+rhLs0RMFV2T0lWpFA9svC9vScnfFe7/Vd2SXeC0QkQepBj519mRZ
 FRaNaTKODTSs9LXX/DQFZC7ZMpetcZDd5BphAqJzZh50tKwi3m9zoDaA3464mlpSbDB8
 ilqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+bNmfOqQ9l35lme/OhLJpZPI0HwQ6OCklf1h/RHbPos=;
 b=ar8tMFMrxk3OG81Yh62jaJwd1rcI8dPHPk+b072slatsP/o4RjF1uwM3aMR3rIme8n
 sBlhzwoxZqTM+SVhP7iOKQLf4Xn5cdThc+Rmj8zV7Yuq0wzbB+S6ynStfFRKug+7HzuD
 9nEPjxTWfbA4LbnH9cxntftSdtBxWoGVWupTSoiq8R7FGJdt7vcNB3z/uqArDhXi97tq
 k3QgbORHmOCtVv8pDXdUgx9nJW8U7M3GAmvRUh9PK7GwZlSlfK4z3yxW3dqM/WDHUgM9
 uVQ/qMQXuwD71+D6ikQfZMeUHs9vbbhY6DCTNwfv86XXsSBcNU6QL+jKs/OEb8njdFZT
 maOQ==
X-Gm-Message-State: AIVw111X0fYG/VLKK2iTlcVLe6kShi2/4Gl/5w9lzR6dpkHxyqxGBRmG
 zzHoLz5nh1OvMb9uG/1gBVgA9keaxA==
X-Received: by 10.129.164.77 with SMTP id b74mr1384252ywh.235.1500457496985;
 Wed, 19 Jul 2017 02:44:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:44:36 -0700 (PDT)
In-Reply-To: <20170710155958.7644-1-cbostic@linux.vnet.ibm.com>
References: <20170710155958.7644-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 19:14:36 +0930
X-Google-Sender-Auth: LnT5ypftutTd9Fsolq5SQcG3DQs
Message-ID: <CACPK8Xe=YJdw6-bbHzTnSE6we8Nvx=ieJ11AAu7KtREknsv24A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add fan fault optional
 parameter for max 31785
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 19 Jul 2017 09:45:00 -0000

On Tue, Jul 11, 2017 at 1:29 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Add optional parameter 'fault-max-fan' to indicate to device driver
> to set max fan mode when fault condition encountered.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.10.

Cheers,

Joel
