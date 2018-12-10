Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYIcDV2E"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DCFy2JqgzDr7C
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 06:05:42 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id v23so11491120otk.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 11:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eIhmBtGVjXMRcgS0oYYcELOs38EXPpVPbOTTJQlJWbQ=;
 b=OYIcDV2EL7evxrK42YIOHJiqRho8BveiJh6I4HZjplsCUn9Rb/84pQarIB8nJDDrmj
 gCukEu2ER+YiZZbHarglsERHELMhRtIu7yDIbCLsxtr6YFXWCEp6mL9gJYdnRwICcwJC
 CtktwUMMdvh5JwoWFH645+MrHFcJ6nhtw2rO7e+QltUyJt/FR9+PEb7JcknCPPqSKEJy
 9UyQ5ulfBIUmVWBcaLwPHkqOjMtrjnIuDpcvBeIKL/M/JV60PzEYoQCqLRYyNJDsFMzT
 T/F4/kP3t3NQwhQDoYRjYn/sB4TgsA9xXF5plSD7MT6zcFmR4GIuBF6Bu5S4Cdq+NU2C
 be0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eIhmBtGVjXMRcgS0oYYcELOs38EXPpVPbOTTJQlJWbQ=;
 b=FPcfxXMN6YdlE+aCmFtF/J2dNMHDBq7XnpGFX1Ug4+yTg3loBPlRKsoiVTN45PDu97
 2csI6eKl25AKa566RagnfC9X0AhEJs5mabAy4rWfRgFdQ9s1r6NwEjvQ3WPddlqKnBEm
 iViz449DNIdWor2dwM3Q+oJp6nd9yJbEvvg2oDz0pBzjp2IvGRyForREBB+heN1xFuZT
 Mn1p9Qk6ZiquIXzZOHzUvt7yYZT1OEKB4UCh115+CqS7rDujD8G0V3yOg7xxtj2aT+V2
 ltZl4UFn/9DWLi9Lvt4u6KBOnZNBYAu681PCoIqmP8n4kfSL6x2GhFL7H1I/0u+4zKTS
 iQLw==
X-Gm-Message-State: AA+aEWZblQcT/bBn+h/xMyMiNnu+QHBnuOJ/6zXRUpeKTi3kOeGF0BMh
 L3e2Z8j7mbYc8l/OE2ytJEQNPEdVzD3EiNMh61/cZb0L
X-Google-Smtp-Source: AFSGD/XcHh7wGA29liAF1cGC25GVCC4hHmROsR35XInp7cKCf9H+UWsuRU+xals16wzpE3rW0t82eabSTtGyNXnUJec=
X-Received: by 2002:a9d:2269:: with SMTP id o96mr10020188ota.45.1544468737963; 
 Mon, 10 Dec 2018 11:05:37 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Dec 2018 13:05:22 -0600
Message-ID: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
Subject: OpenBMC Upstream Reference System(s)
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
X-List-Received-Date: Mon, 10 Dec 2018 19:05:43 -0000

Greetings,

One thing that has come up a few times, and was touched on in last weeks
Infrastructure workgroup (and todays community meeting), was what is our
community reference system(s)? i.e. What do we as a community test against
and guarantee works when we do a tag or release?

If you look at something like https://openpower.xyz/job/openbmc-build/ you
will see a variety of systems. Romulus is put through QEMU CI and another,
Witherspoon, is put through HW CI currently. This list has been mostly created
by IBM, and so it brings up the question of what's our future plan here.

First, what's the criteria for adding a system to officially being supported by
the upstream community?
- Covers as much OpenBMC function as possible?
- Is on hardware that anyone can easily (and cheaply) get their hands on?
- Has consistent upstream support and a person or company to support HW CI?

The witherspoon and romulus systems definitely are well supported by IBM in
the upstream community but they are not all that cheap. There was a rasberry
pi port out there that would be cheap and easy to get access to but not cover
as much OpenBMC function. There's something like
https://www.raptorcs.com/content/TLSDS3/intro.html which is a bit more
accessible but I don't believe the code has been upstreamed.

One point made in last weeks Infrastructure workgroup is we should shoot
for a minimum amount of hardware that covers as much function as possible.
So a matrix of some sort that covers our major functional areas. In general,
having a system on the upstream support list is like getting your code
upstreamed,
once in, you have a guarantee that all future code will support it, so maybe
this is more of a community reward to get your system on the list?

Just throwing ideas out there, input and ideas appreciated.

Andrew

References:
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup
