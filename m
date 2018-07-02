Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::231; helo=mail-oi0-x231.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4Z+rAR0"; 
 dkim-atps=neutral
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41JvHX31CyzF1LQ
 for <openbmc@lists.ozlabs.org>; Mon,  2 Jul 2018 14:22:47 +1000 (AEST)
Received: by mail-oi0-x231.google.com with SMTP id c6-v6so13913334oiy.0
 for <openbmc@lists.ozlabs.org>; Sun, 01 Jul 2018 21:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=A+x2YE3De+rV1bLFTQ1FmnAsRI2C8+mwFkphnrFSIvU=;
 b=G4Z+rAR0/WnyXh0z0ylaoxJ4ji45ao6sgoe+4XTummfpTR5XVL9yoetvB1sRbXKxks
 3mEU8ocQOcOYFYNSqP1XbdSvkHbPXD3DmB3LVtzjFRc31qX5gOAGD7JaaSITcWcMSkre
 2nvcvMUaOB+IQUH4CuSX5mMOKwbHP5qY6xPFAuMLHSnhZaKeaqHn0sUuiHKdEgGlFhXS
 o5iwdPb5e1p1wBS+KcW0JPY9khs1IehGmIx/45rdqho0GrYBmsvp5RMza1THUm5us2GZ
 uQQ+XsUXAsbW3rr60nAcX/nPEk1TaAIgb3qCpb2StlEKgAWlpDi9jNnDzBbBsOchJCaK
 dLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A+x2YE3De+rV1bLFTQ1FmnAsRI2C8+mwFkphnrFSIvU=;
 b=rJtGJ5uWGEeW4kRHyg6+yQm0WQeOEggUT/UBR4ygakXCquWMjahjhnXfFgYtN7AJ9k
 Dd6CdJVnNn+oD8OMDHRJnkoYacl9VMEDXEYjTn9lz5wHwI6+f/ugmongTQi2sCpGRaWI
 Ex/Y8KJE+o5tIP3Q95gURbfYOOtIFTQLQ8BlrBxOSHndLAgZ4GK1/Gi3ErMff57IU27/
 bJqcKEEZVNRNjPPM+UQ4+YMJWRP70g7VEbvR8AVIuCh5c7OK0jLCWHDXBYn2yXYXeIZQ
 pSvN1AMii9VXiH6PFKio1Y37kSVX02Y4lKZ2BBgLSejQkuAo21H197oPaVCtT2UlXAwD
 IIqA==
X-Gm-Message-State: APt69E0klrOWc6O3rXntcYGPYKGGiruLfbdSanvfSIWgX3XUPOmm5E3Q
 zIDonAsGD9P6KmOrtFOTID+yQnhYp3Ss0z2ugSxdTmDI
X-Google-Smtp-Source: AAOMgpcQu/by+JbsyA0scij+3hDjEMJnzmfcaaKyBnfBe2rJCg1MrEtEyuHF7pmo+0svC01bAIGZ3P4G9e+V5xEb9CM=
X-Received: by 2002:aca:ba84:: with SMTP id
 k126-v6mr12947125oif.96.1530505365524; 
 Sun, 01 Jul 2018 21:22:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:2c87:0:0:0:0:0 with HTTP;
 Sun, 1 Jul 2018 21:22:45 -0700 (PDT)
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 2 Jul 2018 09:52:45 +0530
Message-ID: <CAE33tLET5QNui-zYtXvmShkBr4UJfdwMoUP7bRZk0br1803wzg@mail.gmail.com>
Subject: Unable to execute IPMI commands
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000a395a0056ffc8c52"
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
X-List-Received-Date: Mon, 02 Jul 2018 04:22:49 -0000

--000000000000a395a0056ffc8c52
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am new in BMC. We have one custom board that contains Aspeed AST-2500 BMC
chip. I have installed openbmc Linux into the board and tried to execute
IPMI commands using ipmitool. I tried with both open interface and dbus
interface. But it is showing errors "*Could not open device at /dev/ipmi0
or /dev/ipmi/0 or /dev/ipmidev/0*. No such file or directory" and "*error
loading interface dbus*". Please someone help to resolve this.

Whether any firmware required for running IPMI commands on the board, other
than openbmc Linux image ?




Thanks and regards,

Akash G J

--000000000000a395a0056ffc8c52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>I am new in BMC. We=
 have one custom board that contains Aspeed AST-2500 BMC chip. I have insta=
lled openbmc Linux into the board and tried to execute IPMI commands using =
ipmitool. I tried with both open interface and dbus interface. But it is sh=
owing errors &quot;<b>Could not open device at /dev/ipmi0 or /dev/ipmi/0 or=
 /dev/ipmidev/0</b>. No such file or directory&quot; and &quot;<b>error loa=
ding interface dbus</b>&quot;. Please someone help to resolve this.</div><d=
iv><br></div><div>Whether any firmware required for running IPMI commands o=
n the board, other than openbmc Linux image ?</div><div><br></div><div><br>=
</div><div><br></div><div><br></div><div>Thanks and regards,</div><div><br>=
</div><div>Akash G J<br></div></div>

--000000000000a395a0056ffc8c52--
