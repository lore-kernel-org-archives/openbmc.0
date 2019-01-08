Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="O8OE+R/f"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YbTy2YznzDqNj
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 13:16:22 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q8so1525377qke.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 18:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDfPAm1eNmr6tdXvGswzPzBmXKG+n2Vu8I/Geznuchs=;
 b=O8OE+R/fxsDs6iMj+f5s316Qid6hGbeRaLwmlvfQmfPVFb1T0XU3+SF5UIPSLGAKnD
 mO1snVyfQ8rCDov0ufDHsu0oVYWcZ6XcDkLbmNbSybQ+Gk2yb+qalVyHP/fCdhcFWmcm
 GoPEScOgNcO//OhVjMEQgnQHY4odrmuVixKKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDfPAm1eNmr6tdXvGswzPzBmXKG+n2Vu8I/Geznuchs=;
 b=Z7MVYBglP/vJl7Zi0M2EjKaCwqH99bQoticsUMBKG5fe0DAhEv/qlzYyWmAv8MnOhe
 inLwrgSoIlkcd+gkJxB5nomrAcp032zJZ7ry4gumNUYpp3Nmddk9i/hbhfTwcXjG8eJG
 EMf39XsjOgDQdTbcYWwBSL8J6fiqZdewVC85pXmc20Z1+O8x4exwT7dnmGONGITOFCIK
 y/LHjrEY3mRNI8Hq0ixdVjmd2apqjtfJshhzQMt5KNSSejgXmgJ5198JGTtysZIUHPex
 9k/jnmV8LN7yn4Ua/D6F74tWDTjAXMBqZXZlYxq3ibk+4/woRpWJMYGqjOymvFdPcXyS
 gdfQ==
X-Gm-Message-State: AJcUukdpRZWFt8dduZQeK7IR0Xrw3MK3TNxkouPhrRT3eUC6BcQIKqKI
 E2Vz65jtwKinWI1LeOpaIfM2sOnQNZUU9apAfNQ=
X-Google-Smtp-Source: ALg8bN5buG48iEei0yes12HVJZQNt7Ou2yXf8GhKKB668tGkzn4maN90AQueuwuZQn8/YWRneDqdo5TekeiBWn7ufr8=
X-Received: by 2002:a37:781:: with SMTP id 123mr59421555qkh.231.1546913779894; 
 Mon, 07 Jan 2019 18:16:19 -0800 (PST)
MIME-Version: 1.0
References: <1546552448-22621-1-git-send-email-eajames@linux.ibm.com>
 <1546552448-22621-7-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1546552448-22621-7-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jan 2019 13:16:06 +1100
Message-ID: <CACPK8Xez2dZ78biUOg8tgUaLLpFvwnaOGxqFcYrNJN_XpPb-Zw@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 6/6] media: platform: Add Aspeed Video Engine
 driver
To: Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2019 02:16:22 -0000

On Fri, 4 Jan 2019 at 08:54, Eddie James <eajames@linux.ibm.com> wrote:

> +       video->eclk = devm_clk_get(dev, "eclk");
> +       if (IS_ERR(video->eclk)) {
> +               dev_err(dev, "Unable to get ECLK\n");
> +               return PTR_ERR(video->eclk);
> +       }
> +
> +       video->vclk = devm_clk_get(dev, "vclk");
> +       if (IS_ERR(video->vclk)) {
> +               dev_err(dev, "Unable to get VCLK\n");
> +               return PTR_ERR(video->vclk);
> +       }
> +
> +       video->rst = devm_reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(video->rst)) {
> +               dev_err(dev, "Unable to get VE reset\n");
> +               return PTR_ERR(video->rst);
> +       }

Once you've fixed the clock you will need to fix this too.

I suggest we do this before merging as it will also lead to device tree changes.
