Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::235; helo=mail-io0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KVbSPxo8"; 
 dkim-atps=neutral
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Vr9C1yS4zF3Hb
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 18:36:46 +1000 (AEST)
Received: by mail-io0-x235.google.com with SMTP id l7-v6so3381607ioj.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PvTmYGsJ06fjoJ9fSvesBCYTlmKM6Ws8rLaVhkBKZuY=;
 b=KVbSPxo89VfdXfvqo2v3NFcF/YBkbB7Ydpj+kKEIzYx/jSMiNRL1CiL6v5Jv6V3IcV
 9ypSGVDfyEhXSLUNG+U/5gdExdLzQHEJimPfVQMu26zc5nod/R+w5zsnkLrATHrK18JS
 EFOr7ZqQveRRB2eF8rzxo02CW2kBX5I0TT7PHdjB82RT3QTLOomayz09ZOOUeUh/xBHT
 M95Z3xAH+bknQyFbB2pnhZ/MlEwLe0RGfdC11ES15qR4w+3FHbAuBkguhGf1rwARzNpn
 MrGzpPCERR9Fm2xxCUVe2+GHeElI5BjRKfa86Kr462Qfp3iXQrBjr4y8g7+NHBDRCjVX
 UHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PvTmYGsJ06fjoJ9fSvesBCYTlmKM6Ws8rLaVhkBKZuY=;
 b=ZO1QVf66VrXDs60EoJvbDef4GDXXGgs3Xg6dES+dMzNNgC2iKU2O+7jSis2HhdOX3R
 3jGyXSTO/KOjlnBMednNz4BHqecHPNTiG92JPHc01sAvIHXkSAgrsCVlctUgDQ/tqAty
 PcG5SVphT/CgkMXNn8c5eqL5QSuerUZwKQQEaCMdQPFdOWXp2C8wJ1dxAb86gYMtI+lz
 6Vfeb7vTpZg8lqW4nB5gvRfpFQNzOG0FJMpEPaKyn0o9TE+SVu9sPQHhrmx7RTmhRXKF
 TXu7iuLIuOh1Hh+xh+YSyZp6mbsLvg6Op+z329DUX43cPNdzWCs9Rq0UYiYUz/05GlPq
 FbRw==
X-Gm-Message-State: AOUpUlElRoWZqE3qhyRcIAaSb+ksGnQzSY2FyCPKCjQdlauqdTlzrlfB
 692JIQpXT26IqRQgMOYtjCPvQ4iofWUFhczoHnk=
X-Google-Smtp-Source: AA+uWPzt2ziQS+Yl3YALtXpKw4ioO4jpwkKUF51QaHdw288KV/T7N83OZDiquyL0c8UImSHa4qF+EC+znneUjB5/VRI=
X-Received: by 2002:a5e:8404:: with SMTP id
 h4-v6mr4104027ioj.171.1531903004539; 
 Wed, 18 Jul 2018 01:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
 <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
 <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
 <ED94F738-2C50-416D-826B-82BE0D1B0E94@fuzziesquirrel.com>
 <CAO=notz7gk5oF9BSpviz+1VrDRCeBCU7t8+zQxTGZOCDYy=VmQ@mail.gmail.com>
 <1598514C-EBA7-4CF8-A7F8-04BD39498B12@fuzziesquirrel.com>
In-Reply-To: <1598514C-EBA7-4CF8-A7F8-04BD39498B12@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 18 Jul 2018 16:36:29 +0800
Message-ID: <CAARXrtk2EJCkqOzvNwfwBukN3BPCyKDzDhrH0WH_+GB8i6TtGA@mail.gmail.com>
Subject: Re: Sdbusplus-based Shared Library
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Venture <venture@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Tanous, Ed" <ed.tanous@intel.com>, ratagupt@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 18 Jul 2018 08:36:48 -0000

> I thought you were talking about extending the concept that was applied
> to sdbus (thin raii wrappers around sdbus) to sdevent.  I definitely thin=
k
> we need that.
>
> I think C++ bindings around sdevent could also have general utility to so=
meone
> outside of OpenBMC so I=E2=80=99d again vote for not including OpenBMC-is=
ms in a
> library for something like that.
>
> > My primary goal with pushing this
> > line of thought it to reduce code duplication in openbmc.  So many
> > daemons have the same methods that just talk to sdbusplus, etc.  So it
> > makes sense to me to have a utility library for interfacing with
> > sdbusplus for common tasks.  phosphor::util::getService(),
> > phosphor::util::get... etc, so they can be maintained in one place.
>
> I feel like a number of these are mapper related.  Could we add some
> client bindings for the mapper that help here and put them in the
> mapper repository?  Here is a possible example of how that could
> look:
>
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/sdbusplu=
s.hpp
>

I would like to bring this topic *again*, that a shared util library is
*really* needed, either in a new repo, or in some existing repo.
Because we see so many service are implementing the same functions like
"getService" "getProperty", etc, which is so common, that it's preferred to
have a common library provide the implementation, as well as the mock
interfaces.

Then every service using such functions could easily call the library, and =
the
tests could easily use the mocked interface.

Could we get some progress on this?

Thanks!
