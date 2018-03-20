Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22a; helo=mail-io0-x22a.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u7W5C24k"; 
 dkim-atps=neutral
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405F4S4fsxzF1N3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 01:02:32 +1100 (AEDT)
Received: by mail-io0-x22a.google.com with SMTP id 141so2450539iou.12
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xt6LiKSHyMTk5wzwYm+BcuAanCJ8CNKFszE5YWLf8CY=;
 b=u7W5C24k+GyudiyDSB08JcqNLL9h3eDssZKsIdjws43t5OWIcECxrBQpz3sfyIbLdy
 nkzMNCRI//aa68jtw6hgg5VVKJcpPFjDAkIYtahs8Bxu11D6z4LSRSBcKcc8jKEI9gUX
 z290gAu7tw4sa/0gB5CYnlv3NXRHVrZyDmti2ghG+TQdXVdS/bkP8OFJIz4JKH0vHNls
 sz82D3p7/Ct5lkhayMrnqUezxLYvuUh5vsbDZlsoYLGJlAfe43PkFCsEtV6ULvW8qACu
 Wym1I33p/n3bSmID7G4XsfBG4cVf+qsX3+hdhlKdy538993d4PJccok5duQYAANuDD7l
 ndtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xt6LiKSHyMTk5wzwYm+BcuAanCJ8CNKFszE5YWLf8CY=;
 b=NGDGxRm9++P3TP2x25K3zuD6Z8famem414mRjBOITJbpUGBUFYWIcalIr52sWDZbzX
 1WOcb7gcsbQdOOdhBwTUNiBsoHIMaKnVk7Lnk3EVb2t/0t1jVj+Gk20wncRuwdhEOAo7
 TVyWPMzh7d0Jr/Pbq+8sqPEET7klmS2XuuGg1CqESmW/EMR9NMN0c+yE2mq8QMIHChp4
 XntIt6aP91ESBhkujitm3x0n4pLThV1ZwJQVavLB3OQ4HqajgtdzHfq16VXqsMcbT/pj
 LiW7ZPTnqyg4i0lbeQyNcs9cEuNZHhayMpZ9YRC14IoLZz0e6cnYOZCzoqU9V3WjoWDu
 JRow==
X-Gm-Message-State: AElRT7G/aug1DKC9U9j5//VWSr8TkskrboQ+TblLcz8b4KQjYg6RH3Mo
 DTMkOVyWocd/vu0yDqO53VYDLxQvmOxgThKgJvc=
X-Google-Smtp-Source: AG47ELvIUuQhSOnPFyqXFXIxRfUZtX88ylhpAVvwXSMNHi0kIbH+uiS+lcKqko739c7B6OhDXA6pToIsm3jtUeYNENo=
X-Received: by 10.107.2.195 with SMTP id 186mr15713963ioc.162.1521554549638;
 Tue, 20 Mar 2018 07:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.192.164.169 with HTTP; Tue, 20 Mar 2018 07:02:29 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 20 Mar 2018 09:02:29 -0500
Message-ID: <CAG5Oiwj2kQNekMjxtgnC+sN=ZspZc_0N8P2R2zrx+=Cbm8cHRA@mail.gmail.com>
Subject: OpenBMC at OCP Summit hangout
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a113943f47023f80567d88695"
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
X-List-Received-Date: Tue, 20 Mar 2018 14:02:34 -0000

--001a113943f47023f80567d88695
Content-Type: text/plain; charset="UTF-8"

For those of you that are at OCP Summit:  for a lower latency way to
communicate with other OBMCers here, reply to me and I'll invite you to a
Google hangout so we can chat, meet for dinner, beers, etc.

Kurt Taylor (krtaylor)

--001a113943f47023f80567d88695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For those of you that are at OCP Summit:=C2=A0 for a =
lower latency way to communicate with other OBMCers here, reply to me and I=
&#39;ll invite you to a Google hangout so we can chat, meet for dinner, bee=
rs, etc.<br><br></div>Kurt Taylor (krtaylor)<br></div>

--001a113943f47023f80567d88695--
