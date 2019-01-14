Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZmwN3KFn"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dlVg0FJmzDqW1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 07:31:22 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g62so136147pfd.12
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 12:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3inAsOyFkZTBIfjCXQV3heWlOCpv6qX6oeYPMUbQLYs=;
 b=ZmwN3KFnB1mnVXvLlFIRlSxN+zviVx1J1HnXaPdbuAj+qWWHjV/wUrNUovZ0l5wvO0
 iTHF8futx31wGN478ZRpnQilcy91wzuzuMktfxhbzjQa4apKsVGsmyF+aWwG7yp2zfpf
 o+4YiSdmDCQV0aNiaRzrN0jgTUFEgJBPLE4E+RoAF7jyqNEUCt2mmg1bGJpQB51fzxUe
 4M4wdP1dPvBNlRo+Xksanyn6oVuFAt52n3NGrG6qP4UHH+OdI20WuDK4Bw4zT7ZnyJS8
 CCxIg3x9DHldXhc4Ob/NWp5nLUsizyXW6oHnfz4UFDukLN7WCEHCwKfTgZ4b+HqUN5JU
 /5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3inAsOyFkZTBIfjCXQV3heWlOCpv6qX6oeYPMUbQLYs=;
 b=JFCxWgCrmDiy99NjGSpSk5iO7t8J9XKyLp5CrpXDI6trdJJEm8bRZMRFEzbkrYCjhL
 nZ27Rd2V7Pc7+O2aN1g5Etk9P/UlrlwM9JAdf0XivOT8N7N+nEbWhfjnu6VvLdrxCCiW
 NhuMOoV8N8Na9n4eFu4pJNT/4GytHlnbofTP9TXcP8Yukl4C45vZxNhXx+5CK4V7uH+L
 iAtaKjCbgtdW5WHqkeXhuzBaR+zZ7lk5mmK2TT5ZGpRn3xaFwCfHh/cHXh07e6HVdLW0
 l/zxkM8eebXo8u6w/cMTgFHlPj3wx+GF7G0cRJSoaWaBE6ouYkluI/YXTIpuAaZ3evsV
 xH+A==
X-Gm-Message-State: AJcUukdRzxNqexeYqn/xGUJVvJHOM1/hsZm6yfVJeATgmLKx/z9JimPv
 jJCCA3cBzlv7ZIEkbhwDHk+36S3Zbg5Yw0zrSzSSPw==
X-Google-Smtp-Source: ALg8bN6Rb6qm4CLSNu3hQK/A3xk6tq/7Ul9HgzuhOC6BA30h4Pzp/ebqjrP14HLyiA4k+xiAC3zJmJ/GBFJDjVAMMt4=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr330239pge.94.1547497880008;
 Mon, 14 Jan 2019 12:31:20 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 14 Jan 2019 12:31:08 -0800
Message-ID: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
Subject: phosphor-hwmon funcitonal interface
To: Matthew Barth <msbarth@linux.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 20:31:24 -0000

Right now, if a sensor has an explicit hwmon fault interface, then we
have the notion of a status:

https://github.com/openbmc/phosphor-hwmon/blob/master/sensor.cpp#L205

However, I propose that if there isn't a fault file, we still add the
interface, and set to functional=true.  This would allow us to change
it to false in the following condition:

https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127

So basically, instead of returning -rc on failure (optionally), it
could optionally set functional to false, and phosphor-host-ipmid
would need to know to check this additional interface.

Thoughts?  (IIRC< I've mentioned this idea before, but now i'm setting
up some cycles to hammer it out, as I continue to implement unit-tests
in phosphor-hwmon)

Patrick
