Return-Path: <maxims@google.com>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com
 [IPv6:2a00:1450:400c:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x75cw3tsZzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 03:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VzVbr2VE"; 
 dkim-atps=neutral
Received: by mail-wm0-x22d.google.com with SMTP id 62so1130917wmw.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KoY0M6U2XLQn97x9x5gHZN8KDw8sI8xGA0IjoH/Vyns=;
 b=VzVbr2VEpz2enQRPuQKINbM4GZmy64ozvruGoYJSWo31csuIfBASgkYojUZDX4vjMA
 W11gL4sfbrAEKiT3uzwu22FeEtHKAd1vyv4CfO4jcWVpCzkPjIcbsLvbaKm2qnKWyZ69
 9PGAOVGlKtEpqoOPHeQUJd2gAj3otqxgr5DcpRuDtOMpGHPy4TZpdIlaBmognbRwhdZQ
 ZrehZ/JMQpUel8a+txnjhvFzv49e6jCMXhgeOAYOv+gcGArXQMilRb4Z9VmEYQhFMgx6
 8uWrO9o8e8yO/rSTfuUzuObseYaIfOGyd+D9paf0CdPcfgCBSUWHyx3g9WUqAQt9zcPa
 uiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KoY0M6U2XLQn97x9x5gHZN8KDw8sI8xGA0IjoH/Vyns=;
 b=HjwTtsmeDc2kib/hWkrN8Zzzv9ZYcw85ksCL6MGdpgEazrsFWiVd+2eo2z1xTZqwGA
 MaxLCmDepmHcEn6HfS9/ZSyJOhbz39kdU07LaAZszeFsrMTYNhOcKk66SkRsBwCRX2Sm
 dEjGahDwrIzK6zXGQjQtLDIR77WoaIHF7ChP353hQ7+8MwOaADEjtyaK7EG5emN2/nla
 X8qsifo1QK+uYqgJfTc7bOkJ5re5GEa7Ma8MrGMSa13RAIgsKeSsRCFZOHHFcFo+7GAP
 UDeRpF/wQH+n6ynLB42FNKDDoaf2dgBTBWoOFBY8br6J0E3gdSHucFrf8KMsCJfP+8Av
 rRBg==
X-Gm-Message-State: AIVw111zuid6piDppO02UK6QcvHpRDnLIeCTA6vdpjk8WSmhfA2nFbum
 34Imy3gD2UfVrHVP9In+JelZFSg/Q1/YJnk=
X-Received: by 10.28.6.201 with SMTP id 192mr3573779wmg.127.1499880764133;
 Wed, 12 Jul 2017 10:32:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.134.19 with HTTP; Wed, 12 Jul 2017 10:32:43 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 12 Jul 2017 10:32:43 -0700
Message-ID: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
Subject: Linux Kernel PMBus drivers
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114332e82770ce05542234c0"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jul 2017 17:32:49 -0000

--001a114332e82770ce05542234c0
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

I have a couple of small PMBus HWMon Linux Kernel drivers for Zaius
(Infineon and Intersil parts). Do you know which subtree/mailing list I
should send these to or how can I figure this out?

Thanks.

-- 
*M*axim *S*loyko

--001a114332e82770ce05542234c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>I have a couple of small PMBus=
 HWMon Linux Kernel drivers for Zaius (Infineon and Intersil parts). Do you=
 know which subtree/mailing list I should send these to or how can I figure=
 this out?</div><div><br></div><div>Thanks.<br clear=3D"all"><div><br></div=
>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div><b>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--001a114332e82770ce05542234c0--
