Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6NXuWRy"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tlVh1P8mzDqLJ
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 11:16:27 +1100 (AEDT)
Received: by mail-it1-x12e.google.com with SMTP id p197so4403097itp.0
 for <openbmc@lists.ozlabs.org>; Mon, 04 Feb 2019 16:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=P/aNRu4X14BAI66gdQIIJ2upkJ8nvMB0WRshn/+uKmE=;
 b=e6NXuWRyLdPUou9l9dNNt4fmHpOasuyLjlXZFJmDpKGnbnShCUYsxlmkLqiUD6oryZ
 WUDloOg8sLA8DcMJQZWMXZaOrBCN5dYnkMrac9g5KdBTAXmdeqEliIHojzAj73r5zokz
 xJFVl1NMMTEGJ45ypTvzfPEvQJxODYOjTEu7p7xN78hxJQhAzzAH5tIQ+XPXRQM3NFjo
 26plG1Z2JxQDH2Ji7HW7tYpL2Avum6JIzVYj/+onva8rOpPxUUy52LSCx2IeblCjffK/
 dOwjZtrdkjAS7FvzYWTp6xdZsmcVTducZq9xBECrszOVLLLTYQsZZHcpEc+q5xdJTNKc
 CbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=P/aNRu4X14BAI66gdQIIJ2upkJ8nvMB0WRshn/+uKmE=;
 b=eAZL8C/JSCRmx4XZilNZ6JWPmfizwvk6x5aNg/wWbbLN8zz+g8wNORISDQwPAg0N1c
 ds2OXPC3GrwqDbTxnzKgDbkirlHY/uLGsDqyvbgayF0h2Nppm1loNeeasZKEHRC6b3K6
 6KOVkO1EEBr3OojNiqgRCxoqR821WdS28SKAP59+zmX7VfLhNvS8ZAr4AQEGhnNtvsc0
 BzHke5/HdW1AK/bBsZx1/jd/J+emMtW9Ty8ZW9xRhIu+vQQ9UzuAIzJbZqRZiv4qyfQj
 GB0D4TwcifKdwCVTMStcSH48mN9AWsQ1bFs/F6Uy3jqcx4Evd/GMzL0c5hg8w3NLyrmL
 fp4w==
X-Gm-Message-State: AHQUAuaymJBMXo65vd+w+KpHxaXqj/6ZV1E9IvpkTPMuhf50c19OS1D6
 0PVjiW8PNPVif1TfkWZUa4bMg4JIX1V1h33JiU4=
X-Google-Smtp-Source: AHgI3IYhT4Hi0t1JjHuyhy1/9YhA84QrGIx5FEEPDsvcO2LQiD9UkdyBEcmfBJWagXg1UuQ7eB5Apm38nyj6nAVa8fM=
X-Received: by 2002:a6b:ed0b:: with SMTP id n11mr1455965iog.90.1549325785898; 
 Mon, 04 Feb 2019 16:16:25 -0800 (PST)
MIME-Version: 1.0
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 5 Feb 2019 02:23:11 +0200
Message-ID: <CAP6Zq1jAMHSrbEmnKcQcwAfmpgZJ0n3JUwxGSYVw6B==FJYRGQ@mail.gmail.com>
Subject: OpenBMC GitHub invitation to Taiwan Nuvoton BMC team
To: bradleyb@fuzziesquirrel.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: kwliu@nuvoton.com, warp5tw@gmail.com, timlee660101@gmail.com, 
 yschu57@gmail.com, medadyoung@gmail.com
Content-Type: multipart/alternative; boundary="0000000000001c233c05811a851d"
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
X-List-Received-Date: Tue, 05 Feb 2019 00:16:29 -0000

--0000000000001c233c05811a851d
Content-Type: text/plain; charset="UTF-8"

Hi Brad,



Could you please send invites to the OpenBMC GitHub organization to our
team Taiwan Nuvoton BMC team.



Joseph Liu: kwliu@nuvoton.com

Tyrone: warp5tw@gmail.com

Tim: timlee660101@gmail.com

Stanley : yschu57@gmail.com

Medad: medadyoung@gmail.com



They will like to upstream Poleg code to the OpenBMC github.



Thanks a lot,



Tomer

--0000000000001c233c05811a851d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;fo=
nt-size:11pt;font-family:Calibri,sans-serif">Hi Brad,</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Could you please send invites to the OpenBMC Gi=
tHub
organization to our team Taiwan Nuvoton BMC team.</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Joseph Liu: <a href=3D"mailto:kwliu@nuvoton.com=
" style=3D"color:rgb(5,99,193)"><span style=3D"color:windowtext;text-decora=
tion-line:none">kwliu@nuvoton.com</span></a></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Tyrone: <a href=3D"mailto:warp5tw@gmail.com" st=
yle=3D"color:rgb(5,99,193)"><span style=3D"color:windowtext;text-decoration=
-line:none">warp5tw@gmail.com</span></a></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Tim: <a href=3D"mailto:timlee660101@gmail.com" =
style=3D"color:rgb(5,99,193)"><span style=3D"color:windowtext;text-decorati=
on-line:none">timlee660101@gmail.com</span></a></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Stanley : <a href=3D"mailto:yschu57@gmail.com" =
style=3D"color:rgb(5,99,193)"><span style=3D"color:windowtext;text-decorati=
on-line:none">yschu57@gmail.com</span></a></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Medad: <a href=3D"mailto:medadyoung@gmail.com" =
style=3D"color:rgb(5,99,193)"><span style=3D"color:windowtext;text-decorati=
on-line:none">medadyoung@gmail.com</span></a></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">They will like to upstream Poleg code to the Op=
enBMC github.</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Thanks a lot,</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Tomer</p></div>

--0000000000001c233c05811a851d--
