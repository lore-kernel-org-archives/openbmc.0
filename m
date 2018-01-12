Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lMheiNoa"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zJ8Hp2N4BzF0Xx
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jan 2018 04:04:53 +1100 (AEDT)
Received: by mail-it0-x235.google.com with SMTP id c102so2286496itd.0
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=w7kgGakyfKAoqAhhOiDrhoqeZn9LllQJDOHCxfe3hrA=;
 b=lMheiNoaSyiv8/I4oiUL77jSImcZDLGXxjP1Dq/haAJiM34SkxF3NjKCc26oGyKEVj
 domOxnSz+xy2XD5SeU270e3AadyF+/BpDnXXKvzuKofraDg/FBlWIr9pZgTaz8UBjFbm
 SWt0F08Aa43SMhlaQvKanrxmYbJSgvzzudDSJLB4QNhehdW0KoErrTgrkKcQnnTkpzwp
 aVfSFuTm7UbN7Jh9KksEAuZyX2n3S+iLQgJSTUtLK5C4pzsf7V1oofrntnhiUa2xGVlq
 MdyhlzgSNXJaQNEzP3VLAbcsGwL8qlYokPZVi5p0ST67FNV0Yg04sNwrO+YzRBAhN4so
 Nccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=w7kgGakyfKAoqAhhOiDrhoqeZn9LllQJDOHCxfe3hrA=;
 b=sJ21ic67gGIdlAMhJuwDS5Wuvjj9z7pyLrZzbFkrn3GWWXrEtS2AmOhja/3xkS127Q
 Xmx9G647GbiY8vaefGdwZzQ4ihhd7Ijss+9NMqptyHOLUf7ILGzwjzlzVa7gnqlhdHCV
 dspTl6YHm0tMXPBXPX4nniJAvFMxApqy+gUloWeVe3PBC+r64RxUzeGmOq43Kziiv2jX
 mZx9zeMEAXjPXVrkBn5fNTcM+Y2fRxIkxjV3dQSQFPkBAG2HtS+Bk78p1tphR8QSOYJP
 yrkax8mRfkLVVR7pFmhrhIqEJ4ZNoxbfL4atAo+xzQeqO8/c+qfFVB46ZDBN0m/ZIupa
 kGcQ==
X-Gm-Message-State: AKwxytekDtQrVmA2WDXDgCnVgJiz7GBR9/6rqmL7qPNLvJi0AC6Tigyd
 c+rnagV0x9+int/KjIdeeHBBSGVyD3gDOmz8m3c=
X-Google-Smtp-Source: ACJfBouhy8uUs/8b5WhSKN6YnCynBJAKfOYi/GkeWvHI32xARCEMCSf3jwERnGBMRvqdVHzUpY4FfG0uxbRYQqXlJVM=
X-Received: by 10.36.124.18 with SMTP id a18mr5759991itd.47.1515776691710;
 Fri, 12 Jan 2018 09:04:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.160.145 with HTTP; Fri, 12 Jan 2018 09:04:49 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 12 Jan 2018 09:04:49 -0800
Message-ID: <CALLMt=oxScYiG4J-Ms367nqtv_cdZURoiCsa2jz9LH6=n2fRVA@mail.gmail.com>
Subject: openbmc coding standards validation in CI
To: ed.tanous@intel.com, Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 12 Jan 2018 17:04:55 -0000

During the hackathon meetup, we decided to try and get something in
our CI jobs that would validate the code formatting and automatically
-1 the gerrit commit if it's not up to par.  The reasoning behind this
is we still have a lot of code review comments coming in this area,
which is wasteful for the reviewers.

Ed, Adriana, and I all worked different pieces of it.  We're using the
clang-format tool to format (and then validate the format).  The idea
is you do the initial run of the tool against your repo and check the
.clang-format file in with your changes.  The presence of the file
will cause the CI job to validate the code formatting.  After the
.clang-format is merged, CI jobs will fail if the new code doesn't
follow the standard.  The CI jenkins job will output the diff of the
code that is not conforming to the console.

We've tried our best to get the .clang-format file to match up with
our requirements in
https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md.

The .clang-format file and the changes it did to the sdbusplus repo
can be found in https://gerrit.openbmc-project.xyz/#/c/8461/.  Review
comments appreciated.

We've also got a similar commit coming that will validate python code.
That uses the new "pycodestyle --show-source ." tool and will be
triggered off of the presence of a setup.cfg file in the repo
(https://gerrit.openbmc-project.xyz/#/c/8462/).

Coding guidelines are always ... heated discussions ... so I think
there's some room for individual repo maintainers to tweak the
.clang-format a bit if needed.  In general we should all be conforming
to our cpp-style-and-conventions.md.

Andrew
