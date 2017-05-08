Return-Path: <maxims@google.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wM8wW6JnyzDqGv
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 03:42:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cpC9eLDF"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id p24so55136788ioi.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3dGBCz0jhqjYLnyBXrA3XzbRJFf5IQD4jUw9PcMavdY=;
 b=cpC9eLDFcbzBI5hY/0S6GPuKIsN7X6xWx1cMkP1q7XS1VtWS24WkOD9wLWaOXRPhFC
 cZmEBcqagSSFtejXmMF8CMVjn/I1Hb0NEjvFKb0eQszJlKLSkLDEhF0KjW5vsFpx6JYL
 RmSwKSZZsZ4e3Z0Bu+QOW5B0uwR1RpABDBiww5IwmYD8uzslLa+dCl/XyXipBZv5j2gE
 RDw/kQFwPZP1ucsmQrEqYp9L9HBOhpo+AaOXMbC8KsGFhHmRkeJZCvu8gWkgqEVztroM
 vPP4W8xVg06RzZPjT9Rovk6yo7pq5rlVDblYJOKh4oSaLWZ/vEeQeFNEta4uajPhX0Y7
 8mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3dGBCz0jhqjYLnyBXrA3XzbRJFf5IQD4jUw9PcMavdY=;
 b=iR6Hd/MnfOX2B1wZ00YBGHARigG80NetnH28OguqJaAHO4xrJuJWJ17ptBzqyKnbKC
 cbNVgdbQQlqxB2Et3ZKPU57XjnK4/uEDYj3WL4wW2Xp36KEfcrAE6Umlpdm/phPEnEwe
 84mqUHif7b7+E0vrMQnSi6lPJ4WAiumhjaQ1EfYR551292Wk0ZFGYO63Lk913He6YU62
 GIjg0iKoLa6NCmouJ1m38bahjDmYbpehzaWc4xxFtcFJ35hTWcW0zf8INhGzgpzFxD6H
 CjYvIeIvxzATVD5uKGOMileiAs3cNxXWmXpXQGolSnFcHeyUhv95MgDH7GAO+jVxiSQO
 qdrA==
X-Gm-Message-State: AODbwcBXfvtovn63/9v1N9K/3cimXY/2wei2+YbG8JfQdGbCgdCZmqZN
 aT9WXX7x+bOxxZ7NWKGlBCosGWlMdjwfVFjElw==
X-Received: by 10.107.201.131 with SMTP id z125mr5593750iof.160.1494265368089; 
 Mon, 08 May 2017 10:42:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Mon, 8 May 2017 10:42:47 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 8 May 2017 10:42:47 -0700
Message-ID: <CAFR_W8rB5RPxZ0LH6xYSa7iuPAy-vADxYxLHBtzbsoBwm=cUsQ@mail.gmail.com>
Subject: Running ptests
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0b9cbe7789fe054f06c4de
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
X-List-Received-Date: Mon, 08 May 2017 17:42:53 -0000

--94eb2c0b9cbe7789fe054f06c4de
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm working on setting up some infrastructure for testing OpenBMC images
and I want to use Yocto's ptests (https://wiki.yoctoproject.org/wiki/Ptest)

To run those tests the image needs a recipe for gtest and also the recipes
for some of our packages (phosphor-event for example) need to be changed so
that they would build ptests. As far as I can tell the changes to the
packages themselves are not required.

My question is: do we want this in meta-phosphor layer or somewhere else?
What's the best way to implement some kind of a switch to say "build an
image with ptests" or "build an image without ptests"?

Thank you.

-- 
*M*axim *S*loyko

--94eb2c0b9cbe7789fe054f06c4de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m working on setting up s=
ome infrastructure for testing OpenBMC images and I want to use Yocto&#39;s=
 ptests (<a href=3D"https://wiki.yoctoproject.org/wiki/Ptest">https://wiki.=
yoctoproject.org/wiki/Ptest</a>)</div><div><br></div><div>To run those test=
s the image needs a recipe for gtest and also the recipes for some of our p=
ackages (phosphor-event for example) need to be changed so that they would =
build ptests. As far as I can tell the changes to the packages themselves a=
re not required.</div><div><br></div><div>My question is: do we want this i=
n meta-phosphor layer or somewhere else? What&#39;s the best way to impleme=
nt some kind of a switch to say &quot;build an image with ptests&quot; or &=
quot;build an image without ptests&quot;?</div><div><br></div><div>Thank yo=
u.<br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature"><d=
iv><b>M</b>axim <b>S</b>loyko</div></div>
</div></div>

--94eb2c0b9cbe7789fe054f06c4de--
