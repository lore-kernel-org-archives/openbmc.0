Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfR85g4yzDqZj
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="btGYoqZG"; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id i34so55576418qtc.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hYMyjUKB/2zueN8oJRed4dikIqqmTx4F+kfp2jQM/+M=;
 b=btGYoqZGrpjEDQmhGorED8sGNOwasvDKUbi3y7Zws3By3F4zB8RxMdu/lX64kgUuXX
 2slFeS0fzpW/ec9QcuzhZvc8vWS7/YIUDctAy7tTeEW8Lq0/33hNysKeNkgfZ3cAmYNM
 Fu+diHYs0ljbzZds5asL1rDn5kw1s/gs9gnz0O9fcB6h9RLefBSlgEJNVvW7PPG0A1sn
 mbppaf2hVGv5CdQbj4TndG6IO11G51/UCAVZK6+UIpFd3Nglcf2/T9EWd2ThJc2inrRZ
 AcxA80zQUyvk92YJhwhGaDWvIm30Eu1bVdrykVzyk5qU1ncf7RnIc/OaSwGsZyMdePK4
 gylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hYMyjUKB/2zueN8oJRed4dikIqqmTx4F+kfp2jQM/+M=;
 b=TFWeuqDAb41hpkxKpZGGACn5MGXUiKwU8R16zNVSrl7yDOx8WglXxewaHyCXxqcwTo
 ERgSyJAkJU/5BreU/pithsqEsatO0A2WWUjPsQAh2EKhrKKTi9I7op0Y4BQdU+M4UHKP
 eypb8mcEc1n3M1aft6ghyRs2hMWU8GVZS4SPp+BjSX0lImL/K7D/KPCD8UwIXOrlyNJp
 DNbL/VRdCBfH4kj1GpHzKf3m3M7C2U2hmBRLB+D5M7UvB9yd8kVS2cI8w/0Wyj3gf2X5
 Q+8rncbe9xoQVfqvIyAKg9mYIF5TbJ7A+ZeLzn7mBihi2gUd2Yt267fVpKLMjGT6mIHT
 u/qg==
X-Gm-Message-State: AFeK/H2GPHwW0SfxhGYborWMLxiw954Pls6zPpU6P2QYDPAVPY30JkWN03h6vOYQ9ksVo8wkFWOOJtIiLJT6iKqp
X-Received: by 10.237.57.164 with SMTP id m33mr26706731qte.293.1490678545642; 
 Mon, 27 Mar 2017 22:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Mon, 27 Mar 2017 22:22:25 -0700 (PDT)
In-Reply-To: <3236642a-3907-d54f-a091-6a952d8ff1c9@mleia.com>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
 <1480467618-7497-2-git-send-email-brendanhiggins@google.com>
 <3236642a-3907-d54f-a091-6a952d8ff1c9@mleia.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 27 Mar 2017 22:22:25 -0700
Message-ID: <CAFd5g44EvJoZezud6QHMupY4zz2b+VpgvJFNDXz3AsOaAGHdjA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] i2c: aspeed: added driver for Aspeed I2C
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Kachalov Anton <mouse@mayc.ru>, robh+dt@kernel.org, mark.rutland@arm.com, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:22:29 -0000

I think most of these comments were pretty straightforward except for
pulling out the "struct aspeed_i2c_controller" into a interrupt
controller, which is now known as "struct aspeed_i2c_ic". See
https://lkml.org/lkml/2017/3/28/20 for details.
