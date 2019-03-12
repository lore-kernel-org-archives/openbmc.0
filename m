Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c35; helo=mail-yw1-xc35.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NrI/TWYu"; 
 dkim-atps=neutral
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Jljb3jQ0zDq7h
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 06:42:08 +1100 (AEDT)
Received: by mail-yw1-xc35.google.com with SMTP id j66so3099563ywc.10
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tx+RL9Fk/IGpmEdjZsYa6yMtLsh9vDrdAqA78l/el1o=;
 b=NrI/TWYujswqwxDTQVq2fQG3ZfKy+bdgfIdFnx1/RXwp0mS+Gx7tJGdTYstHgWWgdp
 m+4XJ0aeewUi+iRJBm0nZY9UWULFvW8PgaFLiyo8dzHqn9SH68+zYwIEWMst9dVTz/VL
 y+AnL9W5DxpiObMpXJx/cyBWi/eio7DFDDiWaphECsQUsp48BzaJSZ6eILxcDrp8C1bF
 rhtD25BU3i58QtYc7UtzHKxeQcCyiVaSgq/KmZH+Mr4iSGGb0XPAHAEIGa6GYDzvzuNE
 tvryJ9WxXgZlOuqKD4mGjtW43+wpDPLm59jHdP89/G2H+/BJAEAIY4WbI9C7h0Od9zqX
 Cxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tx+RL9Fk/IGpmEdjZsYa6yMtLsh9vDrdAqA78l/el1o=;
 b=mfpDhAJVVBY/0zM8KRcq88c23GUMo3K7AUJgtjMSeEVWCnPzt+fhxWXUtaNNVQNRsT
 Sb/TWNJ4t8weDN0l9mS2X8mCoDWDPP3b4lRv8nUpLpFbSP9hl4jbonlwhq4aKHxP3sLZ
 UCoidg/xtzcq2xxeu9/OgCH4Zoo3nLMftfaMFarZC1PoUWxb6f7+kmeE0ennbQWTvNWQ
 txkHTN0UXNixFiS9ORLLArOqO//BF2giiUPphKutwCy7hpyVBiwHRSZSaRuapcwrCJTj
 vdFNdHXwjBenZLZgJnIe60VcHuwhg5nDG4qUeSTzarWZfZvHmKfRQibpghPB7ZDJgIZ7
 D1CA==
X-Gm-Message-State: APjAAAXyPejooOuPFTbRBQ3+PVPNFMk3hWNkQEZCZ1wgLZDHS7cuhQLK
 UW3KzJxTjVaIQDAgBBBWZSAeJwlWrZKtna64bI2L6ycE
X-Google-Smtp-Source: APXvYqwE+RdtZ7H+Bq9JL6uMYZeuvxn5de+xXLUehZFl3od0UlmTytoBSxRDywXPQyMpXGV2yIrFRUzQ3fEn/OfxvhY=
X-Received: by 2002:a25:65d4:: with SMTP id
 z203mr33277254ybb.370.1552419722923; 
 Tue, 12 Mar 2019 12:42:02 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Tue, 12 Mar 2019 14:41:52 -0500
Message-ID: <CAMTupoQpdx2Hw=dy_pWsMYHbHvbYjj5L6j36Tp=WNnTOPDMrLg@mail.gmail.com>
Subject: Restore MAC address to factory settings
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 12 Mar 2019 19:42:13 -0000

Hello all,

I=E2=80=99d like your input on the value you see =E2=80=93 if any =E2=80=93=
 in the ability for
a user to restore a MAC Address to the factory default via the GUI
(Network Settings).

BACKGROUND: Several end users have told us that they RARELY need to
change their MAC Address, if at all. However, we=E2=80=99ve heard from seve=
ral
subject-matter experts that there IS value in making the MAC Address
editable as well as having a way to restore it to the factory default.

QUESTION: Is there value for the end user in being able to edit a MAC
address? What about restoring it to the factory default?

VIEW CURRENT DESIGN:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutl=
iple_VLAN

Appreciate all thoughts on this.
