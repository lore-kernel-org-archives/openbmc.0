Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MYARLxZd"; 
 dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V5MM4nLSzF3ML
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 05:28:15 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id e22-v6so2775526qto.6
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jLt/blp/eACGkkCdUus4sJialIMb6XtvH73WLSnQ4wU=;
 b=MYARLxZdNhzWVSQfw9sna0loUDdXv1KKrj6bIskbZKLgQAMVi5+PNiNVttyk8/1kD+
 Rhrcha/5X3BKExjzxb9xzZ0Y5PfDAKxLrf+Y+G4vhE6IlMuxMEa4VcxRxngjUehMfAys
 RRQuA2/x4jUk2HGH/iesgWdatZ+rtilxiU6wcINlolvghzyi9cAfyn1Sb82kL95A4xEZ
 O7X6RHJrqezRHbxqCvi3zDgE/uhfJYt2xl1pBkx63EpOSIK3fckB1Q+URTAqGexyvM71
 6Ho/MAcCHfXhdwT3gZsnn/Zjx/MOBIVZpJFsHPsoM/zeX166MnbxMjUc0Gp73pF8rRz+
 FGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jLt/blp/eACGkkCdUus4sJialIMb6XtvH73WLSnQ4wU=;
 b=irdA7hulnw8Mx5BLZ7Mf1IY/gNbEI86zgrclysGthzoUBSn+Hkplt3fOjaTmLLo8KH
 ipncp0DVRTUkfLBh12G6tDYhcVLQVyKOskP/Z3mjlApcHkiBcCmI7g266Q5xtCFcpb93
 GkugJq7uoOuxStiVYZW+4IIWXFIhAIWT1RbwDFxBmHY2wM08fpvHjO8M3gTD7IYreApz
 B/3XSmYpGfobswIdetelRtKdTh3QriwNnHVwAeO7nQBXLzoaNjYvUEWn5NtFCc8BKywg
 M03YP9jKCV9jk1n+0FRXHOn1hYLy78Z9qnhYiKLRgf715Gfby/Fxzlu4UKfFJNmL6BRh
 /Kwg==
X-Gm-Message-State: ABuFfojoI2OlXw+YjD6rh1wuXRFr5sEiCZujcCkwFCXlHJ6WW9ea/BEV
 kzS9YuL0HotaR5LAIVUa2fdvvNtLOWOJvUuELVVHl1NE0Kw=
X-Google-Smtp-Source: ACcGV61MFcHTXdlVgRctjNkudtnXhBGPlfHpHvc+h0m7TpS5xxEC+pix9Myc+hyBlSwv+mKXzBhPDsaJ3ajXAol81cI=
X-Received: by 2002:ac8:5508:: with SMTP id
 j8-v6mr24212294qtq.139.1539109692192; 
 Tue, 09 Oct 2018 11:28:12 -0700 (PDT)
MIME-Version: 1.0
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 9 Oct 2018 11:27:59 -0700
Message-ID: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
Subject: Community Code of Conduct
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000079c91c0577cfe60f"
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
X-List-Received-Date: Tue, 09 Oct 2018 18:28:16 -0000

--00000000000079c91c0577cfe60f
Content-Type: text/plain; charset="UTF-8"

Hi all,

As I briefly mentioned at the end of Brad's presentation today, I'd like to
propose adding and enforcing a code of conduct for us to follow.

For now, I am planning to grab a copy of the Linux CoC and put it up for
review in /docs. If anybody has a different CoC source to suggest, I'd be
happy to discuss.

Brad asked me whether I had seen an issue so far and I had not, so please
don't take this email as some kind of retaliation - it's not. I think we've
got a great, positive community and as we grow I'd like to preserve that
culture, and the code of conduct is a great way to do so.

- Emily

--00000000000079c91c0577cfe60f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>As I briefly mentioned at the e=
nd of Brad&#39;s presentation today, I&#39;d like to propose adding and enf=
orcing a code of conduct for us to follow.</div><div><br></div><div>For now=
, I am planning to grab a copy of the Linux CoC and put it up for review in=
 /docs. If anybody has a different CoC source to suggest, I&#39;d be happy =
to discuss.</div><div><br></div><div>Brad asked me whether I had seen an is=
sue so far and I had not, so please don&#39;t take this email as some kind =
of retaliation - it&#39;s not. I think we&#39;ve got a great, positive comm=
unity and as we grow I&#39;d like to preserve that culture, and the code of=
 conduct is a great way to do so.</div><div><br></div><div>- Emily</div></d=
iv>

--00000000000079c91c0577cfe60f--
