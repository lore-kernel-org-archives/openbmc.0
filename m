Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wst4L68YszDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:07:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RzkeHmRC"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id i80so324774yba.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=gtOGuPM/orDNDI3iH6Y8SJTt9ZxI0Dzk6Zt04kY4BVE=;
 b=RzkeHmRCD+0WOvscDakQCg51s60ASGsZXZHwT9o2s/B92Q4SafrQiU1VoAkDbGs1QE
 yHaxxetqgnsoBThQ5HxHxQTTWRP6wZE5MmTVxOVfll54qqJ0nBFjR5SkUNX6/fCD3ZPD
 JUVgf2ciRewckCz0p7wVJnfG6AXSjOuUQyYkyn8f8Z8/6n13xTDKNUucVjUOoeOy63bc
 UO3BPvf7Ad5rpyxBiACAYhMiFjBGfi6OkHqSxRQpnR+0eZnXpWVy5jWdFat/zM+F7wq7
 FGvK6+kojFhwS+ZBWawuTWGorpOHhra5M0Tek7FDsTNr+ggk2T+uTy+1JVH+fOOqgcF8
 IO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=gtOGuPM/orDNDI3iH6Y8SJTt9ZxI0Dzk6Zt04kY4BVE=;
 b=LnmdNijPAleF9bqGTHZKsCo5p20NnYFSs1qiwnT6+7ZMyN2oChftZAzMe2yThLcizy
 pdw07Q9nIB9e96Bi8m6sKQKz1rASIESxmqp0afVgr2K5VQHBXvrhC6sMFfZfSwT5k1Co
 YLWc2P2Uj8llYO7cFpaz4aOND5w3IIn4HXgta23Hvs4FyCiAAXWOCpPtzIY/af2Sq3Xz
 DAMIV2mb3CsTn0YhTmLj0EXD+t65uxnRVZ38oIG6VVDaApRt0yW9dhw7Si++jK8yL0vT
 OBBupRoaTGQy2bVdqeQgQtpPy4cZL/UzI3ETNs+uoxCMHTSYat8r556qiQw6RgusH87O
 LTmA==
X-Gm-Message-State: AKS2vOxmZXEbf1O3G9ZOGdrGoZp3FLcNYGsuHAAVcJ4nXrBK5mENqho6
 njmUzDwaq5GRV/8WkqLZHRsjkLeVXmsp5C0=
X-Received: by 10.37.88.193 with SMTP id m184mr24443317ybb.39.1498021632270;
 Tue, 20 Jun 2017 22:07:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 20 Jun 2017 22:06:51 -0700 (PDT)
In-Reply-To: <20170619035549.18773-1-joel@jms.id.au>
References: <20170619035549.18773-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jun 2017 14:36:51 +0930
X-Google-Sender-Auth: m0jBf1cPr01bw5zoXBYyv-uCZso
Message-ID: <CACPK8Xd3AdtSURm_p2v8bU9MS4oqs9bxeojEXdoGbsRoZBnF9w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/2] iio: Add driver for Infineon DPS310
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 21 Jun 2017 05:07:15 -0000

On Mon, Jun 19, 2017 at 1:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> The DPS310 is a temperature and pressure sensor. It can be accessed over
> i2c and SPI.
>
> This driver supports polled measurement of temperature over i2c only.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to dev-4.10.
