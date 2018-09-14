Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="N0HblgID"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42BhkF2Jb9zF3Xd
 for <openbmc@lists.ozlabs.org>; Sat, 15 Sep 2018 03:06:13 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id f66-v6so4480395plb.10
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZZ6ZMufJqWvqhZvWqZRAVi4XTuEPrel4WV9fN5UEFUw=;
 b=N0HblgIDlmdXquzx5HNtYZyILBoNh+PVK6T69Dv5Z+NGUfXGs/wfgqCrqE5HFJkjbO
 Gfr8yNpAxBl6XGQVFP20B0lQkEtPotd4ynPSZ6qKhlNar66w9PLiOYlSZZLGh3VbrUq/
 XB0/LoMunqM2Vt1xqcpomEaQtSVnD570cAGRV+73b6gqT7VnFC8SOwEEykSHp7jjZ4XC
 ZBM6DlKba5diWPz5W84LdNj14QgPoObe/plhB8790zenDVD+NVndgh85XDytf0wq7BOz
 37BlFByRK38BVWPDmcn3WJt/+gNTt+2y/Ri60Fk9q7zIXG99S9WBaxmZhmaix/1JD1Ye
 P4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZZ6ZMufJqWvqhZvWqZRAVi4XTuEPrel4WV9fN5UEFUw=;
 b=hbyUuaF6GoD1Kmg8UqK8bXEKAoBM6eFVTlJlkf4hhPlHD2XUL6uhjX82Gmz+OBh8LJ
 CxGHLofCdaz+kEBlAg60dxZzXapOLqsOLQ8lj43rha6bbk67EXeWY5dUAilU87orRfhy
 0SzDslHWvFVhKEZ7ouy0hHwm5Q8lW6osA+SN5khFYe5IlgCY3tU1VCQdS0CG9Ftvjpiu
 i4E4j/KkRYuULgrubL3d8TbHihY3BCDWUzlLq03/Y/25KB2lp666rSmbusXEwOkC0eTh
 osUCDL7ak3DN3PZr1Wcm+TA2ENMV6gXUkpuClycTsUcKd6hHeHttU4wrQODUMDJdQBIT
 Tv/w==
X-Gm-Message-State: APzg51DRu/KkbsoI8gk3gpjbzFaaU0ss6OKjJvAlieSaMYXNvPfi327E
 stTIdj2+mwqGZaia6VnBTMBxqDxs4NX9b4Cp9duhoA==
X-Google-Smtp-Source: ANB0VdZw6xaJEXQpCRUgY43XOvUmWbrqD8RZBkpfy9pnteLWdfZXMCnAAcZj+MKRhsQdaPgLZebo9AMG543x2OTdQfA=
X-Received: by 2002:a17:902:5301:: with SMTP id
 b1-v6mr13120331pli.149.1536944770252; 
 Fri, 14 Sep 2018 10:06:10 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 14 Sep 2018 10:05:58 -0700
Message-ID: <CAO=notyjYJV6CUSAtRSx9v1t2x7tjZCG=xy9O4CXV2nyCZeHwA@mail.gmail.com>
Subject: new subtrees
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Fri, 14 Sep 2018 17:06:14 -0000

Brad;

Are we adding new subtrees to openbmc?  I ask because there's no
meta-google folder in openbmc at present, and I'm having a tricky time
trying to do the subtree cherry-pick strategy.

Thanks,
Patrick
