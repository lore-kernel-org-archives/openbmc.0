Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::131; helo=mail-it1-x131.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tl2hxIsS"; 
 dkim-atps=neutral
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gFGJ5fPLzDr5V
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 02:55:36 +1100 (AEDT)
Received: by mail-it1-x131.google.com with SMTP id e74-v6so7228280ita.2
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 08:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oAHtz0LNAsSdoCRIT8kgW+wmQ6FUktDGuoxt6tw/J8s=;
 b=Tl2hxIsSzjQt3nZwYRKWT3hI633eK0kb7vgc2cFoVVYSZ784Fj/k/CwwXsRZE+NBA1
 OiTenz7LT6KG1C6/JfAgVQwABJ8zSB6OOiyeFWPYBS+II9n0bwbnIj4kMa4HgKW+wWvu
 T9P61Q6mfiFoMKyvkvRKqZy4PIu5Aq+bwyl+jkGw3KuDaBiziKeP3X3HTK0xLdW6lsbO
 UWcBw+Kg/kqfgSvw+ZZmJSnNzGbr+FICcrr4mNN6+aNUmXDTnga9Yc18IUfWa2FcPqNU
 tEKXl7qAXxOKBo3u8E9UbuvgObFaEWPVChYkWHj37C8gZs93rkMdHcEBDFPHIgOxSEtE
 Y8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oAHtz0LNAsSdoCRIT8kgW+wmQ6FUktDGuoxt6tw/J8s=;
 b=anM0soeYzCVQd2Fl/lK8fBYYBdocv1eDLUuzqnv/HiGsMz2nhMXH6DZkK91yqjUpbW
 wkFi6If2a34eUJ7zIbkIhj2Q9dY690vW340imkYvpr+paeb2rcV1QSBwMZL2QqPgLIdw
 BRABgttCUwrP3iQoDaOrNB3EYXMkL8QarPdkWI5nOAIfgNpjmYiv6bH6qhBJEje+perl
 zu0WFRRGSk4KFfctV6H/spJ29Ho41xnXkycFtMMbH0gfp0WQUfRDAFRiVTu4/MVgImXL
 XJOiiItw1V4lcCuDDOHrFiheZIIPYTL8R102X0erq5nJllJSK5vbPN9ODHus3E7eb+IS
 K0xA==
X-Gm-Message-State: AGRZ1gJPbWdd8hTsyi08AkBfg0ekoxxUaUZtd/cpQAE9oUjzahAAo0C2
 bb/06QEPQVllBD9Kje5DfFZ4f9AqLPwLWiq371mmo7T6JDE=
X-Google-Smtp-Source: AJdET5cBPy36bEjavEbWhKlRjLyVwtyzqYFI2gar4jBR/ch8rxpYWH6lpq1rV9WahuESk91NHlE5RhFx1n4FPV5bpxQ=
X-Received: by 2002:a24:3383:: with SMTP id
 k125-v6mr2001382itk.14.1540396532595; 
 Wed, 24 Oct 2018 08:55:32 -0700 (PDT)
MIME-Version: 1.0
From: Artem Senichev <artemsen@gmail.com>
Date: Wed, 24 Oct 2018 18:55:21 +0300
Message-ID: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
Subject: Host console logs service
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 24 Oct 2018 15:55:38 -0000

Hi All,

As you know, OpenBMC contains obmc-console project that intended to
work with host's console. It's very useful that omc-console-server
stores last logs inside its ring buffer, but it would be better to
make the log collector more smarter.

On our VESNIN server, we have an own extension of obmc-console - it is
a standalone service that reads log messages from obmc-console-server,
marks each message with a timestamp and save it to an internal memory
buffer. We have a custom policy that determines how large a buffer can
be (limit by time or message numbers), in which cases the buffer
should be flushed to a file, and how many previous log files can be
saved on a flash drive (some kind of rotation).
By default the buffer has limit of 3000 messages and it flushed to a
file on every significant host state change (host on/off, OS boot
complete). This gives us the opportunity to store not only the latest
messages, but also the logs of the last boot process separately
(hostboot, skiboot, etc).

So, if you find this service useful for the OpenBMC project, we can
upload the source code to the community.

Sources:
https://github.com/YADRO-KNS/phosphor-hostlogger

Small demo:
# ls -lA /var/lib/obmc/hostlogs
-rw-r--r--    1 root     root          6336 Oct 24 09:26
host_20181024_092655.log.gz
-rw-r--r--    1 root     root          9589 Oct 24 11:43
host_20181024_114342.log.gz
-rw-r--r--    1 root     root          6547 Oct 24 12:01
host_20181024_120119.log.gz
# zcat /var/lib/obmc/hostlogs/host_20181024_120119.log.gz
[ 11:55:02 ]: >>> Log collection started at 24.10.2018 11:55:02
[ 11:55:02 ]: --== Welcome to Hostboot v2.1-199-g38a9f30-dirty/hbicore.bin/ ==--
[ 11:55:06 ]:   5.66868|ISTEP  6. 3 - host_init_fsi
[ 11:55:06 ]:   6.27102|ISTEP  6. 4 - host_set_ipl_parms
[ 11:55:06 ]:   6.27234|ISTEP  6. 5 - host_discover_targets
...

Best regards,
Artem Senichev
Software Engineer, YADRO.
