Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tLBGQ4RtbzDvyS
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 08:39:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="panjA0eF"; 
 dkim-atps=neutral
Received: by mail-it0-x235.google.com with SMTP id j191so54453539ita.1
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 13:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=bH6orHAooPaXpjWd2T+edCQc+LgwryNKzssVN6cPlnc=;
 b=panjA0eFovcqF3cfVB6OpK9xrgB78K61oE1tyA3RwjVH+gjxBMlu7/RI4hwyD7Euv7
 T81jGh3+FPrrHqkXXkDwfT8s5kn7mWGZcCsR5oFpFZB7But8ylTaw1cz+I8bTd1flmk3
 1D/MW1vEPhMwza8i1dH+oW+uNegEzOyXGIZeVlR8cfoVr4lqBUTaZ4WI7ulRP0KP08OE
 V+UCvgGpeWek5rTFvBDDzUW9OUXruwS60g3+EyLzn6DDeYIWl5NRuHh9jV5CACUGaFrc
 uCzQamGFbfO9krRNa+Zs11ltI7CbN/XJ0abGEc+QSsSqpPxMQC0/XJbZ0wiOegnaQ9d4
 VRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bH6orHAooPaXpjWd2T+edCQc+LgwryNKzssVN6cPlnc=;
 b=aJwqd88wga/951YcgaN80CFdIa6gW+D5WA/qoA8OhBU6HDWlHXeTuANoPd99KG3KzS
 dK5bLygt6QDL6O2HzIDRldCUsIv4hP7wJhbWpWouNrGbv3nElpqRWsPL14mDTyzqepaJ
 zRhN6nBLsgOiCFRoszPhVmJZ1LKU5h2N228Ki7g5Ra9F1TzBzVCB2thvAJbDgz0/Ajjj
 FM9Kz9JcV9Mf6AZwNPuWydKzIImvvVGM/CJtXYZMd5qmnd5qGzuE6eALJnJB0bbqdRSz
 vM9mIUTOago+9AkfSRGjxCCBxHymk756wuvp5YytOOnmwZ78UYZTcCb6AdLHu1RNTbyh
 aEuw==
X-Gm-Message-State: AKaTC01QW8SoHCjZsjE+Rf9ph3+OcLjsp0nk6OtZdbTZw5fu6Xrs2/99OW+vdfmEo3jB+mGIvB8iDGNyZbpdAg==
X-Received: by 10.107.3.223 with SMTP id e92mr1703935ioi.113.1479505164749;
 Fri, 18 Nov 2016 13:39:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Fri, 18 Nov 2016 13:39:24 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 18 Nov 2016 15:39:24 -0600
Message-ID: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
Subject: Jenkins job for per-repository CI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2016 21:39:27 -0000

Matt Barth is working a story to use his new auto tools capabilities
in each of our repo's to do "make check" calls when code is committed.

For initial prototype work, we created a jenkins job to trigger on
phosphor-event gerrit changes.  That job is here -
https://openpower.xyz/job/phosphor-event-gerrit-trigger/

More to come in the next couple of week.  End goal is a single jenkins
job, using the template plugin, that will trigger on all our repo's
and do the "make check".  Over time we'll add gtests to each of our
repo's to give us more coverage at the individual repo level.

Andrew and Matt
