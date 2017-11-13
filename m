Return-Path: <s.kachkin@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=s.kachkin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uz5bWexj"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybP71456JzDqjf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 08:34:52 +1100 (AEDT)
Received: by mail-lf0-x231.google.com with SMTP id k66so7925409lfg.3
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 13:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xzMqG9fozMH2rZmU+emGvF8dw+Uic5jzD8CJDL8FfXI=;
 b=Uz5bWexjD5uwof5uvGJDypgTCCI6bsm9pEdlnXsRKmJJzj4Rh7vDj1KPXvUmU76Qmc
 bB5MJJg0l4Bvn7SBBoEdwV97Ep/cNIXSR0GaXcyOZXjCH+YdVYMvNmkX4T9nbu1Xl/Xp
 8m43Nhd4LlwjIJcfTyr5uHsqvjpl/gysDRh5gQ1rANrLVy9ZSlzTebnxg9E6o8HBPiUO
 H3ourLqN/Ict2XzCOU25JJMbauNS0hMUz656JgQZ3lb/9e3w4f/Y1Hb9nE1dDDWMgKg2
 uopRXJ54OfEIBzOAoOHeHTPZ5zK+KyWgjJGMA6PfwgzPfoeBdRD76WokdynmutCtoFqc
 1w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xzMqG9fozMH2rZmU+emGvF8dw+Uic5jzD8CJDL8FfXI=;
 b=Im9ZBxAVIhkjpyLXdCqUdSIqnH1dpfOb8ODQF20T2E5h7pzgtdUZZ5YYsVAr+LDR+7
 RuKVfegYcv9MdvhyMbAbaQ/apFx/0BQTm2HCI2BY6tvCfbHmB3/Z867rrDU5GHEactTr
 GQk6zU71sUUksDBRtReV0EfTeA02nfqVxmf0EBtAXehGFZHvZuZDHt0dTb4XUuEH4qqo
 LeenrIkML0yAThf4bXasgDdzqc2/1cGncsp/kR7mq2/DtDKO8V2Fael0q/RiG1DRwaDL
 aEruquOCONadrOVe1pCm7VZ8XOdkxTaH+BDVhh3qSHwb2+X/Dkh5o8HktwdajIId2M+T
 qaEw==
X-Gm-Message-State: AJaThX6TiN/W1CBRc8I0thyz1quzJ7JUwtOD78S7nUEhqKwzPPuDcAYE
 V3wvpn6aeH14H2YtKWCp0zakZ5nhGw5g6DnerbY=
X-Google-Smtp-Source: AGs4zMbhguQDHQ9yEakDFxzYD9x7H9sBKKxtawr0Hoxvyf6hfjz+9CILSbpQO6xS2pYwh1j7sE2x4nGTdZ7LGeUjvOE=
X-Received: by 10.25.163.196 with SMTP id m187mr3342602lfe.244.1510608888364; 
 Mon, 13 Nov 2017 13:34:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.159.197 with HTTP; Mon, 13 Nov 2017 13:34:47 -0800 (PST)
From: Sergey Kachkin <s.kachkin@gmail.com>
Date: Tue, 14 Nov 2017 00:34:47 +0300
Message-ID: <CALg5i8MdDOwf4eLhnO-F3eYmTLaYNMksky9rAnG4iL7oVsmgHA@mail.gmail.com>
Subject: checkstop processing
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="001a114105bc2f83a8055de40a14"
X-Mailman-Approved-At: Tue, 14 Nov 2017 10:56:23 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 21:34:54 -0000

--001a114105bc2f83a8055de40a14
Content-Type: text/plain; charset="UTF-8"

Hi all,

i'm investigating the checkstop processing and looking for a way to isolate
a faulty component with OpenBmc.
So far SEL logs available via REST are not really helpful.

Is there any data source in the openbmc to troubleshoot checkstops?

I guess eSEL binary data parsed with eSEL.pl can be more informative but do
we have any procedure to grab the binary sel data and parse it with the
latest obmc?

Currently it seems that IPL checkstop analysis is not really working. i
mean that faulty component is not deconfigured on the next boot and gard
list is empty.
It can be easily duplicated by injecting an error manually via putscom.

thanks in advance,

regards,
Sergey

--001a114105bc2f83a8055de40a14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>i&#39;m investigating the=
 checkstop processing and looking for a way to isolate a faulty component w=
ith OpenBmc.=C2=A0</div><div>So far SEL logs available via REST are not rea=
lly helpful.=C2=A0</div><div><br></div><div>Is there any data source in the=
 openbmc to troubleshoot checkstops?=C2=A0</div><div><br></div><div>I guess=
 eSEL binary data parsed with eSEL.pl can be more informative but do we hav=
e any procedure to grab the binary sel data and parse it with the latest ob=
mc?=C2=A0</div><div>=C2=A0</div><div>Currently it seems that IPL checkstop =
analysis is not really working. i mean that faulty component is not deconfi=
gured on the next boot and gard list is empty.=C2=A0</div><div>It can be ea=
sily duplicated by injecting an error manually via putscom.=C2=A0</div><div=
><br></div><div>thanks in advance,=C2=A0</div><div><br></div><div>regards,<=
/div><div>Sergey=C2=A0</div><div><br></div></div>

--001a114105bc2f83a8055de40a14--
