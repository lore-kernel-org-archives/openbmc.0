Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::132; helo=mail-it1-x132.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="adpNmwRE"; 
 dkim-atps=neutral
Received: from mail-it1-x132.google.com (mail-it1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hR4s75KrzF3H3
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 01:21:33 +1100 (AEDT)
Received: by mail-it1-x132.google.com with SMTP id l191-v6so1707090ita.4
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 07:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GKah8yFQyAM60VOmQJKB4tPQAyh5ww/sFNeJ5IQY7kg=;
 b=adpNmwREdrWlFvy0OA0Y3wGefJx+YFA8axfoMV1o1kNsh1HY55+YsDhg1bg1PL6KwY
 qp7ho+Zt3RC7euTJ8wPckHPX396LtHQrRwomHagikgk5JrH8x49SvbynKOa2hXFDyjOY
 7gbhO8v1asG69QgOzGUCghZPVvx3kyKbELJA8o4vsOKwoiVzX+grXBG6TqVhTPpFyfYm
 pe0EJiBi7UVa3jQlYvxWyxs5z3nAvTWK//Q445vYbFQlqC+Fh9SCZWM3eDCeFCX9pwxp
 mPxjOA7R1qA5/R7GEP56uA9WfYSZaNUVFBUhe4LvyRR2QtKCAg/Y5QcdSmzillSSLQqs
 6ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GKah8yFQyAM60VOmQJKB4tPQAyh5ww/sFNeJ5IQY7kg=;
 b=VZhh0HrHcCG/8+ZMuA2PJU9n7qSViar2auDuDrXqxEJwqgzuOseWFwndRAzzVivqGT
 GXL9IkXjHojxJ1DL1rE4x7JTjtEgGTptVPesgqSbZPUHIg2hmBFXiK3a32zzTQ4+035R
 ZQjW7MRp8rjrn0lkKH5DMCqwp1RX73URNNRmQ+C0wObxLIcKvotwpHdWIkYUUl1osIjB
 SLfIP0UwcK9R5YOE8eNHtnjcWOFrAdQrxvII72o5dmj6k1i6/Wn33Iu2JHl3eYErA3do
 A+9W7uTP76ZLMgsGw+FtIZ/6Re+ke5Y0+AsIEQxZ/0lfrw7dOwJxV5uJ3+7TpnqWCU2Z
 CImw==
X-Gm-Message-State: AGRZ1gK//COCwHI9cKwRvnEtuSN/+J6nOitUl7pit3ktmsGNoYWZyBfQ
 AnA03oyt1+/mGEBhr33TFTMo7JnBmhV+mAFw1G4=
X-Google-Smtp-Source: AJdET5dOuUAIcojPNZ98H/ArmmYg8Kr9GZVvPcLI7304RYrso0jZXTNDkHAYLnbD7JxeBH7+4PClZLH5Swa6EX3bZiQ=
X-Received: by 2002:a24:dfc4:: with SMTP id
 r187-v6mr3478594itg.30.1540563691359; 
 Fri, 26 Oct 2018 07:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
In-Reply-To: <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Fri, 26 Oct 2018 17:21:19 +0300
Message-ID: <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
Subject: Re: Host console logs service
To: sdasari@fb.com
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 26 Oct 2018 14:21:35 -0000

I have described the architecture and service capabilities:
https://github.com/YADRO-KNS/phosphor-hostlogger/blob/master/README.md

Please, look through and let me know what you think.

Best regards,
Artem Senichev
Software Engineer, YADRO.

On Wed, Oct 24, 2018 at 8:38 PM Sai Dasari <sdasari@fb.com> wrote:
> =EF=BB=BFOn 10/24/18, 8:56 AM, "openbmc on behalf of Artem Senichev" <ope=
nbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org on behalf of artemsen@gmail.=
com> wrote:
>
>     Hi All,
>
>     As you know, OpenBMC contains obmc-console project that intended to
>     work with host's console. It's very useful that omc-console-server
>     stores last logs inside its ring buffer, but it would be better to
>     make the log collector more smarter.
>
>     On our VESNIN server, we have an own extension of obmc-console - it i=
s
>     a standalone service that reads log messages from obmc-console-server=
,
>     marks each message with a timestamp and save it to an internal memory
>     buffer. We have a custom policy that determines how large a buffer ca=
n
>     be (limit by time or message numbers), in which cases the buffer
>     should be flushed to a file, and how many previous log files can be
>     saved on a flash drive (some kind of rotation).
>     By default the buffer has limit of 3000 messages and it flushed to a
>     file on every significant host state change (host on/off, OS boot
>     complete). This gives us the opportunity to store not only the latest
>     messages, but also the logs of the last boot process separately
>     (hostboot, skiboot, etc).
>
>     So, if you find this service useful for the OpenBMC project, we can
>     upload the source code to the community.
> Thanks Artem! Based on the description above, it looks like very useful f=
eature. Few questions related to design are: Is this stand-alone service de=
signed as a D-Bus service? How does this change the existing user interface=
 with obmc-console i.e. any new CLI options change or behavior change? Can =
this be used from REST-API or Redfish? How to configure the custom policy t=
o configure? Etc. It would be great if you could use the Design template @ =
https://github.com/openbmc/docs/tree/master/designs to explain the design d=
etails for helping in understanding and providing feedback.
