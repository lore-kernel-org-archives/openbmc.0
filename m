Return-Path: <jainmjo@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=jainmjo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UeAY1t6S"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44BBNk6X5tzDqTN
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 14:19:45 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id i8so21187870oib.10
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 19:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=itV2xL+QZ2zl/j64fXXTxmWQZvsrKo4FfO3MWSOpnLw=;
 b=UeAY1t6S28di7roSBdg5IZeBxK5bIMGuarA1tmVPJJhLWkHHpMs6ThofcU8Rsc0UMH
 Gfp/DWHViiRW2kqL752R6Bu3tOCggR5DXfTdmdVrshu/ds9UQeHGKkT6s0gMkR+B6f+k
 eem4JL6io6ibZbEoALKFq0hZAUv7MsZGdVPEQJaI1adSby4t4/z1fwydXz2nA6RHLUax
 6ymn+lKJdM6dswWP6M4JiTJhuq8hVEhInIIgXhgdePaWeVYCelnEXUtOn/0SRmBn8r6r
 cI8YzkPQrAhdfLIezUIecmhC34VGVGHR2xD3UruOxaiG+ZIoH8QlWKjLe8hV4b+nRy1v
 yNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=itV2xL+QZ2zl/j64fXXTxmWQZvsrKo4FfO3MWSOpnLw=;
 b=tzm/sA3fO/nuOy6NAofbc3+DZkauDmD48GVcI2/hrEpTmZUovEeKg8yqk0AobV5Uum
 ArXl0+iSwZ1N7+iLF3U2jmGTc2qyiX5pUH8OdhBL/B3ZExpLjo17YNPn8OmsxzgvvIhl
 Bk1kmXGNnFEwISL73TQjaSyJx/C5HqSci5hBKPiNAGuDC2NUxMcaBQtE5h7fVj82y6fl
 pv35pB/9zvggO4/b0+k7Cfauws46jO2sHHkLW5GUBP9NhBx4pNUDeIQQ69HHeey3za17
 aXfupsET57P/hIlDkrQjMd7Zf64PSONt5TnTkOEZvGN5FTyfzXXoqQWF45zNpQwN4Y7z
 R+yw==
X-Gm-Message-State: AHQUAuZNjnDKWLq2uRhys3+k5daACsX2SB4pEPYx6SVK3/HmwrUtfChC
 ZBGeD8cNYREeYZoqWWfO4+fsl0B3Q+wk6YhpNarxyA==
X-Google-Smtp-Source: AHgI3IaAJirJcpROufmKFOTzoi0rUlpM9yUGofWDLa7cepZlmID0JEVYou/FgqJ/CEmgCWKK5Y3eVeArHF3EhiNl4I0=
X-Received: by 2002:aca:ab94:: with SMTP id u142mr5380210oie.58.1551496782395; 
 Fri, 01 Mar 2019 19:19:42 -0800 (PST)
MIME-Version: 1.0
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
In-Reply-To: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
From: "jainmjo@gmail.com" <jainmjo@gmail.com>
Date: Sat, 2 Mar 2019 08:49:31 +0530
Message-ID: <CADc45smTAr8FBh17mr2oVsHdM_-tpiQ7B1hBFMNG39tP0aBEcA@mail.gmail.com>
Subject: Re: [Design] Kernel-based BMC firewall
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: Openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000095be46058313fe36"
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
X-List-Received-Date: Sat, 02 Mar 2019 03:19:52 -0000

--00000000000095be46058313fe36
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 2, 2019 at 2:54 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

>
> ## Alternatives Considered
>
> A user interface to indicate the firewall's status was considered.
> This would invoke iptables and return success only if it showed
> firewall rules, something like `iptables -L -n -v`.  This is not
> needed for basic function.
>
> The `ufw` firewall was considered.  It is implemented in Python which
> is being removed from the OpenBMC image.
>

iptables is being replaced with nftables (at least in the debian world).
Have you considered nftables?
I am very new to OpenBMC. So please correct me if this is not relevant.

~jj

--00000000000095be46058313fe36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Mar 2, 2019 at 2:54 AM Joseph Reynolds &lt;<a=
 href=3D"mailto:jrey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
## Alternatives Considered<br>
<br>
A user interface to indicate the firewall&#39;s status was considered.<br>
This would invoke iptables and return success only if it showed<br>
firewall rules, something like `iptables -L -n -v`.=C2=A0 This is not<br>
needed for basic function.<br>
<br>
The `ufw` firewall was considered.=C2=A0 It is implemented in Python which<=
br>
is being removed from the OpenBMC image.<br></blockquote><div>=C2=A0</div><=
div>iptables is being replaced with nftables (at least in the debian world)=
. Have you considered nftables?</div><div>I am very new to OpenBMC. So plea=
se correct me if this is not relevant.</div><div><br></div><div>~jj</div></=
div></div>

--00000000000095be46058313fe36--
