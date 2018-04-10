Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::22f; helo=mail-pl0-x22f.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nu5GRe5R"; 
 dkim-atps=neutral
Received: from mail-pl0-x22f.google.com (mail-pl0-x22f.google.com
 [IPv6:2607:f8b0:400e:c01::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Kz9z6Tz8zDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 17:21:24 +1000 (AEST)
Received: by mail-pl0-x22f.google.com with SMTP id 61-v6so6881148plb.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=QWgmhFHwjxJqZsK3rWgizdrkSI+OoQIU4dqZn4n6SM8=;
 b=nu5GRe5RL2uEHN4JNfR61FsoOry3nzj09I/2ZFTkiedy1ZD1ay208gLNRXNViRYect
 H2aWhzXPONEg2DNU2ThFlF+bw8K6HKnZmAVbS9Jc+b6xBHf+BA+K+WnqaLIm9Zd7SyIV
 MICys2uKQ47SlDkRFXHXqcoLaC3cZLwhI62vnuQqNqDfQkvaZN5G4jkxX+xc7Hb+Sdka
 JYW9irk5M6l6idbFlDTyY//zvEK2+mLVhbXs1OUVUCRSglUHkATk5kiq2UjTX97gQ4Ob
 I8QkOM82PauRumpeepG3bYwEcfTWmrO7mfnDtcFaTzwlyq6GWIgPFUSLQfwRfJGKbPTJ
 HBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=QWgmhFHwjxJqZsK3rWgizdrkSI+OoQIU4dqZn4n6SM8=;
 b=STXvmIpRyFzl4AUlJpjAMCOaDo07UTFVGjEPsHcvWfGKMKW2/c4ZGhwtWFIhVQn7H2
 q3LzFvlnJQCejwUMyeeml71TfF3yroieo9fyihlu+Z3zag5qS0T5B1WAbbTyQ2wCjrb8
 X6RUGXBNuv2+RUcmAMRjMJj143p8SGk+95xr/cAVJvx1w7j+X6llyE3baBt2ts3Ukte4
 NXBMVUUUz55YWKugNbo0gAtg/HDJUiEIyHCxBmNFHhMJTS4/QItpmBYeA4r4MkKXFlHQ
 pIWNVWBwqFDZ8hdKhb42G5vFELNMi3mJdsJeKVS4sI1oQ/gcI30P4g7MKEI4Ch0NipwZ
 Ktog==
X-Gm-Message-State: AElRT7HehsMr0cMsF6vfEt3xh5mcr8XhKqQSqa67ghRG+hsU0DYMxz86
 Rt+W72nablGCjJX7L+h5aH+3ct8m
X-Google-Smtp-Source: AIpwx4+3YlkAek2sVhGRxdNyEXvaJ+YPaFUB/L7kkDQPWeVr4+df5w/z5xn+eAm605gbP+XwKBs43A==
X-Received: by 2002:a17:902:28a4:: with SMTP id
 f33-v6mr41273704plb.115.1523344882464; 
 Tue, 10 Apr 2018 00:21:22 -0700 (PDT)
Received: from [192.168.1.2] (220-128-238-123.HINET-IP.hinet.net.
 [220.128.238.123])
 by smtp.gmail.com with ESMTPSA id l90sm5534208pfb.96.2018.04.10.00.21.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Apr 2018 00:21:21 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F10AAC01-F11A-4338-92C9-6A748349DA38"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: How to power on Intel x86 based CPUs
Message-Id: <BAC67A78-8473-46F3-BD09-6A418AF0D697@gmail.com>
Date: Tue, 10 Apr 2018 15:21:19 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.6.18)
X-Mailman-Approved-At: Thu, 12 Apr 2018 13:05:57 +1000
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
X-List-Received-Date: Tue, 10 Apr 2018 07:21:28 -0000


--Apple-Mail=_F10AAC01-F11A-4338-92C9-6A748349DA38
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

--Apple-Mail=_F10AAC01-F11A-4338-92C9-6A748349DA38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
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
class=3D""></div><div class=3D"">Thanks.</div></body></html>=

--Apple-Mail=_F10AAC01-F11A-4338-92C9-6A748349DA38--
