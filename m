Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rSYSBLyn"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420rgK1GWQzF32n
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 02:29:32 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id r4-v6so4789638lff.12
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fnnMwtUGpNpGKZEZxuxgIOViX8d4EA3yG7b28j7vNDM=;
 b=rSYSBLynat/muVsEOzAJeJu6b5vmGdV5Kk8S8dHL+P/I/CnQc+Qkg8bYSz+SOFcqL5
 EN61Fyt5XuJwVGgwlcqKlacqie/OHFonzQmdNOazmaanSLElYlmisjJt/0m/EugJGx4h
 SDHBmqcPM9o0bPwVSRULW4epDCRyuKWVwHzjj5LjpzfM7Dz0/VrIPvfLYt10xZlNC9/s
 TB0CqpIsj6nEvIDDGJGJbsHa+kkQfBNLHH4NjpvStnH3m/MDDDhtDQdJM7oj1lDRHub+
 bsTLrX376bpnWDrKAGNdM6jbV6hwFUYIDb9Y3Ui9kq4irUc+3WjesUqlJdNJR42VZilU
 3Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fnnMwtUGpNpGKZEZxuxgIOViX8d4EA3yG7b28j7vNDM=;
 b=o/6n1wHXg+alV5flGn6Hr7gAbcdXo0XsiZzDy3lAsB4zYV/vWG5F3nFXW2SZt0ywT/
 fnjHF77pfswoufGVUcsDJUWUZBRfGtNxybPLzzGsUzhT51z9UUIuBXdyZ9P49DPVlcQn
 5tWao7m58UafjEJH9qT1mEfpM3zDl6kI8yj0T7tc3e0bvLzJCbIHZ3wcw9VzbYoucpVH
 QlQcH/agiW2Rib6RPvDoa1gafrc1pKkpJOCDkYn4HISf06SCgzz5pIuACEB67JyU3g4S
 kRwMVUmXYu3iq062mcLu7YxU2gZZms6qeVADVAVnwTeFqJaaPl3C0xYd4je/GA4qJqF6
 DeXg==
X-Gm-Message-State: APzg51BNNiyO1ZHQbDSwIICZZb0XfwqyPAgyot32EmNJVwo6ytdJfE2P
 w2iE8bsUxwpb25BzcGtAr8jqoz+tl8yldSpLO+iNXQ==
X-Google-Smtp-Source: ANB0VdbMjfEnDpv9flZJ7SYs4DDEblu99Hkj70SaEnRUap0HwETJzUaeBW9hRtnqcx3+1CDjNEAZMOUc2eYZB3HXpnE=
X-Received: by 2002:a19:b24e:: with SMTP id
 b75-v6mr4768530lff.138.1535560168591; 
 Wed, 29 Aug 2018 09:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
In-Reply-To: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Wed, 29 Aug 2018 09:29:16 -0700
Message-ID: <CAPnigKk0USYdx7iJNtei5rkuutvKWqxJoKhBpQNj44+BVOabNQ@mail.gmail.com>
Subject: Re: Single-Source
To: Patrick Venture <venture@google.com>
Cc: bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 29 Aug 2018 16:29:34 -0000

So I've taken the source from
https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#clang-formatting
which closely matches what is in sdbusplus and modified it for the
projects I've created to better enforce the style guide. I don't think
it's possible to have a single source of truth at the moment since
some projects have more relaxed style. Although I don't think it would
be too big of a deal to force those projects to reformat. My current
delta between the original openbmc one and a more strict formatter is:
diff sdbusplus/.clang-format sdeventplus/.clang-format
20c20
< AlwaysBreakTemplateDeclarations: false
---
> AlwaysBreakTemplateDeclarations: true
45c45
< DerivePointerAlignment: true
---
> DerivePointerAlignment: false
68d67
< PointerAlignment: Right
70c69,70
< SortIncludes:    false
---
> SortIncludes:    true
> SortUsingDeclarations: true
On Wed, Aug 29, 2018 at 8:54 AM Patrick Venture <venture@google.com> wrote:
>
> Brad;
>
> While working on updating the documentation, which holds a
> clang-format example in it, within the markdown, I was curious if
> there was a single-source of truth w.r.t configurations of this
> nature?  I imagine it hasn't been an issue yet, but I'm going to
> update clang-format files to use the header inclusion, once we settle
> on the exact pattern, and it'd be useful to have a single-source file
> where I could make the change, and copy that file out into places --
> since I'm not sure of a reasonable automated approach.
>
> Any suggestions or thoughts would be appreciated.
>
> Patrick
