Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eLTfNGOc"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420wWs3xQjzF321
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 05:23:20 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id b11-v6so2726451pfo.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 12:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRYVktAg7MZIoZMHCAU8hZhpdnxoumYVDD6RFsOssvY=;
 b=eLTfNGOcKtin4+iip22NHvDcBRklrBMesqNiLpSnG6GJIOSmegcsMRU9b6HSry5s6f
 D9AiKeGJipclo9DTrWMNkpjo6w9t/AVlPzJvlt8M24ti7sQMb6/GOIqI+4qxgELvloZW
 mKgDzJlHKVJUoYIJi7wc6eWg+3HOMbj1SGLpFAdOncH0iArY7W3R529CLgByIn4+yCaL
 K4Dem+GSUG4O8G3z6heroN0jnMj5EV59khI+zc7S86W+G0eePA/EAbLShjmrUA1cxyfa
 NyAAQKfCtH4gocbyZrxsQf36jxrQlBJB/Ykwn0Fj1G/ZuJbBiL46/EtQuFubaoYBZi5W
 5z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRYVktAg7MZIoZMHCAU8hZhpdnxoumYVDD6RFsOssvY=;
 b=nvlupcmkm5dqoK/6bXAL7DMZaMuLeJD58CZgxKvu2/q2afsQKisHKX8fWsml51GkbG
 qPFmL1IwDQsMitM+WnoIAkx/wfua4by/KO+S5hi9bvIugs5n1cu5i9qmX4zRX1rJ9IQw
 vrNOHAYSRKyQvchNHUMusMAoox5UuFtJ9M5WfZAEyozXIt36AYKlzcnzV/WcQVTgYwPK
 NFjMWIktimWUcjA4yvSyRG9cx/Cu69Fjy6KaAeaviKXvzwxDVhZ5+37qhzkUtAQN8JJT
 z4g44Nqy4gg58CKGR3g3LwL1ncPIVWXoymTaAcf9A4JP1yS/AsJe+dWgCL1+qtV5IeJM
 gyfA==
X-Gm-Message-State: APzg51AtTYfNdnBjo9ayUvBYK1yt9hovtIBK6dDgjI9yJMGZOKIEc76e
 yY21iL86UlStryCEakSl91P1KHMAIfoHqIK2FnDH/A==
X-Google-Smtp-Source: ANB0VdZr8FS02fIasirPl5H4r5DtQtJ6a7o2/VW5pEJ+6M22teT7HwjrLjy4/Zi6Bg5ooZI9m+tCi0yKmtVPfQbw/zA=
X-Received: by 2002:a62:9541:: with SMTP id
 p62-v6mr7344946pfd.194.1535570597910; 
 Wed, 29 Aug 2018 12:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
 <0DEA9298-A196-44BC-AEDA-A72BCCE93D77@fuzziesquirrel.com>
 <CAO=notxhB1dGiUwO0GiYQvJ0kxXu59C0hdc+MaFtittB58dwew@mail.gmail.com>
 <6a147d6f-35ee-3310-b671-cb886a4655df@intel.com>
In-Reply-To: <6a147d6f-35ee-3310-b671-cb886a4655df@intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 12:23:06 -0700
Message-ID: <CAO=notwbkA8Ewm-HbL9KQeNZPBvr+WvLA882agq=f4OsBNHW7w@mail.gmail.com>
Subject: Re: Single-Source
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 19:23:22 -0000

On Wed, Aug 29, 2018 at 11:26 AM Ed Tanous <ed.tanous@intel.com> wrote:
>
> > still different to read every repo.  Of course, the clang-format
> > doesn't do variables names (right?)
>
> clang-format can't do variable renames, but clang-tidy can.
>
> I've been experimenting with it a bit, and it seems to work pretty well,
> but requires a lot more work than clang-format to get set up on a given
> repo.  Right now I'm using the CMAKE_EXPORT_COMPILE_COMMANDS flag to
> generate the metadata that it needs to run.  At some point, I want to
> look into doing that automatically in the build scripts, but I'm not
> there yet.
>
> A .clang-tidy file that approximates the OpenBMC style guides naming
> standard is here:
> https://github.com/openbmc/bmcweb/blob/master/.clang-tidy

Cool.
