Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::231; helo=mail-ot0-x231.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZprLAs+D"; 
 dkim-atps=neutral
Received: from mail-ot0-x231.google.com (mail-ot0-x231.google.com
 [IPv6:2607:f8b0:4003:c0f::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rxfv6QG9zF1tF
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 10:33:43 +1000 (AEST)
Received: by mail-ot0-x231.google.com with SMTP id p2-v6so7854593otf.3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=CfHB4Emr4pLjRWePBsy+2k9TEIcku7erfynnS2DW53Q=;
 b=ZprLAs+D0jZUWQkXWcqvVB25kcPDusQSg8oPht7AhGthZw4ZFjloLdVNuwvl2Rw855
 A1Jed0beYqvWco2XK1R+Eev/gAs+lEHObLUq5pxaDT6jPBLoHo8o5VHAy14IWGyXM5Bp
 /GuYMOMBXnT/WdAp7OBeFTnO8Ir0TOueYqk9sOlySoerFPAOV4e0Gv7l+E68tg2X18jP
 lV0LCCCDiWZdFIrXXMQ6+TwgNNiYJ50penR/fwKrMY+YYL++3TqOFTvCM6mncKZGJxrB
 Uq4kfsjbLVZ43yQ9rpEp8/z+b7h57MMgjZbbX/CgaKOELNLU9AdW9WhA0LmjeU0MDc4i
 mWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=CfHB4Emr4pLjRWePBsy+2k9TEIcku7erfynnS2DW53Q=;
 b=OLpguQyOgPkcWrZqX8+UoxGgKKwMZ7P/H5nt+Bha9NwfTxMndHu3UgTLBD3m+ZsUBm
 dE0eYVHnT3LUVhuRVFOf9Twdo7KlWX/ns2kkT5FLKxCdbCUOVLunTkA32MzF97kgwqMn
 tIWZjDImzj25j6QsJ/RoPiIM509eBMQJ2AxiuwtX+7secc7G8G/RJBqX9bkzheCjonSJ
 sGilOj0qESCEk5sQqTL+zyRqw+yyMauGYFeuF89tq7TAYkEvT1/6qKFN0DvhVXY01ogG
 lCdVUKS5EF+TtonKsb05buUyN70LILSfqSacM6cmiV35jicwOsavEjwGKcaKmt/1qQbt
 qIjQ==
X-Gm-Message-State: ALQs6tB0rNnQjHjGlC6DyOFhjcrhB98v44ODxBd7hMy/rklzz7jdOiHT
 qngDzPflKRPT4X142nxT6/sPejIWWnSd29C1Aw4aEQ==
X-Google-Smtp-Source: AIpwx48EgbbfVV0afVxXsg6vZhZZVpsSIuN3KxxQubcKx6xkUTAQ5/8GiA5Pmu/xtCH0Tv72VOJ7wPMX+3XdKz4gtAQ=
X-Received: by 2002:a9d:5f87:: with SMTP id
 g7-v6mr5081456oti.139.1524184420928; 
 Thu, 19 Apr 2018 17:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.50.79 with HTTP; Thu, 19 Apr 2018 17:33:40 -0700 (PDT)
In-Reply-To: <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 19 Apr 2018 19:33:40 -0500
Message-ID: <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
Subject: Fwd: Migration to new gerrit server is coming
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
X-List-Received-Date: Fri, 20 Apr 2018 00:33:44 -0000

All righty, migration complete.  I did a variety of tests and things
look ok to me.  Let me know if you run into anything.

You'll probably get a "WARNING: POSSIBLE DNS SPOOFING DETECTED!"
message but that's because we moved the IP :)  So just run the
provided command to delete the key and get a new one.

Andrew

---------- Forwarded message ----------
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, Apr 19, 2018 at 7:37 AM
Subject: Fwd: Migration to new gerrit server is coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>


Hello everyone,

I got agreement from the current VM and openbmc-project.xyz domain
owner to work with me today on this transition.  The bad news is that
it's going to have to happen today at around 4:30pm Central time.

A good excuse for the west coast crew to start an early Thursday happy hour.

My estimate on the outage is around 2 hours. There will be no impact
or domain changes. We'll just move the DNS for
gerrit.openbmc-project.xyz over to the new server.

Andrew

---------- Forwarded message ----------
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, Mar 28, 2018 at 2:55 PM
Subject: Migration to new gerrit server is coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>


Greetings,

We've gotten ourselves a nice big server to run our gerrit instance
on.  The virtual machine we're currently running in is going EOL
within the next few months so I've been slowly working on a
transition.  The migration should be pretty painless.  At some point
I'll take down the existing gerrit, migrate the data from it to our
new instance, and move the domain name over to the new server.

I've got a test instance going now and would appreciate some poking
around for anything obviously wrong.  It's running the latest stable
gerrit, so we'll be getting an upgrade in this process. I synch'd over
the data from the production gerrit this morning.

https://test-gerrit.openbmc-project.xyz

PLEASE NOTE: No review comments or merges or ... anything will be
saved or executed on this test-gerrit so don't get the two mixed up :)
 https://gerrit.openbmc-project.xyz is where all real work should
continue.

Andrew
