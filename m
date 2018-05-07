Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::229; helo=mail-pg0-x229.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iyw5ZlAS"; 
 dkim-atps=neutral
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40fcyX2RDlzF1Q8
 for <openbmc@lists.ozlabs.org>; Mon,  7 May 2018 19:39:15 +1000 (AEST)
Received: by mail-pg0-x229.google.com with SMTP id i194-v6so19821051pgd.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 May 2018 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=i50a3NQGHeiscu+emhC8shlP3kSHKxhOkQDzBJn4dY8=;
 b=iyw5ZlAS8Jvxxw6MxR2ccjyhdUjQJ6BHYKTZ2aR+M9XRwFKP1dCQ9IfN56wPAc4XUz
 JVGBDLsyOovJFMN1LS2NixmeDOTq5PTTa7SBilFB2PATxmIKubvGtgNBKIepi4ZfNY00
 S6/ci1kfQfpT2Nm5U0CFlGh7A1jIJ3KiHogxV5mtVFbwSiE5brQD4fpDA85De5giKsD0
 /wg/tdWvuqBeekePmwSAXQbj7wLEF4a5M/iaCwUdSuuQADPTOKlPiFZVed7Ckckeaqxk
 AM5yGstzG9+Lz1VPSZlaB7GwuRJtpv0uw688+Cz7bp06jflrLtgDx6Hfeu6PCP6KDp8L
 EVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=i50a3NQGHeiscu+emhC8shlP3kSHKxhOkQDzBJn4dY8=;
 b=pWSwAv0peZmC9M5Xa+BDfbJ6/FeNHMMCq2vbqWSv2Ejto9s/tTvkIUrm1WBrwEmmFu
 DwwG++ON14tnoTU0bNtKy0SeilcS+Ow9+9czckXVqAIJnGtqhSkxGIhRsBPFN4A9vjA9
 xPOrEKBM3OQjOLGbUtRLBrnCs8A6JpgqBg0DCGg0zheXMlRHBrtjG+iatQhIBi4DSzPd
 kLoYV7VRA5zPQHmMb8kdYvRxu7pEafvC6sJn2Msswe3LeTz3W2hu/EUEINkSW2bx7vW4
 XUda9L9Rj9qqV0muyPjH4lyJCXj/kVBeVwtgcFLAxu4annDE1WLK2CAGCZ/VVQSvWvm3
 5KVA==
X-Gm-Message-State: ALQs6tC+z+3LkyMAHWyBRS2hN2Z21oSn7dkE2+zo7Qj43olPeO7jdDN3
 fjNI/oWOx2GSaRLLJocpIWDwCfTI
X-Google-Smtp-Source: AB8JxZpm7iAFe4ttcZUL/Eo+GShOEPClpdDHk+2gEMGb9DQTrFTvvAvEcMds09g6N+2OwdYO2m/Uow==
X-Received: by 2002:a63:5f05:: with SMTP id
 t5-v6mr28945329pgb.165.1525685953430; 
 Mon, 07 May 2018 02:39:13 -0700 (PDT)
Received: from [192.168.1.2] (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id n126-v6sm34307803pga.85.2018.05.07.02.39.12
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 May 2018 02:39:12 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F8CAC0CC-DA95-4F29-A90D-C34D83FDCEBE"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: How the Set boot mode and Set boot source works ?
Message-Id: <4B72FB83-4B7F-4704-BE55-555B14FFC801@gmail.com>
Date: Mon, 7 May 2018 17:39:09 +0800
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
X-List-Received-Date: Mon, 07 May 2018 09:39:17 -0000


--Apple-Mail=_F8CAC0CC-DA95-4F29-A90D-C34D83FDCEBE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi everyone,
I have read the =
https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md =
<https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md>
And follow it to Set boot mode and Set boot source.
My CPU is Intel x86 based, so I don=E2=80=99t expected it will work with =
those two commands.
So I just want to know how those two commands work with openpower =
system.
Does the CPU send some commands to BMC to get these settings when power =
up ?
What kind of command formate ?
If I want to make my x86 CPU to work with it, what should I going to do =
first ?

Thanks.=

--Apple-Mail=_F8CAC0CC-DA95-4F29-A90D-C34D83FDCEBE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hi everyone,</div>I have read the&nbsp;<a =
href=3D"https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md" =
class=3D"">https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md<=
/a><div class=3D"">And follow it to&nbsp;<b class=3D"">Set boot mode</b> =
and <b class=3D"">Set boot source</b>.</div><div class=3D"">My CPU is =
Intel x86 based, so I don=E2=80=99t expected it will work with those two =
commands.</div><div class=3D"">So I just want to know how those two =
commands work with openpower system.</div><div class=3D"">Does the CPU =
send some commands to BMC to get these settings when power up =
?</div><div class=3D"">What kind of command formate ?</div><div =
class=3D"">If I want to make my x86 CPU to work with it, what should I =
going to do first ?</div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks.</div></body></html>=

--Apple-Mail=_F8CAC0CC-DA95-4F29-A90D-C34D83FDCEBE--
