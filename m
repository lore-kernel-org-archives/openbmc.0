Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::22f; helo=mail-qk0-x22f.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qsbHKDMI"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EiYFG9IO"; 
 dkim-atps=neutral
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RMhq3YyQzDqZH
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 12:03:22 +1000 (AEST)
Received: by mail-qk0-x22f.google.com with SMTP id c136so3928883qkb.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 19:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=GjGl6/AJxZH9BgTW35HKatrp+tpjg6c8756mhke5QQs=;
 b=qsbHKDMIOYy73JpW5S6EEcdUSecqXa7sezizF2EwpyMIlgMzhJ3kkz2LUMY0YrFrwy
 MizO7f7C8HKNWHycHK3WwQ7SKS9QrLyNZBKJa9Zim3WHPvZTgLTQm9FShatOwafdLDo2
 h87SJsidAa8qPs9aWGJSHjHQEE9WRG6dHzW5Xr2gQRzzs5qICfyDFzqFLHrE3MFcuejm
 jOxQE3m97mIP90n3aw7QVkH8BisojuUhGB2ReBAch+EU1/8s3GcogmcKGP92dDydFo+A
 +fus8eTCpKAMOAtSBW37PLv81UYJyTuUEpNtc4fWQSSB2gDD2YgNNNG8/q30mCpKM0QW
 tsAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=GjGl6/AJxZH9BgTW35HKatrp+tpjg6c8756mhke5QQs=;
 b=EiYFG9IOBXWK5BtIAw7p66oVYmrMvN5QYgcoTvzNPPA2RwwHflqZk4TksOjvqN5qTO
 dCR079H3jRpoulA+dqI+FZWb8HMPmrlUcbZ0IeGAqOMRldL8fSqChqISLGd+zZIhX8v7
 9BvIIXxMsq8Y6KZAMO8LhMEJpWo717EAQ+O3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=GjGl6/AJxZH9BgTW35HKatrp+tpjg6c8756mhke5QQs=;
 b=g5qdjI4R/Vr4YCV4LHU6n+IlxJhGxPXPEAgB8jV92SMUrv7DqWNNkjRgeM6FcQp6F9
 ICB/gplQ8t9II7Jc0rMQy4jKvT1wJW9Vbf+JpoYHtYSS+OsyJE/e0acPRzoPFjAFzf5j
 NY1OGrHKqSXnafzYZ/Hf0srFGeMUg2imClF5T/eco0n9rB/l9x2IeVgYwF+OcWp44B4B
 sx/OKZpI2rzzr51u7aD/tZwJh1MkycYK8HrMeuZ61Eo2f+cw91iVruu4mYRQs4bxKBEa
 5cptZn8vQ149QKbiVmFPECzZ48nVPxaq8qCTn7YvRJGwNE6fMPCNEWPLrXAcoO5DDefn
 UrGQ==
X-Gm-Message-State: ALQs6tD/mCwU2yJ7eiAiJ29GZtf+Kd6uM0+uym0Yca94zVp29M/SCni5
 MPF7NQIgXVJeBBbwNLp81238BJ5AhBhohtoXufiI1zll
X-Google-Smtp-Source: AIpwx4/seE9M5GoK8dgbBxhsucZM/XaA/VzxDBbONX0qAYQWb7IwZxlaU/DFBwCA8Pf/TBQ63jqgHXGn4Bfph06Ufxg=
X-Received: by 10.55.212.69 with SMTP id l66mr4154538qki.112.1524103398987;
 Wed, 18 Apr 2018 19:03:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 19:02:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 11:32:57 +0930
X-Google-Sender-Auth: m_MwqgkxhqWSCkx4Qy_9Vmat31o
Message-ID: <CACPK8Xdgcw2VF3mSssAajEyGask0mHeei59ivDLEEcP-NZ8KxA@mail.gmail.com>
Subject: Merged DRM 4.14 tree into OpenBMC dev-4.13
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Apr 2018 02:03:24 -0000

Hello OpenBMC kernel hackers,

Just a heads up that I intend to merge the DRM tree that was merged
into the mainline 4.14 kernel. The ASPEED GFX DRM driver requires
functionality that was included in this tree.

This should have no impact on other parts of the BMC.

I think in the future we'd prefer to move to a newer kernel base, but
this is another option for gaining functionality in our tree. We will
see how it goes.

Cheers,

Joel
