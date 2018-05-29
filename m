Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22b; helo=mail-io0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QGJYl9hX"; 
 dkim-atps=neutral
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40w7gZ4qw3zDqGD
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 19:28:10 +1000 (AEST)
Received: by mail-io0-x22b.google.com with SMTP id l19-v6so7016640ioj.5
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=B3LmQhzEnNe/0/BdBTlqWOma6WkSt0MhtdJGbQqZMyw=;
 b=QGJYl9hXjbVLdKYa3zjH4tDNGBExoxKubfiVrWelMmsWaQ/AbHMXyzOlggcczwMcIY
 pzUlvQ2PV5Vk+UYsfkY+bymJ+3qc4h4IvHWPac03o30btcTgmmALhpQ0/riPCG6g5A+d
 Vqs31K8jBDN2fHs6EIuyBe16EiGl3CgQLB7ZSsu1kZV2vmTN5BOIeitwVi9fT5w7iWwr
 MsUlv3GXxnXVFbfFmbYWBDFRoXYXymcGMf8hxYZAq7U8pyVjGTpDPJuoATMCQqT9+Lz+
 wSvCmZRwsbAn9ErjEP/YXMMVepLSrxOnPP9idbJtOVgJRDaL/zvatxmyT7AU8PfxnxYx
 slbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=B3LmQhzEnNe/0/BdBTlqWOma6WkSt0MhtdJGbQqZMyw=;
 b=K3zNgFm8olH2l4rFuKupBukQqQB99cYULa7jnQwoUbMH490jOgLkGtj9BuRPPlbbiu
 td8OkIld4uZM3c8v10eS0lxbxAKvImLfD7jDrs6zWoN5ovboTyNbb34wLfyHQwbpvjwK
 r6y+Pri3PWOxF7JtBkpbkwj2HrI+iud8lkEPMZ0qtQsbpFAc4MtGW7pN3tq4gKoSh98S
 HTc7Eg1BT8cdP2mTjKUGwXMn285bI6n0wCmhTCKq+I4+WekpM67AKzlECf3G3D4at7QR
 nlJabyU7HWEOhxzHVt+disUN2YXmbtPArp9l0I/UEr7LVLc+ZzbOoxZLKuenyO5JIVby
 vtmA==
X-Gm-Message-State: ALKqPwdztOXVI6e2S9KNUNoN2TxRFp6CysU/oPUCtJYO5IgSgwsrou8g
 tLtG3bdEFTh19OAB+X991vpsU4Xa/glMczgk6dZmz5QI
X-Google-Smtp-Source: ADUXVKJc54en7nuIy2+Uxx7LgP79UEvGZV/2fsQx+VIkbxLIIcpE+OYZjWIqGUuWkjv97cheWeMc54SqiPI9DOat8PQ=
X-Received: by 2002:a6b:a50c:: with SMTP id
 o12-v6mr13389134ioe.16.1527586087383; 
 Tue, 29 May 2018 02:28:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Tue, 29 May 2018 02:28:06
 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
Date: Tue, 29 May 2018 17:28:06 +0800
Message-ID: <CAARXrtmjaQkOH2Cy3nfYYjjvFvREB5N14xgnkYKHFOycEY9qHA@mail.gmail.com>
Subject: Discussion: PNOR image verification (and possibly Virtual PNOR) on
 64MiB flash
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000001a36a2056d54da21"
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
X-List-Received-Date: Tue, 29 May 2018 09:28:11 -0000

--0000000000001a36a2056d54da21
Content-Type: text/plain; charset="UTF-8"

This email is to discuss about PNOR image verification on 64MiB flash, and
possibly it may involve Virtual PNOR feature.

Background:
Witherspoon has 128MiB flash, enables PNOR image verification and Virtual
PNOR
feature, implemented by openpower-software-manager.
And it has the assumptions of:
1. Enough space for 2 PNOR images, thus physically 128MiB flash chip is
   needed;
2. UBIFS on PNOR;
3. PNOR build in squashfs with signatures.

Most OpenPOWER machines uses 64MiB PNOR flash and non-UBIFS, so I would like
to discuss how to support PNOR image verification on smaller chips.

We have two ways:
1. Change to use UBIFS and Virtual PNOR feature with
   openpower-software-manager;
2. Keep current fixed layout, and added new code to support image
   verification.

For 1, it needs code change to assume there is only space for one PNOR
image,
then we get all the exiting features: PNOR version, image sign verification,
code update and virtual PNOR.

For 2, quite a lot of changes are needed:
* Generate signature for the whole pnor image (in op-build);
* Changes in openpower-software-manager to get version of PNOR;
* Changes in openpower-software-manager to support code update of fixed PNOR
   layout;

So I would prefer 1, to make openpower-software-manager support single PNOR
image.

What do you think?

--0000000000001a36a2056d54da21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This email is to discuss about PNOR image verification on =
64MiB flash, and<br>possibly it may involve Virtual PNOR feature.<br><br>Ba=
ckground:<br>Witherspoon has 128MiB flash, enables PNOR image verification =
and Virtual PNOR<br>feature, implemented by openpower-software-manager.<br>=
And it has the assumptions of:<br>1. Enough space for 2 PNOR images, thus p=
hysically 128MiB flash chip is<br>=C2=A0 =C2=A0needed;<br>2. UBIFS on PNOR;=
<br>3. PNOR build in squashfs with signatures.<br><br>Most OpenPOWER machin=
es uses 64MiB PNOR flash and non-UBIFS, so I would like<br>to discuss how t=
o support PNOR image verification on smaller chips.<br><br>We have two ways=
:<br>1. Change to use UBIFS and Virtual PNOR feature with<br>=C2=A0 =C2=A0o=
penpower-software-manager;<br>2. Keep current fixed layout, and added new c=
ode to support image<br>=C2=A0 =C2=A0verification.<br><br>For 1, it needs c=
ode change to assume there is only space for one PNOR image,<br>then we get=
 all the exiting features: PNOR version, image sign verification,<br>code u=
pdate and virtual PNOR.<br><br>For 2, quite a lot of changes are needed:<br=
>* Generate signature for the whole pnor image (in op-build);<br>* Changes =
in openpower-software-manager to get version of PNOR;<br>* Changes in openp=
ower-software-manager to support code update of fixed PNOR<br>=C2=A0 =C2=A0=
layout;<br><br>So I would prefer 1, to make openpower-software-manager supp=
ort single PNOR<br>image.<br><br>What do you think?</div>

--0000000000001a36a2056d54da21--
