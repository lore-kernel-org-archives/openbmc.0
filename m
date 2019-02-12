Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUNlOewL"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zZ404HcpzDqM5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 07:28:32 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id r14so1823934pls.12
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 12:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lvuXoKB8ot52Twi4ot8OdFPDFWURxyz9mtpJvDBvB+I=;
 b=HUNlOewL4WikzfBBOLlfMHux0q6+4YZz1S/Fvc/9rEQQxOv2Z4Ch9WGsYPRb352uBv
 KXTjcnTRIs6aQOZZhCHx2qA2FG5YTXGWum2eNi0qyZXjZ3q3mkvMLmUCPeZkf5eJzwuk
 zRQm+d27cF+aUo2gd1qGhmXtQvnSv/mU75UtLSG0/OuzKC36aZ/JCBrdrVT5YJ8WDlpA
 39lgGMabyRzg7irbz/rUffFZ9NowTBBaY/MCtZwzeoygQuWFFQXayxSVSPFFryfjHMvh
 Z5pdWaIJMsAsWrVxwZMJftoRDWr0tKlsTOAfDbrI7G+pE2ZEIs0hV2jTb/RQBeKhz5zB
 IU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lvuXoKB8ot52Twi4ot8OdFPDFWURxyz9mtpJvDBvB+I=;
 b=DgwMrD/5boHNwVyLSs6RFO6G/bdKMxarUw4WyT9UqGdW9O4PcKV8Jm+pkwAzcMgs0E
 dwmclcw/Ey/k7MvA9i+5NXRA3FwD1e1AZVa+KoDKviSHYifl0e11HYJgvaPG06pTxcIE
 dsEkm35ESjb5gQIozPHEV8pobrI+1bieKyIfPaYq9VmUDZ6XvXlpV3o9Rkf+u4QJd4f8
 npagHm95XlaLpHw9OWqX56igqJle9y6uHSNivdtLROUa9YSh1EQcL3vlbPYMWUOHU8hu
 HfelVeSYW9ndrJ23F+xiX3Wq93uF0lZ1EBM87/tirZzemGrfHPv+0BswjO1+75eDMaHX
 /Fhw==
X-Gm-Message-State: AHQUAubO4DfLpOLMuIO2wapplL+B/27TpOv4nYXPqMw6Ax4Zs6ax8f+m
 rrERkalbz/s442SZS/G8nHR6X5GkT0X8o8F5eTQIvB5n
X-Google-Smtp-Source: AHgI3Iaa7lOExnLecp8v1lc+P8xFzz+S0z5mx01z/Y95QJ5wog7U1K1LLx6glLaspZDFjPu1vYF7LROpiRW3Aqa7bAs=
X-Received: by 2002:a17:902:848d:: with SMTP id
 c13mr5820553plo.257.1550003310038; 
 Tue, 12 Feb 2019 12:28:30 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Tue, 12 Feb 2019 14:28:19 -0600
Message-ID: <CANT4NrLePwUjsLaYWfqPPgOh-JH3DsxoOfHH2-varuRy02y0fA@mail.gmail.com>
Subject: UI Design Update - SNMP server management
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
X-List-Received-Date: Tue, 12 Feb 2019 20:28:33 -0000

The UI design team made some usability changes to the layout of the
SNMP panel based on user feedback. The backend design has
not changed.

You can view the prototype at:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/318996535_1-_SNMP_Empty

We do not have any specific feedback requests. If you have questions
or comments, please post them to the SNMP Github issue
(https://github.com/openbmc/phosphor-webui/issues/37), or reply to
this email.

Thank you, Susan Jasinski
