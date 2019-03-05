Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jnL7yIxl"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DP1r3Xt6zDqCx
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 04:26:07 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id t7so8099446otk.8
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cFF68qis7/N5zP1tBDjfFNOrBzoY+W0jHuv+By7R/z4=;
 b=jnL7yIxlLmg2y5l+HZGIw02J4KfLAY71E+QQs5FmPl57yiTUCV19X8mUuNJ7yL0Edw
 ULWkhOt/7iEDm0x1T4bGngZqUaCzPFyi0UTON23FQf5gUYTalC+uOxs84kUREaylSQQ2
 O62MZp+ckmZ4ZmffgwjTLyKQspFE2UE0ksS8hsh0tota+obElBesrU/Vt6xdexz2NDiz
 PHRodaq1jAFag/demQc9jAwcP67V1TS+R0FyB6CtiE3uF2RbwW3/yv5ZDNGWQm4e58h+
 vGQuaoOBJZUJCsgedJPmOzisrkb7mf4Trku/3xdyZM3TlLq9K1Q6n613uY0teq88SD9Q
 0yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFF68qis7/N5zP1tBDjfFNOrBzoY+W0jHuv+By7R/z4=;
 b=od4M2bhamaDzmupPvszZfPWbmBxRjq1KdUEzJQKf7TtbiC66aWUAr471Tnnq317wez
 NYsR2YKWEH0hvMQGvZS2mFjpbFqJ0LYMriDOhcbqRpvUuixpP4nFZjAFMF/e44/mZ5cG
 l4zqhP0xi4s/JjUtwCKWWtFG4fwdOG8GBStu4CLr0/vGMr8MdSyq2LZW15NpeVWWodle
 PIEKOJqGslyNqbgWpGvp1npcmDDWNA5KNaRuJhgLDqDkS0s4bvkHUM2AKMPocNhyHcSX
 2if4BHbjRqfIq5bxzTlxX1M/PK9YkiDfxYcX1yfgN5j/yGi70A8IzfKY+NYkbkNx5rb/
 vrkg==
X-Gm-Message-State: APjAAAUWswKdAUlAtk8rc5RIiJKYL5FJKxvou1rog6T/Omhpqy525LX3
 Kk06cdCBP/xbPFYPJd2b2gmVGGw8d3YDf9+PwTg=
X-Google-Smtp-Source: APXvYqwiZ4usnxA9pQFYfdowTB0H6+2xznruWlpG3LvE/jrjyRSWw5TStPByIJWRp0cmhYzW7oGfG7l8WapUykQ/8bs=
X-Received: by 2002:a9d:12cb:: with SMTP id g69mr1677512otg.150.1551806764245; 
 Tue, 05 Mar 2019 09:26:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwtEi-z1BW9T6mgTHz2uF5Y9=O=N1JpXK0sNNVyajjsGw@mail.gmail.com>
In-Reply-To: <CAO=notwtEi-z1BW9T6mgTHz2uF5Y9=O=N1JpXK0sNNVyajjsGw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 5 Mar 2019 11:25:48 -0600
Message-ID: <CALLMt=pdTeDDen1UWfGae4oDzeZoUD8wYD3YDOzsTL60YDVYrA@mail.gmail.com>
Subject: Re: Bizarre CI Failure
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 17:26:09 -0000

On Tue, Mar 5, 2019 at 10:48 AM Patrick Venture <venture@google.com> wrote:
>
> https://gerrit.openbmc-project.xyz/18327 is failing:

Yeah, better open an issue on
https://github.com/openbmc/openbmc-build-scripts/issues
Some sort of permission issue with the generated files from the docker container
build. This repo is pre-built into the docker container and then when CI tries
to rebuild the repo, it's hitting permission issues with the
pre-existing file. No idea
why it doesn't recreate in your env though. I verified it hits multiple of our
CI systems.

> Patrick
