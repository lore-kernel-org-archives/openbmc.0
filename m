Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cyynbDDP"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nO5A57U5"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w1Ks4kf5zDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 14:42:25 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id d125-v6so10523158qkb.8
 for <openbmc@lists.ozlabs.org>; Mon, 28 May 2018 21:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dyC2FEzW1Q39oodhD3FiCZfjUD9mKeSUVrLOoGak4BI=;
 b=cyynbDDP6dqE3xhUCJ0GvfaUFFl3TRDOSb6brm3/z+YYYM1MxLYaYwOm7m+2tggEKw
 r8GN0uuYj4mRtXWRF46n5Vr4YQUaQwL+g0v6WoRyZsy6qEqC1WtPJLgMgNVe56pNeAEd
 e3Ko787GvJy6D7KzkIAKDMyhiSQOsdpYw6ktuxRZcE9g7DChlwMtvBK0SLOSHzGaRXsa
 LDSILHD07GMKBmAaIcHkyDE+ahywJj6F9gsAPk7LmvbjySQ6/JB9Mjfyt4YyMhHCNXpt
 gJHFBIYdqHvXjLu5PlpG1030CRaxp3p/vfZfcfiUWDo0PSIVuwiBEyPKUVD4YdZUSUk+
 e4xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dyC2FEzW1Q39oodhD3FiCZfjUD9mKeSUVrLOoGak4BI=;
 b=nO5A57U5O0uEM8qeusU+O1+/IxooiUpOx1+dQHqBemz+hC9ZjTJfAfo7M/qCezkS5K
 AZteFAJ7Bw4aYHmEG3NmCcToeMpCf+6nvEllgCCjMBMFBFr+YiQyJjFz6P86uvIhcbMO
 lYKXXjJ7Z376DbJmxc0a/GjQlEDJh82sUKfzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dyC2FEzW1Q39oodhD3FiCZfjUD9mKeSUVrLOoGak4BI=;
 b=pfKp6UpeglUy7I0RWD5ZU15RASZuGwC0Qr4n021EiGAf070xpbioHamf94MS4rqwf5
 BdjUMmU0jvIxX43DJdL88nRGf/skvxj7EkCUx1dfsTDvvRoQ/FxuSUjCHNELsKRxJCOq
 MW+gqAFgYyLodbm/FTY0O1hR1vJec9JEg5TqNraE7A4FniA2+OEEqUkVCJ/PKexzQ1oZ
 P8cY2wqcq/PGBAOWefzouwzgef2vWYNpEKMd0AKTcSnJ2GzlluOsHEHjc+1XNkQyAUDS
 f9SCgxbFIS6+4TqwwBCXHeatYxxcyXDyCvTZ5q0mPeVkXPbZzKe/8qbwZ8D/OGE9HKWr
 r/Wg==
X-Gm-Message-State: ALKqPwdsq/7NVYMOCI1kEDr3aMbtNZoMcDZv45nWYpgIM8/Ik2vp87fo
 hhsDBIhhdnAR8wAF8wAjiDVFCcmKi7EXzb8rhoY=
X-Google-Smtp-Source: ADUXVKLOo96Rt3RllinDZ4gMLOrWq8zyU+I0BXoeT3TzLGRTT/cKpR70iJScdarYJkilYudxPCj/mI05TeY1qR4d3bo=
X-Received: by 2002:a37:1314:: with SMTP id
 d20-v6mr13787860qkh.422.1527568942762; 
 Mon, 28 May 2018 21:42:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Mon, 28 May 2018 21:42:02
 -0700 (PDT)
In-Reply-To: <20180529042833.11158-2-benh@kernel.crashing.org>
References: <20180529042833.11158-1-benh@kernel.crashing.org>
 <20180529042833.11158-2-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 May 2018 14:12:02 +0930
X-Google-Sender-Auth: io8xhO0P7SNLhuTgNzuMElGw4bw
Message-ID: <CACPK8Xco8zzbyTZT45ER=b6i+p1_7a+Cm2WTdqP5bYRe3H2YMg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 2/3] hwmon: occ: Avoid displaying an error
 when host is down
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 04:42:27 -0000

On 29 May 2018 at 13:58, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Instead display a much less scary informational message as
> this can happen in normal circumstances.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  drivers/hwmon/occ/common.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 365bf207cf0d..0673af00a99b 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1359,7 +1359,10 @@ int occ_setup(struct occ *occ, const char *name)
>
>         /* no need to lock */
>         rc = occ_poll(occ);
> -       if (rc < 0) {
> +       if (rc == -ESHUTDOWN) {
> +               dev_info(occ->bus_dev, "Host is not ready\n");

Given this is normal, should we make this dev_dbg?

Otherwise we see it on the bmc serial console every time we boot the machine.
