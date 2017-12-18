Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::232; helo=mail-lf0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FwnmLDSE"; 
 dkim-atps=neutral
Received: from mail-lf0-x232.google.com (mail-lf0-x232.google.com
 [IPv6:2a00:1450:4010:c07::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0jsC6sW2zDrcl
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 01:21:51 +1100 (AEDT)
Received: by mail-lf0-x232.google.com with SMTP id r143so17930916lfe.13
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=m1FBJ3nyPgAS4wxOqSukh+piNPe0wOEqatAkem0ef6Y=;
 b=FwnmLDSErJ9ZRKXyu+OOu/1Cq7iaxkxN3sT23OAFp5JLpbolLBqU1jaGStiKsLuQuE
 hYN1GgxHL0/aWftnH8cRXqMC/1zKlJDh4xq+Cd9+i0nkD3X2SX8s0Q5HG3OwvZ7WZdQZ
 eU6bNAXrnNNuSfy5Y3uZt70hCaza3BUoUtPERhCz46yK7wg4JIE5S3RMEGrNK8aw4HWB
 UuX8/lf4ejtHx1xdt5ta9NxYDnxI9SRMNhtHFpBEnII69lp2nBPMYj6R7qYHPYETAALv
 UYUmrGg7Dv/8L0Am6ILtMk9NPfpFZmKQQhUcJRfHGIrt9rmmF7UncHZD7GGgviYwiU+d
 doiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=m1FBJ3nyPgAS4wxOqSukh+piNPe0wOEqatAkem0ef6Y=;
 b=Wfdi/8EVBHmEWDBiXEWUPncBJ6fEOxJ6XsN/GGTYsaaidx9j+0r1RKsOB1vgcrPv5Q
 66w9SYzGUTztfIoSljWMScpT3xXOfv1Ho8VITB5Nviw8diF4TibrMe6Flsr84KDhgCK7
 h7s9PBIzbpDZ2MXMSB985AfnyEdh16j0x5cOmFE3zx4i67AUIKhNxFQv+OA7iu3DciEu
 p1KxDuu6p2J2sauUjBr9W7HZKOG8HeG9wxlmz59p8V1ae/588rAyZotgdzrGffxyMaZK
 I9uix48I0Ao31QbgyNIeRK+aH7atyEtGuR6hiQJj5M+HUGd3tWYmVqqvOOMyw3FYsAOH
 9LxA==
X-Gm-Message-State: AKGB3mKbdTZJOLxmtew4bGlI5VeAPbyo7ZWWMvkM8mPRWGY6Dlcwccx9
 JdyeUTl1+OvtDi+Ll9VlyXjXzkBlib0buaO54wE=
X-Google-Smtp-Source: ACJfBous80ahTTR4PnsasYjjzwl24XzMBYXdgMXRUJBptdQWfLZGXkH2Qmd3hwfQ22R7E/TNOurpRw9dma1OXpasblw=
X-Received: by 10.25.234.72 with SMTP id i69mr6618lfh.57.1513606905801; Mon,
 18 Dec 2017 06:21:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 18 Dec 2017 06:21:25 -0800 (PST)
In-Reply-To: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
References: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Dec 2017 00:51:25 +1030
X-Google-Sender-Auth: 0-22ON9p1STamS1QEFm2ocwuUyE
Message-ID: <CACPK8XeXshcZmNaPry6dGZ7nGJf96ZR02esHQ6xj+K_MdpDVeQ@mail.gmail.com>
Subject: Re: dreport will replace ffdc tool starting from Feb-2018.
To: Jayanth Othayoth <ojayanth@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 18 Dec 2017 14:21:52 -0000

On Thu, Dec 14, 2017 at 7:53 PM, Jayanth Othayoth <ojayanth@gmail.com> wrot=
e:
> Starting feb-2018 ffdc tool will be removed from openbmc builds. dreport
> will replace ffdc tool with support for additional features.  dreport is
> already available in openbmc builds.
>
> Users of ffdc tool must plan to migrate to dreport.
>
> dreport is  a drop-in replacement for ffdc.  ie run dreport instead of ff=
dc.
>
> Usage info is as follows.
>
>         dreport creates an archive(xz compressed) consisting of the
> following:
>                 * Configuration information
>                 * Debug information

Cool. What information is currently included? Is there a list or
configuration I can view?

Is the list fixed at build time, or can the user configure their BMC
to collect additional (or less!) data from specified sources?

How do we get include extra information included?

>                 * A summary report
>         The type parameter controls the content of the data. The generate=
d
>         archive is stored in the user specified location.
>
> usage: dreport [OPTION]
>
> Options:
>         -n, =E2=80=94-name <name>     Name to be used for the archive.
>                               Default name format obmcdump_<id>_<epochtim=
e>

Can we change this to include the hostname?

Cheers,

Joel

>         -d, =E2=80=94-dir <directory> Archive directory to copy the compr=
essed
> report.
>                               Default output directory is /tmp
>         -i, =E2=80=94-id <id>         Dump identifier to associate with t=
he archive.
>                               Identifiers include numeric characters.
>                               Default dump identifier is 0
>         -t, =E2=80=94-type <type>     Data collection type. Valid types a=
re
>                               user, core, elog.
>                               Default type is user initiated.
>         -p, =E2=80=94-path <path>     Optional contents to be included in=
 the
> archive.
>                               Valid paths are absolute file path or d-bus
> path
>                               based on type parameter.
>                                  -Absolute file path for core type.
>                                  -elog d-bus object for elog type.
>         -s, --size <size>     Maximum allowed size(in KB) of the archive.
>                               Report will be truncated in case size excee=
ds
>                               this limit. Default size is unlimited.
>         -v, =E2=80=94-verbose         Increase logging verbosity.
>         -V, --version         Output version information.
>         -q, =E2=80=94-quiet           Only log fatal errors to stderr
>         -h, =E2=80=94-help            Display this help and exit.
