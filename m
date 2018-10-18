Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oeC/lLd8"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bgf80ypwzF3Hw
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 07:30:23 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id 78-v6so13027404pfq.0
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qxAyNzACGED4rHspkafnXhLWbN3/8/zZFPrrXFW69H4=;
 b=oeC/lLd8UmK/LzA5j8tlCrAqY/wwtk6kdMh0hYSYTyW/PA9WVcRD2FNBkuWAVqdpq1
 KebA3/W4KCcMo6yut9t1909jNIu3+UN+esS+A1CmPXPimMyULdKcyxuNSqdEJQbQhpWc
 Jnp+e21nlsktdsxghzqB4lSvDXLyGktex/P16AmUk+wGT+8CJjtEp6wsO5If01kyIjVq
 GkzPojIJHKmMVrK2+SKHFNJLjHMXCuDgxbDEAdzfjdBjJDeeIjRE512CjmbUik70mTGo
 mKudIUuM0GaISHWFXdjYtv60qgocKXIy9qpqqtLAiE+djPdxJcO3sF8faMb4BK7Sv8Cq
 S41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qxAyNzACGED4rHspkafnXhLWbN3/8/zZFPrrXFW69H4=;
 b=uEs4tRT1Tx2VT+Vj2rmGdgT8embw8WtnzRWCZ1eWuMcaPXQegjyN230ctTPFZ4P6Mj
 YNzfjf75HlmCqfxKGU1CRD/AuG3TS0jMRd4YWQdexcR7gQujKJ1Ixfqg+tFs0nacRb9O
 Loc+j/MwiN2ZwDYx5NXJ5mUPvJ/O56ImkarffPPp8f12egp34+rADRnPUh31AbPDLd3/
 TKeOdJdhNe8XnpU8ioNdRJW6E8+fK3P8PxSs2kt2ioGVcOcfrUHoycGNoGCRlZsIl9b+
 V7ykgydqMwxgHgndAAWtvWChdHR64EQ6KliP+votyHatwpUqMSa0vvyipFBUIyWrSlgK
 xDqg==
X-Gm-Message-State: ABuFfogOyJdPM7ZzEdNATdXW4aV498CCrlKuc+wlN8TIvCpGdIOsKy4i
 tpsaenFRS8MrhoAH7i5AVziu16pUkTW6itWvS8pIXzqtWI4=
X-Google-Smtp-Source: ACcGV62EUBxxxRP8M97OYBtBYwRmcfFYniUFjA9bbAX2dCn8ypOS9cJWHuQjtg/mU4eIzS0FzV0d201T0+Kby1h97uU=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr30245519pgh.290.1539894619973; 
 Thu, 18 Oct 2018 13:30:19 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Oct 2018 13:30:08 -0700
Message-ID: <CAO=notzFEfBpKCdQ30WO6v9AZ1xh+OLg0jpsEiuGF17x2gFKzg@mail.gmail.com>
Subject: New Checker in the CI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 18 Oct 2018 20:30:25 -0000

Now a tool called cppcheck is run against your code during presubmit.
Its results are not factored into your patchset receiving a +/-1.
However, I encourage you to take a look at the presubmit log.  It'll
have some results that are neat, like, "you can reduce the scope of
this variable" or you can improve performance my making this a
reference, etc...

If you're curious the kind of things it's found so far:
https://gerrit.openbmc-project.xyz/q/topic:%22caught_ci_cppcheck%22

Now, here are some notes:
1) it isn't always correct (it isn't perfect, but it's very very
actively under development so feel free to send them bugs and
notes)!!! and help the OSS community.

2) the generated interfaces right now don't use references for object
parameters, interestingly (maybe something we'll need to examine? :D).

3) If you have any questions about your results, feel free to shoot me
an email with a snippet as the logs don't live forever and I'll take a
look.  I have no stake or influence in cppcheck, but I can be the
point person on this.

Regards,
Patrick
