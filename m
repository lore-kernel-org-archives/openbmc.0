Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22e; helo=mail-lf0-x22e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E7gOXn4J"; 
 dkim-atps=neutral
Received: from mail-lf0-x22e.google.com (mail-lf0-x22e.google.com
 [IPv6:2a00:1450:4010:c07::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxpC17GTzDr2T
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:52:03 +1000 (AEST)
Received: by mail-lf0-x22e.google.com with SMTP id c80so24211608lfh.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xga+mbNlOzY+llZ/HrK4P95wgKyF6tIt3Y9sMC/FUT0=;
 b=E7gOXn4JhEs0XSiyFdMGsdZ5oIEV6dDMy5b+iAGUQBLuq1AaJnoDNCI0NR0sUxe0s9
 RLCzQN6XVkIgGGjJvyDtGSejrPCmlzV86/rTks6aXSgKtBOCywQVl5SfTHDOdzo0GfHi
 PZFDq/JUEctnvWxVVdSa4GbvK4DfoEv4HSPgzgUrAoUnBn/bw+ogub0zqXrDya8CXOwL
 ScJOBVBM9TvRBmWG2dKKYIuMTT1m0FXmQyUOrM8oi3ZFZLUjdKGQhu3O6BHltNoct3xC
 p3ypgVrLkis4yTWblS6NKTdcsICWvt7//nduJXafEENEJ0wG4X12t5ZAabN5lT28EdnR
 m5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xga+mbNlOzY+llZ/HrK4P95wgKyF6tIt3Y9sMC/FUT0=;
 b=b5anqkN4bwe1ZRBHdyk877ZWPoU3/tZQbLoJeno6yh0NstUuKKAybuQ1Ro31L139DP
 /6rSnXGpdNeMcMTSrWHxUBK+M9/N1XBHsuLDRnc2vUqI768aExvhA3TWjLd17HayHrJy
 he/w0YNgyGn6fYJbWEPciHLnwh0J1myBaAKlDEvn9sqzqzcyR1zpqrUJUCTiqpQATIiQ
 N15z1txamcrUPC+T4qiakwZJvTvp3LLzev1EdTF6j8M8V4cjWfJt+ZvO8GaNwZ26mz3Y
 U0u2kd3O4lRH5gG0RcGR10qyo3ezIk0qTSOH72zvoy0WyA/kXBjUHElGcWQ4pcUN6QT4
 gGHg==
X-Gm-Message-State: AHPjjUiGEGGQn/wHG+8WcoH90Xd8rpAzWU5elps9ziV+Yq0nIF7ICCGv
 xjbS73mO0pft6wiSChZj8BfLwD0t/zDsjPE=
X-Google-Smtp-Source: AOwi7QDD7/42zGP3IBPjmSeOagjW0qaqExRdQR0s15MVXu13fCVNa1ByOz7drt2gGsGajyfqn638pcdd9h14gYxoxvQ=
X-Received: by 10.46.95.19 with SMTP id t19mr85678ljb.182.1505202719838; Tue,
 12 Sep 2017 00:51:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:51:39 -0700 (PDT)
In-Reply-To: <20170908215728.115818-5-xow@google.com>
References: <20170908215728.115818-5-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:51:39 +1000
X-Google-Sender-Auth: G_x350h8Wxr283BRxJ6ivi9cAnk
Message-ID: <CACPK8Xe4fw2UvgvrefxfvAMRrwSgUGBHv60S6mwgg7iGVjHdfA@mail.gmail.com>
Subject: Re: [linux,4/5] ARM: dts: aspeed: zaius: enable port 80h snoop
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Tue, 12 Sep 2017 07:52:03 -0000

On Sat, Sep 9, 2017 at 7:57 AM, Xo Wang <xow@google.com> wrote:
> From: Robert Lippert <rlippert@google.com>
>
> Signed-off-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
