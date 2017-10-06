Return-Path: <kunyi@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::232; helo=mail-it0-x232.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TpjHFOmA"; 
 dkim-atps=neutral
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7yB13pq2zDqlT
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 05:01:12 +1100 (AEDT)
Received: by mail-it0-x232.google.com with SMTP id w1so6268413itd.0
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VMmONebU5Vxe331pwKgkUz6kix8k9e5iAep9bf8zs5w=;
 b=TpjHFOmAR+up6py76gtVtfbGC3uppK85uaDWwHUe1rXUPIHbcbeJiJMRURTqXu44Dr
 2MtynhMPSjwEcG78GfZN51pA+/oWjjW5GqLoERirUHl1FYKqNyAJDZ0IR/6HMfHy0i7N
 ZY83jr+qy8NNYLr9JxJbevul57wDEhPE8n+K3vBH+x5/k76VLlsccaxs2UgQcFWZg64r
 7TMqPlzFa0DFq6Np5nQSC/km+FTqHJblGfKNqTRzaume3laGXhp5nV9jFZu8jztd8n09
 ouTHBHyDP1iy+NkF1u3mYQRdqMTKixF2+1ix5UUvgbS5ugjF3wuJTbDh4COzSh3DJNJq
 AjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VMmONebU5Vxe331pwKgkUz6kix8k9e5iAep9bf8zs5w=;
 b=aFHM0A5qR+nCtSEd2SSgVXhfc5Y2esQKm2f6+ZMQsI3WRg31ZnJsswUJsjwcHZoiT4
 li9lzGvNeh/SCF9ZXYyau/CuVyMN1+8zKHF9K8Lo8mHx805VW9WcHoCSpzihlm4ir/hv
 keZ2FGSumvZNpm7/WcTUalnQFvIy7PL9TKfFTFTTId6XsNXu6w3psZG0B0Lji2DyKHCm
 QClCH8POdvwlqUPvckFaO4hdYe2UvvLoK7cWnrLXiT0WGvsvnoU5XAEXCPwusWWyIHZ5
 sfo8KPaps6t/hyUEw+MN9iZKVONOyC0kkjSoP4aE2MKT73a0Y+eC7iPBRSf+LBmQ+QEQ
 3TeA==
X-Gm-Message-State: AMCzsaVyp6nwBYl0Z+LxkcwB+B3KLJwXdD/zNdzstlkw0u2YL9XX2mAX
 SIz0+uJ5ZHGRfc7UyF2c1o49jPg3thZjHHbS/Sk7ZapDguM=
X-Google-Smtp-Source: AOwi7QC3vl88O1VqXOrIz2orPz7ZmkNPQK2xc2apA8fZbo1hlLFT8Kh4Gsy3CHvle36tAcG7+rTTyZ3kueH48bhXvTE=
X-Received: by 10.36.57.18 with SMTP id l18mr3765770ita.56.1507312868811; Fri,
 06 Oct 2017 11:01:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.130.222 with HTTP; Fri, 6 Oct 2017 11:00:38 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
Date: Fri, 6 Oct 2017 11:00:38 -0700
Message-ID: <CAGMNF6W+g_yAnm2e0ta7VtBZb01pwaRs_SZW+=N4tJtDO88xFw@mail.gmail.com>
Subject: pythonnative version mismatch?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a114aa6d61dabfa055ae4a0de"
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
X-List-Received-Date: Fri, 06 Oct 2017 18:01:15 -0000

--001a114aa6d61dabfa055ae4a0de
Content-Type: text/plain; charset="UTF-8"

Hello folks,

I searched through the mailing list but haven't seen anyone brought up.
Here's a weird bug I found on my setup: pythonnative seems to be using
python3.4.3 whereas the recipe specified 2.7.

Before diving into the layers of bitbake recipes to root cause what caused
this, I want to post on the mailing list to see if it is reproducible on
other setups, and if people have ideas why this went wrong (environment
variable accidentally being overwritten?)

*What I tested:*
I found the code in phosphor-settings-manager, which inherits pythonnative,
seems to be working per python 3, so added the following line into a native
python function:

python do_check_version () {
  import sys
  bb.warn(sys.version)
}
addtask check_version after do_configure before do_compile

WARNING: phosphor-settings-manager-1.0-r1 do_check_version: 3.4.3 (default,
Nov 17 2016, 01:08:31)

This is with openbmc git tip, building MACHINE=zaius

*What the recipe should be using is seemingly 2.7:*
$ cat ../import-layers/yocto-poky/meta/classes/pythonnative.bbclass

inherit python-dir
[...]

$ cat ../import-layers/yocto-poky/meta/classes/python-dir.bbclass
PYTHON_BASEVERSION = "2.7"
PYTHON_ABI = ""
PYTHON_DIR = "python${PYTHON_BASEVERSION}"
PYTHON_PN = "python"
PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"

*Why this is bad:*
well, python2.7 and python3 have a ton of differences. A bug I discovered
is due to usage of filter(), which returns different objects between
Python2/3.

-- 
Regards,
Kun

--001a114aa6d61dabfa055ae4a0de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello folks,<div><br></div><div>I searched through the mai=
ling list but haven&#39;t seen anyone brought up. Here&#39;s a weird bug I =
found on my setup: pythonnative seems to be using python3.4.3 whereas the r=
ecipe specified 2.7.</div><div><br></div><div>Before diving into the layers=
 of bitbake recipes to root cause what caused this, I want to post on the m=
ailing list to see if it is reproducible on other setups, and if people hav=
e ideas why this went wrong (environment variable accidentally being overwr=
itten?)</div><div><br></div><div><b>What I tested:</b></div><div>I found th=
e code in phosphor-settings-manager, which inherits pythonnative, seems to =
be working per python 3, so added the following line into a native python f=
unction:</div><div><br></div><div>python do_check_version () {</div><div>=
=C2=A0 import sys</div><div>=C2=A0 bb.warn(sys.version)</div><div>}</div><d=
iv>addtask check_version after do_configure before do_compile<br></div><div=
><br></div><div>WARNING: phosphor-settings-manager-1.0-r1 do_check_version:=
 3.4.3 (default, Nov 17 2016, 01:08:31)=C2=A0<br></div><div><br></div><div>=
This is with openbmc git tip, building MACHINE=3Dzaius</div><div><br></div>=
<div><b>What the recipe should be using is seemingly 2.7:</b></div><div><di=
v>$ cat ../import-layers/yocto-poky/meta/classes/pythonnative.bbclass</div>=
<div><br></div><div>inherit python-dir</div><div>[...]</div></div><div><br>=
</div><div><div>$ cat ../import-layers/yocto-poky/meta/classes/python-dir.b=
bclass=C2=A0</div><div>PYTHON_BASEVERSION =3D &quot;2.7&quot;</div><div>PYT=
HON_ABI =3D &quot;&quot;</div><div>PYTHON_DIR =3D &quot;python${PYTHON_BASE=
VERSION}&quot;</div><div>PYTHON_PN =3D &quot;python&quot;</div><div>PYTHON_=
SITEPACKAGES_DIR =3D &quot;${libdir}/${PYTHON_DIR}/site-packages&quot;</div=
></div><div><br></div><div><div><b>Why this is bad:</b></div><div>well, pyt=
hon2.7 and python3 have a ton of differences. A bug I discovered is due to =
usage of filter(), which returns different objects between Python2/3.</div>=
<div><br></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Regar=
ds,<div>Kun</div></div></div>
</div></div>

--001a114aa6d61dabfa055ae4a0de--
