Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E1L+YmUO"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Cqvk4hyLzDqDS
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 06:33:53 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id s22so3736304pfh.4
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 11:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=dCo6msSXRNCzhdOYyBb8KZHO3V0rdMh66uB2YzEw9KQ=;
 b=E1L+YmUOc374nT2KEwZlceWzF1BuY3ExbG2MINCB6OjHIvM5T/gre+U+pNOkcUbsIu
 8XwpSRqRGw+OgVS0ls17/mTrmxaKxXzqkPgyi1SajPR0YDJym3C8JFq9XTxR0T5GJ+k7
 UXWTndlsTIOxhCj3kllSibIjKOswWCRX1D2lwLJt3CRPaQ/wXVLfg+v9dFbvcxJIW1nE
 eGrQlMMfBjkDEd9wfsZbZR/w3RqzejeZiPWTgP9vDPebRyqwQxeCgx67ljINQmn9pvuL
 7u94YR5Rh4LqsdpYe6l/EPTelnrjWI1/OALOifCJwWRbOcgV/0Du22gXoZSXGPGkw56F
 a2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=dCo6msSXRNCzhdOYyBb8KZHO3V0rdMh66uB2YzEw9KQ=;
 b=ZJnO0yIc05U5+1h47lAv5DoaD1A4cqd1kSc+tg9b6EKheZRM3mvXr4iNtsv83Y4JMB
 UO1AX6HTYol8g4tWHQkziz7/ANwttcPBnQeIkRkzagZ1Acno6/YkE1xLWsTfA3MOJZK6
 1ipKNeuGwWZkvoq9o8a4DyNoVSWlU7sNI853ccEHCr+U1zJ/+zmRY8SkVQRCkC5tcHXP
 DEg2s2q8M3OKsO6q+YYFlQ9nVculn/KsdO7ASXBQCdBlQNspiIym6Yk6fMsywrKS7OgD
 vCNvZjgovriE+ogzc9B5ocC79+mpSdhlb1Q5FhrUHo/EyQPj5TKjiZuuNHhKCHrQZ3tA
 x1mA==
X-Gm-Message-State: APjAAAVCLmE6X14304KxC7EoKoMb2lSyWxjIhxXR6MbVrZKyjuuUMQv9
 5bswDw38yR5CQQse3DEZ36iaqOYdLmuvLvw1nNMCp1RJr5U=
X-Google-Smtp-Source: APXvYqzttTeX9cqIarL2heVcTzJjI6bdmUvR0p2w0JdKZ/alMn2CiF7LLzsIsraFJ/GC/F9jeuhjGH3I1fqEdCrPBHQ=
X-Received: by 2002:a65:43cc:: with SMTP id n12mr19230318pgp.218.1551728029836; 
 Mon, 04 Mar 2019 11:33:49 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
In-Reply-To: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 4 Mar 2019 11:33:38 -0800
Message-ID: <CAO=notwZ0RX2WeqyEFgNBYYaYL_eMXjZzknpfwwGuanT1WpwrQ@mail.gmail.com>
Subject: Re: new repo request
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi731@gmail.com>, 
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 19:33:55 -0000

On Mon, Mar 4, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
>
> Brad,
>
> Please create a repo: ipmi-blob-tool (or) phosphor-blob-tool (at your
> discretion).

This codebase is meant to run on the host and not the BMC, but will be
specifically used by other host-tools talking to OpenBMC.

>
> I'm going to write up the blob tool as a library and then a small
> utility, and then use that in phosphor-ipmi-flash so that we can have
> other blob tools more easily.  There are a few other use-cases we've
> run into, and the core blob code for the tool currently lives in
> phosphor-ipmi-flash, which is sub-ideal.
>
> Patrick
