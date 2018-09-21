Return-Path: <antwil@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=antwil@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l3q9kM5p"; 
 dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H4Z12B9LzF3Qg
 for <openbmc@lists.ozlabs.org>; Sat, 22 Sep 2018 06:14:13 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id c13-v6so8750687qkm.4
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1qD/LcCrQvXRk0kEbzv4rVcyBGTU5efcm3rULf9N1qw=;
 b=l3q9kM5p9cK81SA2KYdNYS7qLPymzszfTaCxoZ4W/3+T8IL+ANio/o29V+Y2oicOSO
 2Equuh4y6CqXodDWPDU2/btAs0DqHjra8/ef19usyjPft3bJEz1KCKXQOywzrTDsCHe8
 JfE4kiYIhBP6MOIruorN0LD0so4g4BKKBq2iuKX1CD/1EvihnplFwQQ2TmHOUcAhqY54
 mauv0IoOXFtesTxP+F6NaMUgpPbwUeBXkD+eB444KCu6W60WQuhtiyirnP6yl6jet2g3
 WF9QsjWtXSJJ6vDGNR/pb9VuJrs9QH/gpytqrsriyguUKkHG6NJrNstuRTB0rAMrtgK4
 qSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1qD/LcCrQvXRk0kEbzv4rVcyBGTU5efcm3rULf9N1qw=;
 b=TD1v43PviAVQhcmSND8M4MEzoKcYm3EukQLMSvmMWoR8IGcUC4Q5Bz/HeuBRpLL0Qs
 NZUCAix2ayNMM78UkOMb0tPvEGUEEvi5mhLjFpx11hV4cQwXfEY1AX7ZtNYLQKSlAIgv
 BNA3tUq2GSjssnZqj/7iVpuYRRTKvS7uR+7I8DGjvVxY6imtQqfcwXOM4hhP7lAjaQcF
 f6T5lj/KXIcBN68Y66IUgyk5WQcylGkaqHMJZTDHReYWJrObBf+htWLR+j3AhoxCl7sk
 YGoFAwKNvgI70AwJbxeOjgyAkni/LvZz81xZHSmS14baLMdPVfzzRagDUhejuFbIam0j
 332g==
X-Gm-Message-State: APzg51An7cjgmb32mjbtfXxx7ZgEUuKCr1lf6Gyw4lfL3UImijO8XHz0
 Om6Q+bSndQp3T84e6+SC3LQ9oXzp6e7/AkuhsGCclNuM
X-Google-Smtp-Source: ANB0VdYLj3ApzG8FBKdOwLLPI2yXhTNg4mjS4+PFnlz0lhWu/Du+j+wKktVv04VbHZCl7JS4wvA8djuWWqO8RaLxNRs=
X-Received: by 2002:a37:cc9a:: with SMTP id
 n26-v6mr32461916qkl.112.1537560850732; 
 Fri, 21 Sep 2018 13:14:10 -0700 (PDT)
MIME-Version: 1.0
From: Anthony Wilson <antwil@gmail.com>
Date: Fri, 21 Sep 2018 15:14:03 -0500
Message-ID: <CA+BOK8nYhD69umr2X9Yga9KnpmjB0hmk_e7Xr_bLe8g-B6_K6w@mail.gmail.com>
Subject: obmcutil: Convert to sh from python
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000541a2105766748f8"
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
X-List-Received-Date: Fri, 21 Sep 2018 20:14:18 -0000

--000000000000541a2105766748f8
Content-Type: text/plain; charset="UTF-8"

 Python takes up flash space, so there has been discussions on making
python optional in openbmc. Therefore obmcutil would need to be made a bash
script so that it runs on systems that have images with no python
installed. We are unsure of the tools usage outside of IBM, so any feedback
is welcome: Please give feedback to:
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-state-manager/+/12798/

Thanks,
Anthony Wilson

--000000000000541a2105766748f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">
Python takes up flash space, so there has been discussions on making=20
python optional in openbmc. Therefore obmcutil would need to be made a=20
bash script so that it runs on systems that have images with no python=20
installed. We are unsure of the tools usage outside of IBM, so any feedback=
 is welcome: Please give feedback to: <a href=3D"https://gerrit.openbmc-pro=
ject.xyz/#/c/openbmc/phosphor-state-manager/+/12798/">https://gerrit.openbm=
c-project.xyz/#/c/openbmc/phosphor-state-manager/+/12798/</a></div><div dir=
=3D"ltr"><br></div><div>Thanks,</div><div>Anthony Wilson<br></div></div>

--000000000000541a2105766748f8--
