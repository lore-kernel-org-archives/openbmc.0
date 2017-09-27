Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::230; helo=mail-it0-x230.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yr1JRCno"; 
 dkim-atps=neutral
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2WD36hJbzDsPT
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 07:29:07 +1000 (AEST)
Received: by mail-it0-x230.google.com with SMTP id m123so9083646ita.3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2017 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sid6oEamm4NCFK+5jnkmwoplylDKyOSgno4NeWIzWpw=;
 b=Yr1JRCno2SlNrjU7bcJ4mH7vxi0SrIj1J8QF8JJMSvFxTwBRQztNb19KM4RUFzHX/S
 a0MuF9zKr0ZtKFVbFe5wmHVb7xpsL4mZWnsg69UePHpisxLAsZm5me5cpFbIo1h4bKrx
 SAKtPzTCj/9gHmn03BOMb55JAAb/HVRANMBdqwVrV9OGz14MPcIYXblQfbkJB9/gIB2Y
 xEsihH7Cqs3pUGzWgd6evH+/RWow8Ua69eOwh1DuLcV4SOP5rnH2tjmgyHQxiEgC8U4N
 sbYZ4O9ZbLGSPr+hyi+R+ApBeXi6mhYgXxItqyIjGhphSKvfQk2C7YZhrZ0lGOdq88Yq
 K8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sid6oEamm4NCFK+5jnkmwoplylDKyOSgno4NeWIzWpw=;
 b=QH4JPvuYj/r3UninKDe8T4fWdNNSuhhhVs+IGu9gJq9o/zxTwsmWXKN0h2fb0zljRA
 ez+4FidW9DTiWnvJY8Uywa38UFlBIHoIvj45YXTUxFi3Viz+Y3Z9Oftav5esQKlvTbLo
 atmS62zevuDsy2pJCpkq+VKYm4Z6pAlQoih65uWIu7E1TSm+J+Xg1GFY+DDIWubw4Ttu
 dFV4Idkiy7O7jaV5cMLHqQ9QmX7yxfY/M9h1tXEDMJBacWeVSYtiuleR14+mJY+Gg2A0
 /xlP1RL9sgoyJST30TSyozWDBRn6TQgA6HARpgUJCrtXAFJJxKfm+dyjgjpmvu7tXSL4
 Yw8w==
X-Gm-Message-State: AHPjjUg+PBG9YKPeJxgQOLmSxLaPlK4poQNa5TOXIKIAPuuR8C3hoScn
 mB0pLBLRfdckIXu/NiWIC3jHJ3URFiCoLa52YE15Ig==
X-Google-Smtp-Source: AOwi7QClT2ZgGL+AHkrL43cvMRVrqeo80BLdKQgFvpiSJoFF6KbdaWO+2EqKAMAaB42dhMHsUtPie97c0Eq/CxWoS7Q=
X-Received: by 10.36.137.66 with SMTP id s63mr2932869itd.28.1506547744316;
 Wed, 27 Sep 2017 14:29:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.131.70 with HTTP; Wed, 27 Sep 2017 14:29:03 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 27 Sep 2017 16:29:03 -0500
Message-ID: <CALLMt=oUFVXDCeQMCSjS7CJjLxuivxgP-m-9mjmNrQ5cdd-rfQ@mail.gmail.com>
Subject: Services to stop on quiesce target start
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2017 21:29:08 -0000

The goal of the quiesce target was to provide a point from which the
bmc firmware can do 2 things
o Initiate a recovery policy (i.e. power off and back on again)
o Sit in indefinitely and leave the system in the fail state for debug

With these goals in mind, the initial design was to basically do
nothing to other targets and services when we got into the quiesce
state.

This causes an issue with checkstops and host timeouts.  If the system
hits a checkstop (processor suddenly halts), bmc firmware detects the
checkstop, logs an error, and puts the bmc into the quiesce state.
But, since the host was running, the host watchdog was enabled so the
bmc ends up also hitting the host watchdog timeout and logging an
error for that as well.  Doesn=E2=80=99t hurt anything, but the bmc has
generated 2 errors when there really should have just been one.

The simple solution is to just have the watchdog service conflict with
the quiesce target.  If the bmc starts the quiesce target, the host
watchdog target is stopped.

Some other options:
o Run the obmc-host-stop target, this would potentially violate our
goal of staying as close to the fail state as possible in quiesce
o Create a new target that quiesce runs where we could stuff things
like this - would give us a single =E2=80=9Cthing=E2=80=9D to look for but =
currently
we really only have this one use case so a bit overkill.

My thoughts - Keep it simple, lets just have the
phosphor-watchdog@poweron.service conflict with the quiesce target.
If we find more of these use cases in the future we can revisit a
special target to keep them all straight.

Relevant issue is https://github.com/openbmc/openbmc/issues/2282

Thoughts or comments appreciated,
Andrew
