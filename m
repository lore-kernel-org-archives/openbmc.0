Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U7bS9Gds"; 
 dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P2S16nJjzDqJX
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 06:00:17 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id c18so18702498otl.13
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MzYW2tgMMbpGvv14P3jpQX30iYJY+lxcvEWcsvizt/M=;
 b=U7bS9Gdsvg3J0pIIUY7yr8J8HQoyR+w/aG9s8cw4CdzMUv7V8Hm2CMFLtq0SQ9W9ad
 z1nEXy4Rr7/bofnTqpW9UU1NRPxk1RYKbrJjbOfmLzkYkFy5UB+O9rSkQA99qAo+9Saw
 PQGzBoVCUtcrlxSDarwX5j2CH1/tWWFX+8R54riaO7e4De/6vp70oNL5qQkXoz4Lkh/k
 CKNpBe4LeJRAR/o12QY7haCL6EdLkBtUcjelxVJpgcNh1gOITLLnpl0YQAW91UaMrXkc
 Yvdw17gLW4LeJ9smPdgeT8p4CgGKZhuAvbSvr5AU+iUSBASn8k6PMfPRhwSHx8co0fdj
 Jaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MzYW2tgMMbpGvv14P3jpQX30iYJY+lxcvEWcsvizt/M=;
 b=TxH/b4Kd+TTXCcMwCxup9FpdfbjcuZ6bKEY0z5L3YZu+bwlCTcU+o35aUiLxRr/0S8
 gbIUVSxYa0rI3g48thBq8vU5w1pQ56zWRnWufcQIayVC9EkXLFW3DmmxOAnO5wjvXcll
 tREQZVGtUPIe9eb1LjsqOgzqW7ABScoJ3dVv2oXVeQ+EzOCR7mvZg6+CXdk8Cv65JuBK
 rL5i8/X6V2ZSI14ZDRfOFoXgnZWMfDEd2jpyS145js95PEbdJVzvZFW6wvchU2gi86E0
 Ls+zg6oEwfZMlEQ8kYCrh5OpghyBGgd4OAiYYuLmDtz5SBhymAsSSt9OUL/T2RTpHOe+
 jChA==
X-Gm-Message-State: APjAAAV9sx5tQrlXiX6pZvb92ZPOlTTkRb/JPt2sAoqwOcqwOgKUhdI8
 eHi69kBlUmZ3P7+3Rs1m3voRWTTVVKCc+t1qcgbHpIU8
X-Google-Smtp-Source: APXvYqzKBzWtxITuGoeI9JPBLFyfmi1RqPZuI9T7fJfkoL1hvsSGzefAEIAlpK+WIDZzteoG2OQjU7l4LfOKZ2kZ5Xw=
X-Received: by 2002:a9d:6e17:: with SMTP id e23mr2845589otr.302.1553022012313; 
 Tue, 19 Mar 2019 12:00:12 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 19 Mar 2019 13:59:56 -0500
Message-ID: <CALLMt=oE4XFDhx2xbJmWZyhXgbrD-qeQz1wF8YFAfd_zoefqqg@mail.gmail.com>
Subject: Infrastructure Workgroup Reschedule
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
X-List-Received-Date: Tue, 19 Mar 2019 19:00:18 -0000

First, Not much on the agenda so I'll be cancelling tomorrows meeting (3/20).

Second, per our last meeting, I'm going to move the meeting an hour
earlier so that we can make the Redfish Firmware Update workgroup
meeting which currently runs at the same time.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup
has been updated.

Andrew
