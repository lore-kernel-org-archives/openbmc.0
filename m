Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tKeR5KoB"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mZ151fjLzDqCD
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 02:47:20 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id g141-v6so1269768ita.4
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YcIoHB4N4iwthFPP1xaWgVQTXTKJqwlwFhm5mUnJkTg=;
 b=tKeR5KoB19gBAsqtd/BRk80sVDxUtS7jXG7sDb0plbLoAhOi9SBVwiTSZO4SFRruZ6
 l/YfFEhYVbzMI0oIVfwyaRDdKIPYK11nc0yPzGp+C9T0DKO1ebPvoiQHZOzFnwuxFGcw
 bZgPAdZH4cdEmAjzLx4tYCxRH+tVgkMSPKV2QO2Jk/O9IYhAVtwFBEs5B+oXIHqJzniJ
 Lzrwuqll2niBHRzyCf0VG0Xzi1+KwfCvqcbuqTDCqw8o/uxhmW9oVBijIF6R/s5F6Amt
 6bvIVt9AWkK8Y2raTFd48ONwq6TySgO7QGrCRzplwlcDVpDkMhkKLgWFOMdWpJtPmTWN
 SdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YcIoHB4N4iwthFPP1xaWgVQTXTKJqwlwFhm5mUnJkTg=;
 b=CCFyIel3Cu3yPJ3lwlRJGobkmnlLgDXsAH9owbdJmVFoqLM2PA0NMapzfzSXuH+zfE
 0t3fXVAvbvp7GoRhDIe/Zq6J7u9FRAl6+rLB8BJAFrGCvZpleGRHhUdveGlZaZnkaO0G
 yeTtbetELzHWIaIC14WfIg0l/o1F0KjhMQv2bGaE4IJCTcYM18Twofg+GwIiKjyFxkXP
 vfZPCv27SXUFqriH2Kq6JxlTJz5JnSZPGdyO07z6o48naPhV1OWf3akgFw1bD6pI3BOZ
 GtFLXvvdQTyvAJ6+c/ps0gqABO0I3GLUzQNpnMvpN/0AMgdUYJyTNUKdSWTyzGb96K7r
 Qyaw==
X-Gm-Message-State: AOUpUlGk2OmtL7+QXERYPoBO2xMA/4hQ7t/Bf3LRMK1vmJaiF6UNXdYg
 eDK8y9t5wiU/j4Jn/Rb0qGlE9uCrAbrpUu75Iu1u6aFRBWY=
X-Google-Smtp-Source: AA+uWPwVyDbqtryovCleHOFzpL8JiNFG7pz5iBYPFmQX8hhCJnWJBGMV/afavrP5JCPDvityXLZ1GMTLDgK+PlBRMbo=
X-Received: by 2002:a24:7882:: with SMTP id
 p124-v6mr2578923itc.111.1533833238104; 
 Thu, 09 Aug 2018 09:47:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Thu, 9 Aug 2018 09:46:57 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Thu, 9 Aug 2018 09:46:57 -0700
Message-ID: <CAO=notyPv2adUkvdB4xWLngFG5sqfSNQg4eJXM22Ub7ociKd_A@mail.gmail.com>
Subject: phosphor-logging in testing
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Aug 2018 16:47:22 -0000

So, phosphor-logging/log.hpp requires one to link in systemd, so
technically I can already argue it isn't a header-only code-base.
That said, I'm looking at how to enable testing such that we can
easily validate error code paths.

One approach is to move the code in the header such that it calls some
code in the library itself that we can swap out with a "body double."
Another approach is to have some global variable in that library that
one can flip when they want such that the tests throw an exception or
something useful to catch in a test.  Or just do nothing.

Is there anyone already tackling this problem?

Patrick
