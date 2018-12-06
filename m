Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12b; helo=mail-it1-x12b.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h4w/fdI5"; 
 dkim-atps=neutral
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439kQd449tzDrPY
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 05:19:36 +1100 (AEDT)
Received: by mail-it1-x12b.google.com with SMTP id z7so2903371iti.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Dec 2018 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u5QhWfY6Uuz0pVhoYZ5WsS970B0SxS7Ekm1GHxyyRSs=;
 b=h4w/fdI58MAy3hDNGyL2GJhUfbavXZR7HdZtynTXE58pi0teKAbWzc3w1AoejuP7eN
 CEtADIKXbrA2Bfb03rX/BZQAn7fahlR2gZKjrylvlWYskx2Q6iEIgJRNpC/su6KA9iDs
 6aKiLfOQ3eF3c25ZXxHQ1jEsbgK0000nrxDw9rlAfCEYObGOILbYXwIc/Na11AcT2N5a
 Wt3mUr0ycKzACBhp5gR7DNbTArRDtvC1oSfyJ6GBeWigQ8I0d6L3CjkuZNa3G9SIOymm
 FhZ5Zj7mU3zjIp6U7FUWAOKHUtom5X3xL0d2yRFscHpXvjW1PIe2NZIo6XC4q0dyKS5S
 aL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u5QhWfY6Uuz0pVhoYZ5WsS970B0SxS7Ekm1GHxyyRSs=;
 b=tZE3/tKbppmkYquFuG5uMIibYgLLLtXL0rXg0B54maxwSVAqqrh/T+YAPdW8UfxVQa
 o70LODbtxtjj2apC/8RgvpkDs/KvAvHiD8JHvMWCnwxpSiwrUVy3WIhNC49qC2QXBJsE
 90ZfLhikJiBiwgHz1IBIyBZooeWefSbUIHJYsfplvLIOScbHK0ahvMv543OzL9HohFc6
 Ce3f3XHcO3m4iVU+lduGXOHh9fT4jrVPND6anRBesDsKT/QTHMKjswU0vi8B3bp4VbCW
 TJKie5ukmK4b6OyAPep2tckJGjovHRsWDxZpElsj2m9D6XxQltBSU+uCBWnlHhhhReF2
 wPUw==
X-Gm-Message-State: AA+aEWbKcDSH3+VGB8g6sNDDSp+i39XRxuZ9FR1JLuCox7B8kjLoZboM
 2SAudiVeQvXJCHaVTazvy6kbkg6eoVYZ5zSeQTGryQ==
X-Google-Smtp-Source: AFSGD/VjlBHmoOntveoP+atar5CHi7zfvAVq9yVnc8IeQasHjnlDiOt9HKBJQLlcz5Wv+LZjH/7G/e5VJA75G7gt1zM=
X-Received: by 2002:a02:4c9:: with SMTP id 192mr26670307jab.2.1544120374284;
 Thu, 06 Dec 2018 10:19:34 -0800 (PST)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Thu, 6 Dec 2018 10:19:07 -0800
Message-ID: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
Subject: New repo request: phosphor-ipmi-blobs-skm
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000066e7e7057c5e8a09"
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
X-List-Received-Date: Thu, 06 Dec 2018 18:19:39 -0000

--00000000000066e7e7057c5e8a09
Content-Type: text/plain; charset="UTF-8"

Hi Brad,

May I request a new repository: phosphor-ipmi-blobs-skm?

It is a phosphor-ipmi-blobs[1] based handler that supports simple binary
data read/write/enumerate operations from the host to a storage only
visible to BMC. Google uses it for storing Storage Key Management (SKM)
specific binary data, and it may probably belong to the openBMC
customizations that Google want to publish and permit others to use.

Currently the storage format is skm specific, but it could be expanded to
support other use cases, thus the "phosphor" naming. If you feel that it is
still Google-specific, then "google-ipmi-blobs-skm" is acceptable as well.
We can always rename this later if the use cases expand. =)

Please add myself, Benjamin Fair (benjaminfair@google.com), and Patrick
Venture (venture@google.com) as maintainers. Thanks!

[1] https://github.com/openbmc/phosphor-ipmi-blobs
-- 
Regards,
Kun

--00000000000066e7e7057c5e8a09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Brad,<div><br></div><div>May I request=
 a new repository: phosphor-ipmi-blobs-skm?</div><div><br></div><div>It is =
a phosphor-ipmi-blobs[1] based handler that supports simple binary data rea=
d/write/enumerate operations from the host to a storage only visible to BMC=
. Google uses it for storing Storage Key Management (SKM) specific binary d=
ata, and it may probably belong to the openBMC customizations that Google w=
ant to publish and permit others to use.</div><div><br></div><div>Currently=
 the storage format is skm specific, but it could be expanded to support ot=
her use cases, thus the &quot;phosphor&quot; naming. If you feel that it is=
 still Google-specific, then &quot;google-ipmi-blobs-skm&quot; is acceptabl=
e as well. We can always rename this later if the use cases expand. =3D)</d=
iv><div><br></div><div>Please add myself, Benjamin Fair (<a href=3D"mailto:=
benjaminfair@google.com">benjaminfair@google.com</a>), and Patrick Venture =
(<a href=3D"mailto:venture@google.com">venture@google.com</a>) as maintaine=
rs. Thanks!</div><div><div><br></div><div>[1]=C2=A0<a href=3D"https://githu=
b.com/openbmc/phosphor-ipmi-blobs">https://github.com/openbmc/phosphor-ipmi=
-blobs</a></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr">Regards,<div>Kun</div></div></div></div></div></div>

--00000000000066e7e7057c5e8a09--
