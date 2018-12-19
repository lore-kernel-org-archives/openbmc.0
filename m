Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hvd8hnSM"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KTwk3Cr7zDqv5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 20:24:05 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id i20so18528525otl.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 01:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oot6eAMzmdPfslofgdS0kmTI09LYPao8IvVjUxim6LU=;
 b=Hvd8hnSMe1zHTsjDIAPg5eI242BG+dRzYYmJcTIWEvT3tzvKwB06VKnIJacbY7R/BF
 IFfZcgZkQQp9D1LfePiWjIQfIiDrq/NRT6ib0ERX22xAdEmmUHArvO1ZdrrbnArpDZHG
 FhmrFbREDAhAr7F6xQUOyHTkoyg2lwSvKbrqRFDF0UNg6yDPYl2u6x7tAFZyucDqHAAK
 yASsg21emAXnzsngUvo4nVF+8UAwQymSbLYBfrOBO8qGsUpKBw+quiTa7hcs+5J6gfWm
 VzIL4FleyozeQmtO2z/TV0n09Et/atH/rFE8hiBtDt27Z5BW9GHm8wrVxPzY/h9UfAWy
 QJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oot6eAMzmdPfslofgdS0kmTI09LYPao8IvVjUxim6LU=;
 b=JtdRa0pqMHx1WplCaAi/L0TXOqlFiRFbKShTHOMD18pk0XPkRYmmVIvkz65SUCYo8V
 JQpWv7ZLqQxY19mNEm3osYw4TP+ZzP7l4oFc9UmP9QwS48cYeGc4O+jOMTEAvYgFIdUt
 PwQhBDDqJmRx7kUzHy5bEqjWGO89RCbNtDlY2DfWlOn0QxQT8trrCCxvH5cdZp+j2AoM
 z2WVNXJnog3TIpa4W8b3Rs26O0L4qnmWGVpGNqG1PU5rcluDdYUSBOGStm9filfE1zrD
 T3cOlgd7Hlghg0wHciPAZkM5iee2utu4WtvMJR+pInrQ/SsSQYVQPskQqWVoPiyzNudl
 8F+Q==
X-Gm-Message-State: AA+aEWZhBR55zbMfaOh6TN4yPw23Zl3ytmj581zLgKLvbRtOBbWNas3D
 5DjXF7yyhKlyaDav8FvpbXxTHBfxoExqegHUiOuVy0odY4g=
X-Google-Smtp-Source: AFSGD/XLbk4xgKFsVSxH7fjXClvS0IGJVZlX6Vqb8UMUhvlawLhM/TapzP3sBg+tayp+gIBv4xYIA7WNB61uSiiCF0E=
X-Received: by 2002:a9d:2624:: with SMTP id a33mr15225813otb.186.1545211093783; 
 Wed, 19 Dec 2018 01:18:13 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 19 Dec 2018 14:48:05 +0530
Message-ID: <CAE33tLEzzm+8UzpA2GCwic3Doxq3yhu4Jc-OCcnC56SV8VKp3g@mail.gmail.com>
Subject: Get Device ID command failed: 0xc1 Invalid command
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000591722057d5c7e4d"
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
X-List-Received-Date: Wed, 19 Dec 2018 09:24:07 -0000

--000000000000591722057d5c7e4d
Content-Type: text/plain; charset="UTF-8"

Hi Team,

While trying to execute commands using ipmitool, I am getting the following
error.

*Get Device ID command failed: 0xc1 Invalid command*

Please someone help to resolve the problem.

--000000000000591722057d5c7e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Wh=
ile trying to execute commands using ipmitool, I am getting the following e=
rror.</div><div><br></div><div><b>Get Device ID command failed: 0xc1 Invali=
d command</b></div><div><br></div><div>Please someone help to resolve the p=
roblem.<b></b><br> </div></div></div>

--000000000000591722057d5c7e4d--
