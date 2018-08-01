Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::231; helo=mail-qk0-x231.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZlFbSgGz"; 
 dkim-atps=neutral
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gPcJ5whJzF18f
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 17:11:28 +1000 (AEST)
Received: by mail-qk0-x231.google.com with SMTP id 191-v6so6065536qki.13
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NbcndgrNrtpJKvjghEz9nuwfW8+4tU5bWZHsmOXBIJc=;
 b=ZlFbSgGzNE0SnbPgyEbxZApFuuLsQqI3FsUvwgyrL8Ku5lzZgzW5QXIeFhHvWRIkis
 vBMBUOnUSDiIRNIPyBZnjIp2V6y6UCqkjWor40khhxoEV3qyWCmCFvH+VFS0sb4ND/AZ
 P178ereGzJzo8pPI8+MEiQTbuVSu2BtZiOrGUeGyw1QQOOY/OEEmR06XHaBNOVlkWdNY
 8iJ4cVh9xrK7vGB3Eloab5UEMzEobVSrgwlvH0fpK5wGbiMmuNYMCa2QJNxERVXFd7rf
 unRl5ImFkIJNPIjRzn4X23jLZVEdymvOGOptyFr3Ea3zah0fvDBzJVf4ee/ZSC7dy05F
 XVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NbcndgrNrtpJKvjghEz9nuwfW8+4tU5bWZHsmOXBIJc=;
 b=OBJtQoD6dwEOYhHa/tOHS2O27UodTxari1iBt5BT9X2NLe10wqdZDmdJdrlu3D+CB/
 8CXeu2WHNRMtaTqxAZiEFaAGCxA6ncc/uqnrraVJjw/UqxhHGpz5z4YD1c296ozI9drQ
 tLS0aUZy7BRxYz/SVEN3ixOaUk0+Hin+qJHXyj/7evhx2HdfJIVwpVu6FOfK6Hx0h0tm
 QgHWGxGBoZBeYp19f2Fmud2FBSbzmX/igM+15gkmi2ukPw7PlPhm0PrQkF6VZrmoe2ue
 4Doo32UeqXnBJX9mMMCrizDl7rh9SmVQspb6Ut+edIR4ZVQUCgAfNc4nt5S1qOSQzugM
 vT5g==
X-Gm-Message-State: AOUpUlHjY0vvejN1lnaR/soZeniQ9GH5AqodVGebafi8HqtIO70aZP99
 j700v+3mOxFZxzQB7gLDsjqkJ1QJlqVORR/mt5UuwE5w
X-Google-Smtp-Source: AAOMgpcCau95W+uxxi9MwiZHUAGvsKOYnGA9EDIXWo78kWZX4DBCbC2zR13FkcU9QIwbQbDMzr+p2TVzhUP4mgxe2Qk=
X-Received: by 2002:a37:13e6:: with SMTP id
 99-v6mr22870035qkt.252.1533107485752; 
 Wed, 01 Aug 2018 00:11:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Wed, 1 Aug 2018 00:11:25 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 1 Aug 2018 15:11:25 +0800
Message-ID: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
Subject: UART Route setting
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001740e705725a67d6"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 07:11:29 -0000

--0000000000001740e705725a67d6
Content-Type: text/plain; charset="UTF-8"

Hi,

Could anyone know how to modify UART Route setting through dts, driver or
other mechanism?

Or I have to find a point to modify it e.g. board_init() in the u-boot.

Thanks.

--0000000000001740e705725a67d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Could anyone know how to modify=C2=
=A0UART Route setting through dts, driver or other mechanism?</div><div><br=
></div><div>Or I have to find a point to modify it e.g. board_init() in the=
 u-boot.</div><div><br></div><div>Thanks.</div></div>

--0000000000001740e705725a67d6--
