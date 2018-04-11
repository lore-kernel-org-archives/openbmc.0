Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::229; helo=mail-oi0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vMiwa4K4"; 
 dkim-atps=neutral
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Ll6n4dd7zF1RN
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 23:21:21 +1000 (AEST)
Received: by mail-oi0-x229.google.com with SMTP id c3-v6so1663285oib.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Rp5JFyazwOnVL1cfMrpXWfXwOHov3R3re5NJ+NYPqB4=;
 b=vMiwa4K4nfuO49yUDzSBENpaq/TRH10eVW189moHc64BDd9dbtPTMiwC9wHj3Eepwu
 /ijvjBG6mykURS2SNRYPMA1P0qRjaQI71aOdRaY0r8n8MeqmLXl61VN/KvJ/zl5w1Ndl
 18GweK91LIZK4vM63nnMwtVTYPrHnR91atuV/YR/ilhAQg5RURvp6yx9tf8XqLVDAJ1y
 F6xmcXeM70pMIOMLEBp6/g/rmPzSU4wrkN6F7Cp3lrGa34Qc2lcO+LKab7W/j6ZLWVNL
 /jPA3KfiVu6mQHsYevF4erX1Hd0ExaesUn/bpZQgr93U1olLwdri6BQMuhS7+cA0qe9D
 JthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Rp5JFyazwOnVL1cfMrpXWfXwOHov3R3re5NJ+NYPqB4=;
 b=JHxFjBgI9vQcCKL4uhwA4dEjjdtJ7g8hxfhindipcaD4MjxUxYulAzFZZzPoxdutBH
 CQJVoouQs+o9A6fmcgeFc9f+LHsQmMSMBbr8RQ+RHiAPh50zIgXuJT2dMetlVk4MMTwb
 HJ1kLlHj1+PN+SHoU/UaLXC7AXti/Bp2zuHKKvUF6laf5Potj857fiGMoqVOgKUnmM49
 rjkqSQeELzVZE/4U5pEWnA5oz0IbqcFQbO/pWMKpyqxEd4BYZuW+56YY+LU7pRQduZvx
 1uwPMKuvaS5/5TJk7E3+ofV6Djk763Wpwii8sJ7Ct7m4PiyzAevn4mwtQih73couGhHO
 xcig==
X-Gm-Message-State: ALQs6tCINoeIYjP/XhezA4V0siqfGvmkdjIGf4QLBEtbDYjgCugCcRLg
 u/czHNbYcGwUUs9tYWKyjSBjsU9M7fJaAu2yosUMig==
X-Google-Smtp-Source: AIpwx49xIkS/d7wsmnPffM6WMAMAEkpyXKLB57X4961Gbag0w6dti4vEWKXowJShnqJIZCT/Yj4bkwrrAVvAIkAu7yA=
X-Received: by 2002:aca:dc04:: with SMTP id t4-v6mr3161508oig.28.1523452878904; 
 Wed, 11 Apr 2018 06:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.50.79 with HTTP; Wed, 11 Apr 2018 06:21:18 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 11 Apr 2018 08:21:18 -0500
Message-ID: <CALLMt=of+23peG1gq9u0aG3OTaukM-otJmjske0oS8nF4J5YCA@mail.gmail.com>
Subject: who wants some nginx?
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
X-List-Received-Date: Wed, 11 Apr 2018 13:21:22 -0000

I picked up some commits from Chris that enabled Nginx in OpenBMC.  We
want  it for a few reasons:

- It provides an easy mechanism to redirect http to https (i.e. user
just types <bmc ip> and get redirected to https which then auto loads
the GUI
- It gives us flexibility to serve multiple back end servers off the
https port (or any port)
- It's much faster then our current front end server
- Many other cool feature we may use some day

https://gerrit.openbmc-project.xyz/#/c/6879/

The question is do we enable for all openbmc systems or just ours?
Any votes?  Feel free to comment the review with your thoughts.

It looks like it takes up about an additional ~250KB of flash space.
There is no impact to our existing REST api path with this change.

Andrew
