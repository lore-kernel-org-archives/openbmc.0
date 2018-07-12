Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=67.222.38.55; helo=gproxy5-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="e3O2/4xj"; 
 dkim-atps=neutral
X-Greylist: delayed 1526 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Jul 2018 18:12:39 AEST
Received: from gproxy5-pub.mail.unifiedlayer.com
 (gproxy5-pub.mail.unifiedlayer.com [67.222.38.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R7w71Hp1zF35b
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 18:12:36 +1000 (AEST)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 6DDDE140552
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 01:47:06 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id dWJefuWvzd20TdWJefpXZA; Thu, 12 Jul 2018 01:47:06 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=daRY1bD5ucqW+4WY5e2qVPVhKxeC3gkIfldBl83HBXk=; b=e3O2/4xjV375PZ+0hkQN+TcYUZ
 uYIKE0kFyLKGshJvEYSyh4UH2T/jF1jMFvF79DEobh2zirRpUKgna4/9BAhElGnVr34BrQ+j403bs
 jp0WJDODgCw3Ig3NMxLaDnZ5K;
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35740)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <aaron_ppus@fmad.com>) id 1fdWJe-002B8w-4O
 for openbmc@lists.ozlabs.org; Thu, 12 Jul 2018 01:47:06 -0600
Received: by mail-oi0-f43.google.com with SMTP id i12-v6so54128492oik.2
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 00:47:06 -0700 (PDT)
X-Gm-Message-State: AOUpUlGiq/EP42pAEk3fcx4VP6kWKyiM3qvo95wVRh1v2iOEF3r+kLIZ
 MZbqfH3ncpesn8XZ2tJ52BEO8AwxYm96hYxuug==
X-Google-Smtp-Source: AAOMgpdHUApZVPfKQLSLgObfUePFwwkjQblVWO+ZE+cg96bQstDv/t1JNB62HaARqNYF7gQJPT/eWHFV+Q09ARVfAOE=
X-Received: by 2002:aca:df42:: with SMTP id
 w63-v6mr1088593oig.295.1531381625555; 
 Thu, 12 Jul 2018 00:47:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:ce05:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 00:47:05
 -0700 (PDT)
From: Aaron <aaron_ppus@fmad.com>
Date: Thu, 12 Jul 2018 16:47:05 +0900
X-Gmail-Original-Message-ID: <CABq4n+RwYT8UN4EO75DkhMr2zKnPQW-PEbKtYB+Tb1yA_JYawQ@mail.gmail.com>
Message-ID: <CABq4n+RwYT8UN4EO75DkhMr2zKnPQW-PEbKtYB+Tb1yA_JYawQ@mail.gmail.com>
Subject: AST2400 x86 bringup LPC problems
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000ce90e30570c891a2"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 209.85.218.43
X-Source-L: No
X-Exim-ID: 1fdWJe-002B8w-4O
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-oi0-f43.google.com [209.85.218.43]:35740
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 1
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
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
X-List-Received-Date: Thu, 12 Jul 2018 08:12:40 -0000

--000000000000ce90e30570c891a2
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently stuck bringup an x86 server board with the AST2400 and looking
for advice.

Have based the code on the Quanta machine, theres a bunch of dst changes
and different gpio / i2c etc mappings. Most things work now, power control,
can control, gpios are good etc however the LPC is broken.

What I cant working out is why the LPC interface is completely dead.

Symptoms are:
- LPC post code sniffer caches nothing
- Host UART is completely missing
- Host IO port range reading returns 0xff`s

Its as if the LPC block is not being reset or theres no clock or being
muxed out or something. Been a few days now and still cant work it out.

Originally thought it was because Strap[14] = 1  (LPC reset not connected
to PCI reset) but on the board they physically routed PERST to the to the
pin, so it should be ok.

Any suggestions or advice ?

Thanks
Aaron

--000000000000ce90e30570c891a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Currently stuck bringup an x86 serv=
er board with the AST2400 and looking for advice.</div><div><br></div><div>=
Have based the code on the Quanta machine, theres a bunch of dst changes an=
d different gpio / i2c etc mappings. Most things work now, power control, c=
an control, gpios are good etc however the LPC is broken.</div><div><br></d=
iv><div>What I cant working out is why the LPC interface is completely dead=
.</div><div><br></div><div>Symptoms are:</div><div>- LPC post code sniffer =
caches nothing</div><div>- Host UART is completely missing</div><div>- Host=
 IO port range reading returns 0xff`s=C2=A0</div><div><br></div><div>Its as=
 if the LPC block is not being reset or theres no clock or being muxed out =
or something. Been a few days now and still cant work it out.</div><div><br=
></div><div>Originally thought it was because Strap[14] =3D 1=C2=A0 (LPC re=
set not connected to PCI reset) but on the board they physically routed PER=
ST to the to the pin, so it should be ok.</div><div><br></div><div>Any sugg=
estions or advice ?</div><div><br></div><div>Thanks</div><div>Aaron</div><d=
iv><br></div><div><br></div></div>

--000000000000ce90e30570c891a2--
