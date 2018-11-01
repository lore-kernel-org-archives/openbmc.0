Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vpbWVkNs"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mCjM3b28zF3Lg
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 05:02:46 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id w3-v6so9364717pgs.11
 for <openbmc@lists.ozlabs.org>; Thu, 01 Nov 2018 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DxMa8GREr6B1mUmazwtO5/2rrCIuhbRaG2fibBy3htU=;
 b=vpbWVkNsl3mI5BUZGaw4l+ccoAioynKNicpf5XWQGHVhTB4EbzkgFD0VoFoQDWy9oh
 YOSfjZEXvKbaG9PZPQKClTkv4SkNirBBKpcitJWEb+1y6E0xnvFRq6E7HKcx7ODQOaAJ
 vmfmsWyaPW1hNXBAKx79j0lNgvIXh4TI5dqgGujVL7cJBLlQz/riz44nUTf+pxIw6PGK
 AvGuidFpIR9oYjhw0zbleHlJqJ4oBTo3BP6CBl6Eq4KE7vqTPsQlLenBqLJ8fyCi+6AC
 4CgjqAydeUOkrk+DAD9e164Tcjb3PK1FxggpAWtGgJ2KFD+nSHMRxYviEM7wu++4nJjP
 CCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DxMa8GREr6B1mUmazwtO5/2rrCIuhbRaG2fibBy3htU=;
 b=Fyq+4jiVrmjReT95Q/k7d8M6pjkM6mit3gGDBAA2KnpScAQihY0h5+d2+egrzjz/MI
 XLAd+a4t72bqFj/060tU+BhJM/BBR/ThDY5FV9KtE74Kh3h2lFH85UWM3rpClSHcL/ME
 9vBPvRUO4GLSrw7tGnUVbib06qGgclgp2rCZr661YZC1jg1hPZofT7/KsDpINtYd7CIA
 5Bhnc6Pzm1w3asYGkiO/c9iyfzI58N4mvVZsiY5pv+VjUx4UxOz+pTMVlu28qmUDBG5G
 YugkH4KtxcNg0wtwOavguRKuhGFJlo4yCLMeaDqd6IB8Oy6mHxR9KWpVQHa7+KtFZndd
 3nHw==
X-Gm-Message-State: AGRZ1gIzNUBYoxwfEdEml0ZTTUJ+LIf9vwQnSTFlAsqGtPjn7v2ic8G0
 6KkEpmf9Ste2Pq7CF+oTTR1x2ewT7a+6P5ul/P2eMAG5GzD3QQ==
X-Google-Smtp-Source: AJdET5da0DBlPFkz8PXHgNFENG9lpQ+YVOTo6DRqj83NVrNYb2esOk1kK/ytO1/RRrqyTIPk8S6xU6jNBmFLO2AkgcQ=
X-Received: by 2002:a63:4d:: with SMTP id 74mr5427546pga.248.1541095363560;
 Thu, 01 Nov 2018 11:02:43 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 1 Nov 2018 11:02:32 -0700
Message-ID: <CAO=notyBKmEUkVtfMQB_05uJP+xgy428Kri=JTVTp84iVcXcVQ@mail.gmail.com>
Subject: using CPP with configure
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, tomjoseph@in.ibm.com
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
X-List-Received-Date: Thu, 01 Nov 2018 18:02:48 -0000

You might have seen a patchset from me setting the language to C++ in
your configure script.

Apparently the default language in the autotools is C. Why does this
matter?  It tries to compile headers and other pieces in C to
determine if they're available.

How this is fixed, by setting the language to cpp before the header checks.

https://gerrit.openbmc-project.xyz/q/topic:%22build_cpp%22+(status:open%20OR%20status:merged)

For new repos, please set the language accordingly.

Patrick
