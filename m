Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::229; helo=mail-pf0-x229.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YmtcREYv"; 
 dkim-atps=neutral
Received: from mail-pf0-x229.google.com (mail-pf0-x229.google.com
 [IPv6:2607:f8b0:400e:c00::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40L2qK1n2YzDqyp
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 20:05:32 +1000 (AEST)
Received: by mail-pf0-x229.google.com with SMTP id o16so7859316pfk.9
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=yPtGVDbIUdWBHQzXIuvzsT37gAZtuIedFd4mod9SLYk=;
 b=YmtcREYvtzH9+6mqAJ7TJLqIqeQf3qp+7k8sBjx3lzUvGxCWfh+UG5qUoYRTOAOXyR
 eJ6tbynapDCia2QDJrBYd0Mjp4r538ugWQmRqS3+eC7SWtmKgT3TZfOcNqIQwJyJlbXB
 Hq3e6+wVtd80PwB8Wtbwy5tDx/Mw0NUVW7a4boFD2wDMD2UC0hxGFG+FDbxZCkx5Riqp
 W3gfw+CWQEYNPmJG7jdXAwg16D3Pwf+Flv/qyPxwbIdIFvhCG15qqXYXvmGOL+uD+o9d
 4Hs9DlSZniZ06n7AHrOadXB9XNarngNc2CoBVKk2K/hK/TSqU+6qrR9FYkQn72j5Uqwl
 N4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=yPtGVDbIUdWBHQzXIuvzsT37gAZtuIedFd4mod9SLYk=;
 b=Nnaphs6dPC6RF0lUJ8ERyaAnu2AIIkSJfJvdgHDWOo4X4+6iQ5DI8nUCmyX6eePZXq
 TkGSkTgzXGxr/TBBvSNvTeqCsacxL39iIqXly7ri2fmhRz2wjXj+u1ix1TOht2s6uGIP
 P8/oLKBPyb8HWKRxJw7H8M7BEKrMMccE5F+ErYTGd/hPNk1DosfTvb7O8ZhucKcTp9dJ
 oDXHe5lDks9DOACCiZi8MzIaXx8kEvB1Yu8MtMwneu7cERKEH9GNt2zgudf/CYzDMB7c
 EI5AQ5Lkp9k0/KtejQ3arEp7tRI5psn28RgtWu1yloTQEwSFHG5TE7D3MLbmu6DMYe2T
 xoNg==
X-Gm-Message-State: ALQs6tACRzqbbbnel2eFiXuO7zwyWBoWu3I55oOKb/OP4WFPCgbsHB7b
 SEjTNwisuwpQUeiFy4MaJYssfdo3
X-Google-Smtp-Source: AIpwx49ot48RPsLVnHWcRDuEoSTVraXtgfl4r8mzaQCv7WWkqJrJLHduIa7RWKFIyVaowt2/T8kFXA==
X-Received: by 10.98.32.80 with SMTP id g77mr2209583pfg.216.1523354730751;
 Tue, 10 Apr 2018 03:05:30 -0700 (PDT)
Received: from [192.168.1.2] ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id t128sm4232535pgb.50.2018.04.10.03.05.29
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Apr 2018 03:05:29 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_38CE64E5-1234-427F-AE43-02ABFA9A85A0"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: How to power on Intel x86 based CPUs
Message-Id: <6BB03E30-7768-4455-BB7D-6B1C8AECBDE4@gmail.com>
Date: Tue, 10 Apr 2018 18:05:26 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.6.18)
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
X-List-Received-Date: Tue, 10 Apr 2018 10:05:34 -0000


--Apple-Mail=_38CE64E5-1234-427F-AE43-02ABFA9A85A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
I am going to power on my OEM server board with two Intel x86 CPUs. The =
BMC chip is ASPEED 2500.

By the Intel data sheets, I just need to control a power on GPIO to =
emulate power button behavior.
The problems are, when I send Host State Control commands as mentioned =
in docs/host-management.md, the journal log shows a lot of systemctl =
errors.

Looks like it is going to start the OpenPower related host control =
services, which only applies to PowerPC system.
I try to modify GPIO_CONFIGS appears in skeleton recipe to match my =
board, but I still got some other errors says pflash stuffs.

Because there is no documents to tell me how to customize the openbmc to =
fit on x86 CPUs, so I am not sure the GPIO_CONFIGS in skeleton is the =
right way or not.

Can somebody share your experience ?

Thanks.=

--Apple-Mail=_38CE64E5-1234-427F-AE43-02ABFA9A85A0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hi,</div><div class=3D"">I am going to power on my OEM server =
board with two Intel x86 CPUs. The BMC chip is ASPEED 2500.</div><div =
class=3D""><br class=3D""></div><div class=3D"">By the Intel data =
sheets, I just need to control a power on GPIO to emulate power button =
behavior.</div><div class=3D"">The problems are, when I send <b =
class=3D"">Host State Control </b>commands as mentioned in =
docs/host-management.md, the journal log shows a lot of <i =
class=3D"">systemctl</i> errors.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Looks like it is going to start the =
OpenPower related host control services, which only applies to PowerPC =
system.</div><div class=3D"">I try to modify <b =
class=3D"">GPIO_CONFIGS</b> appears in skeleton recipe to match my =
board, but I still got some other errors says <i class=3D"">pflash</i> =
stuffs.</div><div class=3D""><br class=3D""></div><div class=3D"">Because =
there is no documents to tell me how to customize the openbmc to fit on =
x86 CPUs, so I am not sure the&nbsp;<b =
class=3D"">GPIO_CONFIGS</b>&nbsp;in&nbsp;<b class=3D"">skeleton</b> is =
the right way or not.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Can somebody share your experience ?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks.</div></div></body></html>=

--Apple-Mail=_38CE64E5-1234-427F-AE43-02ABFA9A85A0--
