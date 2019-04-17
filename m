Return-Path: <derick.montague@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7zj0J34"; 
 dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kqL3055szDqG8
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 03:41:43 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id s15so33019891wra.12
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=J5x94n8nBjuWSeizRlViAkykWnlLlqIlIBMsf/vefV0=;
 b=N7zj0J3459rT2Pj7HHpd/27Jt11SuffTk2MB2Ijp+Wy/s0PwkDoAsfi9VcQoh4nhhF
 Pv/k2ldYKK1zYb2nfaghloBKQ7LWpXjWlHQ3R0MMmKL1lHm5OeqTdxijFWytmvb4jeLQ
 /dhWzpCD7G/0tRlk2fQPmFZpUvrIqG+YGmtYvdZFT59gaTr1l2gTRAAggNxdMKbHx466
 cVB8HpcO2biYT8j+0c6PkomXqEni619tPx+gOBleQ+jF6o29VUd4A803KP/S1u/PGhtp
 YJF4ByZFM1vaLLEOJZZyIRzqNYQr5sK0AqhzsqqZ5cEqpbm4lPlhNkZt5lrWoTXhAvlR
 Qbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=J5x94n8nBjuWSeizRlViAkykWnlLlqIlIBMsf/vefV0=;
 b=PSHVEqDIEOU6th89GoYud7/x9vDYaeFipuPJd6C8dkLyD8jxuLeL9mlZ9WW/P43mcC
 NybD0HSf49E0YIJF4W21MEUHKaF6tJN4EiX9xHK4wIqzWnm4CEi+ighMKzneLidosKI7
 yl/mdX5CRrmPgPSi5pbxAj+vs+deO5awXF9isgMOLKmVVyJEF9EWDdEFaRROCu7c3GrE
 2s8TemqO2fgHKd6dgTgc/a2zRHKeekZEZLPsTko9zneS8O4EZhA2liehhU40P6jTFYz+
 aD3yWqPFifiG0U1QQd8j3MzKGJf73I+b9DDGRz1JfjabbHOQWYtNUap5ALEPpSVoI7BC
 Bykg==
X-Gm-Message-State: APjAAAWSMrit6Z7WXzhATf6alu0f7Euel2LLmO3nBBXWu5svMfrKvaDC
 rz643cD39TpvEdoflBU4PTLbTU1yAWHH6Ilsuq6qICov
X-Google-Smtp-Source: APXvYqyv/hw01EzMCjOSa/45MhCGTOkPvVEkFiNYTpQBlb4KOP6bZ4ATK84WB5nyiJvs9LV7CT5WxOv/9AghrqEMnsE=
X-Received: by 2002:a5d:62cc:: with SMTP id o12mr3694467wrv.142.1555522898749; 
 Wed, 17 Apr 2019 10:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQw2r=6DZ1FDh6iSeJF7SgQT0Uy20qFk22_bH_s5dJ98w@mail.gmail.com>
In-Reply-To: <CAMTupoQw2r=6DZ1FDh6iSeJF7SgQT0Uy20qFk22_bH_s5dJ98w@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 17 Apr 2019 12:41:27 -0500
Message-ID: <CAOUmYFRDNJdOkLoK2MWi+0Yxv7dT2skLpyyJjduKcJ8kAkuHHw@mail.gmail.com>
Subject: GUI Workgroup Notes
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
X-List-Received-Date: Wed, 17 Apr 2019 17:41:47 -0000

Hello Everyone!

Here are the notes from the GUI Workgroup meeting that took place
today, Wednesday April, 17th.

Attendees: Attendees: Jandra Aranguren (IBM), Ryan Arnell (IBM),
Kuiying Wang (Intel), Appu Puli (Intel), Dixsie Wolmers (IBM), Derick
Montague (IBM)

Agenda:
1. Discuss transparency of work
2. Review Generate Certificate UI

Notes:
Intel
    - Is working toward Q2 customer requirements and bugs discovered
upstream and will share details of that plan
    - Plan to use the design prototypes to complete the customer requirements
    - Unclear how to add new icons or where icons in design are located

Need for Transparency of Work
    - It is unclear when a design story is ready for implementation or
actively being worked on
    - Discussed process to create transparency around issues tracked
outside of phosphor-webui

Icon Discussion
    - Previous agreement to use Carbon Design elements
(https://github.com/IBM/carbon-icons)
    - Brief discussion on custom downstream icons. Previous agreements
were that all icons would come from one open library unless that icon
didn't exist.
    - Any work to implement icons should be documented and tracked in
phosphor-webui

Design Reviews
    - Style guide
(https://ibm.invisionapp.com/d/main#/console/15339466/318902250/preview)
    - Generate Certificates prototype
(https://ibm.invisionapp.com/share/K8NYRVZVEC5#/319081092_1A--)

This is a high-level overview. Go to the wiki
(https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group) for
detailed information, announcements, and action items.

The next meeting will be on Wednesday, May 1st.

Best,
GUI Design Team
