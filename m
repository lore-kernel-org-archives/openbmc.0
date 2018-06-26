Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::230; helo=mail-io0-x230.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XSfeY4QZ"; 
 dkim-atps=neutral
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FWt301BhzF1Dt;
 Wed, 27 Jun 2018 02:37:30 +1000 (AEST)
Received: by mail-io0-x230.google.com with SMTP id i23-v6so13658241iog.10;
 Tue, 26 Jun 2018 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=22MQd2+NLsy6z2E0khJpG69aK6h+xM6wsKq5btQ95Jk=;
 b=XSfeY4QZ720mwDATXKtK6isnNvRnps6BINroAkhtDUffvAAOwJrG0mnYxBEACTHe+h
 1390jHHDVcv1CrD2QhayJnmjc3tuOYU0UwSUgluTtdd5ID1sL3sDvkqje6NL0NYt+n+m
 UsIMMkdwOBUqfhnmDpaYXH6y2P7qdb8VTS2cc9+Qxs2INGmsm6HEP+rIEckLez14TSyf
 lCL0nizj0/OsGXfmBN6PCKT6ExqLB8t4Lcv1v9urPznDMbgpM2Ux7Z8rILr9d/63vaI/
 cRsBmSDMUq9Voyl8rA8Fudlri8j8fVQo9wxSVtEgRDMq74qG5FeqMkGMZYlOpSQwmk7m
 GWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=22MQd2+NLsy6z2E0khJpG69aK6h+xM6wsKq5btQ95Jk=;
 b=s/0/fKCR7pibJ9E1rLnGlPFuivZux0JX6S9MLjZexk8jogYU5GGBlNM33iAp6aWPuT
 3Up4YyOFOyuTQmsRbdFxQRSnsDDdJuEhZsXCSno2j/Dhxc3x1Bdwu7RctNq8GMiKg9dU
 /qkylyTPX8ECuoG9DigrmU/PVNFLzuvcvFf2g7DNmAE7OBHrtjOczXjqv90i2FNSxGE/
 JzQ70WsoqPvrx4b80rH76iy4pm6DDTSIsA+zeMh1GCXNjSl3u7w/bv6gmEyY6AIqDOqF
 r0+eyBoaACVOAZGTFzcYC5+/qZIsFCTPyWkXQwRlnTQIJAnyG+f15YnVqX1mVzlm5sEb
 RycQ==
X-Gm-Message-State: APt69E0xOEu0qriSdru2tEMSESX6akGfH0/Kro4DuDXQmummuLuuRJ9C
 VpxzpxDIWgLmbTp2ePvo3DJpbClK55m39oJlPWw=
X-Google-Smtp-Source: AAOMgpfz47NJXTNdvgwZ0oYN6Xys/4EYCtqR2HIGm+8AL7SomxeTipUm+xI4VavEaQfjIpw0rWcaNNEwSZ1ZuaBSXsc=
X-Received: by 2002:a6b:5316:: with SMTP id
 h22-v6mr1884402iob.63.1530031048399; 
 Tue, 26 Jun 2018 09:37:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d481:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 09:37:27
 -0700 (PDT)
In-Reply-To: <CAO=notwRGurPdnvSX_A+DVNudS8V0aSRwsiSqpECTes4FjFMUQ@mail.gmail.com>
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
 <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
 <CAO=notwRGurPdnvSX_A+DVNudS8V0aSRwsiSqpECTes4FjFMUQ@mail.gmail.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 26 Jun 2018 11:37:27 -0500
Message-ID: <CAG5OiwjErYOg6g=-L+N0V0d-je9jsDMedZdW40Ej-9vamkNA8A@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: Patrick Venture <venture@google.com>
Cc: George Keishing <gkeishin@in.ibm.com>, Ali Larijani <alirhas@microsoft.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000022a1bf056f8e1d04"
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
X-List-Received-Date: Tue, 26 Jun 2018 16:37:31 -0000

--00000000000022a1bf056f8e1d04
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 25, 2018 at 2:06 PM, Patrick Venture <venture@google.com> wrote:

> So, lots of voting, I heard the first one is tomorrow.  Tomorrow at 2pm?
>

No, these were proposed times - the idea was to pick one that worked best
for you.


>
> Patrick
>
>
Kurt Taylor (krtaylor)

--00000000000022a1bf056f8e1d04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Jun 25, 2018 at 2:06 PM, Patrick Venture <span dir=
=3D"ltr">&lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">ventur=
e@google.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">So, lots of voting, I heard=
 the first one is tomorrow.=C2=A0 Tomorrow at 2pm?<br></blockquote><div><br=
></div><div>No, these were proposed times - the idea was to pick one that w=
orked best for you.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Patrick<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blo=
ckquote><div><br></div><div>Kurt Taylor (krtaylor) <br></div></div></div></=
div>

--00000000000022a1bf056f8e1d04--
