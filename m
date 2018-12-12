Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cwf8dexK"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FJt65Fk6zDqPP
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 01:22:22 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 40so17755610oth.4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 06:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3tTzUKbTrfv3N0M10m8pmZMykJL3m97cdjIaDmniOjA=;
 b=Cwf8dexKDlGuLcTa+wI1qtwYSQqq2VWBxlUg8xcpdndhYkJ2MlEwfVzJiYaw6IcnoX
 rF6QC+eQRNfBkHPemn/+IKGPbVo15Q8SrOfwvSXbbv8T/AoBTR1IQvBQiABTBx5s5T7T
 bcZ5FU9l/Zcykta3uvlUcoL65/qXAEJJRpwdyAqlnSQZJ/qreDfilOHvEPtkfgQ67E9O
 DBRlQWeOA8pDvNIv+aksWIq67YhczT7G4YN76YJTgc0w0sLLwfNitBJZul5DPKxpEkGD
 86MKcERUOKVTBq6/oxRKBvbPiueuZFRrXk4cJ2G5P2/nLK6sSNn60gEl4Bc+W5+xOqaY
 +1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3tTzUKbTrfv3N0M10m8pmZMykJL3m97cdjIaDmniOjA=;
 b=PL/R+Dlv4vVjM7OmYfw/kI7553Kp+OrD3kihLOfo+HEEy4cPqM0PaFAOckICO2M2xg
 uOgnhAUyg5i5EwvQgrjwoEPegmPNQpr2SsCMhgKwsXsrTXzpX50RadzvowM6qXcWJUmY
 8wSLShPyWfUElGoWru01CYenaujqkNzylfVTU7ihLBayR9i09/ZBbk1SxTZ/db2OXXeQ
 9l7P7z6ZStj4cXmQXHlOrROHoFhy1RcQwaI/QFdMzQa+YRY4PKUJW2L4s610D5u4UymD
 f1d3Mj9tjmyHWLxlyfRhzFYbpnLdJRqZ4mRKD4+JAJnwRsh7+h9WbNO5jkGTTuja0xop
 aqUw==
X-Gm-Message-State: AA+aEWZWZSzAmdkJ/qUDqwGqELRxg+YzGzLltUcyGo0pBav6d/ISCEXl
 a+U0S9krMX4keK5Gio7XqF8D5mqgXjQvueMhHxoM7hvz
X-Google-Smtp-Source: AFSGD/XZ1BEuDGRxXMabgkMjwZnediIKFUELsH3TgZX8jfWb+7r+MZuSiVjD6I95fnuzlbypS3l+Ve4yljeEGhV0U14=
X-Received: by 2002:a9d:74c3:: with SMTP id a3mr15118921otl.107.1544624540017; 
 Wed, 12 Dec 2018 06:22:20 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 12 Dec 2018 08:22:04 -0600
Message-ID: <CALLMt=p78jv-muTo89dMc-JGAF921ONFb8Librx6v7fHhzJ0sw@mail.gmail.com>
Subject: Infrastructure Workgroup Today - 3:00pm Central
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, james.feist@intel.com,
 wak@google.com, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 Kurt Taylor <kurt.r.taylor@gmail.com>, sdasari@fb.com, sharad.khetan@intel.com
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
X-List-Received-Date: Wed, 12 Dec 2018 14:22:23 -0000

All are welcome.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
