Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="elvrBmcl"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 441Pgh2mBCzDqgB
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 07:17:19 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id w7so5286225pgp.13
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 12:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=bTGeA2Vovulx7agDQkgqK6qc7W2cT0FebtvoxfAF2cQ=;
 b=elvrBmcld8oIzEoPS+JA0+RPJ4oanwduAW3krAYAjb5bce/BWiC9yhGNsLVOWzVA+u
 PZnBUfwrp54xkYXFdoP5yfTh6Uoz7fEbViWgw6IkYKQSr+2T5gdAj7MCRVbsPb0Tuxii
 YPULT2inM0ByKf8LeLgweOiCexrwcuGD0IKyGkRJQ8T1ZB3Qr4+6y3/JgMvtay6WXV+w
 arvS8C6vkaF25X0vu7lCZez16SXHhj8O392l1Ll//LDyns00cjAN4gfQDMkkKqtPioH2
 seg7Q1QNVW7ZY084glI1W+bcoM8U5+p4tsi/32UNDSnbEomxk2A9fz75YfdWoBubTcoI
 oQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=bTGeA2Vovulx7agDQkgqK6qc7W2cT0FebtvoxfAF2cQ=;
 b=mfbgE+ttJ3yZthSVj0DNp/yXA9XX2Xdkwe5EdN3IlGGhUPRYtzNFx9+tAML7iCV+8y
 HiGiV9zcawaTvrcabJ/rMq4B3L2evCJt9RdTCTZss7wnmFSvarwe8NVsT5n1m2G7x6V1
 6FvPa6lmpj3AGHnjqfPkPqNMFPr4ZM2PnwP9WE6OcMTn3jBLOkFeqSep3AVSZik50sAH
 7SiUc9Jrrf2ieKBpw6X0ua3BCbE+Je8aYgXig+r3JyyUQjwZWzHzAOZhkL6U1ofZN1Fw
 nQuK6DHgdOiDxN//4bJgQF91RsPFbmsqaVV2QTt5QBobggm8/RPsOBo4y6d0O3FE4HC5
 IFTw==
X-Gm-Message-State: AHQUAuYafe2Gru6pOZlcS+PzKEuD/gs46I3rh5i8tK5mjLfGRw7GVpxJ
 j2hutU3I8y+KXsQmGbYldEiQx5jD3xKrBe7VmezcoUEJ
X-Google-Smtp-Source: AHgI3IZk8+o6Q6nQv7HIFdmz0rb8+lnrMwI7y2tRNcaeyO9kGEjn8i0l8LZGhtbCdnhDKMM1zIxvkWckgs4TdkO6164=
X-Received: by 2002:a63:d347:: with SMTP id u7mr6990767pgi.383.1550261837750; 
 Fri, 15 Feb 2019 12:17:17 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Fri, 15 Feb 2019 14:17:06 -0600
Message-ID: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
Subject: GUI translation bundles
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Fri, 15 Feb 2019 20:17:21 -0000

I=E2=80=99d like some feedback about how to breakdown translation bundles f=
or the GUI.

My initial thought is to create a bundle per panel since companies
have the option to pick and choose which upstream panels they want to
use. Would this be an overwhelming amount of bundles? Does this idea
scale well as we grow the number of panels? Does this scale well as
new panels are added after existing panels have already been
translated?

In addition, there could a =E2=80=9Cglobal=E2=80=9D bundle for navigation a=
nd header,
Should this include words/phrases that are common across many panels
such as =E2=80=9Csave=E2=80=9D and =E2=80=9Ccancel=E2=80=9D?

Also, should GUI notifications/messages be in their own bundle or put
into their respective panel=E2=80=99s bundle?

Can you think of other factors that should guide this decision?

Thank you, Susan Jasinski
