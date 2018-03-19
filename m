Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22c; helo=mail-io0-x22c.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eh2n1p67"; 
 dkim-atps=neutral
Received: from mail-io0-x22c.google.com (mail-io0-x22c.google.com
 [IPv6:2607:f8b0:4001:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404mC70bQfzF0wK
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:21:38 +1100 (AEDT)
Received: by mail-io0-x22c.google.com with SMTP id e7so11664034iof.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mLAbR2KzY4OVg4qQNQaa0JqsmieURpfANc2QubGK6Fo=;
 b=Eh2n1p67U2yg5oOukUNrNCT9PU9tMwECdxyGrV8ouxxU0S5H9hYz9IeP7dZ+v5G3LE
 xWi7JqaSnrxJtfnDqIC9JsRvMQmMsan1zwDts+kfe/UqYAiLJbzxpgYj/kJqvedpMJSL
 MQMELWmfJ1Lb6Lmh8mBZfDDz/UQw+uRBauVrSIyFqAS9ULr6PaLJmBu3xyV7Vy9KBXJf
 r4SeFbiYi+zxGrq4lQBC9ql106Y72yImV3adOHUJJleFf268u6AhnrgbJDzbhl1qB/29
 rU7OwlLuNcVIq+0I/x1OCbhudnAoLmi4viG988N2fHujGlrh7D1phgY898nITEgnSFO4
 buFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mLAbR2KzY4OVg4qQNQaa0JqsmieURpfANc2QubGK6Fo=;
 b=jIp00fU1ROLTDJ4XrYX/0Vs3HK9a0wby4yjYlcnfVKWK6iIe5eMAzMnzL6rwx6Oy7X
 hvnzCIRuPN2hXjr378mIwDXE3rKLq9taeo/WzvGF+ZdLb7JD7hDP81J7DGB3w3mRKmzV
 GWvzJdJZI8kW3HfzvuSmgqR/55sXy4jYp2TLiL9OzYEofRald39tzpCoBhDhq9aYRLDN
 FUBOp10o7pVzsEwc+s2Ightq8pC5S+mc47gJCCgv3bJvU8MKoYW6kXGBjnHQmkkxMdAi
 kHQpcdb5XgepvUaeHyKl4368ucB3Ixhwwi1Dvlp7ObwTtUqycAc3ohZ64ygWE2xBySWS
 GGFQ==
X-Gm-Message-State: AElRT7Fl4K2nqeKbtmZ7m256HA1iZJeafqrURLZmE1HS+w4k8DR0x7rB
 53lJselx7ZO6dXCQEh1b2zgjEg4JgdmMU7J/wsek7Q==
X-Google-Smtp-Source: AG47ELveQOZnwjS0PECQ3ONgtKt93nRwzFGQbBsKSrw27WNeIFHKoEbIAoWmo70zXcLPWneMDEYEFP+rJYt+U/Khmb0=
X-Received: by 10.107.2.195 with SMTP id 186mr12808551ioc.162.1521487295954;
 Mon, 19 Mar 2018 12:21:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.192.164.169 with HTTP; Mon, 19 Mar 2018 12:21:35 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 19 Mar 2018 14:21:35 -0500
Message-ID: <CAG5Oiwjp0tK3ZvfzhUcvTRO1WVpfZECFooX04j94VviwvkiGzQ@mail.gmail.com>
Subject: OpenBMC Project Community at The Linux Foundation
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a113943f4ce74500567c8ddd6"
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
X-List-Received-Date: Mon, 19 Mar 2018 19:21:40 -0000

--001a113943f4ce74500567c8ddd6
Content-Type: text/plain; charset="UTF-8"

Just announced today:

http://www.linuxfoundation.org/blog/openbmc-project-
community-comes-together-at-the-linux-foundation-to-define-open-source-
implementation-of-bmc-firmware-stack/

Spread the news!

Kurt Taylor (krtaylor)

--001a113943f4ce74500567c8ddd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Just announced today:<br><br><a href=
=3D"http://www.linuxfoundation.org/blog/openbmc-project-community-comes-tog=
ether-at-the-linux-foundation-to-define-open-source-implementation-of-bmc-f=
irmware-stack/" rel=3D"noreferrer" target=3D"_blank">http://www.linuxfounda=
tion.<wbr>org/blog/openbmc-project-<wbr>community-comes-together-at-<wbr>th=
e-linux-foundation-to-<wbr>define-open-source-<wbr>implementation-of-bmc-<w=
br>firmware-stack/</a><br><br></div><div>Spread the news!<br></div><div><br=
></div><div>Kurt Taylor (krtaylor)<br></div></div>

--001a113943f4ce74500567c8ddd6--
