Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22d; helo=mail-qt0-x22d.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUxBeZOL"; 
 dkim-atps=neutral
Received: from mail-qt0-x22d.google.com (mail-qt0-x22d.google.com
 [IPv6:2607:f8b0:400d:c0d::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wntP6nbZzDr69
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 21:09:49 +1000 (AEST)
Received: by mail-qt0-x22d.google.com with SMTP id g13-v6so22640669qth.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 04:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BQvAD9fj5EEXc921tBtMvT5BEgKLSe5JWYFeyqLU47g=;
 b=iUxBeZOLzmDzpGM/BIwgNvzfbZ+jW7ytl8MFJai2JdB0XIBwez+pcv69yJyuOj+FUr
 McDv90gRAaFXbIoi3WCIfXYLfU97H69dcqpqbzPUXASPKOt0uN/3vNPJL3ITPFGB0gbR
 TSHZYBdEZjDct3NgmsM2ClSLSnowmfoUYAAfhZSPIQrsFxe2U4f1xZxIXPniI5BdXPPx
 WoBf1q5a1GWdAf+ip+QIw8lcX+LKCa8V5AZpw6O9Oswuj+3VR/+Mqe9XQ1lEAn4t3d2g
 vyM0rzbAsJStBOszhOruYoK5akel4/IiHpV9oNDfgcoouyqjBOMj+drUVku0dbRJvs8K
 goYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BQvAD9fj5EEXc921tBtMvT5BEgKLSe5JWYFeyqLU47g=;
 b=pMv++SGgMRxqXazjPeW79KbdegEQ3YsZDKdBnKJQaKPcUUiSzqB1Z0Ms4sXUh0MMtg
 WnIdTAEAOwyO0FO1c53zJfRBBYHlldC733rfR+CVMY8fjAmbG0ECahYpRmCxVBWPuQ1M
 jNpQX7EK/ppAvHSEC9LEyQWiwM7B+OYtgxhDcHWsivpzsqirEWqPlsosfcQeqRyBcNEe
 wObAUBCPT4c6WRmFvZzx1bxv+HoHn571/346snnlgIMpzxvvFdfIb0VY0a6vJ8/OAIyo
 kOu1Sf1cmOpbCw6O/eLXteaQe6uGiQBwdh6FhkA5Bp1I6IyMRjI519bNhKk/OyowOXBj
 bN0A==
X-Gm-Message-State: APt69E3a5nAYmbT8HGC6fjRFG9DZOMq2i/D+EKvtb5LhcJhZwQv/OCeu
 FeKctUREWdhuTJjCR4P5v2ZZCdvN0faSeebtvis=
X-Google-Smtp-Source: ADUXVKIVEeo48Zx/ghKrp1IF1DIUxIuOVsBj3AwpuDgmUncuvtVLBeu5sLqYW/UEZTqCsOFLxBOkLTw4LE1TZhqKWFs=
X-Received: by 2002:aed:2448:: with SMTP id
 s8-v6mr1966160qtc.336.1527678586643; 
 Wed, 30 May 2018 04:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cB8S=VL6g2Z6dXmC55P-3CW+p+wURH=Qgy-sZXL6b9deA@mail.gmail.com>
 <CAARXrtkSDZQU_m5CD+7aprwZ33NH3gZ6z5hJVZ57rDJ-QXq5ow@mail.gmail.com>
In-Reply-To: <CAARXrtkSDZQU_m5CD+7aprwZ33NH3gZ6z5hJVZ57rDJ-QXq5ow@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 30 May 2018 19:09:33 +0800
Message-ID: <CAG9c7cASzn4HmYrZZi4L_4Ht5iWG8uMyAVUkFhupRo2pm1qbGQ@mail.gmail.com>
Subject: Re: Unable to find mtd partition for image-bmc
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007ceaf3056d6a6364"
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
X-List-Received-Date: Wed, 30 May 2018 11:09:50 -0000

--0000000000007ceaf3056d6a6364
Content-Type: text/plain; charset="UTF-8"

>
> As the message indicates, the update script fails to find a mtd partition
> for
> "image-bmc".
> What is your devices's mtd parts?
> The expected OpenBMC flash layout is like this:
>
> # ls -l /dev/mtd/
> total 0
> lrwxrwxrwx    1 root     root             7 May 30 06:47 bmc -> ../mtd0
> lrwxrwxrwx    1 root     root             7 May 30 06:47 kernel -> ../mtd3
> lrwxrwxrwx    1 root     root             7 May 30 06:47 pnor -> ../mtd6
> lrwxrwxrwx    1 root     root             7 May 30 06:47 rofs -> ../mtd4
> lrwxrwxrwx    1 root     root             7 May 30 06:47 rwfs -> ../mtd5
> lrwxrwxrwx    1 root     root             7 May 30 06:47 u-boot -> ../mtd1
> lrwxrwxrwx    1 root     root             7 May 30 06:47 u-boot-env ->
> ../mtd2
>
> For "image-bmc" it will update the partition labeled "bmc", which is mtd0.


Thanks for your response.

I found no the below attribute in the &fmc of my device tree.
 label="BMC"

It could work after I added it.

--0000000000007ceaf3056d6a6364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span style=3D"font-family:sans-serif;font-size:12.8px">As the messag=
e indicates, the update script fails to find a mtd partition for</span><br =
style=3D"font-family:sans-serif;font-size:12.8px"><span style=3D"font-famil=
y:sans-serif;font-size:12.8px">&quot;image-bmc&quot;.</span><br style=3D"fo=
nt-family:sans-serif;font-size:12.8px"><span style=3D"font-family:sans-seri=
f;font-size:12.8px">What is your devices&#39;s mtd parts?</span><br style=
=3D"font-family:sans-serif;font-size:12.8px"><span style=3D"font-family:san=
s-serif;font-size:12.8px">The expected OpenBMC flash layout is like this:</=
span><br style=3D"font-family:sans-serif;font-size:12.8px"><br style=3D"fon=
t-family:sans-serif;font-size:12.8px"><span style=3D"font-family:sans-serif=
;font-size:12.8px"># ls -l /dev/mtd/</span><br style=3D"font-family:sans-se=
rif;font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8p=
x">total 0</span><br style=3D"font-family:sans-serif;font-size:12.8px"><spa=
n style=3D"font-family:sans-serif;font-size:12.8px">lrwxrwxrwx=C2=A0 =C2=A0=
 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A07 May 30 06:47 bmc -&gt; ../mtd0</span><br style=3D"font-family:sans-=
serif;font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.=
8px">lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 May 30 06:47 kernel -&gt; ../mtd3</span=
><br style=3D"font-family:sans-serif;font-size:12.8px"><span style=3D"font-=
family:sans-serif;font-size:12.8px">lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =
=C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 May 30 0=
6:47 pnor -&gt; ../mtd6</span><br style=3D"font-family:sans-serif;font-size=
:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">lrwxrwxrwx=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A07 May 30 06:47 rofs -&gt; ../mtd4</span><br style=3D"font-=
family:sans-serif;font-size:12.8px"><span style=3D"font-family:sans-serif;f=
ont-size:12.8px">lrwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 May 30 06:47 rwfs -&gt; ../m=
td5</span><br style=3D"font-family:sans-serif;font-size:12.8px"><span style=
=3D"font-family:sans-serif;font-size:12.8px">lrwxrwxrwx=C2=A0 =C2=A0 1 root=
=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 M=
ay 30 06:47 u-boot -&gt; ../mtd1</span><br style=3D"font-family:sans-serif;=
font-size:12.8px"><span style=3D"font-family:sans-serif;font-size:12.8px">l=
rwxrwxrwx=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A07 May 30 06:47 u-boot-env -&gt; ../mtd2</span><b=
r style=3D"font-family:sans-serif;font-size:12.8px"><br style=3D"font-famil=
y:sans-serif;font-size:12.8px"><span style=3D"font-family:sans-serif;font-s=
ize:12.8px">For &quot;image-bmc&quot; it will update the partition labeled =
&quot;bmc&quot;, which is mtd0.</span></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Thanks for your response.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I found no the below attribute in the=
 &amp;fmc of my device tree.</div><div dir=3D"auto">=C2=A0label=3D&quot;BMC=
&quot;</div><div dir=3D"auto"><br></div><div dir=3D"auto">It could work aft=
er I added it.</div><div dir=3D"auto"><br></div></div>

--0000000000007ceaf3056d6a6364--
