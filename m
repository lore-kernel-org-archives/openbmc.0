Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="taO/LTKK"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zYxf66k0zDqNp
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 07:23:02 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id y10so12250plp.0
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GKw+3unksGLalh97Y54/9sMs+4rx4C7Oisvwrh6jD2U=;
 b=taO/LTKKF0tZF8A0QCMpPIgM+xY9oSfyt+TtQx40ViPWHVxodflwteWUVquJVnIjG9
 sMXmkbNAiz2GcdGERlknSmJTjWS8M4we2MbxCXAKYrXf8oZrZujpljqqRMwOD+WOLkYt
 vEGrY7s0wlsbLLPn07Ioo7+F9INfUKDaFbyfYLEC/L8+iqalQo/ZD6vfwjzF7ZNPMR2F
 7pxkBIAO6TaoMx4cMe9LoGA0q03gIFPY70DR6lID2IIH7fCAWlnnuEEnVLesBpIAHxnQ
 44y65iq4+xR8Dtw17pgiOPqmduO05yPstdErhvh2dHUnVd+VkYYuDWlDdXhzUIq/ESVq
 rKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GKw+3unksGLalh97Y54/9sMs+4rx4C7Oisvwrh6jD2U=;
 b=MllKbn566W2yoa85q1a9lyaM9MsS/JLH1/hpiUHmLz7kQrHDTyjgOMXwkU5v833z53
 eAN7P3F7nFi4OLdnytVelLwo6/XQFLZOu+5TYU7dOOsWAF06yoDm6VpovpiCM0KwYH2S
 YRHjKThgvKPLAddy8DlNXPY9D13BuOiQPf4aEqvSrKTSM6wXuKJBKxiQJrrFD4KejEcr
 UsrLXLoj5BKVPwtG9eeen+GAVSCm/UZdUr1a73PxwNgo0G6hG0uj2Kk9FgC5lpF71qhr
 I/iMNflQw7fv0Bk5tLQ/EGf3L1lBVf1A8IxwlhJr58gtmXTQE/sJuLfdbPsGg8xrRWkt
 qMgQ==
X-Gm-Message-State: AHQUAub11ARLFFvORzmr5bo4JpzuweJ0gxH25DRHSLCsMysxOE1Pwxp/
 y+2YADESBDeOkO9dnD0W9KvRT9Ylr2hh7WznjxyHNXji
X-Google-Smtp-Source: AHgI3IaBTj+1vQZd7PmXJdAE3K1mHu1ghNh/Mxcu1+G+w4ChdTEAQ4XTrfNJipwlNFPoEq/AcrvKTROTsa7TTTlBagk=
X-Received: by 2002:a17:902:20e9:: with SMTP id
 v38mr5602904plg.250.1550002979775; 
 Tue, 12 Feb 2019 12:22:59 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Tue, 12 Feb 2019 14:22:49 -0600
Message-ID: <CANT4NrLb6LojmtOo4qraLfdDebruwXi1g27JVaBkQgVEFr+brA@mail.gmail.com>
Subject: UI Design Update - SSL Certificate management
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
X-List-Received-Date: Tue, 12 Feb 2019 20:23:04 -0000

The UI design team made some usability changes to the layout of the
SSL Certificate panel based on user feedback. The backend design has
not changed.

You can view the prototype at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318977543_1-_SSL_Certification

We do not have any specific feedback requests. If you have questions
or comments, please post them to the SSL Certificate Github issue
(https://github.com/openbmc/phosphor-webui/issues/43), or reply to
this email.

Thank you, Susan Jasinski
